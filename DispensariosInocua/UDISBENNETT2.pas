unit UDISBENNETT2;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, DBGrids, RXShell, Registry,
  IBCtrls, SIBEABase, SIBFIBEA, FIBDatabase, pFIBDatabase, UIMGUTIL,
  dxGDIPlusClasses,ShellApi;

Const MaxEsperaRsp=5;
      NivelPrecioContado='1';
      NivelPrecioCredito='2';
      MCxP=4;

type
  TFDISBENNETT2 = class(TForm)
    Ap1: TApdComPort;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    ListBoxPC1: TListBox;
    ListBoxPC2: TListBox;
    ListBoxPC3: TListBox;
    ListBoxPC4: TListBox;
    PanelPC1: TPanel;
    PanelPC2: TPanel;
    PanelPC3: TPanel;
    PanelPC4: TPanel;
    Timer1: TTimer;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    ListBox1: TListBox;
    PopupMenu1: TPopupMenu;
    Restaurar1: TMenuItem;
    BitBtn3: TBitBtn;
    TabSheet1: TTabSheet;
    StaticText5: TStaticText;
    ImageList1: TImageList;
    Panel2: TPanel;
    ListView1: TListView;
    NotificationIcon1: TRxTrayIcon;
    DBGrid3: TDBGrid;
    TL_Bomb: TTable;
    TL_BombMANGUERA: TIntegerField;
    TL_BombPOSCARGA: TIntegerField;
    TL_BombCOMBUSTIBLE: TIntegerField;
    TL_BombISLA: TIntegerField;
    TL_BombCON_PRECIO: TIntegerField;
    TL_BombCON_POSICION: TIntegerField;
    TL_BombCON_DIGITOAJUSTE: TIntegerField;
    TL_BombIMPRESORA: TIntegerField;
    TL_Tcmb: TTable;
    TL_TcmbCLAVE: TIntegerField;
    TL_TcmbNOMBRE: TStringField;
    TL_TcmbCLAVEPEMEX: TStringField;
    TL_TcmbCON_PRODUCTOPRECIO: TStringField;
    TL_TcmbPRECIOFISICO: TFloatField;
    StaticText17: TStaticText;
    Button1: TButton;
    Timer2: TTimer;
    StaticText7: TStaticText;
    TL_BombACTIVO: TStringField;
    TL_BombIMPRIMEAUTOM: TStringField;
    TL_BombDIGITOAJUSTEPRECIO: TIntegerField;
    TL_BombCAMPOLECTURA: TStringField;
    TL_BombMODOOPERACION: TStringField;
    Image1: TImage;
    PageControl1: TPageControl;
    Button2: TButton;
    Button3: TButton;
    AbrirUbicacin1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Ap1TriggerAvail(CP: TObject; Count: Word);
    procedure Timer1Timer(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotificationIcon1DblClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBoxPC1DblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    SwInicio:boolean;
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwEspera,
    SwBcc,
    swcierrabd,
    FinLinea:boolean;
    ContEspera,
    ContEsperaPaso2,
    StEsperaPaso3,
    ContEsperaPaso3,
    NumPaso,
    ContBuffLleno,
    errbcc,
    PosicionActual:integer;
    swprocesando:boolean;
    UltimoStatus:string;
    SnPosCarga:integer;
    SnImporte,SnLitros:real;
    //EmularEstatus   :string;
    //LineaEmular:string;
    SwMensaje:boolean;
    ContadorAlarma:integer;
  public
    { Public declarations }
    function StringCom(ss:string):string;
    function CalculaBCC(ss:string):char;
    procedure ComandoConsola(ss:string);
    procedure ComandoConsolaBuff(ss:string;swinicio:boolean);
    procedure ProcesaLinea;
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    function PosicionDeCombustible(xpos,xcomb:integer):integer;
    procedure EnviaPreset(var rsp:string;xcomb:integer);
  end;

type
     tiposcarga = record
       estatus  :integer;
       descestat:string[20];
       importe,
       volumen,
       precio   :real;
       Isla,
       PosActual:integer; // Posicion del combustible en proceso: 1..NoComb
       PosAutorizada:integer;
       estatusant:integer;
       NoComb   :integer; // Cuantos combustibles hay en la posicion
       Estat_Cons:char;
       TComb    :array[1..MCxP] of integer; // Claves de los combustibles
       TPos     :array[1..MCxP] of integer;
       TMang        :array[1..MCxP] of integer;
       TotalLitros  :array[1..MCxP] of real;
       TotalLtsAnt  :array[1..MCxP] of real;
       SwDesp,SwA,SwPrec   :boolean;
       HoraFinv,
       Hora         :TDateTime;
       SwInicio,
       SwInicio2    :boolean;
       SwPreset,
       SwCargaTotales,
       IniciaCarga,
       SwPrepago:boolean;
       IntentosTotales:byte;
       ActualizarPrecio:Boolean;
       Mensaje:string[30];
       swcargando,
       swcargapreset,
       SwActivo,
       SwCmndF,
       SwDesHabilitado,
       SwOcc,SwCmndB  :boolean;
       ModoOpera    :string[8];
       ContPreset,
       ContOcc,
       ErrorCode,
       StCero       :integer;
       TipoPago     :integer;
       TipoPagoAnt  :integer;
       FinVenta     :integer;

       horaprotegida:TDateTime;

       PresetCont,
       PresetComb,
       PresetImpoN:integer;
       PresetImpo:real;
       SwPresetHora:boolean;
       PresetHora:TDateTime;
     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=5;
      MaxEspera3=5;


var
  FDISBENNETT2: TFDISBENNETT2;
  TPosCarga:array[1..100] of tiposcarga;
  MaxPosCarga:integer;
  MaxPosCargaActiva:integer;
  AvanceBar:integer;
  SwAplicaCmnd,
  SwSolOk:boolean;
  ContDA,
  StErrSol:integer;
  ruta_db:string;
  // CONTROL TRAFICO COMANDOS
  ListaCmnd    :TStrings;
  LinCmnd      :string;
  CharCmnd     :char;
  SwEsperaRsp  :boolean;
  ContEsperaRsp:integer;

  NumPaso      :integer;
  SwCerrar    :boolean;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}


procedure TFDISBENNETT2.DespliegaPrecios;
begin
  with DMCONS do begin
    Q_CombIb.Active:=false;
    Q_CombIb.Active:=true;
    DBGrid3.Refresh;
  end;
end;

// Inicializacion de Parametros

procedure TFDISBENNETT2.IniciaBaseDeDatos;
var i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    try
      //if not swemular then begin
        Ap1.Open:=false;
        Ap1.ComNumber:=ptPuerto;
        Ap1.Baud:=ptBaudios;
        case ptParidad[1] of
          'N':Ap1.Parity:=pNone;
          'E':Ap1.Parity:=pEven;
          'O':Ap1.Parity:=pOdd;
        end;
        Ap1.DataBits:=ptBitsDatos;
        Ap1.StopBits:=ptBitsParada;
        Ap1.Open:=true;
      //end;

      // Carga Pos. Carga
      Q_BombIb.Active:=false;
      Q_BombIb.Active:=true;

      if Q_BombIb.IsEmpty then
        raise Exception.Create('Estación no existe, o no tiene posiciones de carga configurados');

      // Carga Combustibles
      for i:=1 to MaxComb do with TabComb[i] do begin
        Activo:=false;
        Nombre:='';
        Precio:=0;
        AplicaPrecio:=false;
        Agruparcon:=0;
      end;
      Q_CombIb.Active:=true;
      Q_CombIb.First;
      while not Q_CombIb.Eof do begin
        if Q_CombIbClave.AsInteger in [1..MaxComb] then begin
          i:=Q_CombIbClave.AsInteger;
          with TabComb[i] do begin
            Activo:=true;
            Nombre:=Q_CombIbNombre.AsString;
            AgruparCon:=Q_CombIbAgrupar_con.AsInteger;
          end;
        end;
        Q_CombIb.Next;
      end;
      CargaPreciosFH(Now,true); // guarda precio actual como físico
      Q_CombIb.Active:=false;
      Q_CombIb.Active:=true;
      DespliegaPrecios;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISBENNETT2.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
begin
  with DMCONS do begin
    swcierrabd:=false;
    ListView1.Items.Clear;
    MaxPosCarga:=0;
    for i:=1 to 100 do with TPosCarga[i] do begin
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      Estat_Cons:=' ';
      SwInicio:=true;
      SwInicio2:=true;
      IniciaCarga:=false;
      SwPrepago:=false;
      SwPreset:=false;
      ContPreset:=0;
      ActualizarPrecio:=false;
      Mensaje:='';
      importe:=0;
      volumen:=0;
      precio:=0;
      for j:=1 to MCxP do begin
        TotalLitros[j]:=0;
        TotalLtsAnt[j]:=0;
      end;
      SwCargando:=false;
      SwCargaPreset:=false;
      SwCargaTotales:=true;
      IntentosTotales:=0;
      PosAutorizada:=0;
      SwDeshabilitado:=false;
      SwCmndF:=false;
      HoraProtegida:=0;
      SwActivo:=false;
      StCero:=0;
      tipopago:=0;
      errorcode:=0;
      tipopagoant:=0;
      finventa:=0;
      SwOCC:=false;
      ContOcc:=0;
      PresetImpo:=0;
      PresetImpoN:=0;
      PresetComb:=0;
      PresetCont:=0;
      SwPresetHora:=false;
    end;
    // CARGA DEFAULTS BENNETT
    TL_Bomb.Active:=true;
    while not TL_Bomb.Eof do begin
      TL_Bomb.Edit;
      if not (TL_BombCon_Posicion.AsInteger in [1..4]) then begin
        if (TL_BombCombustible.AsInteger in [1..2]) then
          TL_BombCon_Posicion.AsInteger:=TL_BombCombustible.AsInteger
        else
          TL_BombCon_Posicion.AsInteger:=1;
      end;
      TL_Bomb.Post;
      TL_Bomb.Next;
    end;
    // FIN
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xisla:=Q_BombIbIsla.asinteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      xcomb:=Q_BombIbCombustible.AsInteger;
      if (xpos>MaxPosCarga)and(xpos<=DMCONS.MaximoDePosiciones) then begin
        MaxPosCarga:=xpos;
        ListView1.Items.Add;
        ListView1.Items[MaxPosCarga-1].Caption:=IntToClaveNum(xpos,2);
        ListView1.Items[MaxPosCarga-1].ImageIndex:=0;
      end;
      with TPosCarga[xpos] do begin
        Isla:=xisla;
        SwDesp:=false;
        SwA:=false;
        SwPrec:=false;
        existe:=false;
        ModoOpera:=Q_BombIbModoOperacion.AsString;
        for i:=1 to NoComb do
          if TComb[i]=xcomb then
            existe:=true;
        if not existe then begin
          inc(NoComb);
          TComb[NoComb]:=xcomb;
          if Q_BombIbCon_Posicion.AsInteger>0 then
            TPos[NoComb]:=Q_BombIbCon_Posicion.AsInteger
          else if NoComb<=MCxP then
            TPos[NoComb]:=NoComb
          else
            TPos[NoComb]:=1;
          TMang[NoComb]:=Q_BombIbManguera.AsInteger;
        end;
      end;
      Q_BombIb.Next;
    end;
  end;
  ListBox1.Items.Clear;
  xnum:=(MaxPosCarga)div(4);
  if (MaxPosCarga)mod(4)>0 then
    inc(xnum);
  for i:=1 to xnum do begin
    if i<xnum then
      ListBox1.Items.add('Posiciones '+IntToClaveNum(i*4-3,2)+' - '+IntToClaveNum(i*4,2))
    else
      ListBox1.Items.add('Posiciones '+IntToClaveNum(i*4-3,2)+' - '+IntToClaveNum(MaxPosCarga,2));
  end;
end;


procedure TFDISBENNETT2.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      ContDA:=0;
      SwMensaje:=false;
      ErrorInic:=true;
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      SwProcesando:=false;
      SwEspera:=false;
      SwEsperaRsp:=false;
      ContEspera:=0;
      ContEsperaPaso2:=0;
      StEsperaPaso3:=0;
      ContEsperaPaso3:=0;
      ContBuffLleno:=0;
      NumPaso:=0;
      StaticText5.Caption:=IntToStr(NumPaso);
      Linea:='';
      LineaBuff:='';
      LineaTimer:='';
      errbcc:=0;
      SwBcc:=false;
      FinLinea:=false;
      IniciaEstacion;
      ListBox1.SetFocus;
      Timer1.Enabled:=true;
      Timer2.Enabled:=true;
      DMCONS.T_ConfIb.Active:=true;
      (*
      if DMCONS.SwEmular then begin
        LineaEmular:='';
        EmularEstatus:=LlenaStr('','N',MaxPosCarga*2,'1');
      end;

      Timer3.Enabled:=DMCONS.SwEmular;
      if DMCONS.SwEmular then
        Label4x.Visible:=true;
        *)
      ErrorInic:=false;
    finally
      Timer1.Enabled:=true;
      //Timer3.Enabled:=DMCONS.SwEmular;
    end;
  end;
end;

// Fin de inicializacion de parametros

function TFDISBENNETT2.StringCom(ss:string):string;
var str:string;
    i:integer;
begin
  for i:=1 to length(ss) do begin
    case ss[i] of
      idACK: str:=str+'<ACK>';
      idNAK: str:=str+'<NAK>';
      idSTX: str:=str+'<STX>';
      idETX: str:=str+'<ETX>';
      else str:=str+ss[i];
    end;
  end;
  result:=str;
end;

function TFDISBENNETT2.CalculaBCC(ss:string):char;
var i,n,m:integer;
begin
  n:=0;
  for i:=1 to length(ss) do
    n:=n+ord(ss[i]);
  m:=(n)mod(256);
  result:=char(256-m);
end;

procedure TFDISBENNETT2.LimpiaConsola;
begin
  StaticText1.Caption:='  ';
  StaticText2.Caption:='  ';
  StaticText3.Caption:='  ';
  StaticText4.Caption:='  ';
  ListBoxPC1.Items.Clear;
  ListBoxPC2.Items.Clear;
  ListBoxPC3.Items.Clear;
  ListBoxPC4.Items.Clear;
  panelPC1.color:=ClWhite;
  panelPC2.color:=ClWhite;
  panelPC3.color:=ClWhite;
  panelPC4.color:=ClWhite;
  panelPC1.Caption:='';
  panelPC2.Caption:='';
  panelPC3.Caption:='';
  panelPC4.Caption:='';
end;

procedure TFDISBENNETT2.DespliegaPosCarga(xpos:integer);
var i,ii,xp,rango,posi,posf,xcomb,xc:integer;
    xnombre,xdescrip:string;
    xprecio,xprecio2,xdifprec,xdiflts:real;
begin
  try
    try
      StaticText5.Caption:=IntToStr(NumPaso);
      rango:=ListBox1.ItemIndex+1;
      if rango=0 then
        rango:=1;
      posi:=rango*4-3;
      posf:=rango*4;
      with TPosCarga[xpos] do begin
        xdescrip:=descestat;
        if xdescrip='Error' then
          xdescrip:=xdescrip+' '+inttoclavenum(errorcode,2);
        xcomb:=CombustibleEnPosicion(xpos,PosActual);
        if xcomb in [1..maxcomb] then
          xnombre:=DMCONS.TabComb[xcomb].Nombre;
        if xpos in [posi..posf] then begin
          i:=xpos-posi+1;
          TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(xpos,2);
          if not SwDesHabilitado then begin
            TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:=xdescrip;
            case estatus of
              5:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClLime;
              1:if not SwPreset then
                  TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClRed
                else
                  TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClGray;
              2:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClGray;
              3,4:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClYellow;
              7:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClBlue;
              else TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
            end;
          end
          else begin
            TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:='Deshabilitado';
            TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
          end;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Clear;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('$ '+FormatFloat('###,##0.00',importe)+' Pesos');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.00',precio)+' $/Lts');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(xnombre);
          if swmensaje then
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(Mensaje)
          else
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
          for xp:=1 to NoComb do
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                     ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3)
                     );
        end;
      end;

      // Refresca Listas
      for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
        if ModoOpera='Normal' then begin
          case estatus of
            1,2:if not SwPreset then
                  ListView1.Items[i-1].ImageIndex:=1
                else ListView1.Items[i-1].ImageIndex:=7;
            5:ListView1.Items[i-1].ImageIndex:=2;
            3..4:ListView1.Items[i-1].ImageIndex:=3;
            else ListView1.Items[i-1].ImageIndex:=0;
          end;
        end
        else begin
          case estatus of
            1,2:if not SwPreset then
                  ListView1.Items[i-1].ImageIndex:=4
                else ListView1.Items[i-1].ImageIndex:=8;
            5:ListView1.Items[i-1].ImageIndex:=5;
            3..4:ListView1.Items[i-1].ImageIndex:=6;
            else ListView1.Items[i-1].ImageIndex:=0;
          end;
        end;
        ListView1.Items[i-1].Caption:=IntToClaveNum(i,2)+'-'+IntToStr(Estatus)+
                      '  '+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ');
        if SwDesp then with DMCONS do begin
          SwDesp:=false;
          if (importe>0.001)or(tipopago>0) then begin
            SwCargaTotales:=true;
            IntentosTotales:=0;
            try
              try
                swcierrabd:=true;
                if not DBGASCON.Connected then begin
                  DBGASCON.Connected:=true;
                  esperamiliseg(300);
                end;
                T_MoviIb.Active:=true;
                T_MoviIb.Insert;
                T_MoviIbFecha.AsDateTime:=date;
                T_MoviIbHora.AsDateTime:=now;
                T_MoviIbHoraStr.AsString:=HoraPaq(T_MoviIbHora.AsDateTime);
                T_MoviIbPosCarga.AsInteger:=i;
                xcomb:=CombustibleEnPosicion(i,PosActual);
                if TabComb[xcomb].Agruparcon>0 then begin
                  T_MoviIbKilometraje.asinteger:=TMang[PosActual];
                  xc:=TabComb[xcomb].Agruparcon;
                  if TabComb[xc].Activo then
                    xcomb:=xc;
                end;
                T_MoviIbCombustible.AsInteger:=xcomb;
                T_MoviIbVolumen.AsFloat:=AjustaFloat(Volumen,3);
                T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
                xprecio:=TabComb[xcomb].Precio;
                xprecio2:=dividefloat(importe,volumen);
                xdifprec:=abs(xprecio-xprecio2);
                if (xdifprec*10)<=xprecio2 then begin
                  T_MoviIbPrecio.AsFloat:=xprecio;
                end;
                T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLitros[1],3);
                T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLitros[2],3);
                T_MoviIbTotal03.AsFloat:=AjustaFloat(TotalLitros[3],3);
                T_MoviIbTotal04.AsFloat:=AjustaFloat(TotalLitros[4],3);
                xdiflts:=0;
                for ii:=1 to 4 do begin
                  if TotalLtsAnt[ii]>0 then begin
                    xdiflts:=xdiflts+abs(TotalLtsAnt[ii]-TotalLitros[ii]);
                  end;
                  TotalLtsAnt[ii]:=TotalLitros[ii];
                end;
                T_MoviIbTag.AsInteger:=0;
                T_MoviIbManguera.AsInteger:=TMang[PosActual];
                T_MoviIbTipoPago.asinteger:=TPosCarga[i].TipoPago;
                T_MoviIbCuponImpreso.AsString:='No';
                T_MoviIbReferenciaBitacora.AsInteger:=0;
                T_MoviIbGasId.AsInteger:=Random(1000000);
                TPosCarga[i].TipoPagoAnt:=TPosCarga[i].TipoPago;
                TPosCarga[i].TipoPago:=0;

                if swprec then begin
                  dmcons.ActualizaTotalesPrecio(i,posactual,volumen);
                  swprec:=false;
                end;

                T_MoviIb.post;

                if (lcLicTemporal)and(date>lcLicVence) then begin
                  MensajeErr('Licencia vencida. Llame a su distribuidor');
                  Application.Terminate;
                end;
              finally
              end;
            except
            end;
          end;
        end;
      end;
    finally
      with DMCONS do begin
        if (T_MoviIb.State in [dsInsert,dsEdit]) then
          T_MoviIb.Cancel;
      end;
    end;
  except
  end;
end;

Function EjecutaCorte:string;
var rsp:string;
    xpos,xpr,xcomb:integer;
begin
  with DMCONS do begin
    rsp:='OK';
    try
      SwCorteOk:=true;
      if not SwCorteParcial then begin
        for xpos:=1 to MaxPosCarga do begin
          if (TPosCarga[xpos].isla=xIslaCorte)or(xIslaCorte=0) then begin
            if TPosCarga[xpos].swcargando then begin
              SwCorteOk:=false;
              Rsp:='Existen dispensarios cargando';
            end;
          end;
        end;
      end;
      if SwCorteOk then begin
        T_Corte.Active:=true;
        try
          for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
            if (TPosCarga[xpos].isla=xIslaCorte)or(xIslaCorte=0) then begin
              for xpr:=1 to NoComb do begin
                xcomb:=TComb[xpr];
                if xcomb>0 then begin
                  if T_Corte.Locate('Fecha;Turno;Isla;PosCarga;Combustible',
                     VarArrayOf([xFechaCorte,xTurnoCorte,TPosCarga[xpos].isla,xpos,xcomb]),[]) then
                    T_Corte.Delete;
                  T_Corte.Insert;
                  T_CorteFecha.AsDateTime:=xFechaCorte;
                  T_CorteTurno.AsInteger:=xTurnoCorte;
                  T_CorteIsla.AsInteger:=TPosCarga[xpos].isla;
                  T_CortePosCarga.AsInteger:=xpos;
                  T_CorteCombustible.AsInteger:=xcomb;
                  T_CorteContadorLitros.AsFloat:=AjustaFloat(Totallitros[xpr],3);
                  T_CorteContadorImporte.AsFloat:=0;
                  T_Corte.Post;
                end;
              end;
            end;
          end;
        finally
          T_Corte.Active:=false;
        end;
      end
      else begin
        rsp:='ERROR: '+Rsp;
      end;
    except
      if (T_Corte.State in [dsInsert,dsEdit]) then
        T_Corte.Cancel;
      rsp:='ERROR: Al insertar registro de Corte';
    end;
  end;
  result:=rsp;
end;

procedure TFDISBENNETT2.ProcesaLinea;
label uno;
var lin,ss,ss2,rsp,rsp2,
    descrsp,xestado,xmodo,
    xdisp2,xmodo2,xestado2,
    sslin           :string;
    simp,spre,sval  :string[20];
    xcmnd,
    i,j,xpos,ii     :integer;
    XMANG,XCTE,XVEHI,
    xp,xpr,xcomb,xfolio:integer;
    xLista:TStrings;
    ximporte,
    ximpo,xdif,
    xprecio,xvol    :real;
    swerr           :boolean;
    totlts:array[1..4] of real;
begin
  try
    if LineaTimer='' then
      exit;
    SwEsperaRsp:=false;
    ContEsperaRsp:=0;
    if length(LineaTimer)>3 then begin
      while (LineaTimer[1]<>idSTX)and(length(LineaTimer)>3) do
        delete(LineaTimer,1,1);
      lin:=copy(lineaTimer,2,length(lineatimer)-3);
    end
    else
      lin:=LineaTimer;
    LineaTimer:='';
    if lin='' then
      exit;
    case lin[1] of
     'B':begin // pide estatus de todas las bombas
           NumPaso:=1;
           StaticText5.Caption:=IntToStr(NumPaso);
           ContEspera:=0;
           UltimoStatus:=LineaTimer;
           sslin:=copy(lin,4,length(lin)-3);
           MaxPosCargaActiva:=(length(sslin))div(2);
           if MaxPosCargaActiva>MaxPosCarga then
             MaxPosCargaActiva:=MaxPosCarga;
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do begin
               SwCmndB:=true;
               PosActual:=StrToIntDef(sslin[xpos*2-1],0);    // Saca posicion de la manguera
               if PosActual=0 then begin
                 PosActual:=1;
                 for i:=1 to NoComb do begin
                   xcomb:=TComb[i];
                   if abs(precio-DMCONS.TabComb[xcomb].precio)<0.1 then
                     PosActual:=TPos[i];
                 end;
               end;
               if estatusant<>estatus then begin
                 SwPreset:=false;
                 SwA:=true;
               end;
               estatusant:=estatus;
               estatus:=StrToIntDef(sslin[xpos*2],0);         // Saca Estats
               if (estatus=0)and(stcero<=3) then begin
                 inc(stcero);
                 estatus:=estatusant;
               end
               else stcero:=0;
               Mensaje:='Pos = '+inttostr(posactual);
               if (estatus=0)and(SwActivo) then begin
                 if (estatusant in [1..10]) then
                   ContDA:=0
                 else
                   inc(ContDA);
                 if ContDA=5 then begin
                   SwActivo:=false;
                 end;
               end
               else if (estatus in [1..10])and(not SwActivo) then begin
                 SwActivo:=true;
               end;
               case estatus of
                 0:begin
                     descestat:='---';
                     if estatusant<>0 then begin
                       for xcomb:=1 to nocomb do
                         DMCONS.RegistraBitacora3(1,'Desconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                     end;
                   end;
                 1:begin
                     descestat:='Inactivo';
                     swcargando:=false;
                     if swprec then
                       swprec:=false;
                     if (estatusant=2)and(PresetImpo>=0.01) then begin  // vuelve a autorizar
                       SnPosCarga:=xpos;
                       SnImporte:=PresetImpo;
                       inc(PresetImpoN);
                       if PresetImpoN<=3 then
                         estatus:=estatusant;
                       EnviaPreset(rsp,PresetComb);
                     end
                     else begin
                       if estatusant<>1 then begin
                         SwPresetHora:=false;
                         PosAutorizada:=0;
                         FinVenta:=0;
                         TipoPago:=0;
                         SwOcc:=false;
                         ContOcc:=0;
                         PresetImpo:=0;
                         PresetImpoN:=0;
                         if SwCmndF then begin
                           ss:='F'+IntToClaveNum(xpos,2)+'9999';
                           ComandoConsolaBuff(ss,false);
                           SwCmndF:=false;
                         end;
                       end;
                       if estatusant=0 then begin
                         for xcomb:=1 to nocomb do
                           DMCONS.RegistraBitacora3(1,'Reconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                       end;
                     end;
                   end;
                 2:begin
                     descestat:='Autorizado';
                     if (SwPresetHora)and((now-PresetHora)>5*TmSegundo) then begin
                       ss:='E'+IntToClaveNum(xpos,2); // Desautorizar
                       ComandoConsolaBuff(ss,false);
                     end

                     else if estatusant=4 then begin
                       SwPresetHora:=true;
                       PresetHora:=Now;
                     end;
                   end;
                 3:begin
                     swcargando:=false;
                     descestat:='Pistola Levantada';
                     if (estatusant=4)and(PresetImpo>=0.01) then begin  // vuelve a autorizar
                       SnPosCarga:=xpos;
                       SnImporte:=PresetImpo;
                       inc(PresetImpoN);
                       if PresetImpoN<=3 then
                         estatus:=estatusant;
                       EnviaPreset(rsp,PresetComb);
                     end;
                   end;
                 4:begin
                     descestat:='Listo para Despachar';
                   end;
                 5:begin
                     descestat:='Despachando';
                     IniciaCarga:=true;
                     if not SwCargando then
                       SwCargaPreset:=true;
                     swcargando:=true;
                     if (DMCONS.BennettPararVentaCompleta='Si')and(TPosCarga[xpos].presetimpo>0.5)then begin
                       if (TPosCarga[xpos].importe>=abs(TPosCarga[xpos].presetimpo-0.001)) then begin
                         ss:='E'+IntToClaveNum(xpos,2); // STOP
                         ComandoConsolaBuff(ss,false);
                         Esperamiliseg(300);
                         (*
                         if DMCONS.swemular then
                           EmularEstatus[2*xpos]:='6';
                           *)
                       end;
                     end;
                   end;
                 6:begin
                     descestat:='Detenido';
                   end;
                 7:begin
                     descestat:='Fin de Venta';
                     if Estatus<>Estatusant then
                       HoraFinv:=Now;
                     if (Now-HoraFinv)>=2*TmMinuto then begin
                       ComandoConsola('J'+IntToClaveNum(xpos,2));
                       (*
                       if DMCONS.swemular then
                         EmularEstatus[2*xpos]:='1';
                         *)
                     end;
                   end;
                 8:descestat:='Venta Pendiente';
                 9:begin
                     descestat:='Error';
                     ComandoConsola('D'+IntToClaveNum(xpos,2));
                     Esperamiliseg(100);
                     DespliegaPosCarga(xpos);
                   end;
               end;
             end;
           end;
           // Verifica si hay cambio de precios
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do if xpos<=dmcons.MaximoDePosiciones then begin
               // Actualiza Precios
               if ActualizarPrecio then with DMCONS do begin
                 for i:=1 to NoComb do begin
                   if ValidaCifra(TabComb[TComb[i]].precio,2,2)='OK' then begin
                     if TabComb[TComb[i]].precio>=0.01 then begin
                       // precio contado
                       ss:='U'+IntToClaveNum(xpos,2)+NivelPrecioContado+IntToStr(TPos[i])+FiltraStrNum(FormatoNumeroSinComas(TabComb[TComb[i]].precio,5,2));
                       ComandoConsolaBuff(ss,false);
                       esperamiliseg(100);
                       // precio credito
                       ss:='U'+IntToClaveNum(xpos,2)+NivelPrecioCredito+IntToStr(TPos[i])+FiltraStrNum(FormatoNumeroSinComas(TabComb[TComb[i]].precio,5,2));
                       ComandoConsolaBuff(ss,false);
                       esperamiliseg(100);
                       if estatus in [2,4,5,6] then
                         swprec:=true;
                     end;
                   end;
                 end;
                 ActualizarPrecio:=false;
               end;
             end;
           end;
           // Checa las posiciones que estan solicitando autorizacion
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do if xpos<=dmcons.MaximoDePosiciones then begin
               if contpreset>0 then
                 dec(contpreset);
               case Estatus of
                 1:if SwInicio then begin
                     ss:='K'+IntToClaveNum(xpos,2)+'1'; // Postpago
                     ComandoConsolaBuff(ss,false);
                     ss:='L'+IntToClaveNum(xpos,2)+NivelPrecioContado; // Nivel de Precios
                     ComandoConsolaBuff(ss,false);
                     ss:='E'+IntToClaveNum(xpos,2); // Desautorizar
                     ComandoConsolaBuff(ss,false);
                     ss:='D'+IntToClaveNum(xpos,2); // Diagnostico
                     ComandoConsolaBuff(ss,false);
                     SwInicio:=false;
                     SwPrepago:=false;
                     SwPreset:=false;
                   end;
                 3:if (not SwDesHabilitado)and(ModoOpera='Normal')and(now>=HoraProtegida) then begin
                     if ContPreset<=0 then begin
                       PosAutorizada:=0;
                       FinVenta:=0;
                       if DMCONS.ModoAutorizaBennett=0 then begin
                         ss:='S'+IntToClaveNum(xpos,2); // Autorizar
                         ComandoConsolaBuff(ss,false);
                       end
                       else begin
                         SnImporte:=9990.00;
                         SnPosCarga:=xpos;
                         EnviaPreset(ss,0);
                       end;
                       presetimpo:=0;presetimpon:=0;
                       SwInicio:=false;
                       (*
                       if DMCONS.SwEmular then
                         EmularEstatus[2*xpos]:='5';
                         *)
                     end;
                   end;
               end;
             end;
           end;
         end;
     'A':begin // pide estatus de una bomba
           NumPaso:=2;
           StaticText5.Caption:=IntToStr(NumPaso);
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if (xpos>=1)and(xpos<=DMCONS.MaximoDePosiciones) then begin
             ContEsperaPaso2:=0;
             with TPosCarga[xpos] do begin
               try
                 swinicio2:=false;
                 volumen:=StrToFloat(copy(lin,5,6))/100;
                 simp:=copy(lin,11,6);
                 spre:=copy(lin,17,4);
                 importe:=StrToFloat(simp)/100;
                 precio:=StrToFloat(spre)/100;

                 // valida ventas mayores a 10000 pesos
                 ximpo:=volumen*precio;
                 xdif:=abs(ximpo-importe);
                 if xdif>=900 then begin
                   importe:=AjustaFloat(ximpo,2);
                 end;
                 // fin

                 xvol:=ajustafloat(dividefloat(importe,precio),3);
                 if abs(volumen-xvol)<0.05 then
                   volumen:=xvol;
                 if (Estatus in [7,8])and(swcargando) then begin
                   swcargando:=false;
                   swdesp:=true;
                   DMCONS.AgregaLog('GUARDA VENTA Pos:'+inttostr(xpos)+' Estatus:'+inttostr(estatus)+' - ant:'+inttostr(estatusant));
                 end;
                 DespliegaPosCarga(xpos);
                 if (TPosCarga[xpos].finventa=0) then begin
                   if Estatus in [7,8] then begin
                     ss:='J'+IntToClaveNum(xpos,2); // Fin de Venta
                     (*
                     if DMCONS.swemular then
                       EmularEstatus[2*xpos]:='1';
                       *)
                     ComandoConsola(ss);
                   end;
                 end;

               except
               end;
             end;
           end;
         end;
     '1':begin // pide estatus de una bomba
           NumPaso:=2;
           StaticText5.Caption:=IntToStr(NumPaso);
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if (xpos>=1)and(xpos<=DMCONS.MaximoDePosiciones) then begin
             ContEsperaPaso2:=0;
             with TPosCarga[xpos] do begin
               try
                 swinicio2:=false;
                 volumen:=StrToFloat(copy(lin,5,8))/100;
                 simp:=copy(lin,13,8);
                 spre:=copy(lin,21,5);
                 importe:=StrToFloat(simp)/100;
                 precio:=StrToFloat(spre)/100;
                 xvol:=ajustafloat(dividefloat(importe,precio),3);
                 if abs(volumen-xvol)<0.05 then
                   volumen:=xvol;
                 if (Estatus in [7,8])and(swcargando) then begin
                   swcargando:=false;
                   swdesp:=true;
                   DMCONS.AgregaLog('GUARDA VENTA Pos:'+inttostr(xpos)+' Estatus:'+inttostr(estatus)+' - ant:'+inttostr(estatusant));
                 end;
                 DespliegaPosCarga(xpos);
                 if (TPosCarga[xpos].finventa=0) then begin
                   if Estatus in [7,8] then begin
                     ss:='J'+IntToClaveNum(xpos,2); // Fin de Venta
                     (*
                     if DMCONS.swemular then
                       EmularEstatus[2*xpos]:='1';
                       *)
                     ComandoConsola(ss);
                   end;
                 end;

               except
               end;
             end;
           end;
         end;
     'D':begin // diagnostico     DPPSEE
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if (xpos>=1)and(xpos<=DMCONS.MaximoDePosiciones) then begin
             if lin[4]='1' then begin
               TPosCarga[xpos].ErrorCode:=StrToIntDef(copy(lin,5,2),0);
               DespliegaPosCarga(xpos);
             end;
           end;
         end;
     'N':begin // totales de la bomba
           NumPaso:=3;
           StaticText5.Caption:=IntToStr(NumPaso);
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if (xpos>=1)and(xpos<=DMCONS.MaximoDePosiciones) then begin
             ContEsperaPaso3:=0;
             with TPosCarga[xpos] do begin
               SwCargaTotales:=false;
               IntentosTotales:=0;
               Totlts[1]:=StrToFloat(copy(lin,4,10))/1000;
               Totlts[2]:=StrToFloat(copy(lin,14,10))/1000;
               Totlts[3]:=StrToFloat(copy(lin,24,10))/1000;
               Totlts[4]:=StrToFloat(copy(lin,34,10))/1000;
               for j:=1 to MCxP do
                 if TPos[j] in [1..4] then
                   TotalLitros[j]:=TotLts[TPos[j]];
               DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
               DespliegaPosCarga(xpos);
             end;
           end;
         end;
    end;
    if (ListaCmnd.Count>0)and(not SwEsperaRsp) then begin
      ss:=ListaCmnd[0];
      ListaCmnd.Delete(0);
      ComandoConsola(ss);   // Envia comunicacion al dispensario
      exit;
    end
    else begin
      inc(NumPaso);
      PosicionActual:=0;
    end;
    StaticText5.Caption:=IntToStr(NumPaso);
    // checa lecturas de dispensarios
    if NumPaso=2 then begin
      if PosicionActual<MaxPosCargaActiva then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if (estatus<>estatusant)or(estatus>=5)or(SwA)or(swinicio2)or(swcargando) then begin
              SwA:=false;
              if DMCONS.Bennett8Digitos<>'Si' then
                ComandoConsolaBuff('A'+IntToClaveNum(PosicionActual,2),false)
              else
                ComandoConsolaBuff('1'+IntToClaveNum(PosicionActual,2),false);
            end
            else
              DespliegaPosCarga(PosicionActual);
          end;
        until (PosicionActual>=MaxPosCargaActiva);
      end;
      if not SwEsperaRsp then begin
        NumPaso:=3;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionActual:=0;
      end;
    end;
    // Lee Totales
    if NumPaso=3 then with DMCONS do begin
      // GUARDA VALORES DE DISPENSARIOS CARGANDO
      try
        T_ConfIb.Active:=true;
        try
          if not T_ConfIb.IsEmpty then begin
            xestado2:='';xdisp2:='';xmodo2:='';
            try
              if dmcons.MaximoDePosiciones<24 then begin
                xdisp2:=DameDispensarios;

                // leo modo de operacion al final de la linea
                xmodo2:=ExtraeElemStrSep(xdisp2,2,'&');
                if length(xmodo2)>dmcons.MaximoDePosiciones then
                  delete(xmodo2,1,dmcons.MaximoDePosiciones)
                else xmodo2:='';

                // leo estados al principio de la linea
                ss:=ExtraeElemStrSep(xdisp2,1,'&');
                xestado2:=ExtraeElemStrSep(ss,1,'#');
                if xestado2<>'' then
                  if xestado2[1]='D' then
                    delete(xestado2,1,1);
                if length(xestado2)>dmcons.MaximoDePosiciones then
                  delete(xestado2,1,dmcons.MaximoDePosiciones)
                else xestado2:='';

                // saco lecturas de cada posicion
                ii:=NoElemStrSep(ss,'#');
                xdisp2:='';
                for i:=2 to ii do begin
                  ss2:=ExtraeElemStrSep(ss,i,'#');
                  rsp:=ExtraeElemStrSep(ss2,1,'/');
                  xpos:=strtointdef(rsp,0);
                  if xpos>dmcons.MaximoDePosiciones then
                    xdisp2:=xdisp2+'#'+ss2;
                end;
              end;
            except
            end;

            lin:='';xestado:='';xmodo:='';
            for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
              xmodo:=xmodo+ModoOpera[1];
              if not SwDesHabilitado then begin
                case estatus of
                  0:xestado:=xestado+'0'; // Sin Comunicación
                  1:xestado:=xestado+'1'; // Inactivo (Idle)
                  5:xestado:=xestado+'2'; // Cargando (In Use)
                  7:if not swcargando then
                      xestado:=xestado+'3' // Fin de Carga (Used)
                    else
                      xestado:=xestado+'2';
                  3,4:xestado:=xestado+'5'; // Llamando (Calling)
                  2,8:xestado:=xestado+'9'; // Autorizado
                  6:xestado:=xestado+'8'; // Detenido (Stoped)
                  else xestado:=xestado+'0';
                end;
              end
              else xestado:=xestado+'7'; // Deshabilitado
              xcomb:=CombustibleEnPosicion(xpos,PosActual);
              ss:=inttoclavenum(xpos,2)+'/'+inttostr(xcomb);
              ss:=ss+'/'+FormatFloat('###0.###',volumen);
              ss:=ss+'/'+FormatFloat('#0.##',precio);
              ss:=ss+'/'+FormatFloat('####0.##',importe);
              lin:=lin+'#'+ss;
            end;
            if lin='' then
              lin:=xestado+xestado2+'#'
            else
              lin:=xestado+xestado2+lin;
            lin:=lin+xdisp2+'&'+xmodo+xmodo2;
            DMCONS.ActualizaDispensarios('D'+lin);
          end;
        finally
          T_ConfIb.Active:=false;
        end;
      except
      end;
      // FIN

      if PosicionActual<MaxPosCargaActiva then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if swcargatotales then begin
              inc(intentostotales);
              if intentostotales>3 then
                swcargatotales:=false;
              ComandoConsolaBuff('N'+IntToClaveNum(PosicionActual,2),false); // Totales
            end
            else
              DespliegaPosCarga(PosicionActual);
          end;
        until (PosicionActual>=MaxPosCargaActiva);
      end;
      if not SwEsperaRsp then begin
        NumPaso:=4;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionActual:=0;
      end;
    end;
    if (NumPaso=4) then with DMCONS do begin
      // Checa Comandos
      with DMCONS do begin
        if swcierrabd then begin
          if DMCONS.CierraBD='Si' then begin
            DBGASCON.Connected:=false;
            Esperamiliseg(300);
            DBGASCON.Connected:=true;
          end;
          swcierrabd:=false;
          Q_CombIb.Active:=true;
        end;
        for xcmnd:=1 to 40 do if (TabCmnd[xcmnd].SwActivo)and(not TabCmnd[xcmnd].SwResp) then begin
          SwAplicaCmnd:=true;
          ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,1,' ');
          DMCONS.AgregaLog(TabCmnd[xcmnd].Comando);
          // CMND: CERRAR CONSOLA
          if ss='CERRAR' then begin
            rsp:='OK';
            SwCerrar:=true;
          end
          // GLOG: GUARDA LOG
          else if ss='GLOG' then begin
            rsp:='OK';
            Button1.Click;
          end
          // CMND: ACTIVA MODO PREPAGO
          else if ss='AMP' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if xpos=0 then begin
                for xpos:=1 to MaxPosCarga do
                  TPosCarga[xpos].ModoOpera:='Prepago';
                ActivaModoPrepago(0);
                rsp:='OK';
              end
              else if (xpos in [1..maxposcarga]) then begin
                TPosCarga[xpos].ModoOpera:='Prepago';
                ActivaModoPrepago(xpos);
                rsp:='OK';
              end;
            end
            else rsp:='Posicion no Existe';
          end
          // CMND: DESACTIVA MODO PREPAGO
          else if ss='DMP' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              TPosCarga[xpos].TipoPago:=0;
              if xpos=0 then begin
                for xpos:=1 to MaxPosCarga do
                  TPosCarga[xpos].ModoOpera:='Normal';
                DesActivaModoPrepago(0);
                rsp:='OK';
              end
              else if (xpos in [1..maxposcarga]) then begin
                TPosCarga[xpos].ModoOpera:='Normal';
                DesActivaModoPrepago(xpos);
                rsp:='OK';
              end;
            end
            else rsp:='Posicion no Existe';
          end
          // ORDENA CARGA DE COMBUSTIBLE EN IMPORTE
          else if ss='OCC' then begin     // OCC POSCARGA IMPORTE COMBUSTIBLE TIPOVENTA FINVENTA
            SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            xpos:=SnPosCarga;
            rsp:='OK';
            if (SnPosCarga in [1..MaxPosCarga]) then begin
              if (TPosCarga[SnPosCarga].estatus in [1,3])or(TPosCarga[SnPosCarga].SwOCC) then begin
                // Valida que se haya aplicado el PRESET
                if TabCmnd[xcmnd].SwNuevo then begin
                  TPosCarga[SnPosCarga].SwOCC:=false;
                  TabCmnd[xcmnd].SwNuevo:=false;
                end;
                Swerr:=false;
                if (TPosCarga[SnPosCarga].SwOCC) then begin
                  if (TPosCarga[SnPosCarga].SwCmndB) then begin
                    if (TPosCarga[SnPosCarga].estatus in [1,3])and(TPosCarga[SnPosCarga].ContOCC>0) then begin
                      TPosCarga[SnPosCarga].SwOCC:=false;
                    end
                    else if (TPosCarga[SnPosCarga].estatus in [1,3])and(TPosCarga[SnPosCarga].ContOCC<=0) then begin
                      rsp:='Error al aplicar PRESET';
                      Button1.Click;
                      TPosCarga[SnPosCarga].SwOCC:=false;
                      TPosCarga[SnPosCarga].ContOCC:=0;
                      Swerr:=true;
                    end;
                  end
                  else SwAplicaCmnd:=false;
                end;
                if (TPosCarga[SnPosCarga].estatus in [1,3])and(not TPosCarga[SnPosCarga].SwOCC)and(not swerr) then begin
                  TPosCarga[SnPosCarga].SwOCC:=true;
                  TPosCarga[SnPosCarga].SwCmndB:=false;
                  if TPosCarga[SnPosCarga].ContOCC=0 then
                    TPosCarga[SnPosCarga].ContOCC:=DMCONS.BennettReintentosPreset
                  else begin
                    dec(TPosCarga[SnPosCarga].ContOCC);
                    esperamiliseg(500);
                  end;
                  SwAplicaCmnd:=false;
                  try
                    SnImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                    rsp:=ValidaCifra(SnImporte,4,2);
                    if (SnImporte<0.01) then
                      rsp:='Importe en cero no permitido';
                  except
                    rsp:='Error en Importe';
                  end;
                  if rsp='OK' then begin
                    ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                    xcomb:=StrToIntDef(ss,0);
                    xp:=PosicionDeCombustible(xpos,xcomb);
                    if xp>0 then begin
                      TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                      TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                      if rsp='OK' then
                        EnviaPreset(rsp,xcomb);
                    end
                    else rsp:='Combustible no existe en esta posición';
                  end;
                end;
                if (not SwAplicaCmnd)and(rsp<>'OK') then
                   SwAplicaCmnd:=true;
              end
              else rsp:='Posicion de Carga no Disponible';
              if SwAplicaCmnd then
                TPosCarga[SnPosCarga].SwOCC:=false;
            end
            else rsp:='Posicion de Carga no Existe';
          end
          // ORDENA CARGA DE COMBUSTIBLE EN LITROS
          else if ss='OCL' then begin     // OCL POSCARGA LITROS COMBUSTIBLE TIPOVENTA FINVENTA
            SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            xpos:=SnPosCarga;
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              rsp:='OK';
              if (SnPosCarga in [1..MaxPosCarga]) then begin
                if (TPosCarga[SnPosCarga].estatus in [1,3])or(TPosCarga[SnPosCarga].SwOCC) then begin
                  // Valida que se haya aplicado el PRESET
                  if TabCmnd[xcmnd].SwNuevo then begin
                    TPosCarga[SnPosCarga].SwOCC:=false;
                    TabCmnd[xcmnd].SwNuevo:=false;
                  end;
                  Swerr:=false;
                  if (TPosCarga[SnPosCarga].SwOCC) then begin
                    if (TPosCarga[SnPosCarga].SwCmndB) then begin
                      if (TPosCarga[SnPosCarga].estatus in [1,3])and(TPosCarga[SnPosCarga].ContOCC>0) then begin
                        TPosCarga[SnPosCarga].SwOCC:=false;
                      end
                      else if (TPosCarga[SnPosCarga].estatus in [1,3])and(TPosCarga[SnPosCarga].ContOCC<=0) then begin
                        rsp:='Error al aplicar PRESET';
                        Button1.Click;
                        TPosCarga[SnPosCarga].SwOCC:=false;
                        TPosCarga[SnPosCarga].ContOCC:=0;
                        Swerr:=true;
                      end;
                    end
                    else SwAplicaCmnd:=false;
                  end;
                  if (TPosCarga[SnPosCarga].estatus in [1,3])and(not TPosCarga[SnPosCarga].SwOCC)and(not swerr) then begin
                    TPosCarga[SnPosCarga].SwOCC:=true;
                    TPosCarga[SnPosCarga].SwCmndB:=false;
                    if TPosCarga[SnPosCarga].ContOCC=0 then
                      TPosCarga[SnPosCarga].ContOCC:=DMCONS.BennettReintentosPreset
                    else begin
                      dec(TPosCarga[SnPosCarga].ContOCC);
                      esperamiliseg(500);
                    end;
                    SwAplicaCmnd:=false;
                    try
                      SnLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                      SnImporte:=0;
                      rsp:=ValidaCifra(SnLitros,4,0);
                      if rsp='OK' then
                        if (SnLitros<1) then
                          rsp:='Valor en cero no permitido'
                    except
                      rsp:='Error en Valor Litros';
                    end;
                    if rsp='OK' then begin
                      ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                      xcomb:=StrToIntDef(ss,0);
                      xp:=PosicionDeCombustible(xpos,xcomb);
                      if xp>0 then begin
                        TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                        TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                        if rsp='OK' then begin
                          ss:='F'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000',SnLitros));
                          ComandoConsolaBuff(ss,false);
                          EsperaMiliSeg(300);
                          TPosCarga[SnPosCarga].SwCmndF:=true;

                          SnImporte:=9999.99; SnLitros:=0;
                          EnviaPreset(rsp,xcomb);
                        end;
                      end
                      else rsp:='Combustible no existe en esta posición';
                    end;
                  end;
                  if (not SwAplicaCmnd)and(rsp<>'OK') then
                     SwAplicaCmnd:=true;
                end
                else rsp:='Posicion de Carga no Disponible';
                if SwAplicaCmnd then
                  TPosCarga[SnPosCarga].SwOCC:=false;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            else rsp:='Posicion no Existe';
          end
          // ORDENA FIN DE VENTA
          else if ss='FINV' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              rsp:='OK';
              if (xpos in [1..MaxPosCarga]) then begin
                TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
                if TPosCarga[xpos].Estatus in [7,8,1] then begin // EOT
                  if (not TPosCarga[xpos].swcargando) then begin
                    ss:='J'+IntToClaveNum(xpos,2); // Fin de Venta
                    (*
                    if DMCONS.swemular then
                      EmularEstatus[2*xpos]:='1';
                      *)
                    ComandoConsola(ss);
                    TPosCarga[xpos].SwCargaTotales:=true;
                    try
                      EsperaMiliSeg(100);
                      if not DBGASCON.Connected then
                        DBGASCON.Connected:=true;
                      Q_Auxi.Active:=false;
                      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
                      Q_Auxi.SQL.Clear;
                      Q_Auxi.SQL.Add('Select Max(Folio) as Entero1 from DPVGMOVI');
                      Q_Auxi.SQL.Add('Where PosCarga='+inttostr(xpos));
                      Q_Auxi.Active:=true;
                      if Q_AuxiEntero1.AsInteger>0 then begin
                        EsperaMiliSeg(100);
                        xfolio:=Q_AuxiEntero1.AsInteger;
                        Q_Auxi.Active:=false;
                        Q_Auxi.SQL.Clear;
                        Q_Auxi.SQL.Add('Update DPVGMOVI set tipopago='+inttostr(TPosCarga[xpos].tipopago));
                        Q_Auxi.SQL.Add('Where Folio='+inttostr(xfolio));
                        Q_Auxi.ExecSQL;
                        TPosCarga[xpos].tipopago:=0;
                      end;
                    except
                      on e:exception do
                      DMCONS.AgregaLog('ERROR al cambiar tipo de pago: '+e.Message);
                    end;
                    DespliegaPosCarga(xpos);
                  end
                  else
                    rsp:='Posicion no esta despachando';
                end
                else begin // EOT
                  rsp:='Posicion aún no esta en fin de venta';
                end;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            else rsp:='Posicion de Carga no Existe';
          end
          // ORDENA ESPERA FIN DE VENTA
          else if ss='EFV' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then
              if (TPosCarga[xpos].Estatus=5) then
                TPosCarga[xpos].finventa:=1
              else rsp:='Posicion debe estar Despachando'
            else rsp:='Posicion de Carga no Existe';
          end
          // CMND: DESHABILITA POSICIOND DE CARGA
          else if ss='DPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              TPosCarga[xpos].SwDesHabilitado:=true
            else rsp:='Posicion no Existe';
          end
          // CMND: HABILITA POSICIOND DE CARGA
          else if ss='HPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              TPosCarga[xpos].SwDesHabilitado:=false
            else rsp:='Posicion no Existe';
          end
          // CMND: DESAUTORIZA VENTA DE COMBUSTIBLE
          else if (ss='DVC')or(ss='PARAR') then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if TPosCarga[xpos].ModoOpera='Normal' then begin      // Regresa al maximo despacho
                ComandoConsolaBuff('P'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',9999.00)),false);
                EsperaMiliSeg(200);
              end;
              ComandoConsolaBuff('E'+IntToClaveNum(xpos,2),false);
              if TPosCarga[xpos].estatus=2 then
                TPosCarga[xpos].tipopago:=0;
              TPosCarga[xpos].PresetImpo:=0;
              TPosCarga[xpos].PresetImpoN:=0;
              (*
              if DMCONS.swemular then begin
                if xpos in [1..MaxPosCarga] then
                  if EmularEstatus[2*xpos]='5' then
                    EmularEstatus[2*xpos]:='6'  // Si el flujo ya inició, para el despache momentaneamente y se puede reanudar.
                  else
                    EmularEstatus[2*xpos]:='1'; // Si el flujo no ha iniciado, la ventra se cancela totalmente.
              end;
              *)
            end
            else rsp:='Posicion no Existe';
          end
          else if (ss='REANUDAR') then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then begin
              if (TPosCarga[xpos].estatus in [6]) then begin
                ComandoConsola('S'+IntToClaveNum(xpos,2));
              end;
            end;
          end
          // CMND: EJECUTA CORTE
          else if ss='CORTE' then begin
            try
              rsp:='OK';
              xFechaCorte:=StrToFecha(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '));
              xTurnoCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              xIslaCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
              SwCorteParcial:=false;
              rsp:=EjecutaCorte;
            except
            end;
          end
          // CMND: REFRESCA CORTE
          else if ss='REFRESCACORTE' then begin
            try
              rsp:='OK';
              xFechaCorte:=StrToFecha(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '));
              xTurnoCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              xIslaCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
              SwCorteParcial:=false;
              rsp:='OK';
              T_Corte.Active:=true;
              try
                if not T_Corte.Locate('Fecha;Turno',VarArrayOf([xFechaCorte,xTurnoCorte]),[]) then
                  rsp:='Corte no existe'
                else
                  rsp:=EjecutaCorte;
              finally
                T_Corte.Active:=false;
              end;
            except
            end;
          end
          // CMND: EJECUTA CORTE PARCIAL
          else if ss='CORTEPARCIAL' then begin
            try
              rsp:='OK';
              xFechaCorte:=StrToFecha(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '));
              xTurnoCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              xIslaCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
              SwCorteParcial:=true;
              rsp:=EjecutaCorte;
            except
            end;
          end
          else rsp:='Comando no Soportado o no Existe';
          TabCmnd[xcmnd].SwNuevo:=false;
          if SwAplicaCmnd then begin
            TabCmnd[xcmnd].SwResp:=true;
            TabCmnd[xcmnd].Respuesta:=rsp;
            DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
          end;
          if SwCerrar then
            Close;
        end;
      end;

      if not SwEsperaRsp then
        NumPaso:=1;
      StaticText5.Caption:=IntToStr(NumPaso);
    end;
  except
    with DMCONS do begin
      if (T_ConfIb.State in [dsInsert,dsEdit]) then
        T_ConfIb.Cancel;
    end;
  end;
end;

procedure TFDISBENNETT2.Ap1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
begin
  ContadorAlarma:=0;
  Timer1.Enabled:=false;
  try
    for I := 1 to Count do begin
      C:=Ap1.GetChar;
      LineaBuff:=LineaBuff+C;
    end;
    while (not FinLinea)and(Length(LineaBuff)>0) do begin
      c:=LineaBuff[1];
      delete(LineaBuff,1,1);
      Linea:=Linea+C;
      if SwBcc then begin
        FinLinea:=true;
      end;
      if C=idETX then begin
        SwBcc:=true;
      end;
      if (C=idACK)or(c=idNAK) then
        FinLinea:=true;
    end;
    if FinLinea then begin
      LineaTimer:=Linea;
      DMCONS.AgregaLog('R '+LineaTimer);
      Linea:='';
      SwBcc:=false;
      FinLinea:=false;
      ProcesaLinea;
      LineaTimer:='';
      SwEspera:=false;
    end
    else SwEspera:=true;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISBENNETT2.ComandoConsolaBuff(ss:string;swinicio:boolean);
begin
  if (ListaCmnd.Count=0)and(not SwEsperaRsp) then
    ComandoConsola(ss)
  else begin
    if swinicio then begin
      ListaCmnd.Insert(0,ss);
    end
    else
      ListaCmnd.Add(ss);
  end;
end;

procedure TFDISBENNETT2.ComandoConsola(ss:string);
var s1:string;
    cc:char;
begin
  LinCmnd:=ss;
  CharCmnd:=LinCmnd[1];
  SwEsperaRsp:=true;
  ContEsperaRsp:=0;
  (*
  if DMCONS.SwEmular then begin
    DMCONS.AgregaLog('E '+idSTX+ss+idETX+' ');
    LineaEmular:=ss;
    exit;
  end;*)
  inc(ContadorAlarma);
  Timer1.Enabled:=false;
  try
    LineaBuff:='';
    cc:=CalculaBCC(ss+#3);
    s1:=#2+ss+#3+CC;
    if Ap1.OutBuffFree >= Length(S1) then begin
      DMCONS.AgregaLog('E '+s1);
      if ap1.Open then
        Ap1.PutString(S1);
    end
    else begin
      inc(ContBuffLleno);
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;


procedure TFDISBENNETT2.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISBENNETT2.Restaurar1Click(Sender: TObject);
begin
  Visible:=true;
end;

procedure TFDISBENNETT2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if SwCerrar then begin
    CanClose:=true;
  end
  (*
  else if DMCONS.SwEmular then begin
    CanClose:=true;
  end
  *)
  else begin
    CanClose:=false;
  end;
end;

procedure TFDISBENNETT2.FormCreate(Sender: TObject);
begin
  DMCONS.FechaSistema:=now;      // Fechahora sistema
  SwCerrar:=false;
  SwInicio:=true;
  ContadorAlarma:=0;
  ListaCmnd:=TStringList.Create;
  SwEsperaRsp:=false;
end;

procedure TFDISBENNETT2.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISBENNETT2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ap1.Open:=false;
  Application.Terminate;
end;

procedure TFDISBENNETT2.Timer1Timer(Sender: TObject);
var xfec:TDateTime;
begin
  try
    xfec:=Now;
    if abs(xfec-DMCONS.FechaSistema)>TMMinuto then
      DMCONS.RegistraBitacoraCFH(DMCONS.FechaSistema,xfec);
    DMCONS.FechaSistema:=Now;
  except
  end;
  try
    if not SwEsperaRsp then begin // NO HAY COMANDOS EN PROCESO
      ComandoConsola('B00');
    end
    else begin // HAY COMANDOS EN PROCESO
      inc(ContEsperaRsp);
      if ContEsperaRsp>MaxEsperaRsp then begin
        ContEsperaRsp:=0;
        case CharCmnd of
         'B':LineaTimer:=idStx+idStx+'B00'+idEtx+'.*';
         'A','N':LineaTimer:=idStx+CharCmnd+'00'+idEtx+'.*';
         else LineaTimer:=idNak;
        end;
        ProcesaLinea;
      end;
    end;
  except
  end;
end;

procedure TFDISBENNETT2.EnviaPreset(var rsp:string;xcomb:integer);
var xpos,xp,xc:integer;
    ss:string;
begin
  rsp:='OK';
  xpos:=SnPosCarga;
  if not (TPosCarga[xpos].estatus in [1..3]) then begin
    rsp:='Posición no Disponible';
    exit;
  end;
  if TPosCarga[xpos].SwDesHabilitado then begin
    rsp:='Posición Deshabilitada';
    exit;
  end;
  ss:='K'+IntToClaveNum(xpos,2)+'2'; // Modo PrePago
  ComandoConsolaBuff(ss,false);
  ss:='P'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',SnImporte));
  ComandoConsolaBuff(ss,false);
  ss:='L'+IntToClaveNum(xpos,2)+NivelPrecioContado; // Nivel de Precios
  ComandoConsolaBuff(ss,false);
  ss:='S'+IntToClaveNum(xpos,2); // Autorizar
  TPosCarga[xpos].PosAutorizada:=0;
  if DMCONS.SoportaSeleccionProducto='Si' then begin
    if xcomb>0 then with TPosCarga[xpos] do begin
      xp:=0;
      for xc:=1 to NoComb do
        if TComb[xc]=xcomb then
          xp:=TPos[xc];
      case xp of
        1:ss:=ss+char(33);   // 21h
        2:ss:=ss+char(34);   // 22h
        3:ss:=ss+char(40);   // 28h
        4:ss:=ss+char(36);   // 24h
      end;
      PosAutorizada:=xp;
    end;
  end;
  ComandoConsolaBuff(ss,false);
  TPosCarga[xpos].ContPreset:=5;
  TPosCarga[xpos].PresetComb:=xcomb;
  TPosCarga[xpos].PresetImpo:=SnImporte;
  TPosCarga[xpos].presetcont:=0;
  (*
  if DMCONS.swemular then begin
    if EmularEstatus[2*xpos]='1' then
      EmularEstatus[2*xpos]:='5';
    TPosCarga[xpos].Hora:=Time;
    TPosCarga[xpos].estatus:=5;
    TPosCarga[xpos].volumen:=SnImporte/5;
    TPosCarga[xpos].importe:=SnImporte;
    TPosCarga[xpos].precio:=5;
    TPosCarga[xpos].posactual:=1;
  end;
  *)
end;

(*
procedure TFDISBENNETT2.Timer3Timer(Sender: TObject);
const timpo:array[0..4] of real = (50,100,150,200,300);
      tpos:array[0..2] of integer = (2,1,3);
var xpos,rr,i:integer;
    lin:string;
    p1,p2,xp,xcomb:integer;
begin
  if LineaEmular='' then
    exit;
  Randomize;
  Timer1.Enabled:=false;
  try
    if LineaEmular<>'' then begin
      Lin:=LineaEmular;
      LineaEmular:='';
      case Lin[1] of
        'B':with DMCONS do begin
              rr:=Random(16);
              if rr=1 then begin
                xpos:=Random(MaxPosCarga)+1;
                p1:=2*xpos-1;
                p2:=2*xpos;
                case EmularEstatus[p2] of
                  '1':if TPosCarga[xpos].ModoOpera='Normal' then begin
                        EmularEstatus[p2]:='3';
                        rr:=Random(5);
                        xp:=Random(2)+1;
                        if xp>TPosCarga[xpos].NoComb then
                          xp:=TPosCarga[xpos].NoComb;
                        EmularEstatus[p1]:=char(xp+48);
                        xcomb:=CombustibleEnPosicion(xpos,xp);
                        TPosCarga[xpos].volumen:=dividefloat(Timpo[rr],TabComb[xcomb].Precio);
                        TPosCarga[xpos].importe:=timpo[rr];
                        TPosCarga[xpos].precio:=TabComb[xcomb].Precio;
                        TPosCarga[xpos].hora:=time;
                      end;
                end;
              end
              else begin
                for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
                  p2:=2*xpos;
                  if (EmularEstatus[p2]='5')and((Time-Hora)>5*TmSegundo)then
                    EmularEstatus[p2]:='7';
                end;
              end;
              //EmularEstatus[4]:='9';
              Linea:='B00'+EmularEstatus;
            end;
        'A':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              Linea:=copy(Lin,1,3)+'1'
                     +FiltraStrNum(FormatFloat('0000.00',TPosCarga[xpos].volumen))
                     +FiltraStrNum(FormatFloat('0000.00',TPosCarga[xpos].importe))
                     +FiltraStrNum(FormatFloat('0.000',TPosCarga[xpos].precio));
            end;
        'N':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              with TPosCarga[xpos] do begin
                Linea:=copy(Lin,1,3)+'0000000000'+'0000000000'+'0000000000'+'0000000000';
                for i:=1 to NoComb do
                  Linea[TPos[i]*10-5]:=Char(TComb[i]+48);
              end;
            end;
        'D':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              if xpos=2 then
                linea:=lin+'133';
            end;
        else linea:=idACK;
      end;
      if linea<>idACK then
        LineaTimer:=idSTX+Linea+idETX+' '
      else
        LineaTimer:=linea;
      DMCONS.AgregaLog('R '+LineaTimer);
      ProcesaLinea;
      SwEspera:=false;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;
  *)

procedure TFDISBENNETT2.registro(valor:integer;variable:string);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create(KEY_WRITE);
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    if Registry.OpenKey('\SOFTWARE\IMAGEN\VOL\DISP', True) then
       Registry.WriteInteger(variable,Valor)
  finally
    Registry.CloseKey;
    Registry.Free;
  end;
end;

procedure TFDISBENNETT2.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISBENNETT2.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISBENNETT2.lee_registro;
var
  Registry: TRegistry;
  estado:integer;
begin
  with DMCONS,ap1 do begin
    Registry := TRegistry.Create(KEY_READ);
    try
      Registry.RootKey := HKEY_LOCAL_MACHINE;
      estado:=0;
      try
        if Registry.OpenKey('\SOFTWARE\IMAGEN\VOL\DISP', True) then
          Estado:=Registry.ReadInteger('Estado');
      except
      end;
      if Estado=1 then begin
        Self.Visible:=true;
        Self.WindowState:=wsMaximized;
        Self.BringToFront;
        registro(0,'Estado');
      end;
      if Accion<>'' then begin
        try
          Open:=(Accion='Cliente1');
          Accion:='';
        except
        end;
      end;
    finally
      Registry.CloseKey;
      Registry.Free;
      registro(0,'Estado');
    end;
  end;
end;

procedure TFDISBENNETT2.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISBENNETT2.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=TComb[1];
    for i:=1 to NoComb do begin
      if TPos[i]=xposcarga then
        result:=TComb[i];
    end;
  end;
end;

function TFDISBENNETT2.PosicionDeCombustible(xpos,xcomb:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    if xcomb>0 then begin
      for i:=1 to NoComb do begin
        if TComb[i]=xcomb then
          result:=TComb[i];
      end;
    end
    else result:=1;
  end;
end;

procedure TFDISBENNETT2.ListBoxPC1DblClick(Sender: TObject);
begin
  SwMensaje:=not SwMensaje;
  (*
  with DMCONS do if swemular then begin
    if EmularEstatus[2]='0' then
      EmularEstatus[2]:='1'
    else
      EmularEstatus[2]:='0';
  end;
  *)
end;

procedure TFDISBENNETT2.Timer2Timer(Sender: TObject);
var i:integer;
begin
  try
    with DMCONS do begin
      inc(ContadorTot);
      if (ContadorTot>=100) then begin
        ContadorTot:=0;
        inc(ContadorTotPos);
        if ContadorTotPos in [1..MaxPosCarga] then begin
          TPosCarga[ContadorTotPos].SwCargaTotales:=true;
        end
        else ContadorTotPos:=0;
      end;
    end;
    if ContadorAlarma>=10 then begin
      if not StaticText17.Visible then
        Beep;
      StaticText17.Visible:=not StaticText17.Visible;
      if ContadorAlarma=10 then
        DMCONS.RegistraBitacora3(1,'Desconexion de Dispositivo','Error Comunicación Dispensarios','U');
    end
    else StaticText17.Visible:=false;
    try
      lee_registro;
    except
    end;
    // Logs
    if (Now-DMCONS.FechaHoraRefLog)>tmMinuto then
      DMCONS.RefrescaConexion;

    // Checa por cambios de precios
    if (Now-DMCONS.FechaHoraPrecio)>12*tmSegundo then begin
      DMCONS.FechaHoraPrecio:=Now;
      with DMCONS do if AplicarPrecios then begin // checa si hay precio pendiente de aplicar
        for i:=1 to MaxComb do with TabComb[i] do if Activo then begin
          Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
          Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=i;
          Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
          Q_AplicaPrecioF.ExecSQL;                                  // cambia estatus del precio a aplicado
          RegistraBitacoraCP(i);
        end;
        CargaPreciosFH(Now,true); // carga el ultimpo recio aplicado
        Q_CombIb.Active:=false;
        Q_CombIb.Active:=true;
        DespliegaPrecios;
        for i:=1 to MaxPosCarga do
          TPosCarga[i].ActualizarPrecio:=true;
      end;
    end;
    if NotificationIcon1.Tag=0 then begin
      if ErrorInic then begin
        EsperaMiliSeg(3000);
        Application.Terminate;
      end;
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      Visible:=false;
      NotificationIcon1.Show;
    end;
  except
  end;
end;

procedure TFDISBENNETT2.Button2Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISBENNETT2.Button3Click(Sender: TObject);
var
  ruta:PAnsiChar;
begin
  ruta:=PChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)));
  ShellExecute(Handle, 'open','explorer.exe',ruta, nil, SW_SHOWNORMAL);
end;

end.


