# Plan de desarrollo: selección de volumen bruto o neto en el módulo de tanques

## 1. Objetivo

Incorporar al módulo `Tanques` una configuración propiedad de `DMCONS` que determine qué lectura de inventario se utilizará como volumen operativo:

- **BRUTO**: campo `Volume`/`Volumen` entregado por el dispositivo.
- **NETO**: campo `TCVolume`/`Volumen TC`, es decir, volumen compensado por temperatura.

El valor seleccionado seguirá recorriendo el sistema mediante la variable existente `TTanques[x].Volumen`, por lo que será el que se muestre, se compare contra la lectura anterior, participe en los cálculos actuales y se guarde en `DPVGCVOLT.VOLUMEN`.

Este documento es únicamente un plan. No incluye cambios al código fuente ni a la base de datos.

## 2. Alcance técnico confirmado

El ejecutable `PTANMENU.dpr` enlaza el módulo de datos ubicado en:

- `..\Dispensarios\DDMCONS.pas`

Por lo tanto, la primera implementación debe modificar esta variante de `DDMCONS`; las carpetas paralelas (`DispensariosN`, `DispensariosX`, `DispensariosBridge`, etc.) quedan fuera del cambio inicial, salvo que también generen ejecutables que deban mantener el mismo comportamiento.

Archivos principales implicados:

| Archivo | Responsabilidad | Cambio previsto |
|---|---|---|
| `Tanques\UTANMENU.pas` | Lectura de protocolos, estado de tanques, cálculos, pantalla y persistencia | Sí |
| `Dispensarios\DDMCONS.pas` | Declaración y carga de configuración | Sí |
| `Tanques\UTANMENU.dfm` | Etiquetas visuales de cada tanque | Preferentemente no; actualizar las etiquetas en tiempo de ejecución |
| `Tanques\PTANMENU.dpr` | Selección de la variante de `DMCONS` | No |
| `Dispensarios\DDMCONS.dfm` | Componentes de datos | No se requiere para la nueva variable de texto |

## 3. Hallazgos del código actual

### 3.1 Configuración existente en `DMCONS`

`TDMCONS.CargaConfiguracionConsola` inicializa valores predeterminados y después lee pares `NOMBRE=VALOR` desde `T_EstsIbConsola`. Este es el mecanismo que debe utilizar la nueva preferencia.

Ya existe `TipoVolumenEntradaTanques`, con valor predeterminado `Bruto`, pero controla el volumen inicial/final de las **entregas** (`i202`). No debe reutilizarse para inventario, porque eso acoplaría dos decisiones operativas distintas y podría cambiar el cálculo de recepciones al activar volumen neto en pantalla.

### 3.2 Inventario Veeder Root, Red Jacket y Gateway

Las respuestas `i201` contienen ambos valores:

| Posición en la trama | Longitud | Significado propuesto |
|---:|---:|---|
| 26 | 8 | `VolumenBruto` (`Volume`) |
| 34 | 8 | `VolumenNeto` (`TCVolume`) |
| 42 | 8 | `PorLlenar` |
| 66 | 8 | `Temperatura` |
| 74 | 8 | `VolumenAgua` |

Actualmente `ProcesaLineaVeederRoot` y `ProcesaLinea4` sólo asignan la posición 26 a `Volumen`; la posición 34 se ignora. El Gateway también termina procesando tramas `i201`, por lo que debe respetar la misma selección.

### 3.3 Inventario TEAM

La ruta TEAM ya expone los campos `AdoTableInvVolBruto` y `AdoTableInvVolNeto` en `DMCONS`. Hoy el módulo sólo utiliza `AdoTableInvVolBruto`. Esta ruta puede soportar la selección sin modificar consultas ni esquema.

### 3.4 Protocolos que no exponen dos volúmenes en el código actual

- EECO Systems (`ProcesaLinea2`).
- AutoStik (`ProcesaLinea3`).
- Incon (`ProcesaLinea6`).
- PetroVend (`ProcesaLineaPetroVend`).

Para ellos no se identificó un campo separado de volumen compensado por temperatura. La configuración `NETO` no debe convertir el valor en cero ni bloquear lecturas: se conservará el único volumen disponible y se registrará que el protocolo no ofrece una lectura neta independiente.

### 3.5 Consumidores del valor `Volumen`

El valor actualmente alimenta, entre otros:

- `VolumenAnterior` y la detección de cambios.
- `VolumenDisponible`, `VolumenUtil`, `Capacidad`, `PorLlenar90` y `Porciento`.
- La pantalla (`NumericEditor2_*` y nivel gráfico).
- La lógica de supresión de incrementos mediante `CheckBox3`.
- El registro `T_CvoltVolumen` en la tabla `DPVGCVOLT`.
- La detección de entradas de PetroVend basada en mínimos y máximos.

La implementación debe mantener un único valor operativo para evitar que cada consumidor repita la decisión BRUTO/NETO.

## 4. Diseño propuesto

### 4.1 Nueva variable de configuración

Agregar en la sección pública de `TDMCONS`:

```pascal
TipoVolumenInventarioTanques: String;
```

Agregar en `CargaConfiguracionConsola`:

```text
Valor predeterminado: Bruto
Clave: TIPOVOLUMENINVENTARIOTANQUES
Valores válidos: BRUTO, NETO
```

Ejemplos de configuración:

```ini
TIPOVOLUMENINVENTARIOTANQUES=BRUTO
```

```ini
TIPOVOLUMENINVENTARIOTANQUES=NETO
```

Reglas de normalización:

1. Aplicar `Trim` y comparación sin distinguir mayúsculas/minúsculas.
2. Aceptar únicamente `BRUTO` y `NETO`.
3. Si la clave no existe, está vacía o contiene otro valor, utilizar `BRUTO`.
4. Registrar una advertencia cuando el valor configurado no sea válido.

El predeterminado `BRUTO` conserva exactamente el comportamiento actual durante una actualización.

### 4.2 Separación de valores en memoria

Ampliar `TipoTanque` con:

```pascal
VolumenBruto,
VolumenNeto,
Volumen: Real; // volumen operativo seleccionado
```

Conservar `Volumen` para no alterar la interfaz interna del resto del módulo. Las dos variables nuevas permiten inspección, diagnóstico y pruebas sin perder el dato que no fue seleccionado.

Definir estas invariantes:

- `VolumenBruto` siempre representa la lectura sin compensación.
- `VolumenNeto` siempre representa la lectura compensada por temperatura cuando el protocolo la proporciona.
- `Volumen` contiene el valor elegido por `DMCONS.TipoVolumenInventarioTanques`.
- `VolumenAnterior` contiene el valor operativo elegido en el ciclo anterior, no necesariamente el bruto.
- Si el protocolo sólo proporciona un volumen, asignar dicho valor a `VolumenBruto`, `VolumenNeto` y `Volumen`; además, marcar internamente que no existe un neto independiente para poder informar el fallback.

### 4.3 Centralización de la selección

Agregar a `TFTANMENU` un método privado equivalente a:

```pascal
procedure ActualizaVolumenInventario(
  ATanque: Integer;
  AVolumenBruto: Real;
  AVolumenNeto: Real;
  ATieneVolumenNeto: Boolean);
```

Responsabilidades del método:

1. Copiar el `Volumen` operativo anterior a `VolumenAnterior`.
2. Guardar ambos valores fuente en `VolumenBruto` y `VolumenNeto`.
3. Consultar la variable normalizada de `DMCONS`.
4. Seleccionar `VolumenNeto` si el modo es `NETO` y la fuente lo soporta.
5. Seleccionar `VolumenBruto` en cualquier otro caso.
6. Evitar valores no numéricos o negativos antes de sustituir la lectura válida anterior.
7. No recalcular aquí agua, capacidad ni porcentajes; esos cálculos continuarán en el flujo actual después de seleccionar el volumen.

Centralizar la regla evita diferencias entre lectura serial, socket, emulación y TEAM.

### 4.4 Aplicación por protocolo

#### Veeder Root

En `ProcesaLineaVeederRoot`, leer explícitamente:

```pascal
xVolumenBruto := IeeeToFloat(copy(lin, 26, 8));
xVolumenNeto  := IeeeToFloat(copy(lin, 34, 8));
```

Después invocar el método central con `ATieneVolumenNeto=True` y continuar con los cálculos actuales.

#### Red Jacket

Aplicar la misma extracción y selección en `ProcesaLinea4`. Aunque parte del flujo serial de Red Jacket usa `ProcesaLineaVeederRoot`, mantener ambos procedimientos consistentes cubre también la emulación y rutas alternativas.

#### Gateway

No necesita un parser nuevo. Verificar que toda respuesta `i201` recibida por socket llegue a uno de los dos procedimientos anteriores y, por tanto, pase por el selector central.

#### TEAM

En el bloque `TipoTanques=7`, reemplazar la asignación directa de `AdoTableInvVolBruto` por una llamada al selector con:

- Bruto: `AdoTableInvVolBruto.AsFloat`.
- Neto: `AdoTableInvVolNeto.AsFloat`.
- `ATieneVolumenNeto=True` cuando el campo exista y no sea nulo.

Si `VolNeto` es nulo, utilizar el bruto y dejar evidencia en el log sin generar una excepción.

#### EECO, AutoStik, Incon y PetroVend

Pasar el único valor disponible al método central con `ATieneVolumenNeto=False`. Esto conserva el comportamiento vigente y mantiene completas las nuevas variables del registro.

Para no saturar la bitácora, la advertencia de fallback debe emitirse una sola vez al iniciar el módulo o al detectar el protocolo, no en cada lectura.

### 4.5 Cálculos posteriores

Después de seleccionar `Volumen`, conservar inicialmente las expresiones existentes:

```pascal
VolumenDisponible := Volumen - VolumenAgua;
VolumenUtil       := Volumen - VolumenFondaje;
Capacidad         := Volumen + PorLlenar;
PorLlenar90       := PorLlenar - Capacidad * 0.1;
```

Esto cumple la regla solicitada de que el módulo “use” el volumen elegido en todo el flujo. Sin embargo, durante las pruebas funcionales se debe confirmar con operación si `Capacidad` y `PorLlenar90` deben permanecer magnitudes físicas basadas en volumen bruto. Si deben permanecer físicas, se ajustarán específicamente a `VolumenBruto`, sin cambiar el valor mostrado/guardado como inventario neto.

También se debe confirmar si el `Volume` del protocolo ya excluye el agua. El código actual resta `VolumenAgua`; el cambio no debe corregir esa semántica de forma implícita porque sería una modificación funcional adicional.

### 4.6 Pantalla

Mostrar claramente el modo activo para evitar interpretar un volumen neto como bruto:

- `Volumen bruto:` cuando la configuración sea `BRUTO`.
- `Volumen neto:` cuando sea `NETO` y el protocolo lo soporte.
- `Volumen:` o `Volumen bruto (sin TC):` cuando el protocolo no tenga volumen neto.

Actualizar en tiempo de ejecución las ocho etiquetas asociadas a `NumericEditor2_1`…`NumericEditor2_8` (`VrLabel5x`, `VrLabel10`, `VrLabel19`, `VrLabel27`, `VrLabel35`, `VrLabel43`, `VrLabel51` y `VrLabel59`). Así se evita duplicar la decisión en el archivo `.dfm`.

Opcionalmente, agregar el modo al log de arranque:

```text
Inventario de tanques configurado como: NETO (TCVolume)
```

### 4.7 Persistencia y compatibilidad histórica

`T_CvoltVOLUMEN` seguirá recibiendo `Volumen`, por lo que almacenará el valor seleccionado. No se requiere migración de `DPVGCVOLT`.

Consecuencia: si una estación cambia de `BRUTO` a `NETO`, la misma columna contendrá valores con dos criterios antes y después de la fecha de activación. Para una trazabilidad mínima se debe:

1. Registrar en bitácora el modo al arrancar.
2. Documentar fecha y hora del cambio de configuración durante el despliegue.
3. No permitir cambios dinámicos de la preferencia sin reiniciar el módulo.

Como mejora posterior, fuera del alcance inicial, puede agregarse una columna de procedencia (`BRUTO`/`NETO`) a la tabla histórica.

### 4.8 Entregas de tanque

No modificar en este alcance:

- `DMCONS.TipoVolumenEntradaTanques`.
- La selección entre `xValores[1]/xValores[5]` (bruto) y `xValores[2]/xValores[6]` (neto) en respuestas `i202`.
- Las reglas de recepción, ventas asociadas ni rangos válidos de entregas.

La independencia esperada será:

| Configuración | Controla |
|---|---|
| `TIPOVOLUMENINVENTARIOTANQUES` | Inventario actual, pantalla, cálculos y `DPVGCVOLT.VOLUMEN` |
| `TIPOVOLUMENENTRADATANQUES` | Volumen inicial/final y volumen recibido de las entregas |

## 5. Secuencia de implementación

### Fase 1. Preparación y contrato de configuración

1. Crear una rama o respaldo de los fuentes actuales.
2. Agregar `TipoVolumenInventarioTanques` a `TDMCONS`.
3. Establecer `Bruto` como valor predeterminado en `CargaConfiguracionConsola`.
4. Leer `TIPOVOLUMENINVENTARIOTANQUES` desde `T_EstsIbConsola`.
5. Normalizar y validar el valor.
6. Escribir una sola línea de log con el modo efectivo.

Resultado verificable: sin agregar la clave, el ejecutable se comporta igual que la versión actual.

### Fase 2. Modelo interno y selector central

1. Agregar `VolumenBruto` y `VolumenNeto` a `TipoTanque`.
2. Inicializar los tres volúmenes al crear/inicializar los tanques.
3. Implementar `ActualizaVolumenInventario`.
4. Asegurar que `VolumenAnterior` se capture antes de seleccionar la nueva lectura.
5. Añadir protección para nulos, valores inválidos y protocolos sin TC.

Resultado verificable: una prueba aislada del selector produce bruto, neto y fallback según la configuración.

### Fase 3. Integración de fuentes con bruto y neto

1. Integrar Veeder Root.
2. Integrar Red Jacket.
3. Verificar el flujo Gateway por socket.
4. Integrar TEAM con `VolBruto` y `VolNeto`.
5. Confirmar que la emulación recorra exactamente la misma lógica.

Resultado verificable: las dos modalidades entregan números distintos a partir de la misma trama `i201`.

### Fase 4. Fuentes con un solo volumen

1. Adaptar EECO.
2. Adaptar AutoStik, conservando la conversión galón/litro antes de seleccionar.
3. Adaptar Incon.
4. Adaptar PetroVend y su detección de mínimos/máximos.
5. Validar que `NETO` use fallback y nunca registre cero sólo por faltar TC.

Resultado verificable: todos los protocolos anteriores conservan su comportamiento numérico actual.

### Fase 5. Presentación y persistencia

1. Actualizar las etiquetas de pantalla según el modo efectivo.
2. Verificar que `NumericEditor2_*` muestre `Volumen` seleccionado.
3. Verificar que el indicador de nivel y `Porciento` respondan al valor seleccionado.
4. Verificar que `T_CvoltVolumen` guarde ese mismo valor.
5. Confirmar que el filtro `abs(Volumen-VolumenAnterior)>=0.01` compare valores del mismo tipo.

Resultado verificable: pantalla, memoria y base de datos coinciden para una misma lectura.

### Fase 6. Pruebas, despliegue y documentación

1. Ejecutar la matriz de pruebas descrita abajo.
2. Probar primero con emulación/log capturado.
3. Probar contra un dispositivo en ambiente controlado.
4. Desplegar inicialmente con `BRUTO` para demostrar compatibilidad.
5. Activar `NETO` en una estación piloto.
6. Comparar durante un turno las lecturas bruto/neto contra la consola física.
7. Documentar la fecha de corte desde la que `DPVGCVOLT.VOLUMEN` representa neto.

## 6. Plan de pruebas

### 6.1 Configuración

| Caso | Entrada | Resultado esperado |
|---|---|---|
| Clave ausente | Sin configuración | `BRUTO` |
| Bruto normal | `BRUTO` | Usa `Volume` |
| Neto normal | `NETO` | Usa `TCVolume` |
| Minúsculas/espacios | ` neto ` | Usa `TCVolume` |
| Inválido | `COMPENSADO` | Usa `BRUTO` y genera advertencia |

### 6.2 Tramas Veeder Root/Red Jacket/Gateway

Usar las últimas tramas conocidas como datos de regresión:

| Tanque | Bruto esperado | Neto esperado |
|---:|---:|---:|
| 1 | 11174.807 | 11077.149 |
| 2 | 11105.281 | 11017.080 |
| 3 | 3198.051 | 3179.638 |

Para cada tanque verificar:

1. `VolumenBruto` y `VolumenNeto` conservan ambos datos.
2. `Volumen` coincide con la modalidad configurada.
3. `VolumenAnterior` corresponde a la lectura seleccionada anterior.
4. Pantalla y `DPVGCVOLT.VOLUMEN` coinciden con `Volumen`.
5. La temperatura, agua y por llenar no cambian por errores de desplazamiento en la trama.

### 6.3 TEAM

1. Registro con `VolBruto` y `VolNeto` válidos.
2. Registro con `VolNeto` nulo.
3. Registro con ambos valores iguales.
4. Cambio entre configuración BRUTO y NETO después de reiniciar.

### 6.4 Protocolos sin volumen TC

Para EECO, AutoStik, Incon y PetroVend ejecutar BRUTO y NETO. En ambos modos debe conservarse el valor actual; en NETO sólo debe aparecer una advertencia de fallback por sesión/protocolo.

### 6.5 Regresión funcional

- Inicio y reconexión de cada tanque.
- Comunicación serial y por socket.
- Emulación.
- Cambio de corte y escritura en `DPVGCVOLT`.
- Supresión de incrementos con `CheckBox3`.
- Cálculo de porcentaje, volumen disponible, volumen útil y capacidad.
- Recepciones `i202`, confirmando que sólo obedecen `TIPOVOLUMENENTRADATANQUES`.
- Ausencia de nuevas excepciones silenciosas en los bloques `try/except` existentes.

### 6.6 Compilación

1. Compilar `PTANMENU.dpr` con la misma versión de Delphi y librerías de producción.
2. Tratar como error cualquier referencia faltante en `DDMCONS`, especialmente si se compila contra una variante distinta.
3. Ejecutar el módulo con la clave ausente, en BRUTO y en NETO.

## 7. Criterios de aceptación

La tarea estará terminada cuando:

1. Exista una variable independiente de `DMCONS` para seleccionar inventario bruto o neto.
2. El valor predeterminado sea BRUTO y preserve el comportamiento instalado.
3. Veeder Root, Red Jacket y Gateway utilicen la posición 26 en BRUTO y la 34 en NETO.
4. TEAM utilice `VolBruto` en BRUTO y `VolNeto` en NETO.
5. Los protocolos sin TC continúen operando sin ceros ni bloqueos.
6. `VolumenAnterior`, pantalla, cálculos y `DPVGCVOLT.VOLUMEN` utilicen el mismo valor seleccionado.
7. La pantalla o el log identifiquen claramente el modo efectivo.
8. La lógica de entregas permanezca independiente y sin regresiones.
9. Las pruebas con tramas conocidas reproduzcan los valores esperados.
10. El proyecto compile y complete una prueba de operación controlada sin errores nuevos.

## 8. Riesgos y mitigaciones

| Riesgo | Impacto | Mitigación |
|---|---|---|
| Confundir la nueva preferencia con `TipoVolumenEntradaTanques` | Cambios involuntarios en recepciones | Usar una variable y clave independientes |
| Configuración inválida | Volumen incorrecto o cero | Normalizar, validar y usar BRUTO como fallback |
| Protocolo sin TC ejecutado en NETO | Expectativa incorrecta | Fallback explícito y advertencia única |
| Mezcla histórica bruto/neto en `DPVGCVOLT.VOLUMEN` | Reportes no comparables a través del cambio | Registrar modo y fecha exacta del despliegue |
| Duplicación entre parsers Veeder y Red Jacket | Comportamientos divergentes | Selector central y pruebas para ambos caminos |
| Cálculos físicos basados en volumen neto | Capacidad/porcentaje podrían cambiar semánticamente | Validación funcional específica antes del piloto |
| Excepciones absorbidas por `except` vacíos | Fallos difíciles de detectar | Agregar log en los puntos nuevos y revisar pruebas con datos inválidos |

## 9. Estrategia de reversión

La reversión operativa inmediata consistirá en cambiar:

```ini
TIPOVOLUMENINVENTARIOTANQUES=BRUTO
```

y reiniciar el módulo. Como BRUTO es el valor predeterminado, también se puede retirar temporalmente la clave. Si el problema es de código, restaurar el ejecutable anterior; no habrá una migración de base de datos que revertir.

## 10. Decisiones que deben confirmarse antes de codificar

1. Confirmar que el nombre de configuración aceptado será `TIPOVOLUMENINVENTARIOTANQUES`.
2. Confirmar que `DPVGCVOLT.VOLUMEN` debe almacenar el valor seleccionado, no siempre el bruto.
3. Confirmar si `Capacidad`, `PorLlenar90` y el porcentaje deben calcularse con el valor seleccionado o conservar base física bruta.
4. Confirmar si las demás variantes de `DDMCONS` deben recibir la misma variable en la misma entrega.
5. Confirmar si se desea una futura columna de auditoría para distinguir registros históricos BRUTO/NETO.

La recomendación para la primera entrega es: nueva clave independiente, BRUTO predeterminado, persistencia del valor seleccionado, cálculos actuales sin cambios adicionales y despliegue piloto documentado antes de activar NETO en producción.
