unit ULIBLICENCIAS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, dbTables,
  ULIBGRAL;

const
  AcercaDeDerechos = 'Derechos Reservados: Imagen Computación';
  AcercaDeComentario = 'Tels: (668) 818-1023 y 818-1026';

var

   NewPassword:longint;


var
    idEmpresa      :string;
    idClaveDia     :string;
    TablaSistImg   :TTable;
    DemoRestante   :word;
    FechaTrabajoAct    :TDateTime;
    Sw1234         :boolean=true;
    ModoDemo       :boolean=false;
    idDemo          :string='';
    DiasDemo        :integer=0;
    lvCodigoErr     :integer;
    lvWarning       :boolean;


function LicenciaValida2(xEmpresa,xSistema,xVersion,xTipoLicencia,xlicencia:string;xUsuarios:integer;xLimitada:boolean;xFechaVence:TDateTime):boolean;


implementation

var LicenciaDemo :boolean;

function LicenciaSist(xEmpresa,xSistema,xVersion,xTipoLicencia:string;xLicenciaTemporal:boolean;xFechaVence:TDateTime):string;
const vocales='IOAEU';
      numv=5;
      consona='QVRWPSDFKLZXCTYBNMGHJ';
      numc=21;
      digitos='8903451267';
      numd=10;

var sem_c,sem_d,sem_v:longint;
    xtipo:string;

  function SumaOrd(ss:string):longint;
  var i:longint;
  begin
    result:=0;
    for i:=1 to length(ss) do
      if ord(ss[i]) in [32..122] then
        result:=result+ord(ss[i]);
  end;

  function Char_c:char;
  var i:byte;
  begin
    i:=(sem_c+sem_v+sem_d)mod(numc)+1;
    result:=consona[i];
    sem_c:=sem_c+sem_v
  end;

  function Char_v:char;
  var i:byte;
  begin
    i:=(sem_c+sem_v+sem_d)mod(numv)+1;
    result:=vocales[i];
    sem_v:=sem_v+sem_d;
  end;

  function Char_d:char;
  var i:byte;
  begin
    i:=(sem_c+sem_v+sem_d)mod(numd)+1;
    result:=digitos[i];
    sem_d:=sem_d+sem_c
  end;

begin
  if xLicenciaTemporal then
    xempresa:=xempresa+FechaPaq(xFechaVence);
  xtipo:=FiltraStrNum(xTipoLicencia);
  xempresa:=LimpiaStr(xEmpresa);
  sem_c:=sumaord(Mayusculas(xempresa)+xtipo);
  sem_d:=sumaord(Mayusculas(xempresa+xsistema)+xtipo);
  sem_v:=sumaord(Mayusculas(xempresa+xsistema+xversion)+xtipo);
  result:=char_c + char_v + char_c + char_v + char_c +
          char_d + char_d + char_d;
end;



function LicenciaValida2(xEmpresa,xSistema,xVersion,xTipoLicencia,xlicencia:string;xUsuarios:integer;xLimitada:boolean;xFechaVence:TDateTime):boolean;
var xlic,ss:string;
    Lista:TStrings;
    i:word;
begin
  lvCodigoErr:=0;
  if (xlimitada)and(date>xFechaVence) then begin
    raise Exception.Create('Licencia Vencida: '+FechaPaq(xfechaVence));
    lvCodigoErr:=1;
  end;
  if lvWarning then
    if (xlimitada)and(date>=xFechaVence-7) then
      MensajeWarn('Advertencia: Licencia vence el '+FechaPaq(xfechaVence));
  result:=false;
  if xUsuarios>0 then
    xTipoLicencia:=IntToStr(xUsuarios);
  xempresa:=LimpiaStr(xEmpresa);
  if xlicencia<>'DEMO' then begin
    LicenciaDemo:=false;
    xlic:=LicenciaSist(xEmpresa,xSistema,xVersion,FiltraStrNum(xTipoLicencia),xLimitada,xFechaVence);
    result:=StrMayuscIguales(xlic,xlicencia);
  end
  else if length(xsistema)>=5 then begin
    lvCodigoErr:=2;
    raise Exception.Create('Submodulos no pueden instalarse como DEMO');
  end
  else begin
    if sw1234 then begin
      Lista:=TStringList.Create;
      try
        Lista.Assign(TablaSistImg.FieldByName('Tablas'));
        if Lista.Count=0 then begin
          i:=51;
        end
        else begin
          try
            ss:=DesEncriptaStr(Lista.strings[0]);
            i:=StrToInt(ss);
          except
            i:=51;
          end;
          if i=0 then begin
            lvCodigoErr:=3;
            raise exception.Create('Demo esta Vencido');
          end;
          dec(i);
        end;
        ss:=EncriptaStr(inttostr(i));
        Lista.Clear;
        Lista.Add(ss);
        DemoRestante:=i;
        TablaSistImg.Edit;
        TablaSistImg.FieldByName('Tablas').assign(lista);
        TablaSistImg.Post;
        LicenciaDemo:=true;
        result:=true;
      finally
        Lista.Free;
      end;
    end
    else begin
      LicenciaDemo:=true;
      result:=true;
    end;
  end;
end;


Begin
  LicenciaDemo:=false;
end.








