unit UDISWAYNE2W;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, DBGrids, RXShell, Registry,
  dxGDIPlusClasses,ShellApi;


const
      MCxP=4;

type
  TFDISWAYNE2W = class(TForm)
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
    StaticText6: TStaticText;
    ImageList1: TImageList;
    Panel2: TPanel;
    ListView1: TListView;
    NotificationIcon1: TRxTrayIcon;
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
    PageControl1: TPageControl;
    StaticText7: TStaticText;
    Image1: TImage;
    Button3: TButton;
    Button4: TButton;
    AbrirUbicacin1: TMenuItem;
    PuertoSerial: TApdComPort;
    Timer1: TTimer;
    DBGrid3: TDBGrid;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotificationIcon1DblClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure PuertoSerialTriggerAvail(CP: TObject; Count: Word);
    procedure PuertoSerialTriggerData(CP: TObject; TriggerHandle: Word);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    etTimeOut : EventTimer;
    srespuesta : string;
    wTriggerEOT, wTriggerLF : word;
    iBytesEsperados : integer;
    bListo, bEndOfText, bLineFeed : boolean;
    { Private declarations }
    SwAplicaCmnd,
    SwInicio,
    SwBring,
    SwEspera,
    Swcierrabd,
    Swcierrabd2      :boolean;
    HoraEspera      :TDateTime;
    ContadorAlarma,
    PosCiclo,MangCiclo,
    ls,ContLeeVenta,
    NumPaso         :integer;
    SwPasoBien      :boolean;
    { Private declarations }
     function  TransmiteComando1(DataBlock:string):boolean;
  public
    { Public declarations }
     function  AbrePuerto : boolean;
     function  CierraPuerto : boolean;
     // funciones para enviar comandos a dispensarios
     function  Autoriza(xPosCarga: integer) : boolean;
     function  AutorizaPm(xPosCarga,xPm: integer) : boolean;
     function  ReanudaDespacho(xPosCarga: integer) : boolean;
     function  EnviaPresetPesosBomba(xPosCarga,xTipoPreset: integer; xValor: real) : boolean;
     function  DetenerDespacho(xPosCarga : integer) : boolean;
     function  DameTotal(xPosCarga,xPos : integer; var rTotalLitros: real) : boolean;
     function  LeePrecios(xPosCarga : integer): boolean;
     function  CambiaPrecios(xPosCarga : integer): boolean;
     function  DameLecturas(xPosCarga : integer; var rLitros, rPrecio, rPesos : real) : boolean;
     function  DameEstatus(xPosCarga:integer) : integer;

    { Public declarations }
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    //procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    function PosicionDeCombustible(xpos,xcomb:integer):integer;
    procedure AvanzaPosCiclo;
    procedure ProcesaComandos;
    procedure EstatusDispensarios;
  end;

type
     tiposcarga = record
       SwDesHabil   :boolean;
       DivImporte,
       DivLitros,
       estatus,
       estatusant   :integer;
       importe,
       volumen,
       precio       :real;
       Isla,
       PosActual    :integer; // Posicion del combustible en proceso: 1..NoComb
       NoComb       :integer; // Cuantos combustibles hay en la posicion
       TComb        :array[1..MCxP] of integer; // Claves de los combustibles
       TPosx        :array[1..MCxP] of integer;
       TPrecio      :array[1..MCxP] of real;
       TMang        :array[1..MCxP] of integer;
       TotalLitros  :array[1..MCxP] of real;
       SwLeeTotales :array[1..MCxP] of boolean;

       TCambioPrecN1:boolean;
       TNuevoPrec   :array[1..MCxP] of real;

       MontoPreset    :string;

       swprec,
       swdesp,
       swcargando     :boolean;
       ModoOpera      :string[8];
       TipoPago       :integer;
       EsperaFinVenta :integer;

       SwStatusFV,
       SwLeeVenta,
       SwLeePrecios,
       SwCambiaPrecio,
       SwPreset2,
       SwPreset       :boolean;
       TipoPreset,
       PosPreset      :integer;
       ValorPreset    :real;
       PosMangLev     :integer;
     end;


var
  FDISWAYNE2W: TFDISWAYNE2W;
  TPosCarga:array[1..32] of tiposcarga;
  MaxPosCarga:integer;
  SwCerrar    :boolean;
  EstatusAnterior,
  StrCiclo,
  EstatusActual  :string;
  // CONTROL TRAFICO COMANDOS
  ListaCmnd     :TStrings;
  HoraGuardaLog :TDateTime;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}

function DamePosOrdinal(xPosCarga,xPos:integer):integer;
var i:integer;
begin
  i:=1;
  while (TPosCarga[xPosCarga].TPosx[i]<>xPos)and(i<4) do
    inc(i);
  if i<=4 then
    result:=i
  else result:=0;
end;

function LeeTotalPosCiclo(xPos:integer; var xmang:integer):boolean;
begin
  with TPosCarga[xPos] do begin
    xMang:=NoComb;
    while (not SwLeeTotales[xMang])and(xMang>0) do
      dec(xMang);
    result:=xMang>0;
  end;
end;

function ExtraeBCD(xstr:string;xini,xfin:integer):real;
var i:integer;
    ss:string;
begin
  i:=xfin;
  ss:='';
  while i>=xini do begin
    ss:=ss+ExtraeElemStrSep(xstr,i,' ');
    dec(i);
  end;
  result:=strtoint(ss);
end;

function ConvierteBCD(xvalor:real;xlong:integer):string;
var xstr,xres,ss:string;
    i,nc,nn,num:integer;
begin
  num:=trunc(xvalor+0.5);
  xstr:=inttoclavenum(num,xlong);
  nc:=xlong div 2;
  xres:='';
  for i:=1 to nc do begin
    ss:=copy(xstr,xlong-2*i+1,2);
    nn:=StrToIntDef(ss[1],0)*16+StrToIntDef(ss[2],0);
    xres:=xres+char(nn);
  end;
  result:=xres;
end;


function EmpacaWayne(xss:string):string;
var ss2:string;
    long,i:integer;
begin
  long:=length(xss);
  if not (long in [1,5]) then begin
    result:='';
    exit;
  end;
  ss2:='';
  for i:=1 to long do begin
    ss2:=ss2+xss[i]+char(255-ord(xss[i]));
  end;
  result:=#0#0+ss2+#255;
end;

function DesEmpacaWayne(xss:string):string;
var long:integer;
begin
  result:='';
  long:=length(xss);
  if long=13 then
    if (xss[1]=#0)and(xss[2]=#0)and(xss[13]=#255) then
      result:=xss[3]+xss[5]+xss[7]+xss[9]+xss[11];
end;

function ControlByte(xpos,xcmnd:integer):integer;
begin
  if (xpos<=31)and(xcmnd<=7) then
    result:=xpos*8+xcmnd
  else
    result:=0;
end;


procedure TFDISWAYNE2W.PuertoSerialTriggerAvail(CP: TObject; Count: Word);
var i : integer;
begin
   for i:=1 to Count do begin
     sRespuesta:= sRespuesta + PuertoSerial.GetChar;
   end;
   i:= length(sRespuesta);
   if ( ( i>=iBytesEsperados ) ) then //or ( bEndOfText )  or ( bLineFeed ) ) then
      bListo:= true
   else
      newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout));
end;

procedure TFDISWAYNE2W.PuertoSerialTriggerData(CP: TObject;
  TriggerHandle: Word);
begin
   if ( TriggerHandle=wTriggerEOT ) then
      bEndOfText:= true
   else
      bLineFeed:= true;
end;


function TFDISWAYNE2W.TransmiteComando1(DataBlock:string):boolean;
var ss:string;
    iMaxIntentos,i,
    iNoIntento    :integer;
    bOk           :boolean;
begin
   iMaxIntentos:=2;
   iBytesEsperados:=13;
   iNoIntento:= 0;
   bOk:=false;
   repeat
      inc(iNoIntento);
      bListo:= false;
      bEndOfText:= false;
      bLineFeed:= false;
      sRespuesta:= '';
      PuertoSerial.FlushInBuffer;
      PuertoSerial.FlushOutBuffer;
      ss:=StrToHexSep(DataBlock);
      DMCONS.AgregaLog('E  '+ss);
      for i:= 1 to length ( DataBlock ) do begin
         PuertoSerial.PutChar(DataBlock[i]);
         repeat
            PuertoSerial.ProcessCommunications;
         until ( PuertoSerial.OutBuffUsed=0 );
      end;
      if ( not bOk ) then begin
         newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout));
         repeat
            Application.ProcessMessages;
         until ( ( bListo ) or ( timerexpired(etTimeOut) ) );
         if ( bListo ) then begin
           if length(sRespuesta)=13 then begin
             bOk:=true;
             DMCONS.AgregaLog('R  '+StrToHexSep(sRespuesta));
           end;
         end;
         if ( not bOk ) then begin
            if  ( iNoIntento<iMaxIntentos ) then sleep(dmcons.GtwTiempoCmnd);
         end;
      end;
   until ( ( bOk ) or ( iNoIntento>=iMaxIntentos ) );
   result:= bOk;
end;

//------------------------------------------------------------------------------

function TFDISWAYNE2W.AbrePuerto: boolean;
begin
  try
    with DMCONS do begin
      PuertoSerial.Open:=false;
      PuertoSerial.Baud:= ptBaudios;
      PuertoSerial.DataBits:= ptBitsDatos;
      case ptParidad[1] of
        'N':PuertoSerial.Parity:=pNone;
        'E':PuertoSerial.Parity:=pEven;
        'O':PuertoSerial.Parity:=pOdd;
      end;
      PuertoSerial.StopBits:=ptBitsParada;
      PuertoSerial.ComNumber:= ptPuerto;

      PuertoSerial.TraceAllHex:= true;
      PuertoSerial.TraceName:= 'c:\IgasTrace.txt';
      PuertoSerial.Tracing:= tlOn;

      PuertoSerial.Open:= true;
      result:= true;
    end;
  except
     result:= false;
  end;
end;
//--------------------------------------------------------------------------------

function TFDISWAYNE2W.CierraPuerto : boolean;
begin
   try
      PuertoSerial.Tracing:= tlOff;
      PuertoSerial.Open:= false;
      PuertoSerial.DTR:= false;
      PuertoSerial.RTS:= false;
      result:= true;
   except
      result:= false;
   end;
end;

//------------------------------------------------------------------------------
function TFDISWAYNE2W.EnviaPresetPesosBomba(xPosCarga,xTipoPreset: integer; xValor: real) : boolean;
var DataBlock,
    stComando :string;
begin
   result:=false;
   if xTipoPreset=1 then begin  // Pesos
     stComando:= char(ControlByte(xPosCarga,7))+#33+ConvierteBCD(xValor*DMCONS.WtwDivImporte,6);
     DataBlock:=EmpacaWayne(stComando);
     if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then
       result:=true;
   end
   else if xTipoPreset=2 then begin  // Litros
     stComando:= char(ControlByte(xPosCarga,7))+#35+ConvierteBCD(xValor*DMCONS.WtwDivLitros,6);
     DataBlock:=EmpacaWayne(stComando);
     if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then
       result:=true;
   end;
end;

//--------------------------------------------------------------------------------

function TFDISWAYNE2W.DetenerDespacho(xPosCarga : integer) : boolean;
var DataBlock,
    stComando :string;
begin
   result:=false;
   stComando:= char(ControlByte(xPosCarga,0))+char(10*16+7)+#0+#0+#0;
   DataBlock:=EmpacaWayne(stComando);
   if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then
     result:=true;
end;


//--------------------------------------------------------------------------------
function TFDISWAYNE2W.ReanudaDespacho(xPosCarga: integer) : boolean;
var DataBlock,
    stComando :string;
begin
   result:=false;
   stComando:= char(ControlByte(xPosCarga,0))+char(9*16+7)+#0+#0+#0;
   DataBlock:=EmpacaWayne(stComando);
   if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then
     result:=true;
end;

//------------------------------------------------------------------------------

function TFDISWAYNE2W.Autoriza(xPosCarga: integer) : boolean;
var DataBlock,
    stComando :string;
begin
   result:=false;
   stComando:= char(ControlByte(xPosCarga,0))+char(8*16+15)+char(0)+#0+#0;         // 08 8F 00 00 00
   DataBlock:=EmpacaWayne(stComando);
   if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then
     result:=true;
end;


//------------------------------------------------------------------------------

function TFDISWAYNE2W.AutorizaPm(xPosCarga,xPm: integer) : boolean;
var DataBlock,
    stComando :string;
    xposfis:integer;
begin
   result:=false;
   if xpm in [0..4] then begin
     if xpm=0 then
       xposfis:=15
     else
       xposfis:=TPosCarga[xposcarga].TPosx[xpm];
     stComando:= char(ControlByte(xPosCarga,0))+char(128+8+xposfis-1)+char(0)+#0+#0;         // 08 8F 00 00 00
     DataBlock:=EmpacaWayne(stComando);
     if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then
       result:=true;
   end;
end;

//------------------------------------------------------------------------------

function TFDISWAYNE2W.DameTotal(xPosCarga,xPos : integer; var rTotalLitros: real) : boolean;
var DataBlock,ss,
    stComando :string;
    val1,val2,val3:real;
    chmang:char;
    xposfis:integer;
begin
   result:=false;
   rTotalLitros:=0;
   if xpos in [1..4] then begin
     xposfis:=TPosCarga[xposcarga].TPosx[xpos];
     chmang:=char(47+xposfis);
     // leo parte 1
     stComando:= char(ControlByte(xPosCarga,7))+#4+chmang+#0+#0;
     DataBlock:=EmpacaWayne(stComando);
     if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
       ss:=StrToHexSep(DesempacaWayne(sRespuesta));
       val1:=ExtraeBCD(ss,4,5);
       // leo parte2
       stComando:= char(ControlByte(xPosCarga,7))+#2+chmang+#0+#0;
       DataBlock:=EmpacaWayne(stComando);
       if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
         ss:=StrToHexSep(DesempacaWayne(sRespuesta));
         val2:=ExtraeBCD(ss,4,5);
         // leo parte2
         stComando:= char(ControlByte(xPosCarga,7))+#22+chmang+#0+#0;
         DataBlock:=EmpacaWayne(stComando);
         if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
           ss:=StrToHexSep(DesempacaWayne(sRespuesta));
           val3:=ExtraeBCD(ss,4,5);
           rTotalLitros:=(val1+val2*10000+val3*10000*10000)/100;
           result:=true;
         end;
       end;
     end;
   end;
end;

//------------------------------------------------------------------------------

function TFDISWAYNE2W.DameLecturas(xPosCarga : integer; var rLitros, rPrecio, rPesos : real) : boolean;
var DataBlock,ss,ss1,
    stComando :string;
    xposact,xposfis:integer;
    val1,val2:integer;
begin
   result:=false;
   rLitros:=0;rPesos:=0;rPrecio:=0;xposfis:=0;
   xposact:=TPosCarga[xposcarga].PosActual;
   if xposact in [1..4] then
     xposfis:=TPosCarga[xposcarga].TPosx[xposact];
   // leo importe
   stComando:= char(ControlByte(xPosCarga,7))+#42+#0+#0+#0;
   DataBlock:=EmpacaWayne(stComando);
   if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
     ss:=StrToHexSep(DesempacaWayne(sRespuesta));
     rPesos:=dividefloat(ExtraeBCD(ss,3,5),TPoscarga[xPosCarga].DivImporte);
     if xposfis in [1..7] then begin
       // leo precio
       stComando:= char(ControlByte(xPosCarga,7))+#0+char(xposfis-1)+#0+#0;         //   0F 00 00 F2 03
       DataBlock:=EmpacaWayne(stComando);
       if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
         ss:=StrToHexSep(DesempacaWayne(sRespuesta));
         ss1:=ExtraeElemStrSep(ss,5,' ');
         Val1:=HexToInt(ss1);
         ss1:=ExtraeElemStrSep(ss,4,' ');
         Val2:=HexToInt(ss1);
         rprecio:=256*val1+val2;
         rprecio:=dividefloat(rprecio,100);
         if TPoscarga[xPosCarga].DivLitros=1000 then
           rLitros:=ajustafloat(dividefloat(rPesos,rPrecio),3)
         else
           rLitros:=ajustafloat(dividefloat(rPesos,rPrecio),2);
         result:=true;
       end
       else rPesos:=0;
     end
     else begin
       // leo volumen
       stComando:= char(ControlByte(xPosCarga,7))+#38+#0+#0+#0;         // 0F 26 00 00 00
       DataBlock:=EmpacaWayne(stComando);
       if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
         ss:=StrToHexSep(DesempacaWayne(sRespuesta));
         rlitros:=dividefloat(ExtraeBCD(ss,3,5),TPoscarga[xPosCarga].DivLitros);
         rPrecio:=ajustafloat(dividefloat(rPesos,rLitros),2);
         result:=true;
       end
       else rPesos:=0;
     end;
   end;
end;

//------------------------------------------------------------------------------
function TFDISWAYNE2W.LeePrecios(xPosCarga : integer) : boolean;
var DataBlock,
    sse,ss,ss1,
    stComando   :string;
    xp,xcomb,xposfis:integer;
    val1,val2:integer;
    xprecio:real;
begin
   result:=false;
   timer1.Enabled:=false;
   try
     for xp:=1 to TPosCarga[xPosCarga].nocomb do begin
       xposfis:=TPosCarga[xPosCarga].TPosx[xp];
       stComando:= char(ControlByte(xPosCarga,7))+#0+char(xposfis-1)+#0+#0;         //   0F 00 00 F2 03
       sse:=StrToHexSep(stComando);
       DataBlock:=EmpacaWayne(stComando);
       if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
         ss:=StrToHexSep(DesempacaWayne(sRespuesta));
         ss1:=ExtraeElemStrSep(ss,5,' ');
         Val1:=HexToInt(ss1);
         ss1:=ExtraeElemStrSep(ss,4,' ');
         Val2:=HexToInt(ss1);
         xprecio:=256*val1+val2;
         TPosCarga[xPosCarga].TPrecio[xp]:=dividefloat(xprecio,100);
         Esperamiliseg(50);
         with DMCONS do begin
           xcomb:=TPosCarga[xPosCarga].TComb[xp];
           T_Tcmb.Active:=true;
           try
             if T_Tcmb.Locate('Clave',xcomb,[]) then begin
               T_Tcmb.Edit;
               T_TcmbPrecioFisico.AsFloat:=TPosCarga[xPosCarga].TPrecio[xp];
               T_Tcmb.Post;
             end;
           finally
             T_Tcmb.Active:=false;
           end;
         end;
         if xp=TPosCarga[xPosCarga].nocomb then begin
           result:=true;
           DMCONS.Q_CombIb.Active:=false;
           DMCONS.Q_CombIb.Active:=true;
           DBGrid3.Refresh;
         end;
       end;
     end;
   finally
     Timer1.Enabled:=true;
   end;
end;

//------------------------------------------------------------------------------
function TFDISWAYNE2W.CambiaPrecios(xPosCarga : integer) : boolean;
var DataBlock,
    stComando   :string;
    xp,xposfis:integer;
    val1,val2:integer;
    xprecio:integer;
begin
   result:=false;
   timer1.Enabled:=false;
   try
     for xp:=1 to TPosCarga[xPosCarga].nocomb do begin
       xposfis:=TPosCarga[xPosCarga].TPosx[xp];
       xprecio:=Trunc(TPosCarga[xPosCarga].TNuevoPrec[xp]*100+0.01);
       val1:=(xprecio)div(256);
       val2:=(xprecio)mod(256);
       stComando:= char(ControlByte(xPosCarga,7))+#1+char(xposfis-1)+char(val2)+char(val1);
       DataBlock:=EmpacaWayne(stComando);
       if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
         Esperamiliseg(50);
         stComando:= char(ControlByte(xPosCarga,7))+#1+char(16+xposfis-1)+char(val2)+char(val1);
         DataBlock:=EmpacaWayne(stComando);
         if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
           Esperamiliseg(50);
           if xp=TPosCarga[xPosCarga].nocomb then
             result:=true;
         end
         else exit;
       end
       else exit;
     end;
   finally
     Timer1.Enabled:=true;
   end;
end;

//------------------------------------------------------------------------------


function TFDISWAYNE2W.DameEstatus(xPosCarga: integer) : integer;
var iStatus,i,xposact : integer;
    StrBin,DataBlock:string;
    chComando:char;
    tbit:array[0..7] of boolean;
begin
   iStatus:= 0;
   chComando:= char(ControlByte(xPosCarga,1));     // Comando 1
   DataBlock:=EmpacaWayne(chComando);
   if ( ( TransmiteComando1(DataBlock) ) and ( length(sRespuesta)=13 ) ) then begin
     sRespuesta:=DesempacaWayne(sRespuesta);
     StrBin:=ByteToBin(ord(sRespuesta[5]));
     for i:=0 to 7 do
       tbit[i]:=(strbin[8-i]='1');
     if tbit[7] then begin
       iStatus:=2;     // despachando
       TPosCarga[xPosCarga].SwPreset2:=false;
       if (tbit[0])and(tbit[1])and(tbit[2]) then begin
         if (tposcarga[xposcarga].importe>0.001) then begin
           iStatus:=3;        // fin venta
         end
         else begin
           istatus:=9;        // autorizado
         end;
       end
       else begin
         xposact:=0;
         if tbit[0] then
           xposact:=1;
         if tbit[1] then
           inc(xposact,2);
         if tbit[2] then
           inc(xposact,4);
         inc(xposact,1);
         i:=DamePosOrdinal(xPosCarga,xposact);
         if i in [1..4] then
           TPosCarga[xPosCarga].PosActual:=i;
       end;
       if tbit[4] then
         iStatus:=8;  // detenida
     end
     else if tbit[3] then begin
       iStatus:=9;     // autorizado
     end
     else if tbit[4] then begin
       iStatus:=8;     // detenida y ya en fin de venta
       esperamiliseg(50);
       if ReanudaDespacho(xPosCarga) then begin
         iStatus:=3;
       end;
     end
     else if (not tbit[0])or(not tbit[1])or(not tbit[2]) then begin
       iStatus:=5;     // pistola levantada
       i:=0;
       if tbit[0] then i:=1;
       if tbit[1] then i:=i+2;
       if tbit[2] then i:=i+4;
       TPosCarga[xPosCarga].PosMangLev:=DamePosOrdinal(xPosCarga,i+1);
     end
     else begin
       iStatus:=1;    // inactivo
       if (TPosCarga[xPosCarga].SwStatusFV) then begin
         iStatus:=3;
       end
       else if (TPosCarga[xPosCarga].SwPreset2) then
         iStatus:=9;
     end;
   end;
   result:= iStatus;
end;


//-----------------

procedure TFDISWAYNE2W.IniciaBaseDeDatos;
var i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    try
      if not AbrePuerto then
        raise exception.Create('No puedo abrir puerto');
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
        ProductoPrecio:='';
        DigitoPrec:=0;
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
            ClavePemex:=Q_CombIbClavePemex.AsString;
            ProductoPrecio:=inttostr(i);
            DigitoPrec:=Q_CombIbDigitoAjustePrecio.AsInteger;
            AgruparCon:=Q_CombIbAgrupar_con.AsInteger;
          end;
        end;
        Q_CombIb.Next;
      end;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISWAYNE2W.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
begin
  with DMCONS do begin
    swcierrabd:=false;
    swcierrabd2:=false;
    ListView1.Items.Clear;
    EstatusAnterior:='';
    MaxPosCarga:=0;
    for i:=1 to 32 do with TPosCarga[i] do begin
      //DigitosGilbarco:=6;
      DivImporte:=DMCONS.WtwDivImporte;
      DivLitros:=DMCONS.WtwDivLitros;
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      SwPreset:=false;
      SwPreset2:=false;
      PosPreset:=0;
      TipoPreset:=0;
      ValorPreset:=0;
      PosMangLev:=0;
      importe:=0;
      volumen:=0;
      precio:=0;
      tipopago:=0;
      Esperafinventa:=0;
      SwCargando:=false;
      swdesp:=false;
      TCambioPrecN1:=false;
      for j:=1 to MCxP do begin
        TotalLitros[j]:=0;
        TNuevoPrec[j]:=0;
        SwLeeTotales[j]:=true;
        TPrecio[j]:=0;
      end;
      SwDeshabil:=false;
      SwLeeVenta:=true;
      SwStatusFV:=false;
      SwCambiaPrecio:=false;
      SwLeePrecios:=true;
      SwPreset:=false;
      SwPreset2:=false;
    end;
    TL_Bomb.Active:=true;
    while not TL_Bomb.Eof do begin
      TL_Bomb.Edit;
      if not (TL_BombCon_Posicion.AsInteger in [1..7]) then
        TL_BombCon_Posicion.AsInteger:=TL_BombCombustible.AsInteger;
      if (TL_BombCon_DigitoAjuste.IsNull)or (not (TL_BombCon_DigitoAjuste.AsInteger in [0,1,22])) then
        TL_BombCon_DigitoAjuste.AsInteger:=0;
      TL_Bomb.Post;
      TL_Bomb.Next;
    end;
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xisla:=Q_BombIbIsla.asinteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      if (xpos in [1..32]) then begin
        xcomb:=Q_BombIbCombustible.AsInteger;
        if (xpos>MaxPosCarga) then begin
          MaxPosCarga:=xpos;
          ListView1.Items.Add;
          ListView1.Items[MaxPosCarga-1].Caption:=IntToClaveNum(xpos,2);
          ListView1.Items[MaxPosCarga-1].ImageIndex:=0;
        end;
        with TPosCarga[xpos] do begin
          Isla:=xisla;
          SwPrec:=false;
          existe:=false;
          ModoOpera:=Q_BombIbModoOperacion.AsString;
          for i:=1 to NoComb do
            if TComb[i]=xcomb then
              existe:=true;
          if not existe then begin
            inc(NoComb);
            TComb[NoComb]:=xcomb;
            if (Q_BombIbCon_Posicion.AsInteger>=1)and(Q_BombIbCon_Posicion.AsInteger<=7) then begin
              TPosx[NoComb]:=Q_BombIbCon_Posicion.AsInteger;
            end
            else
              TPosx[NoComb]:=1;
            TMang[NoComb]:=Q_BombIbManguera.AsInteger;
          end;
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

procedure TFDISWAYNE2W.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      StaticText6.Caption:='';
      NumPaso:=0;
      SwPasoBien:=true;
      PosCiclo:=1;MangCiclo:=1;
      StaticText5.Caption:=IntToStr(NumPaso);
      IniciaEstacion;
      ListBox1.SetFocus;
      DMCONS.T_ConfIb.Active:=true;
    finally
      Timer1.Enabled:=true;
    end;
  end;
end;


procedure TFDISWAYNE2W.LimpiaConsola;
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

procedure TFDISWAYNE2W.DespliegaPosCarga(xpos:integer);
var i,ii,xp,rango,posi,posf,
    xcomb,xc,apunt,xmang:integer;
    xnombre,xdescestatus:string;
begin
  apunt:=1;
  try
    rango:=ListBox1.ItemIndex+1;
    if rango=0 then
      rango:=1;
    posi:=rango*4-3;
    posf:=rango*4;
    with TPosCarga[xpos],FDISWAYNE2W do begin
      if PosActual in [1..maxcomb] then
        xcomb:=TComb[PosActual]
      else
        xcomb:=0;
      if xcomb in [1..maxcomb] then
        xnombre:=DMCONS.TabComb[xcomb].Nombre
      else
        xnombre:='';
      if xpos in [posi..posf] then begin
        ii:=xpos-posi+1;
        TStaticText(FindComponent('StaticText'+IntToStr(ii))).Caption:=IntToClaveNum(xpos,2);
        case estatus of
          0:xdescestatus:='Fuera de Linea';
          1:xdescestatus:='Inactivo';
          2:xdescestatus:='Despachando';
          3,4:xdescestatus:='Fin de Venta';
          5:xdescestatus:='Pistola Levantada';
          8:xdescestatus:='Detenido';
          9:xdescestatus:='Autorizado';
          else xdescestatus:='Estado: '+inttostr(estatus);
        end;
        if not SwDesHabil then begin
          case ii of
            1:panelPC1.Caption:=xdescestatus;
            2:panelPC2.Caption:=xdescestatus;
            3:panelPC3.Caption:=xdescestatus;
            4:panelPC4.Caption:=xdescestatus;
          end;
          case estatus of
            1:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClRed;
            5,9,8:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClYellow;
            2:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClLime;
            3,4:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClBlue;
            else TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClWhite;
          end;
        end
        else begin
          TPanel(FindComponent('panelPC'+IntToStr(ii))).Caption:='Deshabilidado';
          TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClWhite;
        end;
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Clear;
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('$ '+FormatFloat('###,##0.00',importe)+' Pesos');
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.00',precio)+' $/Lts');
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(xnombre);
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
        for xp:=1 to NoComb do begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                   ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3)
                   //+'    $'+FormatFloat('#0.00',TPrecio[xp])
                   );
        end;
        if SwPreset then
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('PRESET '+MontoPreset+' >>'+inttostr(Esperafinventa));
      end;
    end;
    apunt:=2;
    // Refresca Listas
    for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
      if ModoOpera='Normal' then begin
        case estatus of
          1,3,4:ListView1.Items[i-1].ImageIndex:=1;
          2:ListView1.Items[i-1].ImageIndex:=2;
          5,9:ListView1.Items[i-1].ImageIndex:=3;
          else ListView1.Items[i-1].ImageIndex:=0;
        end;
      end
      else begin
        case estatus of
          1,3,4:ListView1.Items[i-1].ImageIndex:=4;
          2:ListView1.Items[i-1].ImageIndex:=5;
          5,9:ListView1.Items[i-1].ImageIndex:=6;
          else ListView1.Items[i-1].ImageIndex:=0;
        end;
      end;
      apunt:=3;
      ListView1.Items[i-1].Caption:=IntToClaveNum(i,2)+
                    '  '+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ');
      if (SwStatusFV)and(NumPaso>2) then with DMCONS do begin
        SwStatusFV:=false;
        SwDesp:=false;
        SwPreset:=false;
        SwPreset2:=false;
        if (importe>0.01)and(PosActual in [1..4]) then begin
          SwLeeTotales[PosActual]:=true;
          apunt:=4;
          try
            try
              swcierrabd:=true;
              swcierrabd2:=true;
              if not DBGASCON.Connected then
                DBGASCON.Connected:=true;
              T_MoviIb.Active:=true;
              T_MoviIb.Insert;
              T_MoviIbFecha.AsDateTime:=date;
              T_MoviIbHora.AsDateTime:=now;
              T_MoviIbHoraStr.AsString:=HoraPaq(T_MoviIbHora.AsDateTime);
              T_MoviIbPosCarga.AsInteger:=i;
              apunt:=5;
              xcomb:=TComb[PosActual];
              xmang:=TMang[PosActual];
              if TabComb[xcomb].Agruparcon>0 then begin // Combustible agrupado
                T_MoviIbKilometraje.asinteger:=xmang;
                xc:=TabComb[xcomb].Agruparcon;
                if TabComb[xc].Activo then
                  xcomb:=xc;
              end;
              T_MoviIbCombustible.AsInteger:=xcomb;
              apunt:=6;
              T_MoviIbVolumen.AsFloat:=AjustaFloat(Volumen,3);
              T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
              T_MoviIbPrecio.AsFloat:=Ajustafloat(Precio,2);
              T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLitros[1],3);
              T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLitros[2],3);
              T_MoviIbTotal03.AsFloat:=AjustaFloat(TotalLitros[3],3);
              T_MoviIbTotal04.AsFloat:=AjustaFloat(TotalLitros[4],3);
              T_MoviIbTag.AsInteger:=0;
              T_MoviIbManguera.AsInteger:=xmang;
              T_MoviIbTipoPago.asinteger:=TipoPago;
              T_MoviIbCuponImpreso.AsString:='No';
              T_MoviIbReferenciaBitacora.AsInteger:=0;
              T_MoviIbGasId.AsInteger:=Random(1000000);
              TipoPago:=0;
              apunt:=7;

              if swprec then begin
                for xp:=1 to NoComb do if TComb[xp]=xcomb then
                  dmcons.ActualizaTotalesPrecio(i,xp,volumen);
                swprec:=false;
              end;

              T_MoviIb.post;
              apunt:=8;
              if (lcLicTemporal)and(date>lcLicVence) then begin
                MensajeErr('Licencia vencida. Llame a su distribuidor');
                swcerrar:=true; FDISWAYNE2W.Close;
              end;
            finally
              T_MoviIb.Active:=false;
            end;
          except
          end;
        end;
      end
      else if (SwStatusFV)and(importe<0.001) then
        SwStatusFV:=false;
    end;
  except
    DMCONS.AgregaLogCmnd('Error: '+inttostr(apunt));
    with DMCONS do begin
      if (T_MoviIb.State in [dsInsert,dsEdit]) then
        T_MoviIb.Cancel;
    end;
  end;
end;

Function EjecutaCorte:string;
var rsp,Descrsp:string;
    xpos,xpr,xcomb:integer;
begin
  with DMCONS do begin
    rsp:='OK';
    try
      SwCorteOk:=true;
      if not SwCorteParcial then begin
        for xpos:=1 to MaxPosCarga do
          if ((TPosCarga[xpos].isla=xIslaCorte)or(xIslaCorte=0))and(TPosCarga[xpos].estatus in [2,3,4]) then begin
            SwCorteOk:=false;
            DescRsp:='Existen dispensarios cargando';
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
        rsp:='ERROR: '+DescRsp;
      end;
    except
      if (T_Corte.State in [dsInsert,dsEdit]) then
        T_Corte.Cancel;
      rsp:='ERROR: Al insertar registro de Corte';
    end;
  end;
  result:=rsp;
end;



procedure TFDISWAYNE2W.ListBox1Click(Sender: TObject);
var xp:integer;
begin
  LimpiaConsola;
  for xp:=1 to MaxPosCarga do
    DespliegaPosCarga(xp);
end;

procedure TFDISWAYNE2W.Restaurar1Click(Sender: TObject);
begin
  FDISWAYNE2W.Visible:=true;
end;

procedure TFDISWAYNE2W.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=SwCerrar;
end;

procedure TFDISWAYNE2W.FormCreate(Sender: TObject);
begin
  DMCONS.FechaSistema:=now;      // Fechahora sistema
  SwCerrar:=false;
  SwInicio:=true;
  SwBring:=true;
  SwEspera:=false;
  ListaCmnd:=TStringList.Create;
  ContadorAlarma:=0;
  StrCiclo:='';
  HoraGuardaLog:=Now;
end;

procedure TFDISWAYNE2W.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISWAYNE2W.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=false;
  CierraPuerto;
  Application.Terminate;
end;


procedure TFDISWAYNE2W.registro(valor:integer;variable:string);
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

procedure TFDISWAYNE2W.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISWAYNE2W.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISWAYNE2W.lee_registro;
var
  Registry: TRegistry;
  estado:integer;
begin
  with DMCONS,PuertoSerial do begin
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


procedure TFDISWAYNE2W.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
  PuertoSerial.Tracing:= tlDump;
  PuertoSerial.Tracing:= tlOn;
end;

function TFDISWAYNE2W.PosicionDeCombustible(xpos,xcomb:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    if xcomb>0 then begin
      for i:=1 to NoComb do begin
        if TComb[i]=xcomb then
          result:=i;
      end;
    end;
  end;
end;



procedure TFDISWAYNE2W.Button3Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISWAYNE2W.Button4Click(Sender: TObject);
var
  ruta:PAnsiChar;
begin
  ruta:=PChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)));
  ShellExecute(Handle, 'open','explorer.exe',ruta, nil, SW_SHOWNORMAL);
end;

procedure TFDISWAYNE2W.AvanzaPosCiclo;
begin
  inc(PosCiclo);
  if PosCiclo>MaxPosCarga then begin
    EstatusDispensarios;
    PosCiclo:=1;
  end;
end;

procedure TFDISWAYNE2W.EstatusDispensarios;
var ss,lin,xestado,xmodo,scmnd:string;
    xpos,xcomb:integer;
begin
  with DMCONS do begin
    lin:='';xestado:='';xmodo:='';
    for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
      xmodo:=xmodo+ModoOpera[1];
      if not SwDesHabil then begin
        case estatus of
          0:xestado:=xestado+'0'; // Sin Comunicación
          1:xestado:=xestado+'1'; // Inactivo (Idle)
          2:xestado:=xestado+'2'; // Despachando (In Use)
          3,4:if not swcargando then
              xestado:=xestado+'3' // Fin de Carga (Used)
            else
              xestado:=xestado+'2';
          5:xestado:=xestado+'5'; // Llamando (Calling) Pistola Levantada
          9:xestado:=xestado+'9'; // Autorizado
          8:xestado:=xestado+'8'; // Detenido (Stoped)
          else
            xestado:=xestado+'0';
        end;
      end
      else xestado:=xestado+'7'; // Deshabilitado
      xcomb:=TComb[PosActual];//CombustibleEnPosicion(xpos,PosActual);
      ss:=inttoclavenum(xpos,2)+'/'+inttostr(xcomb);
      ss:=ss+'/'+FormatFloat('###0.###',volumen);
      ss:=ss+'/'+FormatFloat('#0.##',precio);
      ss:=ss+'/'+FormatFloat('####0.##',importe);
      lin:=lin+'#'+ss;
      //end;
    end;
    EstatusActual:=xestado;
    if lin='' then
      lin:=xestado+'#'
    else
      lin:=xestado+lin;
    lin:=lin+'&'+xmodo;
    DMCONS.ActualizaDispensarios('D'+lin);
    if EstatusActual<>EstatusAnterior then begin
      DMCONS.AgregaLog('Estatus Disp: '+EstatusActual);
      EstatusAnterior:=EstatusActual;
    end;
  end;
end;

procedure TFDISWAYNE2W.ProcesaComandos;
var ss,rsp,scmnd            :string;
    xcmnd,xpos,xcomb,
    xp,xfolio                :integer;
    ximporte,xlitros  :real;
begin
  try
    // Checa Comandos
    with DMCONS do begin
      if swcierrabd then begin
        DBGASCON.Connected:=false;
        Esperamiliseg(200);
        DBGASCON.Connected:=true;
        swcierrabd:=false;
        Q_CombIb.Active:=true;
      end;
      for xcmnd:=1 to 40 do begin
        if (TabCmnd[xcmnd].SwActivo)and(not TabCmnd[xcmnd].SwResp) then begin
          SwAplicaCmnd:=true;
          scmnd:=TabCmnd[xcmnd].Comando;
          ss:=ExtraeElemStrSep(scmnd,1,' ');
          DMCONS.AgregaLog(scmnd);
          // CMND: CERRAR CONSOLA
          if ss='CERRAR' then begin
            rsp:='OK';
            SwCerrar:=true;
            Timer1.Enabled:=false;
          end
          // GLOG: GUARDA LOG
          else if ss='GLOG' then begin
            rsp:='OK';
            Button1.Click;
          end
          // CMND: ACTIVA MODO PREPAGO
          else if ss='AMP' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos=0 then begin
              for xpos:=1 to MaxPosCarga do
                TPosCarga[xpos].ModoOpera:='Prepago';
              ActivaModoPrepago(0);
              rsp:='OK';
            end
            else if (xpos in [1..maxposcarga]) then begin
              TPosCarga[xpos].ModoOpera:='Prepago';
              ActivaModoPrepago(xpos);
            end;
          end
          // CMND: DESACTIVA MODO PREPAGO
          else if ss='DMP' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos=0 then begin
              for xpos:=1 to MaxPosCarga do
                TPosCarga[xpos].ModoOpera:='Normal';
              DesActivaModoPrepago(0);
              rsp:='OK';
            end
            else if (xpos in [1..maxposcarga]) then begin
              TPosCarga[xpos].ModoOpera:='Normal';
              DesActivaModoPrepago(xpos);
            end;
          end
          // ORDENA CARGA DE COMBUSTIBLE
          else if ss='OCC' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then begin
              if (TPosCarga[xpos].estatus in [1,5]) then begin
                try
                  xImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                  rsp:=ValidaCifra(xImporte,4,2);
                  if rsp='OK' then
                    if (xImporte<0.50) then
                      rsp:='Minimo permitido: $0.50';
                  TPosCarga[xpos].MontoPreset:='$ '+FormatoMoneda(xImporte);
                except
                  rsp:='Error en Importe';
                end;
                if rsp='OK' then begin
                  TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                  if rsp='OK' then begin
                    if (TPosCarga[xpos].estatus in [1,5,9]) then begin
                      ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                      xcomb:=StrToIntDef(ss,0);
                      xp:=PosicionDeCombustible(xpos,xcomb);
                      TPosCarga[xpos].Esperafinventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                      // Preset Pesos
                      EsperaMiliseg(50);
                      if EnviaPresetPesosBomba(xpos,1,ximporte) then begin
                        TPosCarga[xpos].SwPreset:=true;
                        TPosCarga[xpos].SwPreset2:=true;
                        TPosCarga[xpos].PosPreset:=xp;
                        TPosCarga[xpos].TipoPreset:=1;
                        TPosCarga[xpos].ValorPreset:=ximporte;
                      end
                      else rsp:='No se pudo prefijar';
                      // Fin
                    end
                    else rsp:='Posicion de Carga no Disponible';
                  end;
                end;
              end
              else rsp:='Posicion de Carga no Disponible';
            end
            else rsp:='Posicion de Carga no Existe';
          end
          else if ss='OCL' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then begin
              if (TPosCarga[xpos].estatus in [1,5]) then begin
                try
                  xLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                  rsp:=ValidaCifra(xLitros,3,2);
                  if rsp='OK' then
                    if (xLitros<0.10) then
                      rsp:='Minimo permitido: 0.10 lts';
                  TPosCarga[xpos].MontoPreset:=FormatoMoneda(xLitros)+' lts';
                except
                  rsp:='Error en Litros';
                end;
                if rsp='OK' then begin
                  TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                  if rsp='OK' then begin
                    if (TPosCarga[xpos].estatus in [1,5,9]) then begin
                      ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                      xcomb:=StrToIntDef(ss,0);
                      xp:=PosicionDeCombustible(xpos,xcomb);
                      TPosCarga[xpos].Esperafinventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                      // Preset Litros
                      EsperaMiliseg(50);
                      if EnviaPresetPesosBomba(xpos,1,xlitros) then begin
                        TPosCarga[xpos].SwPreset:=true;
                        TPosCarga[xpos].SwPreset2:=true;
                        TPosCarga[xpos].PosPreset:=xp;
                        TPosCarga[xpos].TipoPreset:=2;
                        TPosCarga[xpos].ValorPreset:=xlitros;
                      end
                      else rsp:='No se pudo prefijar';
                      // Fin
                    end
                    else rsp:='Posicion de Carga no Disponible';
                  end;
                end;
              end
              else rsp:='Posicion de Carga no Disponible';
            end
            else rsp:='Posicion de Carga no Existe';

          end
          // ORDENA FIN DE VENTA
          else if ss='FINV' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then begin
              TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              if (TPosCarga[xpos].Estatus in [3,4]) then begin // EOT
                if (not TPosCarga[xpos].swcargando) then begin
                  TPosCarga[xpos].esperafinventa:=0;
                  try
                    try
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
                    finally
                      Q_Auxi.Active:=false;
                    end;
                  except
                    on e:exception do
                    DMCONS.AgregaLogCmnd('ERROR al cambiar tipo de pago: '+e.Message);
                  end;
                  DespliegaPosCarga(xpos);
                end
                else begin
                  if (TPosCarga[xpos].swcargando)and(TPosCarga[xpos].Estatus=1) then begin
                    TPosCarga[xpos].swcargando:=false;
                    TPosCarga[xpos].esperafinventa:=0;
                    rsp:='OK';
                  end
                  else rsp:='Posicion no esta despachando';
                end;
              end
              else  // EOT
                rsp:='Posicion aún no esta en fin de venta';
            end
            else rsp:='Posicion de Carga no Existe';

          end
          // ORDENA ESPERA FIN DE VENTA
          else if ss='EFV' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then
              if (TPosCarga[xpos].Estatus in [2,9]) then
                TPosCarga[xpos].Esperafinventa:=1
              else rsp:='Posicion debe estar Autorizada o Despachando'
            else rsp:='Posicion de Carga no Existe';
          end
          // CMND: DESHABILITA POSICIOND DE CARGA
          else if ss='DPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              TPosCarga[xpos].SwDesHabil:=true;
          end
          else if ss='HPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              TPosCarga[xpos].SwDesHabil:=false;
          end
          // CMND: DESAUTORIZA VENTA DE COMBUSTIBLE
          else if (ss='DVC')or(ss='PARAR') then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(scmnd,2,' '),0);
            if xpos in [1..MaxPosCarga] then begin
              if (TPosCarga[xpos].estatus=2) then begin // despachando
                if DetenerDespacho(xpos) then begin
                end;
              end
              else if (TPosCarga[xpos].estatus=9) then begin // autorizado
                if EnviaPresetPesosBomba(xpos,1,9999.99) then begin
                  TPosCarga[xpos].SwPreset:=false;
                  TPosCarga[xpos].SwPreset2:=false;
                end;
              end;
            end;
          end
          else if (ss='REANUDAR') then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then begin
              //if (TPosCarga[xpos].estatus in [8]) then begin
                if ReanudaDespacho(xpos) then begin
                end;
              //end;
            end;
          end
          else if ss='CORTE' then begin
            try
              xFechaCorte:=StrToFecha(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '));
              xTurnoCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              xIslaCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
              SwCorteParcial:=false;
              rsp:=EjecutaCorte;
            except
              rsp:='Comando Erroneo';
            end;
          end
          // CMND: REFRESCA CORTE
          else if ss='REFRESCACORTE' then begin
            try
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
              rsp:='Comando Erroneo';
            end;
          end
          else if ss='CORTEPARCIAL' then begin
            try
              xFechaCorte:=StrToFecha(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '));
              xTurnoCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              xIslaCorte:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
              SwCorteParcial:=true;
              rsp:=EjecutaCorte;
            except
              rsp:='Comando Erroneo';
            end;
          end
          else rsp:='Comando no Soportado o no Existe';
          TabCmnd[xcmnd].SwNuevo:=false;
          if SwAplicaCmnd then begin
            if rsp='' then
              rsp:='OK';
            TabCmnd[xcmnd].SwResp:=true;
            TabCmnd[xcmnd].Respuesta:=rsp;
            DMCONS.AgregaLog(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
            DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
          end;
          if SwCerrar then
            FDISWAYNE2W.Close;
        end;
      end;
    end;
  except
  end;
end;

procedure TFDISWAYNE2W.Timer1Timer(Sender: TObject);
label L01;
var xvolumen,n1,n2,n3:real;
    xcomb,xpos,xp,xgrade,i,j:integer;
    xtotallitros:real;
    xfec:TDateTime;
begin
  try
    xfec:=Now;
    if abs(xfec-DMCONS.FechaSistema)>TMMinuto then
      DMCONS.RegistraBitacoraCFH(DMCONS.FechaSistema,xfec);
    DMCONS.FechaSistema:=Now;
    if CheckBox1.Checked then
      if abs(now-HoraGuardaLog)>10*TMMinuto then begin
        Button1.Click;
        HoraGuardaLog:=now;
      end;
  except
  end;
  if swbring then begin
    StaticText17.Visible:=false;
    FDISWAYNE2W.BringToFront;
    swbring:=false;
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
  //
  if (swespera)and((now-horaespera)>3*tmsegundo) then
    swespera:=false;
  if not SwEspera then begin
    if not SwPasoBien then begin
      swespera:=false;
      inc(ContadorAlarma);
      goto L01;
    end;
    SwPasoBien:=false;
    SwEspera:=true;
    HoraEspera:=Now;
    if PosCiclo in [1..MaxPosCarga] then with TPosCarga[PosCiclo] do begin
      StrCiclo:=StrCiclo+inttostr(PosCiclo);
      while length(StrCiclo)>20 do
        delete(StrCiclo,1,1);
      StaticText5.Caption:='Bomba: '+inttostr(PosCiclo);
      StaticText6.Caption:='Paso: '+inttostr(NumPaso);
      try
        case NumPaso of
          0:if SwLeePrecios then begin
              if LeePrecios(PosCiclo) then
                SwLeePrecios:=false;
            end;
          1:begin                           // ESTATUS
              try
                if not swdeshabil then begin   // no polea los que estan deshabilitados
                  EstatusAnt:=Estatus;
                  Estatus:=DameEstatus(PosCiclo);    // Aqui bota cuando no hay posicion activa
                  ContadorAlarma:=0;
                  if estatus=2 then
                    swdesp:=true;
                  if (swdesp)and(estatus in [1,3,5]) then begin
                    DMCONS.AgregaLog('Detecto Fin Venta: '+inttostr(PosCiclo));
                    swdesp:=false;
                    SwStatusFV:=true;
                    Estatus:=3;
                  end;
                  if (Estatusant=0)and(estatus=1) then begin
                    Swleeventa:=true;
                    for j:=1 to TPosCarga[PosCiclo].NoComb do
                      SwLeeTotales[j]:=true;
                  end;
                  if (EstatusAnt in [3,4])and(Estatus=1) then begin
                    swcargando:=false;
                    if EsperaFinVenta=1 then
                      Estatus:=4;
                  end;
                  EstatusDispensarios;
                  if (Estatusant=2)and(Estatus=9)and(not swpreset) then begin // Desautoriza
                    DMCONS.AgregaLog('Desautorizo posicion: '+inttostr(PosCiclo));
                    Esperamiliseg(300);
                    DetenerDespacho(PosCiclo);
                    Esperamiliseg(300);
                    ReanudaDespacho(PosCiclo);
                  end;
                end;
              except
                DMCONS.AgregaLogCmnd('Error Estatus Pos: '+inttostr(PosCiclo));
                AvanzaPosCiclo;
                NumPaso:=1;
                exit;
              end;
            end;
          2:if (swleeventa)and(estatus>0) then begin       // LEE VENTA TERMINADA
              if not swdeshabil then begin   // no polea los que estan deshabilitados
                DMCONS.AgregaLog('E> FIN DE VENTA: '+inttoclavenum(PosCiclo,2));
                if DameLecturas(PosCiclo,Volumen,Precio,Importe) then begin
                  swleeventa:=false;
                  xvolumen:=ajustafloat(dividefloat(importe,precio),3);
                  if abs(volumen-xvolumen)>0.5 then
                    volumen:=xvolumen;
                  DMCONS.AgregaLog('R> '+FormatFloat('###,##0.00',Volumen)+' / '+FormatFloat('###,##0.00',precio)+' / '+FormatFloat('###,##0.00',importe));
                end;
              end;
            end;
          3:if (estatus>0)and(not swdeshabil) then begin        // LEE TOTALES
              if LeeTotalPosCiclo(PosCiclo,MangCiclo) then begin
                DMCONS.AgregaLog('E> Lee Totales: '+inttoclavenum(PosCiclo,2));
                if DameTotal(PosCiclo,MangCiclo,xTotalLitros)then
                begin
                  TotalLitros[MangCiclo]:=xTotalLitros;
                  DMCONS.AgregaLog('R> '+FormatFloat('###,###,##0.00',xTotalLitros));
                  SwLeeTotales[MangCiclo]:=false;
                  if not DMCONS.DBGASCON.Connected then
                    DMCONS.DBGASCON.Connected:=true;
                  DMCONS.RegistraTotales_BD4(PosCiclo,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                  if swcierrabd2 then begin
                    swcierrabd:=true;
                    swcierrabd2:=false;
                  end;
                end;
              end;
            end;
          4:if (estatus=5)and(not swdeshabil)  then begin
              if (ModoOpera='Normal') then begin // AUTORIZA VENTA tanque lleno
                DMCONS.AgregaLog('E> Autoriza: '+inttoclavenum(PosCiclo,2));
                if not swpreset then begin
                  if Autoriza(PosCiclo) then ;
                end
                else if (swpreset)and(PosPreset=PosMangLev) then begin
                  if EnviaPresetPesosBomba(PosCiclo,TipoPreset,ValorPreset) then
                    if AutorizaPm(PosCiclo,PosPreset) then begin
                      swpreset2:=true;
                    end;
                end
                else if (swpreset)and(PosPreset=0) then begin
                  if EnviaPresetPesosBomba(PosCiclo,TipoPreset,ValorPreset) then
                    if Autoriza(PosCiclo) then begin
                      swpreset2:=true;
                    end;
                end;
              end
              else begin // AUTORIZA PREPAGO
                DMCONS.AgregaLog('E> Autoriza Prepago: '+inttoclavenum(PosCiclo,2));
                if (SwPreset)and(PosPreset=PosMangLev) then begin
                  if EnviaPresetPesosBomba(PosCiclo,TipoPreset,ValorPreset) then
                    if AutorizaPm(PosCiclo,PosPreset) then begin
                      swpreset2:=true;
                    end;
                end
                else if (swpreset)and(PosPreset=0) then begin
                  if EnviaPresetPesosBomba(PosCiclo,TipoPreset,ValorPreset) then
                    if Autoriza(PosCiclo) then begin
                      swpreset2:=true;
                    end;
                end;
              end
            end;
          5:if estatus in [2,8] then begin                 // LEE VENTA PROCESO
              if not swdeshabil then begin   // no polea los que estan deshabilitados
                DMCONS.AgregaLog('E> Lee Venta Proc: '+inttoclavenum(PosCiclo,2));
                if DameLecturas(PosCiclo,Volumen,Precio,Importe) then begin
                end;
              end;
            end;
          6:ProcesaComandos;
          7:begin          // CAMBIA PRECIO
              if not swdeshabil then begin   // no polea los que estan deshabilitados
                if TCambioPrecN1 then begin
                  DMCONS.AgregaLog('E> Cambia Precio: '+inttoclavenum(PosCiclo,2));
                  if CambiaPrecios(PosCiclo) then
                    TCambioPrecN1:=false;
                end;
              end;
            end;

        end;
      finally
        swespera:=false;
      end;
L01:
      SwPasoBien:=true;
      DespliegaPosCarga(PosCiclo);
      with TPosCarga[PosCiclo] do begin
        case estatus of
          2:swcargando:=true;
          3:if NumPaso=1 then begin
              SwLeeVenta:=true;
              ContLeeVenta:=0;
            end;
        end;

        inc(NumPaso);
        if (NumPaso=2)and(not SwLeeVenta) then
          NumPaso:=3;
        if (NumPaso=3) then begin
          if (swleeventa)and(contleeventa<3) then begin
            NumPaso:=2;
            inc(contleeventa);
          end
          else if (not LeeTotalPosCiclo(PosCiclo,MangCiclo)) then
            NumPaso:=4;
        end;
        if (NumPaso=4)and(not estatus in [5,9]) then
          NumPaso:=5;
        if (NumPaso=5)and(estatus<>2)and(estatus<>8) then  // no esta ni estaba despachando
          NumPaso:=6;
        if (NumPaso=6)and(PosCiclo<MaxPosCarga) then
          NumPaso:=7;
        if (NumPaso=7) then begin
          swprec:=TPosCarga[PosCiclo].TCambioPrecN1;
          if not swprec then
            NumPaso:=8;
        end;

        //
        if NumPaso>=8 then begin
          AvanzaPosCiclo;
          if TPosCarga[PosCiclo].SwLeePrecios then
            NumPaso:=0
          else
            NumPaso:=1;
        end;
      end;
    end
    else posciclo:=1;

    // Checa por cambios de precios
    if ((Now-DMCONS.FechaHoraPrecio)>12*tmSegundo) then begin
      DMCONS.FechaHoraPrecio:=Now;
      with DMCONS do if AplicarPrecios then begin
        for xcomb:=1 to MaxComb do with TabComb[xcomb] do if Activo then begin
          try
            Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
            Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=xcomb;
            Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
            Q_AplicaPrecioF.ExecSQL;
            RegistraBitacoraCP(xcomb);
          except
          end;

          // Programa cambio precio
          for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
            TCambioPrecN1:=true;
            for xp:=1 to NoComb do if xcomb=TComb[xp] then
              TNuevoPrec[xp]:=TabComb[xcomb].precio;
          end;
        end;
        CargaPreciosFH(Now,true);
        Q_CombIb.Active:=false;
        Q_CombIb.Active:=true;
        DBGrid3.Refresh;
      end;
    end;

    // Minimiza pantalla al inicio
    if NotificationIcon1.Tag=0 then begin
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      FDISWAYNE2W.Visible:=false;
      NotificationIcon1.Show;
    end;

  end;
end;


end.

