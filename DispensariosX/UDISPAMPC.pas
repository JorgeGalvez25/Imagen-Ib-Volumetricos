unit UDISPAMPC;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  dxGDIPlusClasses;


const
      MCxP=4;


type
  TFDISPAMPC = class(TForm)
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
    Timer3: TTimer;
    ImageList1: TImageList;
    CheckBox2: TCheckBox;
    Memo4: TMemo;
    Panel2: TPanel;
    ListView1: TListView;
    Memo1: TMemo;
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
    StaticText7: TStaticText;
    Label4x: TLabel;
    Image1: TImage;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Ap1TriggerAvail(CP: TObject; Count: Word);
    procedure Timer1Timer(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer3Timer(Sender: TObject);
    procedure NotificationIcon1DblClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBoxPC1DblClick(Sender: TObject);
    procedure ListBoxPC2Click(Sender: TObject);
    procedure ListBoxPC3Click(Sender: TObject);
    procedure ListBoxPC4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    ApEg,
    ContReset  :integer;
    SwReset,
    SwAplicaCmnd,
    SwInicio:boolean;
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwEspera,
    SwBcc,
    SwChecksum,
    FinLinea:boolean;
    ContEspera1,
    ContEsperaPaso2,
    StEsperaPaso3,
    ContEsperaPaso3,
    ContEsperaPaso4,
    ContEsperaPaso5,
    NumPaso,
    ContBuffLleno,
    errbcc,
    PrecioCombActual,
    PosicionDispenActual,
    PosicionCargaActual:integer;
    swprocesando:boolean;
    UltimoStatus:string;
    SnPosCarga:integer;
    SnImporte:real;
    SnLitros:real;
    EmularEstatus,
    LineaEmular:string;
    SwError:boolean;
    ContadorAlarma:integer;
  public
    { Public declarations }
    function StringCom(ss:string):string;
    function XorChar(c1,c2:char):char;
    function CalculaBCC(ss:string):char;
    procedure ComandoConsolaBuff(ss:string); //;swinicio:boolean);
    procedure ComandoConsola(ss:string);
    procedure ProcesaLinea;
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer;swforza:boolean);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    procedure DespliegaMemo4(lin:string);
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    procedure EnviaPreset(var rsp:string;xcomb:integer);
    function DigitosDispensario(xpos:integer):integer;
    function DamePorcientoComb(xcomb:integer):integer;
    function ComandoB:string;
    function ComandoA(xpos:integer):string;
    procedure ProcesoComandoB(xResp:string);
    procedure ProcesoComandoA(xResp:string);

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
       estatusant:integer;
       NoComb   :integer; // Cuantos combustibles hay en la posicion
       Estat_Cons:char;
       TComb    :array[1..MCxP] of integer; // Claves de los combustibles
       TPos      :array[1..MCxP] of integer;
       TDiga    :array[1..MCxP] of integer;
       TDigvol    :array[1..MCxP] of integer;
       TDigit    :integer;
       TMapa    :array[1..MCxP] of string[6];
       TMang     :array[1..MCxP] of integer;
       SwMapea    :array[1..MCxP] of boolean;
       TotalLitrosAnt:array[1..MCxP] of real;
       TotalLitros:array[1..MCxP] of real;
       SwTotales:array[1..MCxP] of boolean;
       SwDesp:boolean;
       SwA:boolean;
       Hora:TDateTime;
       SwInicio:boolean;
       SwInicio2:boolean;
       SwInicio3:boolean;
       SwPreset,
       SwPresetManual,
       IniciaCarga,
       SwPrepago,
       SwPrepago6:boolean;
       ImportePreset:real;
       ActualizarPrecio:Boolean;
       Mensaje:string[30];
       //swnivelprec,
       swautorizada,
       swautorizando,
       swcargando:boolean;
       SwActivo,
       SwOCC,SwCmndB,
       SwDesHabilitado:boolean;
       ModoOpera:string[8];
       TipoPago:integer;
       ContOcc,
       FinVenta:integer;
       HoraOcc:TDateTime;
       CmndOcc:string[25];

       swarosmag:boolean;
       aros_cont,
       aros_mang,
       aros_cte,
       aros_vehi:integer;
       swarosmag_stop:boolean;

       HoraPreset:TDateTime;
       CmndPreset:string[15];
       CtrlPreset:boolean;
     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=20;
      MaxEspera31=10;
      MaxEspera3=10;


var
  FDISPAMPC: TFDISPAMPC;
  TPosCarga:array[1..100] of tiposcarga;
  MaxPosCarga:integer;
  MaxPosCargaActiva:integer;
  AvanceBar:integer;
  SwSolOk:boolean;
  ContDA,
  StErrSol:integer;
  ruta_db:string;
  SwConfDig,
  SwCerrar    :boolean;
  // CONTROL TRAFICO COMANDOS
  ListaCmnd    :TStrings;
  LinCmnd      :string;
  CharCmnd     :char;
  SwEsperaRsp  :boolean;

  SwComPro     :boolean;
  HoraComPro   :TDateTime;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}

function TFDISPAMPC.ComandoA(xpos:integer):string;
var ss:string;
begin
  ss:=HexToStr('E3');
  case xpos of
    1..15:ss:=ss+HexToStr('C'+inttohex(xpos,1));
    16:ss:=ss+HexToStr('C0');
    17..31:ss:=ss+HexToStr('D'+inttohex(xpos,1));
    32:ss:=ss+HexToStr('D0');
  end;
  result:=ss;
end;

function TFDISPAMPC.ComandoB:string;   // Leer estatus de bomba
begin
  result:=HexToStr('B4');
end;

procedure TFDISPAMPC.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=60 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISPAMPC.DespliegaPrecios;
var i:integer;
begin
  with DMCONS do begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Precios Actuales: ');
    for i:=1 to MaxComb do with TabComb[i] do if Activo then
      Memo1.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
  end;
end;

procedure TFDISPAMPC.IniciaBaseDeDatos;
var i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    try
      if not swemular then begin
        StaticText8.Caption:='Abriendo Puerto';
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
        EsperaMiliSeg(2000);
      end;

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
            ProductoPrecio:=inttostr(i); //Q_CombIbCon_ProductoPrecio.AsString;
            DigitoPrec:=Q_CombIbDigitoAjustePrecio.AsInteger;
            AgruparCon:=Q_CombIbAgrupar_con.AsInteger;
          end;
        end;
        Q_CombIb.Next;
      end;
      CargaPreciosFH(Now,true); // guarda precio actual como físico
      DBGrid3.Refresh;
      DespliegaPrecios;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISPAMPC.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
begin
  with DMCONS do begin
    ListView1.Items.Clear;
    MaxPosCarga:=0;
    for i:=1 to 100 do with TPosCarga[i] do begin
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      Estat_Cons:=' ';
      SwInicio:=true;
      SwInicio2:=true;
      SwInicio3:=true;
      IniciaCarga:=false;
      SwPrepago:=false;
      SwPrepago6:=false;
      SwPreset:=false;
      SwPresetManual:=false;
      ActualizarPrecio:=false;
      Mensaje:='';
      importe:=0;
      volumen:=0;
      precio:=0;
      tipopago:=0;
      finventa:=0;
      SwCargando:=false;
      SwAutorizada:=false;
      SwAutorizando:=false;
      for j:=1 to MCxP do begin
        SwTotales[j]:=true;
        TotalLitrosAnt[j]:=0;
        TotalLitros[j]:=0;
        swmapea[j]:=false;
        TMapa[j]:='';
      end;
      SwActivo:=false;
      SwDeshabilitado:=false;
      SwArosMag:=false;
      SwArosMag_stop:=false;
      SwOCC:=false;
      ContOcc:=0;
      CtrlPreset:=false;
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
      xcomb:=Q_BombIbCombustible.AsInteger;
      if xpos>MaxPosCarga then begin
        MaxPosCarga:=xpos;
        ListView1.Items.Add;
        ListView1.Items[MaxPosCarga-1].Caption:=IntToClaveNum(xpos,2);
        ListView1.Items[MaxPosCarga-1].ImageIndex:=0;
      end;
      with TPosCarga[xpos] do begin
        Isla:=xisla;
        SwDesp:=false;
        SwA:=false;
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
          else if NoComb<=2 then
            TPos[NoComb]:=NoComb
          else
            TPos[NoComb]:=1;
          TMang[NoComb]:=Q_BombIbManguera.AsInteger;
          // MAPEA POSICION DE CARGA
          TMapa[NoComb]:='X'+IntToClaveNum(xpos,2)+TabComb[xcomb].ProductoPrecio+IntToStr(Q_BombIbCon_Posicion.AsInteger);
          SwMapea[NoComb]:=true;
          TDiga[TPos[NoComb]]:=Q_BombIbCon_DigitoAjuste.AsInteger;
          TDigvol[TPos[NoComb]]:=Q_BombIbDigitoAjusteVol.AsInteger;
          TDigit:=Q_BombIbDigitosGilbarco.AsInteger;
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

function TFDISPAMPC.DigitosDispensario(xpos:integer):integer;
begin
  with DMCONS,TPosCarga[xpos] do begin
    if (TDigit in [6,5]) then
      result:=TDigit
    else begin
      if DigitosPam1000='6' then
        result:=6
      else result:=5;
    end;
  end;
end;

procedure TFDISPAMPC.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      ContDA:=0;
      SwEsperaRsp:=false;
      SwComPro:=false;
      ErrorInic:=true;
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      SwProcesando:=false;
      SwEspera:=false;
      ContEspera1:=0;
      ContEsperaPaso2:=0;
      StEsperaPaso3:=0;
      ContEsperaPaso3:=0;
      ContEsperaPaso4:=0;
      ContEsperaPaso5:=0;
      ContBuffLleno:=0;
      NumPaso:=0;
      StaticText5.Caption:=IntToStr(NumPaso);
      Linea:='';
      LineaBuff:='';
      LineaTimer:='';
      errbcc:=0;
      SwBcc:=false;
      FinLinea:=false;
      SwChecksum:=false;
      IniciaEstacion;
      ListBox1.SetFocus;
      Timer1.Enabled:=true;
      DMCONS.T_ConfIb.Active:=true;
      if DMCONS.SwEmular then begin
        LineaEmular:='';
        EmularEstatus:=LlenaStr('','N',MaxPosCarga,'1');
      end;
      Timer3.Enabled:=DMCONS.SwEmular;
      if DMCONS.SwEmular then
        Label4x.Visible:=true;
      ErrorInic:=false;
    finally
      Timer1.Enabled:=true;
      Timer3.Enabled:=DMCONS.SwEmular;
    end;
  end;
end;

function TFDISPAMPC.StringCom(ss:string):string;
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

function TFDISPAMPC.XorChar(c1,c2:char):char;
var bits1,bits2,bits3:array[0..7] of boolean;
    nn,n1,n2,i,nr:byte;
begin
  n1:=ord(c1);
  n2:=ord(c2);
  nr:=0;
  for i:=0 to 7 do begin
    nn:=n1 mod 2;
    bits1[i]:=(nn=1);
    n1:=n1 div 2;

    nn:=n2 mod 2;
    bits2[i]:=(nn=1);
    n2:=n2 div 2;

    bits3[i]:=bits1[i] xor bits2[i];
    if bits3[i] then
      case i of
        0:nr:=nr+1;
        1:nr:=nr+2;
        2:nr:=nr+4;
        3:nr:=nr+8;
        4:nr:=nr+16;
        5:nr:=nr+32;
        6:nr:=nr+64;
        7:nr:=nr+128;
      end;
  end;
  result:=char(nr);
end;

function TFDISPAMPC.CalculaBCC(ss:string):char;
var xc,cc:char;
    i:integer;
begin
  xc:=ss[1];
  for i:=2 to length(ss) do begin
    cc:=ss[i];
    xc:=XorChar(xc,cc);
  end;
  result:=xc;
end;

procedure TFDISPAMPC.LimpiaConsola;
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

procedure TFDISPAMPC.DespliegaPosCarga(xpos:integer;swforza:boolean);
var i,ii,xp,rango,posi,posf,
    xcomb,xc,apunt,xmang:integer;
    lin,xnombre:string;
    xprecio,xprecio2,xdifprec,xdiflts:real;
begin
  apunt:=1;
  try
    rango:=ListBox1.ItemIndex+1;
    if rango=0 then
      rango:=1;
    posi:=rango*4-3;
    posf:=rango*4;
    with TPosCarga[xpos],FDISPAMPC do begin
      xcomb:=CombustibleEnPosicion(xpos,PosActual);
      if xcomb in [1..maxcomb] then
        xnombre:=DMCONS.TabComb[xcomb].Nombre;
      if xpos in [posi..posf] then begin
        ii:=xpos-posi+1;
        TStaticText(FindComponent('StaticText'+IntToStr(ii))).Caption:=IntToClaveNum(xpos,2);
        if not SwDesHabilitado then begin
          case ii of
            1:panelPC1.Caption:=TPosCarga[xpos].descestat;
            2:panelPC2.Caption:=TPosCarga[xpos].descestat;
            3:panelPC3.Caption:=TPosCarga[xpos].descestat;
            4:panelPC4.Caption:=TPosCarga[xpos].descestat;
          end;
          case estatus of
            1:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClRed;
            5,9:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClYellow;
            2:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClLime;
            3:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClBlue;
            else TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClWhite;
          end;
        end
        else begin
          TPanel(FindComponent('panelPC'+IntToStr(ii))).Caption:='Deshabilidado';
          TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClWhite;
        end;
        if (not swforza)and(TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Count>0) then
          exit;
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Clear;
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('$ '+FormatFloat('###,##0.00',importe)+' Pesos');
        if not SwCargando then begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.000',precio)+' $/Lts');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(xnombre);
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(Mensaje);
        end
        else begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
        end;
        for xp:=1 to NoComb do
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                   ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3)
                   );
        if SwPreset then begin
          if not SwPresetManual then
            TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('PRESET $'+FormatoMoneda(ImportePreset)+' >>'+inttostr(finventa))
          else
            TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('PRESET ** $'+FormatoMoneda(ImportePreset)+' >>'+inttostr(finventa));
        end;
      end;
    end;
    apunt:=2;
    // Refresca Listas
    for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
      if ModoOpera='Normal' then begin
        case estatus of
          1,3:ListView1.Items[i-1].ImageIndex:=1;
          2:ListView1.Items[i-1].ImageIndex:=2;
          5,9:ListView1.Items[i-1].ImageIndex:=3;
          else ListView1.Items[i-1].ImageIndex:=0;
        end;
      end
      else begin
        case estatus of
          1,3:ListView1.Items[i-1].ImageIndex:=4;
          2:ListView1.Items[i-1].ImageIndex:=5;
          5,9:ListView1.Items[i-1].ImageIndex:=6;
          else ListView1.Items[i-1].ImageIndex:=0;
        end;
      end;
      apunt:=3;
      ListView1.Items[i-1].Caption:=IntToClaveNum(i,2)+
                    '  '+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ');
      if SwDesp then with DMCONS do begin
        SwDesp:=false;
        if (importe>0.01)and(PosActual in [1..MCxP]) then begin
          SwAutorizada:=false;
          SwTotales[1]:=true;
          apunt:=4;
          SwTotales[2]:=true;
          SwTotales[3]:=true;
          SwTotales[4]:=true;
          try
            try
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
              xprecio:=TabComb[xcomb].Precio;
              xprecio2:=dividefloat(importe,volumen);
              xdifprec:=abs(xprecio-xprecio2);
              if (xdifprec*10)<=xprecio2 then begin
                T_MoviIbPrecio.AsFloat:=xprecio;
              end
              else begin
                DespliegaMemo4('pos:'+inttostr(i)+' comb:'+inttostr(xcomb)+' prec:'+formatomoneda(xprecio)+' prec2:'+formatomoneda(xprecio2)+
                                ' vol:'+formatomoneda(volumen)+' imp:'+formatomoneda(importe));
              end;
              T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLitros[1],3);
              T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLitros[2],3);
              T_MoviIbTotal03.AsFloat:=AjustaFloat(TotalLitros[3],3);
              T_MoviIbTotal04.AsFloat:=AjustaFloat(TotalLitros[4],3);
              xdiflts:=0;
              for ii:=1 to 4 do begin
                xdiflts:=xdiflts+(TotalLitros[ii]-TotalLitrosAnt[ii]);
                TotalLitrosAnt[ii]:=TotalLitros[ii];
              end;
              T_MoviIbTag.AsInteger:=0;
              T_MoviIbManguera.AsInteger:=xmang;
              T_MoviIbTipoPago.asinteger:=TipoPago;
              T_MoviIbBoucher.Asstring:='';
              T_MoviIbCuponImpreso.AsString:='No';
              T_MoviIbReferenciaBitacora.AsInteger:=0;
              T_MoviIbGasId.AsInteger:=Random(1000000);
              T_MoviIbHexhash.AsString:=EncriptaCadena(T_EstsIbNUMEROESTACION.AsString, FormatFloat('###0.00',T_MoviIbImporte.AsFloat));
              TipoPago:=0;
              apunt:=7;
              T_MoviIb.post;
              swpresetmanual:=false;
              if ModoOpera='Normal' then
                SwPreset:=false;
              if (lcLicTemporal)and(date>lcLicVence) then begin
                MensajeErr('Licencia vencida. Llame a su distribuidor');
                swcerrar:=true; FDISPAMPC.Close;
              end;
            finally
              T_MoviIb.Active:=false;
            end;
          except
            lin:='Error Movi: pos:'+inttostr(i)+' comb:'+inttostr(xcomb)+'  cod:'+inttostr(apunt);
            DespliegaMemo4(lin);
          end;
          (*
          T_ConsIb.Active:=true;
          try
            T_ConsIb.Refresh;
            if T_ConsIb.Locate('PosCarga',i,[]) then begin
              T_ConsIb.Edit;
              // inicio
              T_ConsIbVolumen.AsFloat:=volumen;
              T_ConsIbImporte.AsFloat:=importe;
              T_ConsIbPrecio.AsFloat:=precio;
              T_ConsIbCombustible.AsString:=xnombre;
              case estatus of
                0:T_ConsIbEstado.AsInteger:=0; // Sin Comunicación
                1:T_ConsIbEstado.AsInteger:=1; // Inactivo (Idle)
                2:T_ConsIbEstado.AsInteger:=2; // Cargando (In Use)
                3:T_ConsIbEstado.AsInteger:=3; // Fin de Carga (Used)
                5:T_ConsIbEstado.AsInteger:=5; // Llamando (Calling)
                9:T_ConsIbEstado.AsInteger:=9; // Autorizado (Calling)
                8:T_ConsIbEstado.AsInteger:=8; // Detenido (Stoped)
                else T_ConsIbEstado.AsInteger:=0;
              end;
              T_ConsIbOtros.AsString:=FormatFloat('#######0.00',totallitros[1])+
                                      '|'+FormatFloat('#######0.00',totallitros[2]);
              // fin
              T_ConsIbEstatus.AsString:='F';
              T_ConsIb.Post;
            end;
          finally
            T_ConsIb.Active:=false;
          end;
          *)
        end;
      end;
    end;
  except
    DespliegaMemo4('Error: '+inttostr(apunt));
    with DMCONS do begin
      if (T_MoviIb.State in [dsInsert,dsEdit]) then
        T_MoviIb.Cancel;
      (*
      if (T_ConsIb.State in [dsInsert,dsEdit]) then
        T_ConsIb.Cancel;
        *)
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
      // SwCorteTurno:=false;
      SwCorteOk:=true;
      if not SwCorteParcial then begin
        for xpos:=1 to MaxPosCarga do
          if ((TPosCarga[xpos].isla=xIslaCorte)or(xIslaCorte=0))and(TPosCarga[xpos].estatus in [2,3]) then begin
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

procedure TFDISPAMPC.ProcesaLinea;
label uno;
var lin,ss,rsp,descrsp,xestado,xmodo,
    ss2,UltimoEstado:string;
    simp,spre,sval:string[20];
    xporc,i,xpos,xcmnd,
    ii,nposini,nposfin,
    XMANG,XCTE,XVEHI,
    xcomb,xp,xpr,xc,xfolio,tag3:integer;
    xgrade:char;
    xestatus:char;
    importeant,
    ximporte:real;
    xvol,ximp:real;
    swerr:boolean;
    xLista:Tstrings;
begin
  try
    if LineaTimer='' then
      exit;
    SwEsperaRsp:=false;
    lin:=LineaTimer;
    LineaTimer:='';
    if lin='' then
      exit;
    case lin[1] of
     'B':begin // pide estatus de todas las bombas
           try
             apeg:=0;
             StaticText18.Caption:=Lin;
             ContEspera1:=0;
             UltimoStatus:=LineaTimer;
             ss:=copy(lin,4,length(lin)-3);
             MaxPosCargaActiva:=length(ss);
             xestado:='';
             if MaxPosCargaActiva>MaxPosCarga then
               MaxPosCargaActiva:=MaxPosCarga;

             apeg:=1;
             for xpos:=1 to MaxPosCargaActiva do begin
               with TPosCarga[xpos] do begin
                 SwAutorizando:=false;
                 SwCmndB:=true;
                 if estatusant<>estatus then
                   SwA:=true; //CAMBIO
                 estatusant:=estatus;
                 estatus:=StrToIntDef(ss[xpos],0);
                 if dmcons.Swemular then
                   if estatus=5 then
                     EmularEstatus[xpos]:='2';
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
                 if not (estatus in [2,8]) then
                   swarosmag_stop:=false;
                 case estatus of
                   0:begin
                       descestat:='---';  // OFFLINE
                       swautorizada:=false;
                       if estatusant<>0 then begin
                         for xcomb:=1 to nocomb do
                           DMCONS.RegistraBitacora3(1,'Desconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                       end;
                     end;
                   1:begin              // IDLE
                       if (estatusant in [9,5,2])and(DMCONS.ReautorizaPam='Si') then begin
                         //DMCONS.AgregaLog('Reenvia: '+TPosCarga[xpos].CmndOcc);
                         if (now-TPosCarga[xpos].HoraOcc)<=60*tmsegundo then begin
                           ComandoConsolaBuff(TPosCarga[xpos].CmndOcc);
                           esperamiliseg(300);
                           TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                           exit;
                         end;
                       end;
                       if estatusant=0 then begin
                         for xcomb:=1 to nocomb do
                           DMCONS.RegistraBitacora3(1,'Reconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                       end;
                       swautorizada:=false;
                       if not SwPreset then
                         swpresetmanual:=false;
                       descestat:='Inactivo';
                       if (estatusant<>estatus) then begin
                         FinVenta:=0;
                         SwArosMag:=false;
                         SwOcc:=false;
                         ContOcc:=0;
                       end;
                     end;
                   2:begin              // BUSY
                       descestat:='Despachando';
                       IniciaCarga:=true;
                       SwCargando:=true;
                       if SwArosMag then begin
                         if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                           ss:='E'+IntToClaveNum(xpos,2); // STOP
                           ComandoConsolaBuff(ss);
                           Despliegamemo4('Stop aros: mang'+inttostr(aros_mang)+' cte '+inttostr(aros_cte)+' vehic '+inttostr(aros_vehi));
                           SwArosMag_Stop:=true;
                           if swemular then
                             EmularEstatus[xpos]:='8';
                         end;
                       end;
                     end;
                   3:descestat:='Fin de Venta';       // EOT
                   5:descestat:='Pistola Levantada';  // CALL
                   6:begin
                       descestat:='Cerrada';            // CLOSED
                       ComandoConsolaBuff('L'+inttoclavenum(xpos,2));
                       EsperaMiliSeg(200);
                     end;
                   8:begin
                       descestat:='Detenida';           // STOP
                       if SwArosMag_Stop then begin
                         if DMCONS.ControlArosMagneticosRecon(xpos,xmang,xcte,xvehi) then begin
                           Despliegamemo4('Reconecta aros: mang'+inttostr(xmang)+' cte '+inttostr(xcte)+' vehic '+inttostr(xvehi));
                           Despliegamemo4('Anterior aros: mang'+inttostr(aros_mang)+' cte '+inttostr(aros_cte)+' vehic '+inttostr(aros_vehi));
                           if (xmang=aros_mang)and(xcte=aros_cte)and(xvehi=aros_vehi)and(aros_cont<DMCONS.ReconexionesAros) then begin
                             ss:='G'+IntToClaveNum(xpos,2); // START
                             ComandoConsolaBuff(ss);
                             SwArosMag_Stop:=false;
                             inc(aros_cont);
                             with DMCONS do begin
                               try
                                 Q_Auxi.Active:=false;
                                 Q_Auxi.SQL.Clear;
                                 Q_Auxi.SQL.Add('UPDATE DPVGBOMB SET CONTROL_AROS=''X'' WHERE MANGUERA='+inttostr(xmang));
                                 Q_Auxi.ExecSQL;
                               finally
                                 Q_Auxi.Active:=false;
                               end;
                             end;
                             if DMCONS.swemular then
                               EmularEstatus[xpos]:='2';
                           end;
                         end;
                       end;
                     end;
                   9:begin
                       descestat:='Autorizada';         // AUTHORIZED
                       swautorizada:=true;
                       if SwArosMag then begin
                         if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                           Despliegamemo4('STOP MANGUERA >> '+Formatdatetime('HH:mm:ss.zzz',now));
                           ss:='E'+IntToClaveNum(xpos,2); // STOP
                           ComandoConsolaBuff(ss);
                           if swemular then
                             EmularEstatus[xpos]:='1';
                         end;
                       end;
                     end;
                 end;
                 case estatus of
                   0,6:begin
                       xestado:=xestado+'0';
                     end;
                   2:xestado:=xestado+'2';
                   else xestado:=xestado+'1';
                 end;
               end;
             end;

             apeg:=2;
             apeg:=3;
             if true then begin
               apeg:=14;
               // Checa las posiciones que estan en fin de venta
               StaticText8.Caption:='Operando';
               for xpos:=1 to MaxPosCargaActiva do begin
                 with TPosCarga[xpos] do begin
                   case Estatus of
                     5:if (not SwDesHabilitado)and(not swautorizada) then begin
                         apeg:=16;
                         if (ModoOpera='Normal')and(not swarosmag) then begin
                           apeg:=17;
                           if (CtrlPreset)and((now-horapreset)<=15*tmsegundo) then begin
                             ss:=CmndPreset;
                             ComandoConsola(ss);
                           end
                           else begin
                             ss:='S'+IntToClaveNum(xpos,2); // AUTHORIZATION FOR FILLUP
                             ComandoConsolaBuff(ss);
                             SwAutorizando:=true;
                           end;
                           SwInicio:=false;
                           CtrlPreset:=false;
                         end
                         else if swpresetmanual then begin
                           apeg:=18;
                           ss:='S'+IntToClaveNum(xpos,2); // AUTHORIZATION FOR FILLUP
                           ComandoConsolaBuff(ss);
                           SwAutorizando:=true;
                         end
                         else if (DigitosDispensario(xpos)=6)and(swprepago6) then begin
                           apeg:=19;
                           swprepago6:=false;
                           ss:='S'+IntToClaveNum(xpos,2); // AUTHORIZATION FOR FILLUP
                           ComandoConsolaBuff(ss);
                           SwAutorizando:=true;
                         end;
                       end
                       else if (swautorizada)and(DMCONS.ReautorizaPam='Si') then begin
                         if (now-TPosCarga[xpos].HoraOcc)<=60*tmsegundo then begin
                           //DMCONS.AgregaLog('Reenvia: '+TPosCarga[xpos].CmndOcc);
                           ComandoConsolaBuff(TPosCarga[xpos].CmndOcc);
                           esperamiliseg(300);
                           TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                           exit;
                         end;
                       end;
                     8:if (ModoOpera='Normal') then begin
                         apeg:=20;
                         if ((not SwPresetManual)or(importe<ImportePreset))and(not SwArosMag) then begin
                           apeg:=21;
                           ss:='G'+IntToClaveNum(xpos,2); // RESTART
                           DespliegaMemo4('Reanuda carga: '+ss);
                           ComandoConsolaBuff(ss);
                           if CheckBox2.Checked then begin
                             DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
                           end;
                         end;
                       end;
                   end;
                 end;
               end;
             end;
             NumPaso:=2;
             PosicionCargaActual:=0;
           except
             DespliegaMemo4('ERROR(COMANDO B) NO '+inttostr(apeg));
             NumPaso:=2;
             PosicionCargaActual:=0;
           end;
         end;
     'A':begin // RECIBE LECTURA DE BOMBA
           try
             xpos:=StrToIntDef(copy(lin,2,2),0);
             if xpos<>0 then begin
               ContEsperaPaso2:=0;
               with TPosCarga[xpos] do begin
                 Mensaje:='';
                 if lin[4]='0' then begin // POSICION ESTA CARGANDO
                   swinicio2:=false;
                   if DigitosDispensario(xpos)=6 then begin
                     importeant:=importe;
                     simp:=copy(lin,14,8);
                     if TPosCarga[xpos].TDiga[1]=2 then
                       importe:=StrToFloat(simp)/10
                     else if TPosCarga[xpos].TDiga[1]=1 then
                       importe:=StrToFloat(simp)/100
                     else
                       importe:=StrToFloat(simp)/1000;
                     volumen:=0;
                     precio:=0;
                   end
                   else begin
                     simp:=copy(lin,14,8);
                     if TPosCarga[xpos].TDiga[1]=2 then
                       importe:=StrToFloat(simp)/10
                     else if TPosCarga[xpos].TDiga[1]=1 then
                       importe:=StrToFloat(simp)/100
                     else
                       importe:=StrToFloat(simp)/1000;
                     volumen:=0;
                     precio:=0;
                   end;

                   if (DMCONS.ControlAros='Si')and(importe<0.01)and(not swarosmag)and(ModoOpera='Normal') then begin
                     swarosmag:=DMCONS.ControlArosMagneticos2(xpos,aros_mang,aros_cte,aros_vehi);
                     if swarosmag then begin
                       Despliegamemo4('Activa aros: mang'+inttostr(aros_mang)+' cte '+inttostr(aros_cte)+' vehic '+inttostr(aros_vehi));
                       ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
                       if DMCONS.SwEmular then
                         EmularEstatus[xpos]:='5';
                     end;
                   end;
                   DespliegaPosCarga(xpos,true);
                 end
                 else if lin[4]='\' then begin // POSICION NO MAPEADA
                   for i:=1 to nocomb do
                     SwMapea[i]:=true;
                   Mensaje:='No Mapeada';
                 end
                 else begin // VENTA CONCLUIDA
                   xGrade:=lin[4];
                   PosActual:=0;
                   for i:=1 to MCxP do
                     if xGrade=IntToStr(TComb[i]) then
                       PosActual:=TPos[i];
                   if (PosActual=0)or(checkbox2.Checked) then begin   // Perdió el mapeo
                     for i:=1 to nocomb do
                       SwMapea[i]:=true;
                   end
                   else begin
                     try
                       swinicio2:=false;
                       if TPosCarga[xpos].TDigvol[1]=1 then
                         volumen:=StrToFloat(copy(lin,6,8))/100
                       else
                         volumen:=StrToFloat(copy(lin,6,8))/1000;
                       simp:=copy(lin,14,8);
                       spre:=copy(lin,22,5);

                       xcomb:=CombustibleEnPosicion(xpos,PosActual);
                       if DMCONS.TabComb[xcomb].DigitoPrec=1 then
                         precio:=StrToFloat(spre)/100
                       else
                         precio:=StrToFloat(spre)/1000;
                       if TPosCarga[xpos].TDiga[1]=2 then
                         importe:=StrToFloat(simp)/10
                       else if TPosCarga[xpos].TDiga[1]=1 then
                         importe:=StrToFloat(simp)/100
                       else importe:=StrToFloat(simp)/1000;
                       if (2*volumen*precio<importe) then
                         importe:=importe/10;
                       if (2*importe<volumen*precio) then
                         importe:=importe*10;

                       if DMCONS.AjustePAM='Si' then begin
                         ximporte:=AjustaFloat(volumen*precio,2);
                         if abs(importe-ximporte)>=0.015 then
                           importe:=ximporte;
                       end;

                       if (Estatus=3)and(SwCargando) then begin// EOT
                         SwCargando:=false;
                         swdesp:=true;
                       end;
                       DespliegaPosCarga(xpos,true);
                       xcomb:=CombustibleEnPosicion(xpos,PosActual);
                       for xc:=1 to MaxComb do with DMCONS do begin // REGISTRA PRECIO FISICO
                         if (TabComb[xc].ProductoPrecio=inttostr(xcomb))and(not TabComb[xc].AplicaPrecio) then
                           if (abs(TabComb[xc].precio-precio)>0.001)and(precio>0.01) then begin
                             TabComb[xc].precio:=precio;
                             T_Tcmb.Active:=true;
                             try
                               if T_Tcmb.Locate('Clave',xc,[]) then begin
                                 T_Tcmb.Edit;
                                 T_TcmbPrecioFisico.AsFloat:=precio;
                                 T_Tcmb.Post;
                                 Q_CombIb.Active:=false;
                                 Q_CombIb.Active:=true;
                               end;
                             finally
                               T_Tcmb.Active:=false;
                             end;
                           end;
                       end;
                       if (TPosCarga[xpos].finventa=0) then begin //or(TPosCarga[xpos].ModoOpera='Normal') then begin
                         if Estatus=3 then begin // EOT
                           TPosCarga[xpos].finventa:=0;
                           ss:='R'+IntToClaveNum(xpos,2); // VENTA COMPLETA
                           if DMCONS.swemular then
                             EmularEstatus[xpos]:='1';
                           //ComandoConsolaBuff(ss);
                         end;
                       end;
                     except
                     end;
                   end;
                 end;
               end;
             end;
           except
             DespliegaMemo4('ERROR EN COMANDO A');
           end
         end;
     '@':begin // RECIBE TOTAL DE LA POSICION
           try
             xpos:=StrToIntDef(copy(lin,5,2),0);
             if xpos<>0 then begin
               with TPosCarga[xpos] do begin
                 xgrade:=lin[8];
                 for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                   SwTotales[i]:=false;
                   TotalLitros[i]:=StrToFloat(copy(lin,9,10))/100;
                   DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                   swinicio3:=false;
                   DespliegaPosCarga(xpos,true);
                 end;
                 if nocomb=1 then begin
                   for i:=1 to 4 do
                     SwTotales[i]:=false;
                 end
                 else if nocomb>=2 then begin
                   xgrade:=lin[37];
                   for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                     SwTotales[i]:=false;
                     TotalLitros[i]:=StrToFloat(copy(lin,38,10))/100;
                     DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                     swinicio3:=false;
                     DespliegaPosCarga(xpos,true);
                   end;
                   if nocomb>=3 then begin
                     xgrade:=lin[66];
                     for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                       SwTotales[i]:=false;
                       TotalLitros[i]:=StrToFloat(copy(lin,67,10))/100;
                       DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                       swinicio3:=false;
                       DespliegaPosCarga(xpos,true);
                     end;
                     if nocomb=4 then begin
                       xgrade:=lin[95];
                       for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                         SwTotales[i]:=false;
                         TotalLitros[i]:=StrToFloat(copy(lin,96,10))/100;
                         DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                         swinicio3:=false;
                         DespliegaPosCarga(xpos,true);
                       end;
                     end;
                   end;
                 end;
               end;
             end;
           except
             DespliegaMemo4('ERROR EN COMANDO @');
           end
         end;
     'C':begin // RECIBE TOTAL DE UNA PISTOLA
           try
             xpos:=StrToIntDef(copy(lin,2,2),0);
             if xpos<>0 then begin
               xgrade:=lin[4];
               with TPosCarga[xpos] do begin
                 for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                   SwTotales[i]:=false;
                   if DMCONS.LcSerie=321 then begin
                     if TPosCarga[xpos].TDigvol[1]=1 then
                       TotalLitros[i]:=StrToFloat(copy(lin,6,10))/10
                     else
                       TotalLitros[i]:=StrToFloat(copy(lin,6,10))/100;
                   end
                   else
                     TotalLitros[i]:=StrToFloat(copy(lin,6,10))/100;
                   DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                   swinicio3:=false;
                   DespliegaPosCarga(xpos,true);
                 end;
               end;
             end;
           except
             DespliegaMemo4('ERROR EN COMANDO C');
           end
         end;
   idAck:if NumPaso=4 then with DMCONS do begin // CAMBIO DE PRECIOS
           try
             ContEsperaPaso4:=0;
             with TabComb[PrecioCombActual] do begin
               AplicaPrecio:=false;
               try
                 Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
                 Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=PrecioCombActual;
                 Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
                 Q_AplicaPrecioF.ExecSQL;
               except
                 DespliegaMemo4('Error 1: '+inttostr(PrecioCombActual));
               end;
               try
                 T_Tcmb.Active:=true;
                 try
                   if T_Tcmb.Locate('Clave',PrecioCombActual,[]) then begin
                     T_Tcmb.Edit;
                     T_TcmbPrecioFisico.AsFloat:=Precio;
                     T_Tcmb.Post;
                     Q_CombIb.Active:=false;
                     Q_CombIb.Active:=true;
                   end;
                 finally
                   T_Tcmb.Active:=false;
                 end;
               except
                 DespliegaMemo4('Error 2: '+inttostr(PrecioCombActual));
               end;
             end;
           except
             DespliegaMemo4('ERROR EN ACK');
           end
         end
         else if NumPaso=5 then
           ContEsperaPaso5:=0;
   idNak:if NumPaso=4 then with DMCONS do begin // ERROR EN CAMBIO DE PRECIOS
           ContEsperaPaso4:=0;
         end
         else if NumPaso=5 then
           ContEsperaPaso5:=0;
    end;

    // checa lecturas de dispensarios
    if NumPaso=2 then begin
      try
        if PosicionCargaActual<MaxPosCargaActiva then begin
          repeat
            Inc(PosicionCargaActual);
            with TPosCarga[PosicionCargaActual] do if NoComb>0 then begin
              if (estatus<>estatusant)or(estatus>1) or (((SwA)or(swinicio2))and(estatus>0)) then begin //CAMBIO
                if (estatus in [1,2,3,8]) then begin
                  SwA:=false;
                  //Esperamiliseg(500);
                  ComandoConsolaBuff('A'+IntToClaveNum(PosicionCargaActual,2));
                  exit;
                end;
              end
              else begin
                DespliegaPosCarga(PosicionCargaActual,false);
              end;
            end;
          until (PosicionCargaActual>=MaxPosCargaActiva);
          if not SwEsperaRsp then begin
            NumPaso:=3;
            StaticText5.Caption:=IntToStr(NumPaso);
            PosicionCargaActual:=0;
          end;
        end
        else if not SwEsperaRsp then begin
          NumPaso:=3;
          StaticText5.Caption:=IntToStr(NumPaso);
          PosicionCargaActual:=0;
        end;
      except
        DespliegaMemo4('ERROR PASO 2');
        NumPaso:=3;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionCargaActual:=0;
      end;
    end;
    // Lee Totales
    if NumPaso=3 then begin // TOTALES
      try
        // GUARDA VALORES DE DISPENSARIOS CARGANDO
        with DMCONS do begin
          lin:='';xestado:='';xmodo:='';
          for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
            xmodo:=xmodo+ModoOpera[1];
            if not SwDesHabilitado then begin
              case estatus of
                0:xestado:=xestado+'0'; // Sin Comunicación
                1:xestado:=xestado+'1'; // Inactivo (Idle)
                2:xestado:=xestado+'2'; // Cargando (In Use)
                3:if not swcargando then
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
            (*
            if (SwActualizar)or(ManejaServicios='Si') then begin
              SwActualizar:=false;
              *)
            xcomb:=CombustibleEnPosicion(xpos,PosActual);
            ss:=inttoclavenum(xpos,2)+'/'+inttostr(xcomb);
            ss:=ss+'/'+FormatFloat('###0.##',volumen);
            ss:=ss+'/'+FormatFloat('#0.##',precio);
            ss:=ss+'/'+FormatFloat('####0.##',importe);
            lin:=lin+'#'+ss;
            //end;
          end;
          if lin='' then
            lin:=xestado+'#'
          else
            lin:=xestado+lin;
          lin:=lin+'&'+xmodo;
          DMCONS.ActualizaDispensarios('D'+lin);
        end;
        // FIN
        if PosicionCargaActual<=MaxPosCarga then begin
          repeat
            if PosicionDispenActual=0 then begin
              PosicionCargaActual:=1;
              PosicionDispenActual:=1;
            end
            else if PosicionDispenActual<TPosCarga[PosicionCargaActual].NoComb then
              inc(PosicionDispenActual)
            else begin
              Inc(PosicionCargaActual);
              PosicionDispenActual:=1;
            end;
            if PosicionCargaActual<=MaxPosCarga then begin
              with TPosCarga[PosicionCargaActual] do begin
                if (estatus=1) and (swtotales[PosicionDispenActual]) then begin
                  ComandoConsolaBuff('C'+IntToClaveNum(PosicionCargaActual,2)+IntToStr(TComb[PosicionDispenActual])+'1');
                  exit;
                end
                else begin
                  DespliegaPosCarga(PosicionCargaActual,false);
                end;
              end;
            end
            else if not SwEsperaRsp then begin
              NumPaso:=4;
              PrecioCombActual:=0;
              StaticText5.Caption:=IntToStr(NumPaso);
            end;
          until (PosicionCargaActual>MaxPosCarga);
          if not SwEsperaRsp then begin
            NumPaso:=4;
            PrecioCombActual:=0;
            StaticText5.Caption:=IntToStr(NumPaso);
          end;
        end
        else if not SwEsperaRsp then begin
          NumPaso:=4;
          PrecioCombActual:=0;
          StaticText5.Caption:=IntToStr(NumPaso);
        end;
      except
        DespliegaMemo4('ERROR PASO 3');
        NumPaso:=4;
        PrecioCombActual:=0;
        StaticText5.Caption:=IntToStr(NumPaso);
      end;
    end;

    if NumPaso=4 then begin // CAMBIO DE PRECIOS
      try
        if PrecioCombActual<MaxComb then with DMCONS do begin
          repeat
            inc(PrecioCombActual);
            if not swreset then with TabComb[PrecioCombActual] do begin
              if AplicaPrecio then begin // Cambia Precios
                if ProductoPrecio<>'' then begin
                  ComandoConsolaBuff('X'+'00'+ProductoPrecio+'1'+'00'+IntToClaveNum(Trunc(Precio*100+0.5),4));
                  EsperaMiliSeg(300);
                  if SwEmular then
                    AplicaPrecio:=false;
                  exit;
                end
                else with TabComb[PrecioCombActual] do begin // no realiza el cambio de precio
                  AplicaPrecio:=false;
                  Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
                  Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=PrecioCombActual;
                  Q_AplicaPrecioF.ParamByName('pError').AsString:='Si';
                  Q_AplicaPrecioF.ExecSQL;
                end;
              end;
            end;
          until (PrecioCombActual>=MaxComb);
          if not SwEsperaRsp then begin
            NumPaso:=5;
            StaticText5.Caption:=IntToStr(NumPaso);
          end;
        end
        else with DMCONS do begin
          if not SwEsperaRsp then begin
            NumPaso:=5;
            StaticText5.Caption:=IntToStr(NumPaso);
          end;
        end;
      except
        DespliegaMemo4('ERROR PASO 4');
        NumPaso:=5;
        StaticText5.Caption:=IntToStr(NumPaso);
      end;
    end;
    if (NumPaso=5) then with DMCONS do begin
      try

        // Checa Comandos
        with DMCONS do begin
          for xcmnd:=1 to 40 do if (TabCmnd[xcmnd].SwActivo)and(not TabCmnd[xcmnd].SwResp) then begin
            SwAplicaCmnd:=true;
            ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,1,' ');
            DMCONS.AgregaLog(TabCmnd[xcmnd].Comando);
            // CMND: PARO TOTAL
            if ss='PAROTOTAL' then begin
              rsp:='OK';
              ComandoConsolaBuff('E00');
              if DMCONS.swemular then
                for xpos:=1 to MaxPosCarga do
                  if EmularEstatus[xpos]='2' then
                    EmularEstatus[xpos]:='8'
                  else
                    EmularEstatus[xpos]:='1';
            end
            // CMND: CERRAR CONSOLA
            else if ss='CERRAR' then begin
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
              SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              rsp:='OK';
              if (TPosCarga[SnPosCarga].estatus in [1,5,9]) then begin
                try
                  if (SnPosCarga in [1..MaxPosCarga]) then begin
                    if not TPosCarga[SnPosCarga].swautorizando then begin
                      // Valida que se haya aplicado el PRESET
                      Swerr:=false;
                      if (TPosCarga[SnPosCarga].SwOCC) then begin
                        if (TPosCarga[SnPosCarga].SwCmndB) then begin
                          if (TPosCarga[SnPosCarga].estatus<=1)and(TPosCarga[SnPosCarga].ContOCC>0) then begin
                            TPosCarga[SnPosCarga].SwOCC:=false;
                          end
                          else if TPosCarga[SnPosCarga].ContOCC<=0 then begin
                            rsp:='Error al aplicar PRESET';
                            Button1.Click;
                            TPosCarga[SnPosCarga].SwOCC:=false;
                            TPosCarga[SnPosCarga].ContOCC:=0;
                            Swerr:=true;
                          end;
                        end
                        else SwAplicaCmnd:=false;
                      end;

                      if (not TPosCarga[SnPosCarga].SwOCC)and(not swerr) then begin
                        TPosCarga[SnPosCarga].SwOCC:=true;
                        TPosCarga[SnPosCarga].SwCmndB:=false;
                        if TPosCarga[SnPosCarga].ContOCC=0 then
                          TPosCarga[SnPosCarga].ContOCC:=3
                        else
                          dec(TPosCarga[SnPosCarga].ContOCC);
                        SwAplicaCmnd:=false;
                        try
                          SnImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                          SnLitros:=0;
                          if (SnImporte>9999) then
                            SnImporte:=9999.00;
                          if (SnImporte<1) then
                            SnImporte:=1.00;
                        except
                          rsp:='Error en Importe';
                        end;
                        TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                        TPosCarga[SnPosCarga].swarosmag:=false;
                        if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                          swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                          aros_cont:=0;
                          if (not swarosmag) then
                            rsp:='Aro magnético se encuentra desconectado';
                        end;
                        if rsp='OK' then begin
                          if (TPosCarga[SnPosCarga].estatus in [1,5,9]) then begin
                            xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
                            TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                            EnviaPreset(rsp,xcomb);
                          end
                          else begin
                            rsp:='Posicion de Carga no Disponible';
                            TPosCarga[SnPosCarga].swarosmag:=false;
                          end;
                        end;
                      end;
                    end
                    else swaplicacmnd:=false;
                  end
                  else rsp:='Posicion de Carga no Existe';
                except
                  rsp:='Error Desconocido';
                end;
              end
              else rsp:='Posicion de Carga no Disponible';
            end
            else if ss='OCL' then begin
              SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              rsp:='OK';
              if (TPosCarga[SnPosCarga].estatus in [1,5,9]) then begin
                if (SnPosCarga in [1..MaxPosCarga]) then begin
                  if not TPosCarga[SnPosCarga].swautorizando then begin
                    // Valida que se haya aplicado el PRESET
                    Swerr:=false;
                    if (TPosCarga[SnPosCarga].SwOCC) then begin
                      if (TPosCarga[SnPosCarga].SwCmndB) then begin
                        if (TPosCarga[SnPosCarga].estatus<=1)and(TPosCarga[SnPosCarga].ContOCC>0) then begin
                          TPosCarga[SnPosCarga].SwOCC:=false;
                        end
                        else if TPosCarga[SnPosCarga].ContOCC<=0 then begin
                          rsp:='Error al aplicar PRESET';
                          TPosCarga[SnPosCarga].SwOCC:=false;
                          TPosCarga[SnPosCarga].ContOCC:=0;
                          Swerr:=true;
                        end;
                      end
                      else SwAplicaCmnd:=false;
                    end;

                    if (not TPosCarga[SnPosCarga].SwOCC)and(not swerr) then begin
                      TPosCarga[SnPosCarga].SwOCC:=true;
                      TPosCarga[SnPosCarga].SwCmndB:=false;
                      if TPosCarga[SnPosCarga].ContOCC=0 then
                        TPosCarga[SnPosCarga].ContOCC:=3
                      else
                        dec(TPosCarga[SnPosCarga].ContOCC);
                      SwAplicaCmnd:=false;
                      if TPosCarga[SnPosCarga].ModoOpera='Prepago' then begin
                        try
                          SnImporte:=0;
                          SnLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                          if (SnLitros<1) then
                            SnLitros:=1;
                          if (SnLitros>999) then
                            SnLitros:=999;
                        except
                          rsp:='Error en Litros';
                        end;
                        TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                        TPosCarga[SnPosCarga].swarosmag:=false;
                        if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                          swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                          aros_cont:=0;
                          if (not swarosmag) then
                            rsp:='Aro magnético se encuentra desconectado';
                        end;
                        if rsp='OK' then begin
                          if (TPosCarga[SnPosCarga].estatus in [1,5,9]) then begin
                            xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
                            TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                            EnviaPreset(rsp,xcomb);
                          end
                          else begin
                            rsp:='Posicion de Carga no Disponible';
                            TPosCarga[SnPosCarga].swarosmag:=false;
                          end;
                        end;
                      end
                      else rsp:='No se encuentra en Modo Prepago';
                    end;
                  end
                  else swaplicacmnd:=false;
                end
                else rsp:='Posicion de Carga no Existe';
              end
              else rsp:='Posicion de Carga no Disponible';
            end
            // ORDENA FIN DE VENTA
            else if ss='FINV' then begin
              xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              rsp:='OK';
              if (xpos in [1..MaxPosCarga]) then begin
                TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
                if (TPosCarga[xpos].Estatus=3) (*or(TPosCarga[xpos].Estatus=1)*) then begin // EOT
                  if (not TPosCarga[xpos].swcargando) then begin
                    TPosCarga[xpos].finventa:=0;
                    ss:='R'+IntToClaveNum(xpos,2); // VENTA COMPLETA
                    for i:=1 to 4 do
                      TPosCarga[xpos].SwTotales[i]:=true;
                    if DMCONS.swemular then
                      EmularEstatus[xpos]:='1';
                    ComandoConsolaBuff(ss);
                    Q_Auxi.Active:=false;
                    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
                    Q_Auxi.SQL.Clear;
                    Q_Auxi.SQL.Add('Select Max(Folio) as Entero1 from DPVGMOVI');
                    Q_Auxi.SQL.Add('Where PosCarga='+inttostr(xpos));
                    Q_Auxi.Active:=true;
                    if Q_AuxiEntero1.AsInteger>0 then begin
                      xfolio:=Q_AuxiEntero1.AsInteger;
                      Q_Auxi.Active:=false;
                      Q_Auxi.SQL.Clear;
                      Q_Auxi.SQL.Add('Update DPVGMOVI set tipopago='+inttostr(TPosCarga[xpos].tipopago));
                      Q_Auxi.SQL.Add('Where Folio='+inttostr(xfolio));
                      Q_Auxi.ExecSQL;
                      TPosCarga[xpos].tipopago:=0;
                    end;
                    DespliegaPosCarga(xpos,true);
                  end
                  else begin
                    if (TPosCarga[xpos].swcargando)and(TPosCarga[xpos].Estatus=1) then begin
                      TPosCarga[xpos].swcargando:=false;
                      rsp:='OK';
                    end
                    else rsp:='Posicion no esta despachando';
                  end;
                end
                else begin // EOT
                  rsp:='Posicion aún no esta en fin de venta';
                end;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            // CMND: DESHABILITA POSICIOND DE CARGA
            else if ss='DPC' then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              if xpos in [1..MaxPosCarga] then
                TPosCarga[xpos].SwDesHabilitado:=true;
            end
            else if ss='HPC' then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              if xpos in [1..MaxPosCarga] then
                TPosCarga[xpos].SwDesHabilitado:=false;
            end
            // CMND: DESAUTORIZA VENTA DE COMBUSTIBLE
            else if (ss='DVC')or(ss='PARAR') then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              tposcarga[xpos].SwPrepago6:=false;
              if (TPosCarga[xpos].estatus in [2,9]) then begin
                ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
                if TPosCarga[xpos].estatus=9 then
                  TPosCarga[xpos].tipopago:=0;
                if DMCONS.swemular then
                  if xpos in [1..MaxPosCarga] then
                    if EmularEstatus[xpos]='2' then
                      EmularEstatus[xpos]:='8'
                    else
                      EmularEstatus[xpos]:='1';
              end;
            end
            else if (ss='REANUDAR') then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              if (TPosCarga[xpos].estatus in [8]) then begin
                ComandoConsolaBuff('G'+IntToClaveNum(xpos,2));
                if DMCONS.swemular then
                  if xpos in [1..MaxPosCarga] then
                    if EmularEstatus[xpos]='8' then
                      EmularEstatus[xpos]:='2';
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
            else rsp:='Comando no existe';
            if SwAplicaCmnd then begin
              if rsp='' then
                rsp:='OK';
              TabCmnd[xcmnd].SwResp:=true;
              TabCmnd[xcmnd].Respuesta:=rsp;
              DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
            end;
            if SwCerrar then
              Close;
          end;
        end;
        if not SwEsperaRsp then
          NumPaso:=0;
      except
        DespliegaMemo4('ERROR PASO 5');
        NumPaso:=0;
      end;
    end;
  except
    with DMCONS do begin
      if (T_Tcmb.State in [dsInsert,dsEdit]) then
        T_Tcmb.Cancel;
    end;
  end;
end;

procedure TFDISPAMPC.ProcesoComandoB(xResp:string);
var lineax,ss:string;
    xpos:integer;
begin
  Lineax:=xResp;
  LineaTimer:='B00';
  MaxPosCargaActiva:=NoElemStrSep(Lineax,' ')-3;
  for xpos:=1 to MaxPosCargaActiva do begin
    ss:=ExtraeElemStrSep(Lineax,xpos+1,' ');
    if length(ss)=2 then begin
      case ss[2] of
        '1':LineaTimer:=LineaTimer+'1';
        '2':LineaTimer:=LineaTimer+'5';
        '3':LineaTimer:=LineaTimer+'2';
        '4':LineaTimer:=LineaTimer+'9';
        '5':LineaTimer:=LineaTimer+'3';
        '8':LineaTimer:=LineaTimer+'0';
        '9':LineaTimer:=LineaTimer+'0';
        'A':LineaTimer:=LineaTimer+'8';
        else LineaTimer:=LineaTimer+'0';
      end;
    end;
  end;
end;

function Posicion7E(xstr:string;apartir:integer):integer;
var
    i:integer;
begin
  i:=apartir;
  repeat
    inc(i);
  until (ExtraeElemStrSep(xstr,i,' ')='7E')or(i>NoElemStrSep(xstr,' '));
  if i>NoElemStrSep(xstr,' ') then
    result:=0
  else result:=i;
end;

function ExtraeStrHex2(xstr:string; e1,e2:integer):string;
var ss,xres:string;
    i:integer;
begin
  xres:='';
  for i:=e1 to e2 do begin
    ss:=ExtraeElemStrSep(xstr,i,' ');
    xres:=xres+ss[2];
  end;
  result:=xres;
end;

(*
00 01 01 00 01 34 37 35 2E 35 37 30 7E         1 a 13
          m  p  4  7  5  .  5  7  0
33 33 2E 39 36 39 7E                           14 a 20
 3  3  .  9  6  9
31 34 2E 30 30 30 7E                           21 a 27
 1  4  .  0  0  0*)
procedure TFDISPAMPC.ProcesoComandoA(xResp:string);
var lineax,ss,simp,svol,spre:string;
    ini,fin:integer;
begin
  Lineax:=xResp;
  LineaTimer:=copy(lincmnd,1,3); // A + PosCarga
  LineaTimer:=LineaTimer+ExtraeStrHex2(xResp,5,5);    // Grade
  LineaTimer:=LineaTimer+'1';    // Nivel Precio

  ini:=6;
  fin:=Posicion7e(Lineax,ini)-1;
  ss:=ExtraeStrHex2(Lineax,ini,fin);
  simp:=LlenaStr(FiltraStrNum(ss),'D',8,'0');   // Importe

  ini:=fin+1;
  fin:=Posicion7e(Lineax,ini)-1;
  ss:=ExtraeStrHex2(Lineax,ini,fin);
  svol:=llenaStr(FiltraStrNum(ss),'D',8,'0');    //Volumen

  ini:=fin+1;
  fin:=Posicion7e(Lineax,ini)-1;
  ss:=ExtraeStrHex2(Lineax,ini,fin);
  spre:=llenaStr(FiltraStrNum(ss),'D',5,'0');    // Precio

  LineaTimer:=LineaTimer+svol+simp+spre;
end;


procedure TFDISPAMPC.Ap1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
begin
  ContadorAlarma:=0;
  Timer1.Enabled:=false;
  try
    SwEsperaRsp:=false;
    for I := 1 to Count do begin
      C:=Ap1.GetChar;
      LineaBuff:=LineaBuff+C;
    end;
    while (not FinLinea)and(Length(LineaBuff)>0) do begin
      c:=LineaBuff[1];
      delete(LineaBuff,1,1);
      if not swchecksum then begin
        Linea:=Linea+C;
        if c=Char(HexToInt('7F')) then // sigue checksum
          Swchecksum:=true;
      end
      else begin
        Linea:=Linea+C;
        FinLinea:=true;
        SwChecksum:=false;
      end;
    end;
    if FinLinea then begin
      SwComPro:=false;
      while (length(linea)>0)and(Linea[1]<>char(0)) do
        delete(Linea,1,1);
      LineaTimer:=StrToHexSep(Linea);
      DMCONS.AgregaLog('R '+LineaTimer);
      DespliegaMemo4('R '+LineaTimer);
      FinLinea:=false;
      if length(linea)>2 then begin
        if CalculaBcc(copy(linea,1,length(linea)-1))<>linea[length(linea)] then begin
          DMCONS.AgregaLog('R Error de Checksum');
          DespliegaMemo4('R Error de Checksum');
        end
        else begin
          Case CharCmnd of
          'B':ProcesoComandoB(LineaTimer);
          'A':ProcesoComandoA(LineaTimer);
          end;
          DMCONS.AgregaLog('R >> '+LineaTimer);
          ProcesaLinea;
        end;
      end
      else begin
        DMCONS.AgregaLog('R Error de Comunicion');
        DespliegaMemo4('R Error de Comunicion');
      end;
      Linea:='';
      SwEspera:=false;
    end
    else SwEspera:=true;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISPAMPC.ComandoConsolaBuff(ss:string);
begin
  if (SwComPro)and((Now-HoraComPro)>2*TmSegundo) then
    SwComPro:=false;
  if not SwComPro then begin
    SwComPro:=true;
    HoraComPro:=now;
    ComandoConsola(ss);
  end;
end;

procedure TFDISPAMPC.ComandoConsola(ss:string);
var s1,LinCmd2:string;
    xpos:integer;
begin
  DMCONS.AgregaLog('E >> '+ss);
  LinCmnd:=ss;
  CharCmnd:=LinCmnd[1];
  inc(ContadorAlarma);
  case CharCmnd of
    'B':LinCmd2:=ComandoB;
    'A':begin
          xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
          LinCmd2:=ComandoA(xpos);
        end;
    else exit;
  end;
  Timer1.Enabled:=false;
  try
    LinCmd2:=LinCmd2;
    s1:=StrToHexSep(LinCmd2);
    DMCONS.AgregaLog('E '+s1);
    DespliegaMemo4('E '+s1);
    SwEsperaRsp:=true;
    if not DMCONS.SwEmular then begin
      if Ap1.Open then
        Ap1.OutPut:=LinCmd2;
    end
    else begin
      DMCONS.AgregaLog('E '+ss);
      LineaEmular:=ss;
      exit;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;


procedure TFDISPAMPC.ListBox1Click(Sender: TObject);
var xp:integer;
begin
  LimpiaConsola;
  for xp:=1 to MaxPosCarga do
    DespliegaPosCarga(xp,true);
end;

procedure TFDISPAMPC.Restaurar1Click(Sender: TObject);
begin
  FDISPAMPC.Visible:=true;
end;

procedure TFDISPAMPC.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if SwCerrar then begin
    CanClose:=true;
  end
  else if DMCONS.SwEmular then begin
    CanClose:=true;
  end
  else begin
    CanClose:=false;
  end;
end;

procedure TFDISPAMPC.FormCreate(Sender: TObject);
begin
  SwReset:=false;
  SwCerrar:=false;
  SwConfDig:=true;
  SwInicio:=true;
  ContadorAlarma:=0;
  ListaCmnd:=TStringList.Create;
  SwEsperaRsp:=false;
end;

procedure TFDISPAMPC.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISPAMPC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ap1.Open:=false;
  Application.Terminate;
end;

procedure TFDISPAMPC.Timer1Timer(Sender: TObject);
var ss:string;
    i:integer;
begin
  try
    //if DMCONS.ManejaServicios='Si' then
    if not StaticText9.Visible then begin
      StaticText9.Caption:='Puerto: '+DMCONS.PuertoServicio;
      StaticText9.Visible:=true;
    end;
    if SwReset then begin
      inc(contreset);
      if ContReset=90 then begin
        DMCONS.DBGASCON.Connected:=false;
        swcerrar:=true; FDISPAMPC.Close;
      end;
    end;
    try
      with DMCONS do begin
        inc(ContadorTot);
        if (ContadorTot>=100) then begin
          ContadorTot:=0;
          inc(ContadorTotPos);
          if ContadorTotPos in [1..MaxPosCarga] then begin
            TPosCarga[ContadorTotPos].SwTotales[1]:=true;
            TPosCarga[ContadorTotPos].SwTotales[2]:=true;
            TPosCarga[ContadorTotPos].SwTotales[3]:=true;
            TPosCarga[ContadorTotPos].SwTotales[4]:=true;
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
      if (not swreset)and((Now-DMCONS.FechaHoraPrecio)>12*tmSegundo) then begin
        DMCONS.FechaHoraPrecio:=Now;
        with DMCONS do if AplicarPrecios then begin
          for i:=1 to MaxComb do with TabComb[i] do if Activo then begin
            Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
            Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=i;
            Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
            Q_AplicaPrecioF.ExecSQL;
          end;
          CargaPreciosFH(Now,true); // guarda precio actual como físico
          DespliegaPrecios;
          DBGrid3.Refresh;
          for i:=1 to MaxPosCarga do
            TPosCarga[i].ActualizarPrecio:=true;
        end;
      end;

      if NumPaso>1 then begin
        if NumPaso=2 then begin // si esta en espera de respuesta ACK
          inc(ContEsperaPaso2);     // espera hasta 5 ciclos
          if ContEsperaPaso2>MaxEspera2 then begin
            ContEsperaPaso2:=0;
            LineaTimer:='.A00..';  // de lo contrario provoca un NAK para que continue
            ProcesaLinea;       // el proceso con la siguiente solicitud
          end;
        end;
        if NumPaso=3 then begin // si esta en espera de respuesta ACK
          inc(ContEsperaPaso3);     // espera hasta 5 ciclos
          if ContEsperaPaso3>MaxEspera3 then begin
            ContEsperaPaso3:=0;
            LineaTimer:='.N00..';  // de lo contrario provoca un NAK para que continue
            ProcesaLinea;       // el proceso con la siguiente solicitud
          end;
        end;
        if NumPaso=4 then begin // si esta en espera de respuesta ACK
          inc(ContEsperaPaso4);     // espera hasta 5 ciclos
          if ContEsperaPaso4>3 then begin
            ContEsperaPaso4:=0;
            LineaTimer:=idNak;  // de lo contrario provoca un NAK para que continue
            ProcesaLinea;       // el proceso con la siguiente solicitud
          end;
        end;
        if NumPaso=5 then begin
          inc(ContEsperaPaso5);     // espera hasta 5 ciclos
          if ContEsperaPaso5>10 then begin
            ContEsperaPaso5:=0;
            LineaTimer:=idNak;  // de lo contrario provoca un NAK para que continue
            ProcesaLinea;       // el proceso con la siguiente solicitud
          end;
        end;
        exit;
      end;

      // Espera en el paso 0 hasta que reciba respuesta
      if NumPaso=1 then begin
        inc(ContEspera1);
        if ContEspera1>10 then begin
        end
        else exit;
      end;

      if not DMCONS.swemular then begin
        if Ap1.OutBuffUsed>0 then begin
          NumPaso:=0;
          exit;
        end;
      end;

      NumPaso:=1;
      StaticText5.Caption:=IntToStr(NumPaso);
      ss:='B00';
      ContEspera1:=0;
      SwEspera:=true;
      ComandoConsolaBuff(ss);
    finally
      if NotificationIcon1.Tag=0 then begin
        if ErrorInic then begin
          EsperaMiliSeg(3000);
          swcerrar:=true; FDISPAMPC.Close;
        end;
        NotificationIcon1.Tag:=1;
        FDISMENU.Visible:=false;
        FDISPAMPC.Visible:=false;
        NotificationIcon1.Show;
      end;
    end;
    if not DMCONS.SwEmular then begin
      if Ap1.Open then
        Label4x.Caption:='On'
      else
        Label4x.Caption:='Off';
      Label4x.Visible:=true;
    end;
  except
    DespliegaMemo4('ERROR TIMER1');
  end;
end;

procedure TFDISPAMPC.EnviaPreset(var rsp:string;xcomb:integer);
var xpos,xp:integer;
    ss:string;
    swlitros:boolean;
begin
  if (SnImporte>957)and(SnImporte<958) then
    SnImporte:=AjustaFloat(SnImporte,0);
  swlitros:=SnLitros>0.01;
  rsp:='OK';
  xpos:=SnPosCarga;
  if TPosCarga[xpos].SwDesHabilitado then begin
    rsp:='Posición Deshabilitada';
    exit;
  end;
  if not (TPosCarga[xpos].estatus in [1,5,9]) then begin
    rsp:='Posición no Disponible';
    DespliegaMemo4(rsp+' Pos: '+inttostr(xpos)+'   Estatus: '+inttostr(TPosCarga[xpos].estatus));
    exit;
  end;
  if TPosCarga[xpos].estatus=9 then begin
    ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
    Esperamiliseg(100);
  end;
  if snimporte>9900 then
    snimporte:=9900;
  if not swlitros then begin
    if (DigitosDispensario(xpos)=6)and(TPosCarga[xpos].NoComb=1) then begin
      if xcomb=0 then
        xcomb:=TPosCarga[xpos].Tcomb[1];
      if (dmcons.TabComb[xcomb].Precio>0.1) then begin
        Swlitros:=true;
        SnLitros:=AjustaFloat(SnImporte/dmcons.TabComb[xcomb].precio,3);
        SnImporte:=0;
      end;
    end;
  end;
  if (snimporte<=DMCONS.MaximoPresetPam)or(DigitosDispensario(xpos)=5)or(swlitros) then begin
    if DigitosDispensario(xpos)=5 then begin
      if not swlitros then begin // PRESET EN IMPORTE
        case DMCONS.DecimalesPresetPAM of
          0:ss:='P'+IntToClaveNum(xpos,2)+'0'+'1'+'000'+FiltraStrNum(FormatFloat('00000',snimporte))+'0';
          1:ss:='P'+IntToClaveNum(xpos,2)+'0'+'1'+'000'+FiltraStrNum(FormatFloat('0000.0',snimporte))+'0';
          else begin
              if snimporte>999.00 then
                snimporte:=999.00;
              ss:='P'+IntToClaveNum(xpos,2)+'0'+'1'+'000'+FiltraStrNum(FormatFloat('000.00',snimporte))+'0';
            end;
        end;
      end
      else begin // PRESET EN LITROS

      end;
    end
    else begin
      if not swlitros then begin // PRESET IMPORTE
        tposcarga[xpos].swprepago6:=true;
        ss:='P'+IntToClaveNum(xpos,2)+'0'+'1'+'000'+FiltraStrNum(FormatFloat('00000',snimporte))+'0';
      end
      else begin // PRESET LITROS
        for xp:=1 to 4 do
          if CombustibleEnPosicion(xpos,xp)=xcomb then
            ss:='P'+IntToClaveNum(xpos,2)+'1'+'1'+'00'+FiltraStrNum(FormatFloat('000.00',snlitros))+'0'+inttostr(xp);
      end;
    end;
    if not swlitros then begin
      if copy(ss,9,5)<'00010' then begin
        rsp:='Importe mínimo $10.00';
        exit;
      end;
    end;
    ComandoConsolaBuff(ss);
    EsperaMiliSeg(300);
    if DMCONS.ReautorizaPam='Si' then begin
      TPosCarga[xpos].CmndOcc:=ss;
      TPosCarga[xpos].HoraOcc:=now;
      DMCONS.AgregaLog('Guarda Comando: '+ss+' '+DMCONS.ReautorizaPam);
    end;
    if SwError then begin
      rsp:='Error al Activar Posición de Carga';
      exit;
    end;
    tposcarga[xpos].CtrlPreset:=true;
    tposcarga[xpos].CmndPreset:=ss;
    tposcarga[xpos].HoraPreset:=now;
  end
  else begin
    DespliegaMemo4('Autoriza Manual: '+inttostr(xpos));
    TPosCarga[xpos].SwPresetManual:=true;
  end;
  TPosCarga[xpos].SwPreset:=true;
  TPosCarga[xpos].ImportePreset:=SnImporte;
  if DMCONS.swemular then begin
    if EmularEstatus[xpos]='1' then begin
      EmularEstatus[xpos]:='2';
      TPosCarga[xpos].estatus:=2;
      TPosCarga[xpos].volumen:=SnImporte/5;
      TPosCarga[xpos].importe:=SnImporte;
      TPosCarga[xpos].precio:=5;
      TPosCarga[xpos].posactual:=1;
      TPosCarga[xpos].hora:=time;
    end;
  end;
end;

procedure TFDISPAMPC.Timer3Timer(Sender: TObject);
const timpo:array[0..4] of real = (50,100,150,200,30);
      tpos:array[0..2] of integer = (2,1,2);
var xpos,rr,nn,xpa:integer;
    lin:string;
    xvol,ximp,xpre:real;
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
              rr:=Random(12);
              if rr=1 then begin
                xpos:=Random(MaxPosCarga)+1;
                case EmularEstatus[xpos] of
                  '1':if TPosCarga[xpos].ModoOpera<>'Prepago' then begin
                        EmularEstatus[xpos]:='5';
                        rr:=Random(5);
                        TPosCarga[xpos].volumen:=Timpo[rr]/5;
                        TPosCarga[xpos].importe:=timpo[rr];
                        TPosCarga[xpos].precio:=5;
                        TPosCarga[xpos].hora:=time;
                        rr:=Random(MCxP);
                        nn:=tpos[rr];
                        if nn>TPosCarga[xpos].NoComb then
                          nn:=TPosCarga[xpos].NoComb;
                        if nn=0 then
                          nn:=1;
                        TPosCarga[xpos].posactual:=nn;
                        if TabComb[TPosCarga[xpos].TComb[nn]].precio>0.01 then begin
                          if (TPosCarga[xpos].ActualizarPrecio)and(not PrimeraCarga) then
                            TPosCarga[xpos].precio:=TabComb[TPosCarga[xpos].TComb[nn]].precioant
                          else
                            TPosCarga[xpos].precio:=TabComb[TPosCarga[xpos].TComb[nn]].precio;
                          TPosCarga[xpos].volumen:=DivideFloat(TPosCarga[xpos].importe,TPosCarga[xpos].precio);
                        end;
                      end;
                  '2':EmularEstatus[xpos]:='3';
                end;
              end
              else begin
                for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
                  if (EmularEstatus[xpos]='2')and((Time-Hora)>15*tmSegundo)then
                    EmularEstatus[xpos]:='3';
                end;
              end;
              Linea:='B00'+EmularEstatus;
            end;
        'A':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              xpa:=TPosCarga[xpos].PosActual;
              if not (xpa in [1..MCxP]) then
                xpa:=1;
              ximp:=TPosCarga[xpos].importe;
              xpre:=5;
              case TPosCarga[xpos].TComb[xpa] of
                1:xpre:=6.33;
                2:xpre:=7.47;
                3:xpre:=5.25;
              end;
              xvol:=dividefloat(ximp,xpre);
              Linea:=copy(Lin,1,3)+IntToStr(TPosCarga[xpos].TComb[xpa])+'1'
                     +FiltraStrNum(FormatFloat('00000.000',xvol))
                     +FiltraStrNum(FormatFloat('000000.00',ximp))
                     +'0'+FiltraStrNum(FormatFloat('0.000',xpre))+'0';
            end;
        '@':begin
              if copy(lin,2,2)='10' then
                Linea:=copy(Lin,1,6)+'3'
                      +'1'+'0123033280'+'0900992050'+'7400'+'7400'
                      +'2'+'0123033280'+'0900992050'+'7400'+'7400'
                      +'3'+'0123033280'+'0900992050'+'7400'+'7400';
            end;
        'C':begin
              Linea:=copy(Lin,1,5)+'0012303328009009920507400';
            end;
        'P':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              if EmularEstatus[xpos]='1' then begin
                EmularEstatus[xpos]:='2';
                TPosCarga[xpos].estatus:=2;
                TPosCarga[xpos].volumen:=SnImporte/5;
                TPosCarga[xpos].importe:=SnImporte;
                TPosCarga[xpos].precio:=5;
                TPosCarga[xpos].posactual:=1;
                TPosCarga[xpos].hora:=time;
                Linea:=' ';
              end
              else Linea:=' ';
            end;
        'S':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              if EmularEstatus[xpos]='1' then
                EmularEstatus[xpos]:='9';
              Linea:=idAck;
            end;
        'E':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              if EmularEstatus[xpos]='9' then
                EmularEstatus[xpos]:='1';
              Linea:=idAck;
            end;     
        'G':Linea:=idAck;
        else exit;
      end;
      if length(linea)>1 then
        LineaTimer:=idStx+Linea+idEtx+' '
      else
        LineaTimer:=Linea;
      DMCONS.AgregaLog('R '+LineaTimer);
      ProcesaLinea;
      SwEspera:=false;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISPAMPC.registro(valor:integer;variable:string);
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

procedure TFDISPAMPC.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISPAMPC.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISPAMPC.lee_registro;
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

  
procedure TFDISPAMPC.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISPAMPC.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    for i:=1 to NoComb do begin
      if TPos[i]=xposcarga then
        result:=TComb[i];
    end;
  end;
end;

procedure TFDISPAMPC.ListBoxPC1DblClick(Sender: TObject);
var xpos:integer;
begin
  if DMCONS.swemular then begin
    xpos:=strtointdef(StaticText1.Caption,1);
    if EmularEstatus[xpos]='1' then
      EmularEstatus[xpos]:='0'
    else if EmularEstatus[xpos]='0' then
      EmularEstatus[xpos]:='1';
    DespliegaPosCarga(xpos,true);
  end;
end;

procedure TFDISPAMPC.ListBoxPC2Click(Sender: TObject);
var xpos:integer;
begin
  if DMCONS.swemular then begin
    xpos:=strtointdef(StaticText2.Caption,1);
    if EmularEstatus[xpos]='1' then
      EmularEstatus[xpos]:='0'
    else if EmularEstatus[xpos]='0' then
      EmularEstatus[xpos]:='1';
    DespliegaPosCarga(xpos,true);
  end;
end;

procedure TFDISPAMPC.ListBoxPC3Click(Sender: TObject);
var xpos:integer;
begin
  if DMCONS.swemular then begin
    xpos:=strtointdef(StaticText3.Caption,1);
    if EmularEstatus[xpos]='1' then
      EmularEstatus[xpos]:='0'
    else if EmularEstatus[xpos]='0' then
      EmularEstatus[xpos]:='1';
    DespliegaPosCarga(xpos,true);
  end;
end;

procedure TFDISPAMPC.ListBoxPC4Click(Sender: TObject);
var xpos:integer;
begin
  if DMCONS.swemular then begin
    xpos:=strtointdef(StaticText4.Caption,1);
    if EmularEstatus[xpos]='1' then
      EmularEstatus[xpos]:='0'
    else if EmularEstatus[xpos]='0' then
      EmularEstatus[xpos]:='1';
    DespliegaPosCarga(xpos,true);
  end;
end;

function TFDISPAMPC.DamePorcientoComb(xcomb:integer):integer;
var xval:integer;
begin
  result:=0;
  try
    with DMCONS do begin
      Q_Auxi.Active:=false;
      Q_AuxiStr10.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Max(Con_ProductoPrecio) as Str10 from DPVGTCMB');
      Q_Auxi.SQL.Add('Where Clave='+inttostr(xcomb));
      Q_Auxi.Active:=true;
      xval:=StrToIntDef(Q_AuxiStr10.AsString,0);
      if (xval>=0)and(xval<=9) then
        result:=xval;
      Q_Auxi.Active:=false;
    end;
  except
  end;
end;

procedure TFDISPAMPC.Button3Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

end.

