unit UDISGILBARCO;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  dxGDIPlusClasses,ShellApi;


const
      MCxP=4;
      ValorX='9573';
      ValorOn='93715';
      ValorOff='92476';

type
  TFDISGILBARCO = class(TForm)
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
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    Button1: TButton;
    PageControl1: TPageControl;
    StaticText9: TStaticText;
    Button3: TButton;
    AbrirUbicacin1: TMenuItem;
    PuertoSerial: TApdComPort;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    Label5: TLabel;
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
    procedure Button2Click(Sender: TObject);
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
    procedure DespliegaMemo4(lin:string);
    function CombustibleEnPosicion(xpos,xpc:integer):integer;
    function PosicionDeCombustible(xpos,xcomb:integer):integer;
    procedure AvanzaPosCiclo;
    procedure ProcesaComandos;
    function EnviaPresetFlu(xpos:integer;xsube:boolean):boolean;
    procedure EstatusDispensarios;
    function StrToHexSep(ss:string):string;
    function HexSepToStr(ss:string):string;
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
       PosActual    :integer; // Posicion del combustible en proceso: 1..NoComb
       NoComb       :integer; // Cuantos combustibles hay en la posicion
       TComb        :array[1..MCxP] of integer; // Claves de los combustibles
       TPosx        :array[1..MCxP] of integer;
       TMang        :array[1..MCxP] of integer;
       TotalLitros  :array[1..MCxP] of real;

       TCambioPrecN1:array[1..MCxP] of boolean;
       TCambioPrecN2:array[1..MCxP] of boolean;
       TNuevoPrec   :array[1..MCxP] of real;

       MontoPreset    :string;
       ImportePreset  :real;

       swprec,
       swcargando     :boolean;
       ModoOpera      :string[8];
       TipoPago       :integer;
       EsperaFinVenta :integer;

       SwFinVenta,
       SwLeeVenta,
       SwTotales,
       SwNivelPrecio,
       SwCambiaPrecio,
       SwPreset       :boolean;
       HoraNivelPrecio:TDateTime;

       StFluPos,
       FallosEstat    :integer;
     end;


var
  FDISGILBARCO: TFDISGILBARCO;
  TPosCarga   :array[1..32] of tiposcarga;
  MaxPosCarga :integer;
  Tagx        :array[1..3] of integer;
  StFlu,PosFlu:integer;
  Swflu       :boolean;
  SwCerrar    :boolean;
  EstatusAnt,
  EstatusAct  :string;
  // CONTROL TRAFICO COMANDOS
  ListaCmnd     :TStrings;
  TAdicf        :array[1..32,1..3] of integer;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}


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



procedure TFDISGILBARCO.PuertoSerialTriggerAvail(CP: TObject; Count: Word);
var i : integer;
begin
   for i:=1 to Count do sRespuesta:= sRespuesta + PuertoSerial.GetChar;
   i:= length(sRespuesta);
   if ( ( i>=iBytesEsperados ) or ( bEndOfText )  or ( bLineFeed ) ) then
      bListo:= true
   else
      newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout));
end;

procedure TFDISGILBARCO.PuertoSerialTriggerData(CP: TObject;
  TriggerHandle: Word);
begin
   if ( TriggerHandle=wTriggerEOT ) then
      bEndOfText:= true
   else
      bLineFeed:= true;
end;

function TFDISGilbarco.DataControlWordValue(chDataControlWord : char; iLongitud : integer) : longint;
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

function TFDISGilbarco.TransmiteComando(iComando, xNPos: integer; sDataBlock: string) : boolean;
var iMaxIntentos, iNoIntento, i , xpos: integer;
    chComando : char;
    sw2,
    bOk : boolean;
begin
   xpos:=xNPos;
   sw2:=false;
   if ( iComando in [$10,$30,$F0] ) then begin
      bOk:= true;
      iMaxIntentos:= 0;
   end
   else begin
      bOk:= false;
      if ( iComando in [$00,$20] ) then begin
         iMaxIntentos:= 2;
         iBytesEsperados:= 1;
         if ( iComando in [$20] ) then begin
           sw2:=true;
         end;
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
      PuertoSerial.PutChar(chComando);
      repeat
         PuertoSerial.ProcessCommunications;
      until ( PuertoSerial.OutBuffUsed=0 );
      if ( not bOk ) then begin
         if sw2 then
           newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout))
         else
           newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout));
         repeat
            Application.ProcessMessages;
         until ( ( bListo ) or ( timerexpired(etTimeOut) ) );
         if ( bListo ) then begin
            ls:=length(sRespuesta);
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
            sleep(10);
            bListo:= false;
            bEndOfText:= false;
            bLineFeed:= false;
            sRespuesta:= '';
            PuertoSerial.FlushInBuffer;
            PuertoSerial.FlushOutBuffer;
            for i:= 1 to length ( sDataBlock ) do begin
               PuertoSerial.PutChar(sDataBlock[i]);
               repeat
                  PuertoSerial.ProcessCommunications;
               until ( PuertoSerial.OutBuffUsed=0 );
            end;
            sleep(dmcons.GtwTiempoCmnd);
            chComando:= char($00 + xNPos);
            PuertoSerial.PutChar(chComando);
            repeat
               PuertoSerial.ProcessCommunications;
            until ( PuertoSerial.OutBuffUsed=0 );
            newtimer(etTimeOut,MSecs2Ticks(dmcons.GtwTimeout));
            repeat
               Application.ProcessMessages;
            until ( ( bListo ) or ( timerexpired(etTimeOut) ) );        // FALLA
            bOk:= ( LoNibbleChar(sRespuesta[1])=xNPos );
         end;
      end;
   until ( ( bOk ) or ( iNoIntento>=iMaxIntentos ) );
   result:= bOk;
end;

procedure TFDISGilbarco.TransmiteComandoEsp(sDataBlock: string);
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
          until ( ( bListo ) or ( timerexpired(etTimeOut) ) );        // FALLA
end;

//------------------------------------------------------------------------------
//                         Rutinas de uso publico
//------------------------------------------------------------------------------

function TFDISGilbarco.AbrePuerto: boolean;
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

function TFDISGilbarco.Autoriza(PosCarga: integer) : boolean;
begin
   result:= ( TransmiteComando($10,PosCarga,'') );
end;

//--------------------------------------------------------------------------------
function TFDISGilbarco.ReanudaDespacho(PosCarga: integer) : boolean;
begin
   result:= ( TransmiteComando($10,PosCarga,'') );
end;

//--------------------------------------------------------------------------------

function TFDISGilbarco.CierraPuerto : boolean;
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


function TFDISGilbarco.PonNivelPrecio(xNPos, xNPrec : integer) : boolean;
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

function TFDISGilbarco.EnviaPresetBomba6(xNPos, xNMang, xNPrec: integer; rPesos, rLitros: real) : boolean;
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

function TFDISGilbarco.EnviaPresetBomba8(xNPos, xNMang, xNPrec: integer; rPesos, rLitros: real) : boolean;
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

function TFDISGILBARCO.CambiaPrecio6(xNPos, xNMang, xNPrec : integer; rPrecio : real) : boolean;
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

function TFDISGILBARCO.CambiaPrecio8(xNPos, xNMang, xNPrec : integer; rPrecio : real) : boolean;
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

function TFDISGILBARCO.DetenerDespacho(xNPos : integer) : boolean;
begin
   result:= ( TransmiteComando($30,xNPos,'') );
end;

//------------------------------------------------------------------------------

function TFDISGILBARCO.DameTotales6(xNPos : integer;var rTotalizadorLitros1, rTotalizadorPesos1, rTotalizadorLitros2, rTotalizadorPesos2, rTotalizadorLitros3, rTotalizadorPesos3 : real) : boolean;
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

function TFDISGILBARCO.DameTotales8(xNPos : integer; var rTotalizadorLitros1, rTotalizadorPesos1, rTotalizadorLitros2, rTotalizadorPesos2, rTotalizadorLitros3, rTotalizadorPesos3 : real) : boolean;
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

function TFDISGILBARCO.DameVentaProceso6(xNPos : integer; var rPesos : real) : boolean;
var bOk : boolean;
begin
   bOk:= ( ( TransmiteComando($60,xNPos,'') ) and ( length(sRespuesta)>=6 ) );
   if ( bOk ) then
     rPesos:= BcdToInt(copy(sRespuesta,1,6))/TPosCarga[PosCiclo].DivImporte;
   result:= bOk;
end;

function TFDISGILBARCO.DameVentaProceso8(xNPos : integer; var rPesos : real) : boolean;
var bOk : boolean;
begin
   bOk:= ( ( TransmiteComando($60,xNPos,'') ) and ( length(sRespuesta)>=8 ) );
   if ( bOk ) then rPesos:= BcdToInt(copy(sRespuesta,1,8))/TPosCarga[PosCiclo].DivImporte;
   result:= bOk;
end;

//------------------------------------------------------------------------------

function TFDISGILBARCO.DameLecturas6(xNPos : integer; var xNMang : integer; var rLitros, rPrecio, rPesos : real) : boolean;
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

function TFDISGILBARCO.DameLecturas8(xNPos : integer; var xNMang : integer; var rLitros, rPrecio, rPesos : real) : boolean;
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


function TFDISGILBARCO.DameEstatus(PosCarga: integer) : integer;
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
procedure TFDISGILBARCO.DespliegaMemo4(lin:string);
begin
  DMCONS.AgregaLog('>> '+lin);
end;


procedure TFDISGILBARCO.IniciaBaseDeDatos;
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

procedure TFDISGILBARCO.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
begin
  with DMCONS do begin
    swcierrabd:=false;
    swcierrabd2:=false;
    stflu:=0;swflu:=false;
    EstatusAnt:='';
    ListView1.Items.Clear;
    MaxPosCarga:=0;
    for i:=1 to 32 do with TPosCarga[i] do begin
      DigitosGilbarco:=6;
      StFluPos:=0;
      for j:=1 to 3 do
        TAdicf[i,j]:=0;
      DivImporte:=DMCONS.GtwDivImporte;
      DivLitros:=DMCONS.GtwDivLitros;
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      SwPreset:=false;
      importe:=0;
      volumen:=0;
      precio:=0;
      tipopago:=0;
      Esperafinventa:=0;
      SwCargando:=false;
      for j:=1 to MCxP do begin
        TotalLitros[j]:=0;
        TCambioPrecN1[j]:=false;
        TCambioPrecN2[j]:=false;
        TNuevoPrec[j]:=0;
      end;
      SwDeshabil:=false;
      SwTotales:=true;
      SwLeeVenta:=true;
      SwFinVenta:=false;
      SwNivelPrecio:=true;
      SwCambiaPrecio:=false;
      SwPreset:=false;
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
              DespliegaMemo4('>>NoComb '+inttostr(NoComb)+'    Comb '+inttostr(xcomb)+'    xPos '+inttostr(TPosx[NoComb]));
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

procedure TFDISGILBARCO.FormShow(Sender: TObject);
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


procedure TFDISGILBARCO.LimpiaConsola;
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

procedure TFDISGILBARCO.DespliegaPosCarga(xpos:integer);
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
    with TPosCarga[xpos],FDISGILBARCO do begin
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
        if (importe>0.01)and(PosActual in [1..MCxP]) then begin
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
                swcerrar:=true; FDISGILBARCO.Close;
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
    DespliegaMemo4('Error: '+inttostr(apunt));
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



procedure TFDISGILBARCO.ListBox1Click(Sender: TObject);
var xp:integer;
begin
  LimpiaConsola;
  for xp:=1 to MaxPosCarga do
    DespliegaPosCarga(xp);
end;

procedure TFDISGILBARCO.Restaurar1Click(Sender: TObject);
begin
  FDISGILBARCO.Visible:=true;
end;

procedure TFDISGILBARCO.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=SwCerrar;
end;

procedure TFDISGILBARCO.FormCreate(Sender: TObject);
begin
  SwCerrar:=false;
  SwInicio:=true;
  SwBring:=true;
  SwEspera:=false;
  ListaCmnd:=TStringList.Create;
  ContadorAlarma:=0;
end;

procedure TFDISGILBARCO.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISGILBARCO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=false;
  CierraPuerto;
  Application.Terminate;
end;


procedure TFDISGILBARCO.registro(valor:integer;variable:string);
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

procedure TFDISGILBARCO.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISGILBARCO.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISGILBARCO.lee_registro;
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

  
procedure TFDISGILBARCO.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
  PuertoSerial.Tracing:=tlDump;
  PuertoSerial.Tracing:=tlOn;
end;

function TFDISGILBARCO.CombustibleEnPosicion(xpos,xpc:integer):integer;
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

function TFDISGILBARCO.PosicionDeCombustible(xpos,xcomb:integer):integer;
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



procedure TFDISGILBARCO.Button3Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISGILBARCO.Button4Click(Sender: TObject);
var
  ruta:PAnsiChar;
begin
  ruta:=PChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)));
  ShellExecute(Handle, 'open','explorer.exe',ruta, nil, SW_SHOWNORMAL);
end;

(*
procedure TFDISGilbarco.AvanzaPosCiclo;
label uno;
var xcont:Integer;
begin
  xcont:=0;
  repeat
    uno:
    inc(PosCiclo); inc(xcont);
    if PosCiclo>MaxPosCarga then begin
      EstatusDispensarios;
      PosCiclo:=1;
    end;
    with TPosCarga[PosCiclo] do if estatus=0 then begin
      inc(Fallosestat);
      if Fallosestat>20 then
        FallosEstat:=0
      else if Fallosestat>1 then begin
        if xcont>MaxPosCarga+1 then
          exit
        else
          goto uno;
      end;
    end;
    if PosCiclo>MaxPosCarga then begin
      EstatusDispensarios;
      PosCiclo:=1;
    end;
  until (TPosCarga[PosCiclo].FallosEstat<2)or(xcont>MaxPosCarga+1);
end;
  *)

procedure TFDISGilbarco.AvanzaPosCiclo;
begin
  inc(PosCiclo);
  if PosCiclo>MaxPosCarga then begin
    EstatusDispensarios;
    PosCiclo:=1;
  end;
end;

procedure TFDISGilbarco.EstatusDispensarios;
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
    end;
    EstatusAct:=xestado;
    if lin='' then
      lin:=xestado+'#'
    else
      lin:=xestado+lin;
    lin:=lin+'&'+xmodo;
    DMCONS.ActualizaDispensarios('D'+lin);
      if (EstatusAct<>EstatusAnt) then begin
        DMCONS.AgregaLog('Estatus Disp: '+EstatusAct);
        EstatusAnt:=EstatusAct;
      end;
  end;
end;

procedure TFDISGilbarco.ProcesaComandos;
var ss,rsp,ss2            :string;
    xcmnd,xpos,xcomb,i,xc,
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

            case TipoClb[1] of
             '2':begin  // Por posicion de carga
                   for xpos:=1 to MaxPosCarga do
                     TPosCarga[xpos].StFluPos:=1;
                 end;
            else begin  // General
                   StFlu:=1;
                 end;
            end;
          end
          // CMND: FLU OFF
          else if ss='FLUMIN' then begin
            rsp:='OK';
            StFlu:=11;
            for xpos:=1 to MaxPosCarga do
              TPosCarga[xPos].StFluPos:=11;
            SwCerrar:=true;
          end
          // CMND: FLU $     Especial para tipoclb=2
          else if ss='FLU$' then begin
            rsp:='OK';
            ss:=TabCmnd[xcmnd].Comando;
            delete(ss,1,5);
            dmcons.AgregaLog(ss);
            ss2:=HexSepToStr(ss);
            TransmiteComandoEsp(ss2);

            if swcerrar then begin
              for xpos:=1 to MaxPosCarga do
                TPosCarga[xpos].StFluPos:=0;
            end;
          end
          // CMND: PARO TOTAL
          else if ss='PAROTOTAL' then begin
            rsp:='OK';
          end
          // CMND: CERRAR CONSOLA
          else if ss='CERRAR' then begin
            rsp:='OK';
            StFlu:=11;
            for xpos:=1 to MaxPosCarga do
              TPosCarga[xPos].StFluPos:=11;
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
                          if Autoriza(xpos) then begin
                            TPosCarga[xpos].SwPreset:=true;
                          end
                          else rsp:='No se pudo autorizar';
                        end
                        else rsp:='No se pudo prefijar';
                      end
                      else begin
                        if EnviaPresetBomba8(xpos,xp,1,ximporte,0) then
                        begin
                          if Autoriza(xpos) then begin
                            TPosCarga[xpos].SwPreset:=true;
                          end
                          else rsp:='No se pudo autorizar';
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
                          if Autoriza(xpos) then begin
                            TPosCarga[xpos].SwPreset:=true;
                          end
                          else rsp:='No se pudo autorizar';
                        end
                        else rsp:='No se pudo prefijar';
                      end
                      else begin
                        if EnviaPresetBomba8(xpos,xp,1,0,xlitros) then begin
                          if Autoriza(xpos) then begin
                            TPosCarga[xpos].SwPreset:=true;
                          end
                          else rsp:='No se pudo autorizar';
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
                    on e:exception do
                    DespliegaMemo4('ERROR al cambiar tipo de pago: '+e.Message);
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
          TabCmnd[xcmnd].SwNuevo:=false;
          if SwAplicaCmnd then begin
            if rsp='' then
              rsp:='OK';
            TabCmnd[xcmnd].SwResp:=true;
            TabCmnd[xcmnd].Respuesta:=rsp;
            DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
          end;
          (*
          if SwCerrar then
            FDISGILBARCO.Close;
            *)
        end;
      end;
    end;
  except
  end;
end;

function TFDISGilbarco.EnviaPresetFlu(xpos:integer;xsube:boolean):boolean;
var ximporte:real;
begin
  result:=true;
  try
    if xsube then
      ximporte:=StrToIntDef(Valorx+inttostr(tagx[1]),0)/100
    else
      ximporte:=StrToIntDef(Valorx+'0',0)/100;
    DMCONS.AgregaLog('Preset Posicion '+inttoclavenum(xpos,2)+' $'+FormatoMoneda(ximporte));
    if TPosCarga[xPos].DigitosGilbarco=6 then begin
      if EnviaPresetBomba6(xpos,1,1,ximporte,0) then
      begin
        if Autoriza(xpos) then begin
          TPosCarga[xpos].SwPreset:=true;
        end
        else result:=false;
      end
      else result:=false;
    end
    else begin
      if EnviaPresetBomba8(xpos,1,1,ximporte,0) then
      begin
        if Autoriza(xpos) then begin
          TPosCarga[xpos].SwPreset:=true;
        end
        else result:=false;
      end
      else result:=false;
    end;
  except
    result:=false;
  end;
end;

procedure TFDISGILBARCO.Timer1Timer(Sender: TObject);
label L01;
var xvolumen,n1,n2,n3:real;
    xcomb,xpos,xp,xgrade,i,xsuma:integer;
    xtotallitros:array[1..4] of real;
begin
  //
  if swbring then begin
    StaticText17.Visible:=false;
    FDISGILBARCO.BringToFront;
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
                if PonNivelPrecio(PosCiclo,1) then begin
                  swnivelprecio:=false;
                end;
              end;
            end;
          1:begin                           // ESTATUS
              try
                EstatusAnt:=Estatus;
                Estatus:=DameEstatus(PosCiclo);    // Aqui bota cuando no hay posicion activa
                EstatusDispensarios;
                ContadorAlarma:=0;
                if (Estatusant=0)and(estatus=1) then begin
                  SwNivelPrecio:=true;
                  HoraNivelPrecio:=Now+5*TMSegundo;
                  Swleeventa:=true;
                  SwTotales:=true;
                end;
                if (EstatusAnt in [3,4])and(Estatus=1) then begin // Termina Venta
                  swcargando:=false;
                  if EsperaFinVenta=1 then
                    Estatus:=4
                  else
                    SwTotales:=true;
                end;
                Case DMCONS.TipoClb[1] of
                  '2':begin
                        if swcerrar then begin
                          xsuma:=0;
                          for xpos:=1 to MaxPosCarga do
                            xsuma:=xsuma+TPosCarga[xpos].StFluPos;
                          if (xsuma=0) then begin
                            Button1.Click;
                            FDISGILBARCO.Close;
                          end;
                        end;
                        if (Estatus=1)and(StFluPos=1)and(swflu) then begin   // Sube
                          MandaFlujoPos(PosCiclo,TAdicf[PosCiclo,1]);
                          StFluPos:=0;
                        end;
                        if (StFluPos=11) then  // Baja todos
                          MandaFlujoPos(23,0);
                      end;
                 else begin
                    if (Estatus=1)and(Stflu=1)and(swflu) then begin // Manda Flu
                      if EnviaPresetFlu(PosCiclo,true) then begin
                        StFlu:=2;
                        PosFlu:=PosCiclo;
                      end;
                    end;
                    if (Estatus=1)and(Stflu=11)and(swflu) then begin // Manda Flu
                      if EnviaPresetFlu(PosCiclo,false) then begin
                        StFlu:=12;
                        PosFlu:=PosCiclo;
                      end;
                    end;
                    if (PosFlu=PosCiclo)and(stflu in[2,12])and(estatus in[2,9]) then begin // detener flu
                      if DetenerDespacho(PosFlu) then begin
                        stflu:=0;
                        if swcerrar then begin
                          Button1.Click;
                          FDISGILBARCO.Close;
                        end;
                      end;
                    end;
                 end;
                end;
              except
                DespliegaMemo4('Error Estatus Pos: '+inttostr(PosCiclo));
                AvanzaPosCiclo;
                NumPaso:=1;
                exit;
              end;
            end;
          2:if (swleeventa)and(estatus>0) then begin       // LEE VENTA TERMINADA
              if TPosCarga[PosCiclo].DigitosGilbarco=6 then begin
                DMCONS.AgregaLog('E> FIN DE VENTA(6): '+inttoclavenum(PosCiclo,2));
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
                DMCONS.AgregaLog('E> FIN DE VENTA(8): '+inttoclavenum(PosCiclo,2));
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
              swflu:=true; // Inicia despues del primer proceso de comandos
            end;
          7:begin          // CAMBIA PRECIO
              for xp:=1 to NoComb do begin
                if Estatus=1 then begin
                  if TCambioPrecN1[xp] then begin
                    if TPosCarga[PosCiclo].DigitosGilbarco=6 then begin
                      DMCONS.AgregaLog('E> Cambia Precio(6): '+inttoclavenum(PosCiclo,2)+' - '+inttoclavenum(xp,2));
                      if CambiaPrecio6(PosCiclo,xp,1,TNuevoPrec[xp]) then begin
                        TCambioPrecN1[xp]:=false;
                      end;
                    end
                    else begin
                      DMCONS.AgregaLog('E> Cambia Precio(8): '+inttoclavenum(PosCiclo,2)+' - '+inttoclavenum(xp,2));
                      if CambiaPrecio8(PosCiclo,xp,1,TNuevoPrec[xp]) then begin
                        TCambioPrecN1[xp]:=false;
                      end;
                    end;
                  end
                  else if TCambioPrecN2[xp] then begin
                    if TPosCarga[PosCiclo].DigitosGilbarco=6 then begin
                      DMCONS.AgregaLog('E> Cambia Precio(6): '+inttoclavenum(PosCiclo,2)+' - '+inttoclavenum(xp,2));
                      if CambiaPrecio6(PosCiclo,xp,1,TNuevoPrec[xp]) then begin
                        TCambioPrecN2[xp]:=false;
                      end;
                    end
                    else begin
                      DMCONS.AgregaLog('E> Cambia Precio(8): '+inttoclavenum(PosCiclo,2)+' - '+inttoclavenum(xp,2));
                      if CambiaPrecio8(PosCiclo,xp,1,TNuevoPrec[xp]) then begin
                        TCambioPrecN2[xp]:=false;
                      end;
                    end;
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
        if (NumPaso=5)and(estatus<>2) then
          NumPaso:=6;

        //
        if NumPaso>=8 then begin
          AvanzaPosCiclo;
          NumPaso:=1;
          if SwNivelPrecio then
            NumPaso:=0;
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
          except
          end;

          // Programa cambio precio
          for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do
            for xp:=1 to NoComb do if xcomb=CombustibleEnPosicion(xpos,xp) then begin
              TCambioPrecN1[xp]:=true;
              TCambioPrecN2[xp]:=true;
              TNuevoPrec[xp]:=TabComb[xcomb].precio;
            end;
        end;
        CargaPreciosFH(Now,true);
        DBGrid3.Refresh;


      end;
    end;

    // Minimiza pantalla al inicio
    if NotificationIcon1.Tag=0 then begin
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      FDISGILBARCO.Visible:=false;
      NotificationIcon1.Show;
    end;

  end;
end;

function TFDISGILBARCO.StrToHexSep(ss:string):string;
var i:integer;
    xaux:string;
begin
  xaux:='';
  for i:=1 to length(ss) do
    xaux:=xaux+' '+inttohex(ord(ss[i]),2);
  result:=xaux;
end;

function TFDISGILBARCO.HexSepToStr(ss:string):string;
var i,ne:integer;
    st,xaux:string;
begin
  xaux:='';
  ne:=NoElemStrSep(ss,' ');
  for i:=1 to ne do begin
    st:=ExtraeElemStrSep(ss,i,' ');
    xaux:=xaux+HexToStr(st);
  end;
  result:=xaux;
end;

procedure TFDISGILBARCO.MandaFlujoPos(xpos,xvalor:integer);
var xstr : string;
begin
   xstr:='C6 B4 A9 D5 '+inttohex(xpos+224,2)+' E5 E0 '+inttohex(xvalor+224,2)+' FF FF FF FF';
   DMCONS.EjecutaComando('FLU$ '+xstr);
end;

procedure TFDISGILBARCO.Button2Click(Sender: TObject);
// C7 B5 A0 D4 WW XX YY ZZ FF FF FF FF
// WW pos carga
// XX manguera       (05 todas);
// YY 00
// ZZ %
var xstr : string;
    v1,v2,v3:integer;
begin
   xstr:='C6 B4 A9 D5 '+Edit1.Text+' '+Edit2.Text+' 00 '+Edit3.Text+' FF FF FF FF';
   DMCONS.AgregaLog('Antes..: '+xstr);

   v1:=StrToIntdef(Edit1.Text,0)+224;
   v2:=StrToIntdef(Edit2.Text,0)+224;
   v3:=StrToIntdef(Edit3.Text,0)+224;

   xstr:='C6 B4 A9 D5 '+inttohex(v1,2)+' '+inttohex(v2,2)+' E0 '+inttohex(v3,2)+' FF FF FF FF';
   DMCONS.AgregaLog('Despues: '+xstr);

   DMCONS.EjecutaComando('FLU$ '+xstr);
end;

end.

