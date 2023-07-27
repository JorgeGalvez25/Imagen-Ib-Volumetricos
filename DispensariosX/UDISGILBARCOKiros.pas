unit UDISGILBARCOKiros;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  dxGDIPlusClasses,ShellApi;


const
      _poly=$1D;
      ValorX='957.3';


type
  TFDISGILBARCOKiros = class(TForm)
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
    StaticText6: TStaticText;
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
    StaticText18: TStaticText;
    Button1: TButton;
    PageControl1: TPageControl;
    StaticText9: TStaticText;
    Button3: TButton;
    AbrirUbicacin1: TMenuItem;
    PuertoSerial: TApdComPort;
    TL_BombTANQUE: TIntegerField;
    StaticText17: TStaticText;
    Label1: TLabel;
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
    procedure PuertoSerialTriggerAvail(CP: TObject; Count: Word);
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
    PosCiclo,ls,
    ContLeeVenta,
    NumPaso         :integer;
    SwEsperaComando,
    SwPasoBien      :boolean;
    { Private declarations }
     function  DataControlWordValue(chDataControlWord : char; iLongitud : integer) : longint;
     function  TransmiteComando(iComando, xNPos: integer; sDataBlock: string) : boolean;
     procedure  TransmiteComandoEsp(sDataBlock: string) ;
  public
    { Public declarations }
     function  AbrePuerto : boolean;
     function  CierraPuerto : boolean;
     function  Autoriza(PosCarga: integer) : boolean;
     function  ReanudaDespacho(PosCarga: integer) : boolean;
     function  PonNivelPrecio(xNPos, xNPrec : integer) : boolean;
     function  EnviaPresetBomba6(xNPos, xNMang, xNPrec: integer; rPesos, rLitros: real) : boolean;
     function  EnviaPresetBomba8(xNPos, xNMang, xNPrec: integer; rPesos, rLitros: real) : boolean;
     function  CambiaPrecio6(xNPos, xNMang, xNPrec : integer; rPrecio : real) : boolean;
     function  CambiaPrecio8(xNPos, xNMang, xNPrec : integer; rPrecio : real) : boolean;
     function  DetenerDespacho(xNPos : integer) : boolean;
     function  DameTotales6(xNPos : integer; var rTotalizadorLitros1, rTotalizadorPesos1, rTotalizadorLitros2, rTotalizadorPesos2, rTotalizadorLitros3, rTotalizadorPesos3 : real) : boolean;
     function  DameTotales8(xNPos : integer; var rTotalizadorLitros1, rTotalizadorPesos1, rTotalizadorLitros2, rTotalizadorPesos2, rTotalizadorLitros3, rTotalizadorPesos3 : real) : boolean;
     function  DameVentaProceso6(xNPos : integer; var rPesos : real) : boolean;
     function  DameVentaProceso8(xNPos : integer; var rPesos : real) : boolean;
     function  DameLecturas6(xNPos : integer; var xNMang : integer; var rLitros, rPrecio, rPesos : real) : boolean;
     function  DameLecturas8(xNPos : integer; var xNMang : integer; var rLitros, rPrecio, rPesos : real) : boolean;
     function  DameEstatus(PosCarga:integer) : integer;

    { Public declarations }
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    function CombustibleEnPosicion(xpos,xpc:integer):integer;
    function PosicionDeCombustible(xpos,xcomb:integer):integer;
    procedure AvanzaPosCiclo;
    procedure ProcesaComandos;
    procedure ProcesaPrecios;
    procedure EstatusDispensarios;
    procedure MandaFlujoPos(xpos,xvalor:integer);
  end;

type
     tiposcarga = record
       SwDesHabil   :boolean;
       DigitosGilbarco,
       DivImporte,
       DivLitros,
       estatus,
       estatusant   :integer;
       importe,
       volumen,
       precio       :real;
       Isla,
       Canal,
       PosActual    :integer; // Posicion del combustible en proceso: 1..NoComb
       NoComb       :integer; // Cuantos combustibles hay en la posicion
       TComb        :array[1..4] of integer; // Claves de los combustibles
       TPosx        :array[1..4] of integer;
       TMang        :array[1..4] of integer;
       TotalLitros  :array[1..4] of real;

       MontoPreset    :string;
       ImportePreset  :real;

       swprec,
       swestatus0,
       swautoriza,
       swcargando     :boolean;
       ModoOpera      :string[8];
       TipoPago       :integer;
       EsperaFinVenta :integer;

       SwFinVenta,
       SwLeeVenta,
       SwTotales,
       SwNivelPrecio,
       SwCambiaPrecio,
       SwRepitePos,
       //swaux,
       SwPreset       :boolean;
       HoraNivelPrecio:TDateTime;

       StPresetPos,
       StKairosFrec,
       StFluPos,
       FallosEstat    :integer;
     end;

     regprecios = record
       SwCambPrec:array[1..4] of boolean;
       NuevoPrec:array[1..4] of real;
     end;



var
  FDISGILBARCOKiros: TFDISGILBARCOKiros;
  MaxPosCarga :integer;
  SwCerrar    :boolean;
  EstatusAntx,
  EstatusActx  :string;
  // CONTROL TRAFICO COMANDOS
  ListaCmnd   :TStrings;
  TPosCarga   :array[1..32] of tiposcarga;
  TPrecios    :array[1..16] of regprecios;
  SwCmndPend  :boolean;
  IdCmndPend,
  PosCmndPend  :integer;

  Tagx        :array[1..3] of integer;
  //StFlu,PosFlu:integer;

  Swflu       :boolean;
  TAdicf        :array[1..32,1..3] of integer;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU, Math;

{$R *.DFM}



function crc8(Buffer:String):Cardinal;
var
  i,j: Integer;
begin
  Result:=0;
  for i:=1 to Length(Buffer) do begin
    Result:=Result xor ord(buffer[i]);
    for j:=0 to 7 do begin
      if (Result and $80)<>0 then
        Result:=(Result shl 1) xor _poly
      else
        Result:=Result shl 1;
    end;
  end;
  Result:=Result and $ff;
end;

function EmpacaKairos(xss:string;xpos:integer):string;
var ss:string;
    i:integer;
    ch:char;
begin
  // inserta ESC ($7D)
  if xss='' then begin
    result:=char($FF);
    exit;
  end;


  i:=1;
  repeat
    if (xss[i] in [char($7E),char($7D)]) then begin
      insert(char($7D),xss,i);
      inc(i);
    end;
    inc(i);
  until i>length(xss);


  // fin
  ss:=char(TPosCarga[xpos].Canal)+char(3)+char(1)+char(0)+xss;
  ch:=char(crc8(ss));
  if ch<>char($7E) then
    ss:=ss+ch
  else
    ss:=ss+char($7D)+ch;
  result:=char($7E)+ss+char($7E);
end;

function DesEmpacaKairos(xss:string):string;
var i:integer;
begin
  if length(xss)<7 then begin
    result:=char($FF);
    exit;
  end;
  while (xss[1]<>char($7E))and(length(xss)>7) do
    delete(xss,1,1);
  while (xss[length(xss)]<>char($7E))and(length(xss)>7) do
    delete(xss,length(xss),1);


  if (xss[1]=char($7E))and(xss[length(xss)]=char($7E)) then begin
    // valida EXC ($7D)
    i:=6;
    while (i<=length(xss)-2) do begin
      if (xss[i]=char($7D))and(xss[i+1] in [char($7E),char($7D)]) then begin
        delete(xss,i,1);
        inc(i);
      end;
      inc(i);
    end;
    // fin

    result:=copy(xss,5,length(xss)-6);
  end
  else result:=char($FF);
end;



function BcdToInt(xBCD : string) : integer;   // Convierte un BCD a Integer
var xValor, xMult, i : integer;
begin
   xValor:= 0;
   xMult:= 1;
   for i:= 1 to length(xBCD)do begin
      xValor:= xValor + (ord(xBCD[i]) and $0F)*xMult;
      xMult:= xMult*10;
   end;
   result:= xValor;
end;

function BcdToStr(xValor : string) : string;    // Convierte BCD a String
var xBCD : string;
    i : integer;
begin
   xBCD:= '';
   for i:= length(xValor) downto 1 do try
      xBCD:= xBCD + char($E0 + strtoint(xValor[i]));
   except
      xBCD:= '';
   end;
   result:= xBCD;
end;

function DLChar(s : string) : char;    // Longitud de String en Character
var iDL : integer;
begin
   iDL:= ( length(s) + 2 ) xor $FF + 1;
   result:= char($E0 + iDL and $0F);
end;

function LoNibbleChar(ch : char): byte;
begin
   result:= ord(ch) and $0F;
end;

function HiNibbleChar(ch : char): byte;
begin
   result:= ( ord(ch) shr 4) and $0F;
end;


function LrcCheckChar(s : string) : char;
var iLRC, i : integer;
begin
   iLRC:= 0;
   for i:= 1 to length(s) do iLRC:= iLRC + ord(s[i]) and $0F;
   iLRC:= iLRC xor $F + 1;
   result:= char($E0 + iLRC and $F);
end;



procedure TFDISGILBARCOKiros.PuertoSerialTriggerAvail(CP: TObject; Count: Word);
var i : integer;
    c,cx:char;
begin
   c:=' ';cx:=' ';
   for i:=1 to Count do begin
     cx:=c;
     c:=PuertoSerial.GetChar;
     sRespuesta:= sRespuesta + c;
   end;
   i:= length(sRespuesta);
   if (i>4)and(ord(c)=$7E)and(ord(cx)<>$7D) then
     bEndOfText:=true;
   if ( ( i>=iBytesEsperados ) or ( bEndOfText )  or ( bLineFeed ) ) then
      bListo:= true
   else
      newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout));
end;

function TFDISGILBARCOKiros.DataControlWordValue(chDataControlWord : char; iLongitud : integer) : longint;
var xValor : longint;
    iPosicion : integer;
begin
   iPosicion:= pos(chDataControlWord,sRespuesta);
   if ( ( iPosicion=0 ) or ( ( iPosicion + 1 + iLongitud )>length(sRespuesta) ) ) then
      xValor:= 0
   else
      xValor:= BcdToInt(copy(sRespuesta,iPosicion + 1,iLongitud));
   result:= xValor;
end;

function TFDISGILBARCOKiros.TransmiteComando(iComando, xNPos: integer; sDataBlock: string) : boolean;
var iMaxIntentos, iNoIntento, i , xpos, long: integer;
    chComando : char;
    bOk : boolean;
    xDataBlock,
    xComando:string;
begin
   SwEsperaComando:=true;
   xpos:=xNPos;
   if ( iComando in [$10,$30,$F0] ) then begin
      bOk:= true;
      iMaxIntentos:= 0;
   end
   else begin
      bOk:= false;
      if ( iComando in [$00,$20] ) then begin
         iMaxIntentos:= 2;
         iBytesEsperados:= 1;
      end
      else begin
         iMaxIntentos:= 2;
         if TPosCarga[xpos].DigitosGilbarco=6 then begin
           if ( iComando=$40 ) then
              iBytesEsperados:= 33
           else if ( iComando=$50 ) then
              iBytesEsperados:= 184
           else if ( iComando=$60 ) then
              iBytesEsperados:= 6;
         end
         else begin
           if ( iComando=$40 ) then
              iBytesEsperados:= 39
           else if ( iComando=$50 ) then
              iBytesEsperados:= 256
           else if ( iComando=$60 ) then
              iBytesEsperados:= 8;
         end;
      end;
   end;
   iBytesEsperados:=iBytesEsperados+6;
   if ( xNPos=16 ) then xNPos:= 0;
   chComando:= char(iComando + xNPos);
   iNoIntento:= 0;
   repeat
      inc(iNoIntento);
      bListo:= false;
      bEndOfText:= false;
      bLineFeed:= false;
      sRespuesta:= '';
      PuertoSerial.FlushInBuffer;
      PuertoSerial.FlushOutBuffer;
      xComando:=EmpacaKairos(chComando,xnpos);
      for i:= 1 to length ( xComando ) do begin
         PuertoSerial.PutChar(xComando[i]);
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
            sRespuesta:=DesEmpacaKairos(sRespuesta);
            if TPosCarga[xpos].DigitosGilbarco=6 then begin
              if ( iComando=$00 ) then
                 bOk:= ( ( LoNibbleChar(sRespuesta[1])=xNPos ) and ( HiNibbleChar(sRespuesta[1])<>$0 ) )
              else if ( iComando=$20 ) then begin
                 bOk:= ( ( LoNibbleChar(sRespuesta[1])=xNPos ) and ( HiNibbleChar(sRespuesta[1])=$D ) );
              end
              else if ( iComando=$40 ) then begin
                bOk:= ( length(sRespuesta)>31 );
              end
              else if ( iComando=$50 ) then begin
                bOk:= ( ( ( length(sRespuesta) - 4) mod 30)=0 );
              end
              else if ( iComando=$60 ) then begin
                 bOk:= ( length(sRespuesta)=6 );
              end
              else
                 bOk:= false;
            end
            else begin
              if ( iComando=$00 ) then
                 bOk:= ( ( LoNibbleChar(sRespuesta[1])=xNPos ) and ( HiNibbleChar(sRespuesta[1])<>$0 ) )
              else if ( iComando=$20 ) then begin
                 bOk:= ( ( LoNibbleChar(sRespuesta[1])=xNPos ) and ( HiNibbleChar(sRespuesta[1])=$D ) );
              end
              else if ( iComando=$40 ) then begin
                bOk:= ( length(sRespuesta)>37 );
              end
              else if ( iComando=$50 ) then begin
                bOk:= ( ( ( length(sRespuesta) - 4) mod 42)=0 );
              end
              else if ( iComando=$60 ) then begin
                bOk:= ( length(sRespuesta)=8 );
              end
              else
                 bOk:= false;
            end;
         end;
         if ( not bOk ) then begin
            if  ( iNoIntento<iMaxIntentos ) then sleep(dmcons.GtwTiempoCmnd);
         end
         else if ( iComando=$20 ) then begin
            sleep(50);
            bListo:= false;
            bEndOfText:= false;
            bLineFeed:= false;
            sRespuesta:= '';
            PuertoSerial.FlushInBuffer;
            PuertoSerial.FlushOutBuffer;
            xDataBlock:=EmpacaKairos(sDataBlock,xnpos);
            long:=length ( xDataBlock );
            for i:= 1 to long do begin
               PuertoSerial.PutChar(xDataBlock[i]);
               repeat
                  PuertoSerial.ProcessCommunications;
               until ( PuertoSerial.OutBuffUsed=0 );
            end;
            sleep(500);
            bOk:=true;
         end;
      end;
   until ( ( bOk ) or ( iNoIntento>=iMaxIntentos ) );
   result:= bOk;
   SwEsperaComando:=false;
end;

procedure TFDISGilbarcoKiros.TransmiteComandoEsp(sDataBlock: string);
var 
    i:integer;
begin
          sleep(10);
          PuertoSerial.FlushInBuffer;
          PuertoSerial.FlushOutBuffer;
          for i:= 1 to length ( sDataBlock ) do begin
             PuertoSerial.PutChar(sDataBlock[i]);
             repeat
                PuertoSerial.ProcessCommunications;
             until ( PuertoSerial.OutBuffUsed=0 );
          end;
          sleep(dmcons.GtwTiempoCmnd);
          newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout));
          repeat
             Application.ProcessMessages;
          until ( ( bListo ) or ( timerexpired(etTimeOut) ) );        
end;

//------------------------------------------------------------------------------
//                         Rutinas de uso publico
//------------------------------------------------------------------------------

function TFDISGILBARCOKiros.AbrePuerto: boolean;
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
      wTriggerEOT:= PuertoSerial.AddDataTrigger(#$F0,true);
      wTriggerLF:= PuertoSerial.AddDataTrigger(#$8A,true);
      result:= true;
    end;
  except
     result:= false;
  end;
end;

//------------------------------------------------------------------------------

function TFDISGILBARCOKiros.Autoriza(PosCarga: integer) : boolean;
begin
   result:= ( TransmiteComando($10,PosCarga,'') );
end;

//--------------------------------------------------------------------------------
function TFDISGILBARCOKiros.ReanudaDespacho(PosCarga: integer) : boolean;
begin
   result:= ( TransmiteComando($10,PosCarga,'') );
end;

//--------------------------------------------------------------------------------

function TFDISGILBARCOKiros.CierraPuerto : boolean;
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

//--------------------------------------------------------------------------------


function TFDISGILBARCOKiros.PonNivelPrecio(xNPos, xNPrec : integer) : boolean;
var sPriceLevel, sDataBlock : string;
begin
   if ( xNPrec=1 ) then
      sPriceLevel:= #$F4
   else
      sPriceLevel:= #$F5;
   sDataBlock:= sPriceLevel + #$FB;
   sDataBlock:= #$FF + DLChar(sDataBlock) + sDataBlock;
   sDataBlock:= sDataBlock + LrcCheckChar(sDataBlock) + #$F0;
   result:= ( TransmiteComando($20,xNPos,sDataBlock) );
end;

//------------------------------------------------------------------------------

function TFDISGILBARCOKiros.EnviaPresetBomba6(xNPos, xNMang, xNPrec: integer; rPesos, rLitros: real) : boolean;
var sGrade, sPriceLevel, sPresetType, sAmount, sDataBlock : string;
begin
   with DMCONS do begin
     if ( xNMang=0 ) then
        sGrade:= ''
     else
        sGrade:= #$F6 + char($E0 + xNMang - 1);
     if ( xNPrec=1 ) then
        sPriceLevel:= #$F4
     else
        sPriceLevel:= #$F5;
     if ( rLitros>0 ) then begin
        sPresetType:= #$F1;
        sAmount:= format('%5.5d',[round(rLitros*GtwDivPresetLts)]);
     end
     else begin
        sPresetType:= #$F2;
        sAmount:= format('%6.6d',[round(rPesos*GtwDivPresetPesos)]);
     end;
     sDataBlock:=  sPresetType + sPriceLevel + sGrade + #$F8 + BcdToStr(sAmount) + #$FB;
     sDataBlock:= #$FF + DLChar(sDataBlock) + sDataBlock;
     sDataBlock:= sDataBlock + LrcCheckChar(sDataBlock) + #$F0;
     result:= ( TransmiteComando($20,xNPos,sDataBlock) );
   end;
end;

function TFDISGILBARCOKiros.EnviaPresetBomba8(xNPos, xNMang, xNPrec: integer; rPesos, rLitros: real) : boolean;

var sGrade, sPriceLevel, sPresetType, sAmount, sDataBlock : string;
begin
  with DMCONS do begin
   if ( xNMang=0 ) then
      sGrade:= ''
   else
      sGrade:= #$F6 + char($E0 + xNMang - 1);
   if ( xNPrec=1 ) then
      sPriceLevel:= #$F4
   else
      sPriceLevel:= #$F5;
   if ( rLitros>0 ) then begin
      sPresetType:= #$F1;
      sAmount:= format('%8.8d',[round(rLitros*GtwDivPresetLts)]);
   end
   else begin
      sPresetType:= #$F2;
      sAmount:= format('%8.8d',[round(rPesos*GtwDivPresetPesos)]);
   end;
   sDataBlock:=  sPresetType + sPriceLevel + sGrade + #$F8 + BcdToStr(sAmount) + #$FB;
   sDataBlock:= #$FF + DLChar(sDataBlock) + sDataBlock;
   sDataBlock:= sDataBlock + LrcCheckChar(sDataBlock) + #$F0;
   result:= ( TransmiteComando($20,xNPos,sDataBlock) );
  end;
end;
//--------------------------------------------------------------------------------

function TFDISGILBARCOKiros.CambiaPrecio6(xNPos, xNMang, xNPrec : integer; rPrecio : real) : boolean;
var sPriceLevel, sDataBlock : string;
begin
  with DMCONS do begin
   if ( xNPrec=1 ) then
      sPriceLevel:= #$F4
   else
      sPriceLevel:= #$F5;
   sDataBlock:= sPriceLevel + #$F6 + chr($E0 + xNMang - 1) + #$F7 + BcdToStr(format('%4.4d',[round(rPrecio*GtwDivPrecio)])) + #$FB;
   sDataBlock:= #$FF + DLChar(sDataBlock) + sDataBlock;
   sDataBlock:= sDataBlock + LrcCheckChar(sDataBlock) + #$F0;
   result:= ( TransmiteComando($20,xNPos,sDataBlock) );
  end;
end;

function TFDISGILBARCOKiros.CambiaPrecio8(xNPos, xNMang, xNPrec : integer; rPrecio : real) : boolean;
var sPriceLevel, sDataBlock : string;
begin
  with DMCONS do begin
   if ( xNPrec=1 ) then
      sPriceLevel:= #$F4
   else
      sPriceLevel:= #$F5;
   sDataBlock:= sPriceLevel + #$F6 + chr($E0 + xNMang - 1) + #$F7 + BcdToStr(format('%6.6d',[round(rPrecio*GtwDivPrecio)])) + #$FB;
   sDataBlock:= #$FF + DLChar(sDataBlock) + sDataBlock;
   sDataBlock:= sDataBlock + LrcCheckChar(sDataBlock) + #$F0;
   result:= ( TransmiteComando($20,xNPos,sDataBlock) );

  end;
end;

//------------------------------------------------------------------------------

function TFDISGILBARCOKiros.DetenerDespacho(xNPos : integer) : boolean;
begin
   result:= ( TransmiteComando($30,xNPos,'') );
end;

//------------------------------------------------------------------------------

function TFDISGILBARCOKiros.DameTotales6(xNPos : integer;var rTotalizadorLitros1, rTotalizadorPesos1, rTotalizadorLitros2, rTotalizadorPesos2, rTotalizadorLitros3, rTotalizadorPesos3 : real) : boolean;
var xNMang : integer;
    bOk : boolean;
begin
  with DMCONS do begin
   rTotalizadorLitros1:= 0;
   rTotalizadorPesos1:= 0;
   rTotalizadorLitros2:= 0;
   rTotalizadorPesos2:= 0;
   rTotalizadorLitros3:= 0;
   rTotalizadorPesos3:= 0;
   bOk:= ( ( TransmiteComando($50,xNPos,'') ) and ( length(sRespuesta)>=34 ) );
   if ( bOk ) then begin
      delete(sRespuesta,1,1);
      while ( length(sRespuesta)>30 ) do begin
         xNMang:= ( LoNibbleChar(sRespuesta[2]) ) + 1;
         case ( xNMang ) of
            1 : begin
                   rTotalizadorLitros1:= DataControlWordValue(#$F9,8)/GtwDivTotLts;
                   rTotalizadorPesos1:= DataControlWordValue(#$FA,8)/GtwDivTotImporte;
                end;
            2 : begin
                   rTotalizadorLitros2:= DataControlWordValue(#$F9,8)/GtwDivTotLts;
                   rTotalizadorPesos2:= DataControlWordValue(#$FA,8)/GtwDivTotImporte;
                end;
            3 : begin
                   rTotalizadorLitros3:= DataControlWordValue(#$F9,8)/GtwDivTotLts;
                   rTotalizadorPesos3:= DataControlWordValue(#$FA,8)/GtwDivTotImporte;
                end;
         end;
         delete(sRespuesta,1,30);
      end;
   end;
   result:= bOk;
  end;
end;

function TFDISGILBARCOKiros.DameTotales8(xNPos : integer; var rTotalizadorLitros1, rTotalizadorPesos1, rTotalizadorLitros2, rTotalizadorPesos2, rTotalizadorLitros3, rTotalizadorPesos3 : real) : boolean;
var xNMang : integer;
    bOk : boolean;
begin
  with DMCONS do begin
   rTotalizadorLitros1:= 0;
   rTotalizadorPesos1:= 0;
   rTotalizadorLitros2:= 0;
   rTotalizadorPesos2:= 0;
   rTotalizadorLitros3:= 0;
   rTotalizadorPesos3:= 0;
   bOk:= ( ( TransmiteComando($50,xNPos,'') ) and ( length(sRespuesta)>=46 ) );
   if ( bOk ) then begin
      delete(sRespuesta,1,1);
      while ( length(sRespuesta)>30 ) do begin
         xNMang:= ( LoNibbleChar(sRespuesta[2]) ) + 1;
         case ( xNMang ) of
            1 : begin
                   rTotalizadorLitros1:= DataControlWordValue(#$F9,12)/GtwDivTotLts;
                   rTotalizadorPesos1:= DataControlWordValue(#$FA,12)/GtwDivTotImporte;
                end;
            2 : begin
                   rTotalizadorLitros2:= DataControlWordValue(#$F9,12)/GtwDivTotLts;
                   rTotalizadorPesos2:= DataControlWordValue(#$FA,12)/GtwDivTotImporte;
                end;
            3 : begin
                   rTotalizadorLitros3:= DataControlWordValue(#$F9,12)/GtwDivTotLts;
                   rTotalizadorPesos3:= DataControlWordValue(#$FA,12)/GtwDivTotImporte;
                end;
         end;
         delete(sRespuesta,1,42);
      end;
   end;
   result:= bOk;
  end;
end;

//------------------------------------------------------------------------------

function TFDISGILBARCOKiros.DameVentaProceso6(xNPos : integer; var rPesos : real) : boolean;
var bOk : boolean;
begin
   bOk:= ( ( TransmiteComando($60,xNPos,'') ) and ( length(sRespuesta)>=6 ) );
   if ( bOk ) then rPesos:= BcdToInt(copy(sRespuesta,1,6))/TPosCarga[PosCiclo].DivImporte;
   result:= bOk;
end;

function TFDISGILBARCOKiros.DameVentaProceso8(xNPos : integer; var rPesos : real) : boolean;
var bOk : boolean;
begin
   bOk:= ( ( TransmiteComando($60,xNPos,'') ) and ( length(sRespuesta)>=8 ) );
   if ( bOk ) then rPesos:= BcdToInt(copy(sRespuesta,1,8))/TPosCarga[PosCiclo].DivImporte;
   result:= bOk;
end;

//------------------------------------------------------------------------------

function TFDISGILBARCOKiros.DameLecturas6(xNPos : integer; var xNMang : integer; var rLitros, rPrecio, rPesos : real) : boolean;
var bOk : boolean;
begin
  with DMCONS do begin
   bOk:= ( ( TransmiteComando($40,xNPos,'') ) and ( length(sRespuesta)>=33 ) );
   if ( bOk ) then begin
      xNMang:= DataControlWordValue(#$F6,1) + 1;
      rPrecio:= DataControlWordValue(#$F7,4);
      rLitros:= DataControlWordValue(#$F9,6);
      rPesos:= DataControlWordValue(#$FA,6);
      rPrecio:= rPrecio/GtwDivPrecio;
      rLitros:= rLitros/TPosCarga[PosCiclo].DivLitros;
      rPesos:= rPesos/TPosCarga[PosCiclo].DivImporte;
   end;
   result:= bOk;
  end;
end;

function TFDISGILBARCOKiros.DameLecturas8(xNPos : integer; var xNMang : integer; var rLitros, rPrecio, rPesos : real) : boolean;
var bOk : boolean;
begin
  with DMCONS do begin
   bOk:= ( ( TransmiteComando($40,xNPos,'') ) and ( length(sRespuesta)>=39 ) );
   if ( bOk ) then begin
      xNMang:= DataControlWordValue(#$F6,1) + 1;
      rPrecio:= DataControlWordValue(#$F7,6);
      rLitros:= DataControlWordValue(#$F9,8);
      rPesos:= DataControlWordValue(#$FA,8);
      rPrecio:= rPrecio/GtwDivPrecio;
      rLitros:= rLitros/TPosCarga[PosCiclo].DivLitros;
      rPesos:= rPesos/TPosCarga[PosCiclo].DivImporte;
   end;
   result:= bOk;
  end;
end;

//------------------------------------------------------------------------------


function TFDISGILBARCOKiros.DameEstatus(PosCarga: integer) : integer;
var iStatus : integer;
begin
   iStatus:= 0;
   if ( ( TransmiteComando($00,PosCarga,'') ) and ( length(sRespuesta)>=1 ) ) then case ( HiNibbleChar(sRespuesta[1]) ) of
       $6,$E  : iStatus:= 1;
       $9,$1  : iStatus:= 2;
     $A,$B,$3 : iStatus:= 3;
        $0    : iStatus:= 0;
        $7    : iStatus:= 5;
       $C,$F  : iStatus:= 8;
        $8    : iStatus:= 9;
   end;
   result:= iStatus;
end;



//-----------------

procedure TFDISGILBARCOKiros.IniciaBaseDeDatos;
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
      CargaPreciosFH(Now,true); // guarda precio actual como físico
      DBGrid3.Refresh;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISGILBARCOKiros.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
begin
  with DMCONS do begin
    swcierrabd:=false;
    swcierrabd2:=false;
    ListView1.Items.Clear;
    EstatusAntx:='';
    EstatusActx:='';
    MaxPosCarga:=0;
    SwCmndPend:=false;
    IdCmndPend:=0;
    Swflu:=false;
    for i:=1 to 16 do with TPrecios[i] do begin
      for j:=1 to 4 do begin
        SwCambPrec[j]:=false;
        NuevoPrec[j]:=0;
      end;
    end;
    for i:=1 to 32 do with TPosCarga[i] do begin
      DigitosGilbarco:=6;
      StFluPos:=0;
      DivImporte:=DMCONS.GtwDivImporte;
      DivLitros:=DMCONS.GtwDivLitros;
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      SwPreset:=false;
      StPresetPos:=0;
      importe:=0;
      volumen:=0;
      precio:=0;
      tipopago:=0;
      stkairosfrec:=1;
      Esperafinventa:=0;
      SwCargando:=false;
      SwEstatus0:=false;
      SwAutoriza:=false;
      for j:=1 to 4 do begin
        TotalLitros[j]:=0;
      end;
      SwDeshabil:=false;
      SwTotales:=true;
      SwLeeVenta:=true;
      SwFinVenta:=false;
      SwNivelPrecio:=true;
      SwCambiaPrecio:=false;
      SwRepitePos:=false;
      Fallosestat:=0;
      HoraNivelPrecio:=Now;
    end;
    // CARGA DEFAULTS PAM
    TL_Bomb.Active:=true;
    while not TL_Bomb.Eof do begin
      TL_Bomb.Edit;
      if not (TL_BombCon_Posicion.AsInteger in [1,2,3]) then
        TL_BombCon_Posicion.AsInteger:=TL_BombCombustible.AsInteger;
      if (TL_BombCon_DigitoAjuste.IsNull)or (not (TL_BombCon_DigitoAjuste.AsInteger in [0,1,22])) then
        TL_BombCon_DigitoAjuste.AsInteger:=0;
      TL_Bomb.Post;
      TL_Bomb.Next;
    end;
    // FIN
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
          Canal:=Q_BombIbTeam_NoDisp.asinteger;
          SwPrec:=false;
          existe:=false;
          ModoOpera:=Q_BombIbModoOperacion.AsString;
          if (Q_BombIbDecimalesGilbarco.AsInteger=100)or(Q_BombIbDecimalesGilbarco.AsInteger=1000) then begin
            DivImporte:=Q_BombIbDecimalesGilbarco.AsInteger;
            DivLitros:=Q_BombIbDecimalesGilbarco.AsInteger;
          end;
          if Q_BombIbDigitosGilbarco.AsInteger=8 then
            DigitosGilbarco:=8;
          for i:=1 to NoComb do
            if TComb[i]=xcomb then
              existe:=true;
          if not existe then begin
            inc(NoComb);
            TComb[NoComb]:=xcomb;
            if Q_BombIbCon_Posicion.AsInteger>0 then begin
              TPosx[NoComb]:=Q_BombIbCon_Posicion.AsInteger;
            end
            else if NoComb<=2 then begin
              TPosx[NoComb]:=NoComb;
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

procedure TFDISGILBARCOKiros.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      StaticText6.Caption:='';
      NumPaso:=1;
      SwPasoBien:=true;
      PosCiclo:=1;
      StaticText5.Caption:=IntToStr(NumPaso);
      IniciaEstacion;
      ListBox1.SetFocus;
      DMCONS.T_ConfIb.Active:=true;
    finally
      Timer1.Enabled:=true;
    end;
  end;
end;


procedure TFDISGILBARCOKiros.LimpiaConsola;
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

procedure TFDISGILBARCOKiros.DespliegaPosCarga(xpos:integer);
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
    with TPosCarga[xpos],FDISGILBARCOKiros do begin
      xcomb:=CombustibleEnPosicion(xpos,PosActual);
      if xcomb in [1..maxcomb] then
        xnombre:=DMCONS.TabComb[xcomb].Nombre;
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
            5,9:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClYellow;
            2:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClLime;
            3,4:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClBlue;
            else TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClWhite;
          end;
        end
        else begin
          TPanel(FindComponent('panelPC'+IntToStr(ii))).Caption:='Deshabilidado';
          TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClWhite;
        end;
        (*
        if (not swforza)and(TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Count>0) then
          exit;
          *)
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Clear;
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('$ '+FormatFloat('###,##0.00',importe)+' Pesos');
        if not SwCargando then begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.00',precio)+' $/Lts');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(xnombre);
        end
        else begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
        end;
        for xp:=1 to NoComb do begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                   ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3)
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
      if (SwFinVenta)and(NumPaso>2) then with DMCONS do begin
        SwFinVenta:=false;
        if (importe>0.01)and(PosActual in [1..4]) then begin
          SwTotales:=true;
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
              xcomb:=CombustibleEnPosicion(i,PosActual);
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
              T_MoviIbBoucher.Asstring:='';
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
              SwPreset:=false;
              if (lcLicTemporal)and(date>lcLicVence) then begin
                MensajeErr('Licencia vencida. Llame a su distribuidor');
                swcerrar:=true; FDISGILBARCOKiros.Close;
              end;
            finally
              T_MoviIb.Active:=false;
            end;
          except
          end;
        end;
      end;
    end;
  except
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



procedure TFDISGILBARCOKiros.ListBox1Click(Sender: TObject);
var xp:integer;
begin
  LimpiaConsola;
  for xp:=1 to MaxPosCarga do
    DespliegaPosCarga(xp);
end;

procedure TFDISGILBARCOKiros.Restaurar1Click(Sender: TObject);
begin
  FDISGILBARCOKiros.Visible:=true;
end;

procedure TFDISGILBARCOKiros.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=SwCerrar;
end;

procedure TFDISGILBARCOKiros.FormCreate(Sender: TObject);
begin
  SwCerrar:=false;
  SwInicio:=true;
  SwBring:=true;
  SwEspera:=false;
  ListaCmnd:=TStringList.Create;
  ContadorAlarma:=0;
end;

procedure TFDISGILBARCOKiros.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISGILBARCOKiros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=false;
  CierraPuerto;
  Application.Terminate;
end;


procedure TFDISGILBARCOKiros.registro(valor:integer;variable:string);
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

procedure TFDISGILBARCOKiros.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISGILBARCOKiros.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISGILBARCOKiros.lee_registro;
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

  
procedure TFDISGILBARCOKiros.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
  PuertoSerial.TraceName:='c:\IgasTrace'+FiltraStrNum(FechaHoraToStr(Now))+'.txt';
  PuertoSerial.Tracing:= tlDump;
  PuertoSerial.Tracing:= tlOn;
end;

function TFDISGILBARCOKiros.CombustibleEnPosicion(xpos,xpc:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    for i:=1 to NoComb do begin
      if TPosx[i]=xpc then
        result:=TComb[i];
    end;
  end;
end;

function TFDISGILBARCOKiros.PosicionDeCombustible(xpos,xcomb:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    if xcomb>0 then begin
      for i:=1 to NoComb do begin
        if TComb[i]=xcomb then
          result:=TPosx[i];
      end;
    end;
  end;
end;



procedure TFDISGILBARCOKiros.Button3Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISGILBARCOKiros.AvanzaPosCiclo;
begin
  if TPosCarga[PosCiclo].SwRepitePos then begin
    TPosCarga[PosCiclo].SwRepitePos:=false;
    exit;
  end;
  inc(PosCiclo);
  if PosCiclo>MaxPosCarga then begin
    EstatusDispensarios;
    PosCiclo:=1;
  end;
end;

procedure TFDISGILBARCOKiros.EstatusDispensarios;
var ss,lin,xestado,xmodo:string;
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
          2:xestado:=xestado+'2'; // Cargando (In Use)
          3,4:if not swcargando then
              xestado:=xestado+'3' // Fin de Carga (Used)
            else
              xestado:=xestado+'2';
          5:xestado:=xestado+'5'; // Llamando (Calling) Pistola Levantada
          9:xestado:=xestado+'9'; // Autorizado
          8:xestado:=xestado+'8'; // Detenido (Stoped)
          else xestado:=xestado+'0';
        end;
      end
      else xestado:=xestado+'7'; // Deshabilitado
      xcomb:=CombustibleEnPosicion(xpos,PosActual);
      ss:=inttoclavenum(xpos,2)+'/'+inttostr(xcomb);
      ss:=ss+'/'+FormatFloat('###0.##',volumen);
      ss:=ss+'/'+FormatFloat('#0.##',precio);
      ss:=ss+'/'+FormatFloat('####0.##',importe);
      lin:=lin+'#'+ss;
      //end;
    end;
    EstatusActx:=xestado;
    if lin='' then
      lin:=xestado+'#'
    else
      lin:=xestado+lin;
    lin:=lin+'&'+xmodo;
    DMCONS.ActualizaDispensarios('D'+lin);
      if EstatusActx<>EstatusAntx then begin
        DMCONS.AgregaLog('Estatus Disp: '+EstatusActx);
        EstatusAntx:=EstatusActx;
      end;
  end;
end;


procedure TFDISGILBARCOKiros.ProcesaPrecios;
var xcomb,xpos,xp:integer;
begin
    // Checa por cambios de precios
    if ((Now-DMCONS.FechaHoraPrecio)>12*tmSegundo) then begin
      DMCONS.FechaHoraPrecio:=Now;
      with DMCONS do if AplicarPrecios then begin
        for xcomb:=1 to MaxComb do if TabComb[xcomb].Activo then begin
          try
            Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=TabComb[xcomb].Folio;
            Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=xcomb;
            Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
            Q_AplicaPrecioF.ExecSQL;
          except
          end;
          for xpos:=1 to MaxPosCarga do with TPrecios[xpos] do
            for xp:=1 to TPosCarga[xpos].NoComb do if xcomb=CombustibleEnPosicion(xpos,xp) then begin
              TPrecios[xpos].SwCambPrec[xp]:=true;
              TPrecios[xpos].NuevoPrec[xp]:=TabComb[xcomb].precio;
            end;
        end;
        CargaPreciosFH(Now,true);
        Q_CombIb.Active:=false;
        Q_CombIb.Active:=true;
        DBGrid3.Refresh;
      end;
    end;


end;

procedure TFDISGILBARCOKiros.ProcesaComandos;
var ss,rsp,ss2            :string;
    xcmnd,xpos,xcomb,xcanal,
    xp,xfolio,i,xc                :integer;
    ximporte,xlitros  :real;

begin
  try
    // Checa Comandos
    with DMCONS do begin
      //swcmndpreset:=false;
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
          ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,1,' ');
          DMCONS.AgregaLog(TabCmnd[xcmnd].Comando);
          // CMND: FLU ON
          if ss='FLUSTD' then begin
            rsp:='OK';
            // Carga valor x combustible
            for i:=1 to 3 do
              tagx[i]:=0;
            Q_CombIb.Active:=false;
            Q_CombIb.Active:=true;
            Q_CombIb.First;
            while not Q_CombIb.Eof do begin
              if Q_CombIbClave.AsInteger in [1..MaxComb] then begin
                xcomb:=Q_CombIbClave.AsInteger;
                if xcomb in [1..3] then begin
                  ss:=Q_CombIbTag3.AsString;
                  if length(ss)=1 then begin
                    xc:=ord(ss[1])-65;
                    if xc in [0..9] then
                      tagx[xcomb]:=xc;
                  end;
                end;
              end;
              Q_CombIb.Next;
            end;
            // Fin

            // Carga valores pcar
            Q_Pcar.Active:=false;
            Q_Pcar.Active:=true;
            while not Q_Pcar.Eof do begin
              xpos:=Q_PcarPosCarga.AsInteger;
              if (xpos<=DMCONS.MaximoDePosiciones) then begin
                TAdicf[xpos,1]:=trunc(Q_PcarSlowFlow.AsFloat*10+0.5);
                TAdicf[xpos,2]:=trunc(Q_PcarSlowFlow2.AsFloat*10+0.5);
                TAdicf[xpos,3]:=trunc(Q_PcarSlowFlow3.AsFloat*10+0.5);
              end;
              Q_Pcar.Next;
            end;
            Q_Pcar.Active:=false;
            // fin

            xpos:=1;xcanal:=-1;
            repeat
              if xcanal<>TPosCarga[xPos].Canal then begin
                TPosCarga[xPos].StFluPos:=1;
                xcanal:=TPosCarga[xPos].Canal;
              end;
              inc(xpos);
            until (xpos>MaxPosCarga);
          end
          // CMND: FLU OFF
          else if ss='FLUMIN' then begin
            rsp:='OK';
            xpos:=1;xcanal:=-1;
            repeat
              if xcanal<>TPosCarga[xPos].Canal then begin
                TPosCarga[xPos].StFluPos:=11;
                xcanal:=TPosCarga[xPos].Canal;
              end;
              inc(xpos);
            until (xpos>MaxPosCarga);
            SwCerrar:=true;
          end
          // CMND: PARO TOTAL
          else if ss='PAROTOTAL' then begin
            rsp:='OK';
          end
          // CMND: CERRAR CONSOLA
          else if ss='CERRAR' then begin
            rsp:='OK';
            xpos:=1;xcanal:=-1;
            repeat
              if xcanal<>TPosCarga[xPos].Canal then begin
                TPosCarga[xPos].StFluPos:=11;
                xcanal:=TPosCarga[xPos].Canal;
              end;
              inc(xpos);
            until (xpos>MaxPosCarga);
            SwCerrar:=true;
          end
          // GLOG: GUARDA LOG
          else if ss='GLOG' then begin
            rsp:='OK';
            Button1.Click;
            Button3.Click;
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
          (*
            if not swcmndpreset then
              swcmndpreset:=true
            else
              exit;
              *)
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then begin
              if (TPosCarga[xpos].estatus in [1,5]) then begin
                try
                  xImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                  xLitros:=0;
                  if TPosCarga[xPos].DigitosGilbarco=8 then
                    rsp:=ValidaCifra(xImporte,6,2)
                  else
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
                      if TPosCarga[xPos].DigitosGilbarco=6 then begin
                        if EnviaPresetBomba6(xpos,xp,1,ximporte,0) then
                        begin
                          TPosCarga[xPos].swautoriza:=true;
                          TPosCarga[xPos].StPresetPos:=1;
                          SwCmndPend:=true;
                          PosCmndPend:=xpos;
                        end
                        else rsp:='No se pudo prefijar';
                      end
                      else begin
                        if EnviaPresetBomba8(xpos,xp,1,ximporte,0) then
                        begin
                          TPosCarga[xPos].swautoriza:=true;
                          TPosCarga[xPos].StPresetPos:=1;
                          SwCmndPend:=true;
                          PosCmndPend:=xpos;
                        end
                        else rsp:='No se pudo prefijar';
                      end;
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
            (*
            if not swcmndpreset then
              swcmndpreset:=true
            else
              exit;
              *)
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then begin
              if (TPosCarga[xpos].estatus in [1,5]) then begin
                try
                  xLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                  xImporte:=0;
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
                      if TPosCarga[xPos].DigitosGilbarco=6 then begin
                        if EnviaPresetBomba6(xpos,xp,1,0,xlitros) then begin
                          TPosCarga[xPos].swautoriza:=true;
                          TPosCarga[xPos].StPresetPos:=1;
                          SwCmndPend:=true;
                          PosCmndPend:=xpos;
                        end
                        else rsp:='No se pudo prefijar';
                      end
                      else begin
                        if EnviaPresetBomba8(xpos,xp,1,0,xlitros) then begin
                          TPosCarga[xPos].swautoriza:=true;
                          TPosCarga[xPos].StPresetPos:=1;
                          SwCmndPend:=true;
                          PosCmndPend:=xpos;
                        end
                        else rsp:='No se pudo prefijar';
                      end;
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
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then begin
              if (TPosCarga[xpos].estatus in [2,9]) then begin
                if DetenerDespacho(xpos) then begin
                end;
              end;
            end;
          end
          else if (ss='REANUDAR') then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if xpos in [1..MaxPosCarga] then begin
              if (TPosCarga[xpos].estatus in [8]) then begin
                if ReanudaDespacho(xpos) then begin
                end;
              end;
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
          if not SwCmndPend then begin
            TabCmnd[xcmnd].SwNuevo:=false;
            if SwAplicaCmnd then begin
              if rsp='' then
                rsp:='OK';
              TabCmnd[xcmnd].SwResp:=true;
              TabCmnd[xcmnd].Respuesta:=rsp;
              DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
            end;
          end
          else begin
            IdCmndPend:=xcmnd;
            exit;
          end;
          (*
          if SwCerrar then
            FDISGILBARCOKiros.Close;
            *)
        end;
      end;
    end;
  except
  end;
end;

procedure TFDISGILBARCOKiros.Timer1Timer(Sender: TObject);
label L01;
var xvolumen,n1,n2,n3 :real;
    xcomb,xpos,xp,xsuma,
    xgrade,i,xcmnd    :integer;
    xtotallitros      :array[1..4] of real;
    swprec            :boolean;
    rsp               :string;
begin
  if SwEsperaComando then exit;
  //
  if swbring then begin
    StaticText17.Visible:=false;
    FDISGILBARCOKiros.BringToFront;
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
      StaticText5.Caption:='Bomba: '+inttostr(PosCiclo);
      StaticText6.Caption:='Paso: '+inttostr(NumPaso);
      try
        case NumPaso of
          0:if (estatus=1)and(SwNivelPrecio) then begin     // NIVEL DE PRECIOS
              if (Now>=HoraNivelPrecio) then begin
                DMCONS.AgregaLog('E> Pon Nivel Precio: '+inttoclavenum(PosCiclo,2));
                if PonNivelPrecio(PosCiclo,1) then 
                  swnivelprecio:=false;
              end;
            end;
          1:begin                           // ESTATUS
              try
                EstatusAnt:=Estatus;
                Estatus:=DameEstatus(PosCiclo);    // Aqui bota cuando no hay posicion activa
                EstatusDispensarios;
                if (Estatusant=0)and(estatus=1) then begin
                  SwNivelPrecio:=true;
                  HoraNivelPrecio:=Now+5*TMSegundo;
                  Swleeventa:=true;
                  SwTotales:=true;
                end;
                if (estatus=0)and(not swestatus0) then begin
                  Estatus:=EstatusAnt;
                  swestatus0:=true;
                end
                else swestatus0:=false;
                ContadorAlarma:=0;
                if (EstatusAnt in [3,4])and(Estatus=1) then begin
                  swcargando:=false;
                  if EsperaFinVenta=1 then
                    Estatus:=4
                  else
                    SwTotales:=true;
                end;
                if SwAutoriza then begin
                  SwAutoriza:=false;
                  SwCmndPend:=false;
                  rsp:='OK';
                  if estatus>0 then begin
                    if Autoriza(PosCiclo) then begin
                      TPosCarga[PosCiclo].SwPreset:=true;
                      sleep(500);
                    end
                    else rsp:='No se puede autorizar, vuelva a intentar';
                  end
                  else begin
                    rsp:='No se puede autorizar, vuelva a intentar';
                  end;
                  xcmnd:=IdCmndPend;
                  DMCONS.TabCmnd[xcmnd].SwNuevo:=false;
                  DMCONS.TabCmnd[xcmnd].SwResp:=true;
                  DMCONS.TabCmnd[xcmnd].Respuesta:=rsp;
                  DMCONS.AgregaLog(LlenaStr(DMCONS.TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+rsp);
                  DMCONS.AgregaLogCmnd(LlenaStr(DMCONS.TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+rsp);

                end;

              // FLU
                      if swcerrar then begin
                        xsuma:=0;
                        for xpos:=1 to MaxPosCarga do
                          xsuma:=xsuma+TPosCarga[xpos].StFluPos;
                        if (xsuma=0) then begin
                          Button1.Click;
                          FDISGILBARCOKiros.Close;
                        end;
                      end;
                      if (Estatus=1)and(StFluPos=1)and(swflu) then begin   // Sube
                        MandaFlujoPos(PosCiclo,TAdicf[PosCiclo,1]);
                        StFluPos:=2;
                      end
                      else if (StFluPos in [2..9]) then begin
                        if Estatus=9 then begin
                          if DetenerDespacho(PosCiclo) then begin
                          end;
                        end
                        else inc(StFluPos);
                        if StFluPos>5 then
                          StFluPos:=0;
                      end;
                      if (Estatus=1)and(StFluPos=11) then begin  
                        MandaFlujoPos(PosCiclo,0);
                        StFluPos:=12;
                      end
                      else if (StFluPos in [12..19]) then begin
                        if Estatus=9 then begin
                          if DetenerDespacho(PosCiclo) then begin
                          end;
                        end
                        else inc(StFluPos);
                        if StFluPos>15 then
                          StFluPos:=0;
                      end;
                // FIN FLU
              except
                AvanzaPosCiclo;
                NumPaso:=1;
                exit;
              end;
            end;
          2:if (swleeventa)and(estatus>0) then begin       // LEE VENTA TERMINADA
              if TPosCarga[PosCiclo].DigitosGilbarco=6 then begin
                DMCONS.AgregaLog('E> LEE VENTA(6): '+inttoclavenum(PosCiclo,2));
                if DameLecturas6(PosCiclo,PosActual,
                                             Volumen,Precio,Importe) then
                begin
                  xvolumen:=ajustafloat(dividefloat(importe,precio),3);
                  if abs(volumen-xvolumen)>0.5 then
                    volumen:=xvolumen;
                  DMCONS.AgregaLog('R> '+FormatFloat('###,##0.00',Volumen)+' / '+FormatFloat('###,##0.00',precio)+' / '+FormatFloat('###,##0.00',importe));
                  swleeventa:=false;
                end;
              end
              else begin
                DMCONS.AgregaLog('E> LEE VENTA(8): '+inttoclavenum(PosCiclo,2));
                if DameLecturas8(PosCiclo,PosActual,
                                             Volumen,Precio,Importe) then
                begin
                  xvolumen:=ajustafloat(dividefloat(importe,precio),3);
                  if abs(volumen-xvolumen)>0.5 then
                    volumen:=xvolumen;
                  DMCONS.AgregaLog('R> '+FormatFloat('###,##0.00',Volumen)+' / '+FormatFloat('###,##0.00',precio)+' / '+FormatFloat('###,##0.00',importe));
                  swleeventa:=false;
                end;
              end;
            end;
          3:if (swtotales)and(estatus>0) then begin        // LEE TOTALES
              if DigitosGilbarco=6 then begin
                DMCONS.AgregaLog('E> Lee Totales(6): '+inttoclavenum(PosCiclo,2));
                if DameTotales6(PosCiclo,
                                        xTotalLitros[1],n1,
                                        xTotalLitros[2],n2,
                                        xTotalLitros[3],n3)then
                begin
                  for i:=1 to nocomb do begin
                    xcomb:=Tcomb[i];
                    xp:=PosicionDeCombustible(PosCiclo,xcomb);
                    if xp>0 then begin
                      TotalLitros[xp]:=xTotalLitros[i];
                    end;
                  end;
                  DMCONS.AgregaLog('R> '+FormatFloat('###,###,##0.00',TotalLitros[1])+' / '+FormatFloat('###,###,##0.00',TotalLitros[2])+' / '+FormatFloat('###,###,##0.00',TotalLitros[3]));
                  DespliegaPosCarga(PosCiclo);
                  SwTotales:=false;
                  if not DMCONS.DBGASCON.Connected then
                    DMCONS.DBGASCON.Connected:=true;
                  DMCONS.RegistraTotales_BD4(PosCiclo,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                  if swcierrabd2 then begin
                    swcierrabd:=true;
                    swcierrabd2:=false;
                  end;
                end;
              end
              else begin
                DMCONS.AgregaLog('E> Lee Totales(8): '+inttoclavenum(PosCiclo,2));
                if DameTotales8(PosCiclo,
                                        xTotalLitros[1],n1,
                                        xTotalLitros[2],n2,
                                        xTotalLitros[3],n3)then
                begin
                  for i:=1 to nocomb do begin
                    xcomb:=Tcomb[i];
                    xp:=PosicionDeCombustible(PosCiclo,xcomb);
                    if xp>0 then begin
                      TotalLitros[xp]:=xTotalLitros[i];
                    end;
                  end;
                  DMCONS.AgregaLog('R> '+FormatFloat('###,###,##0.00',TotalLitros[1])+' / '+FormatFloat('###,###,##0.00',TotalLitros[2])+' / '+FormatFloat('###,###,##0.00',TotalLitros[3]));
                  DespliegaPosCarga(PosCiclo);
                  SwTotales:=false;
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
          4:if (estatus=5)and(ModoOpera='Normal') then begin // AUTORIZA TANQUE LLENO
              DMCONS.AgregaLog('E> Autoriza: '+inttoclavenum(PosCiclo,2));
              if Autoriza(PosCiclo) then begin
                sleep(500);
              end;
            end;
          5:if estatus=2 then begin                 // LEE VENTA PROCESO
                if TPosCarga[PosCiclo].DigitosGilbarco=6 then begin
                  DMCONS.AgregaLog('E> Lee Venta Proc(6): '+inttoclavenum(PosCiclo,2));
                  if DameVentaProceso6(PosCiclo,Importe) then begin
                    volumen:=0;
                    precio:=0;
                    DMCONS.AgregaLog('R> '+FormatFloat('###,##0.00',importe));
                  end;
                end
                else begin
                  DMCONS.AgregaLog('E> Lee Venta Proc(8): '+inttoclavenum(PosCiclo,2));
                  if DameVentaProceso8(PosCiclo,Importe) then begin
                    volumen:=0;
                    precio:=0;
                    DMCONS.AgregaLog('R> '+FormatFloat('###,##0.00',importe));
                  end;
                end;
            end;
          6:begin
              ProcesaComandos;
              SwFlu:=true;
            end;
          7:begin          // CAMBIA PRECIO
              xp:=1;SwPrec:=false;
              while (xp<=NoComb)and(not swprec) do begin
                if (estatus=1)and(TPrecios[PosCiclo].SwCambPrec[xp]) then
                  SwPrec:=true
                else inc(xp);
              end;
              if swprec then begin
                if TPosCarga[PosCiclo].DigitosGilbarco=6 then begin
                  DMCONS.AgregaLog('E> Cambia Precio(6): '+inttoclavenum(PosCiclo,2)+' - '+inttoclavenum(xp,2));
                  if CambiaPrecio6(PosCiclo,xp,1,TPrecios[PosCiclo].NuevoPrec[xp]) then begin
                    TPrecios[PosCiclo].SwCambPrec[xp]:=false;
                  end;
                end
                else begin
                  DMCONS.AgregaLog('E> Cambia Precio(8): '+inttoclavenum(PosCiclo,2)+' - '+inttoclavenum(xp,2));
                  if CambiaPrecio8(PosCiclo,xp,1,TPrecios[PosCiclo].NuevoPrec[xp]) then begin
                    TPrecios[PosCiclo].SwCambPrec[xp]:=false;
                  end;
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
              if estatusant<>3 then
                swfinventa:=true;
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
          else if (not SwTotales) then
            NumPaso:=4;
        end;
        if (NumPaso=4)and(estatus<>5) then
          NumPaso:=5;
        if (NumPaso=5) then begin
          if (estatus=2) then begin
            if StKairosFrec>=DMCONS.GtwKairosFrec then
              StKairosFrec:=1
            else begin
              inc(StKairosFrec);
              NumPaso:=6;
            end;
          end
          else NumPaso:=6;
        end;

        if (NumPaso=7) then begin
          if SwCmndPend then begin
            xpos:=PosCmndPend;
            if TPosCarga[xpos].StPresetPos=1 then begin
              PosCiclo:=xpos;
              NumPaso:=1;
              TPosCarga[xpos].StPresetPos:=2;
              exit;
            end
            else if TPosCarga[xpos].StPresetPos=2 then begin
              SwCmndPend:=false;
              PosCiclo:=xpos;
              NumPaso:=1;
              TPosCarga[xpos].StPresetPos:=0;
              exit;
            end;
          end;
        end;
        
        if (NumPaso=7) then begin
          swprec:=false;
          for xpos:=1 to MaxPosCarga do
            for xp:=1 to TPosCarga[xpos].NoComb do
              if TPrecios[PosCiclo].SwCambPrec[xp] then
                swprec:=true;
          if not swprec then
            NumPaso:=8;
        end;
        //
        if NumPaso>=8 then begin
          AvanzaPosCiclo;
          NumPaso:=1;
          if  TPosCarga[PosCiclo].SwNivelPrecio then
            NumPaso:=0;
        end;
      end;
    end
    else posciclo:=1;

    ProcesaPrecios;

    // Minimiza pantalla al inicio
    if NotificationIcon1.Tag=0 then begin
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      FDISGILBARCOKiros.Visible:=false;
      NotificationIcon1.Show;
    end;

  end;
end;

procedure TFDISGILBARCOKiros.MandaFlujoPos(xpos,xvalor:integer);
var ximpo:real;
begin
  DMCONS.EjecutaComando('OCC '+inttoclavenum(xpos,2)+' '+Valorx+inttostr(xvalor));
end;


end.

