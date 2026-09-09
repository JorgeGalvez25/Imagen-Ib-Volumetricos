unit UDISIGM;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry;

Const MaxEsperaRsp=5;
      NivelPrecioContado='2';
      NivelPrecioCredito='1';
      SegundosAutoriza = 2;
      ModoConsola=true;

type
  TFDISIGM = class(TForm)
    ApdComPort1: TApdComPort;
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
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    PopupMenu5: TPopupMenu;
    CerrarCuenta1: TMenuItem;
    CerrarCuenta2: TMenuItem;
    TabSheet1: TTabSheet;
    RadioGroup1: TRadioGroup;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText15: TStaticText;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn2: TBitBtn;
    Timer3: TTimer;
    ImageList1: TImageList;
    Memo2: TMemo;
    CerrarCuenta3: TMenuItem;
    CerrarCuenta4: TMenuItem;
    Memo4: TMemo;
    Panel2: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
    StaticText16: TStaticText;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
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
    Label2: TLabel;
    Button1: TButton;
    Timer2: TTimer;
    PageControl1: TPageControl;
    StaticText7: TStaticText;
    Bevel1: TBevel;
    Label4x: TLabel;
    Timer4: TTimer;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    SpeedButton3: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure ApdComPort1TriggerAvail(CP: TObject; Count: Word);
    procedure Timer1Timer(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure NotificationIcon1DblClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBoxPC1DblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    ContImp:integer;
    SwInicio:boolean;
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwBcc,
    FinLinea:boolean;
    ContBuffLleno,
    errbcc:integer;
    swprocesando:boolean;
    SnPosCarga:integer;
    SnImporte:real;
    EmularEstatus,
    UltimoEstado,
    LineaEmular:string;
    ContadorAlarma:integer;
    contguardaval:integer;
    SwEmulaFalla:boolean;
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
    procedure PonTipoServicio(xtipo:string);
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    procedure DespliegaMemo4(lin:string);
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    function DamePosicion(xnumpos:integer):integer;
    procedure EnviaPreset(var rsp:string;estarjeta:boolean);
    procedure Comando_S_Autorizado(xpos:integer);
    procedure Comando_S_Error(xpos:integer;rsp:string);
  end;

type
     tiposcarga = record
       NumPos   :integer;
       estatus  :integer;
       descestat:string[20];
       importeant,
       volumenant,
       precioant :real;
       importe,
       volumen,
       precio   :real;
       impopreset:real;
       Isla,
       PosAnt,
       PosActual:integer; // Posicion del combustible en proceso: 1..NoComb
       estatusant:integer;
       NoComb   :integer; // Cuantos combustibles hay en la posicion
       Estat_Cons:char;
       TComb    :array[1..2] of integer; // Claves de los combustibles
       TPos     :array[1..2] of integer;
       TMang     :array[1..2] of integer;
       TotalLitros:array[1..2] of real;
       ActPrecio:array[1..2] of Boolean;
       ActFlujo:array[1..2] of Boolean;
       TPreciosCon :array[1..2] of real;
       TPreciosCre :array[1..2] of real;
       SwImp,
       SwDesp:boolean;
       SwA:boolean;
       Hora:TDateTime;
       SwInicio1:boolean;
       SwInicio2:boolean;
       SwPreset,
       SwTarjeta,
       SwCargaTotales,
       SwCargaPreciosCon,
       SwCargaPreciosCre,
       IniciaCarga,
       SwPrepago:boolean;
       ModoPago:char;
       MontoTarjeta:real;
       IntentosTotales:byte;
       Mensaje:string[30];
       swactualizar,
       swcargando:boolean;
       SwActivo,
       SwDesHabilitado:boolean;
       ValorFlujo:string[5];
       ContadorFin   :integer;
       ImportePrev  :real;
     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;


var
  FDISIGM: TFDISIGM;
  TPosCarga:array[1..32] of tiposcarga;
  ApPosCarga,
  ContPrecio,
  MaxPosCarga:integer;
  nPosIni,nPosFin:integer;
  AvanceBar:integer;
  SwSolOk:boolean;
  ContDA,
  StErrSol:integer;
  ruta_db:string;
  SwDespPrecioCred:boolean;
  SwCerrar    :boolean;
  // CONTROL TRAFICO COMANDOS
  ListaCmnd    :TStrings;
  LinCmnd      :string;
  CharCmnd     :char;
  SwEsperaRsp  :boolean;
  ContEsperaRsp:integer;
  NumPaso      :integer;
  // CONTROL COMANDO "S"
  SwComando_S  :boolean;
  ContComando_S:integer;
  Folio_S,
  PosCarga_S   :integer;
  Origen_S     :char;
  // CONTROL COMANDO "U"
  SwComando_U  :boolean;
  ContComando_U:integer;
  PosCarga_U   :integer;
  Manguera_U   :integer;
  // CONTROL COMANDO "F"
  SwComando_F  :boolean;
  ContComando_F:integer;
  PosCarga_F   :integer;
  Manguera_F   :integer;


implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UAutoriza2, DDMCONS2, UDISMENU;

{$R *.DFM}

procedure TFDISIGM.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=40 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISIGM.DespliegaPrecios;
var i:integer;
begin
  with DMCONS do begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Precios Actuales: ');
    for i:=1 to MaxComb do with TabComb[i] do if Activo then
      Memo1.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
    Q_CombIb.Active:=false;
    Q_CombIb.Active:=true;
    DBGrid3.Refresh;
  end;
end;

procedure TFDISIGM.PonTipoServicio(xtipo:string);
var xp:integer;
begin
  with DMCONS do begin
    if xtipo='Nocturno' then begin
      StaticText15.Caption:='Servicio Nocturno';
      StaticText15.Color:=clNavy;
      StaticText15.Font.Color:=clWhite;
      SwNocturno:=true;
      RadioGroup1.ItemIndex:=1;
      for xp:=nPosIni to nPosFin do with TPosCarga[xp] do
        if estatus=1 then
          ComandoConsolaBuff('K'+IntToClaveNum(NumPos,2)+'2',true); // Modo Prepago
    end
    else begin
      StaticText15.Caption:='Servicio Diurno';
      StaticText15.Color:=clYellow;
      StaticText15.Font.Color:=clBlack;
      SwNocturno:=false;
      RadioGroup1.ItemIndex:=0;
      for xp:=nPosIni to nPosFin do with TPosCarga[xp] do
        if estatus=1 then
          ComandoConsolaBuff('K'+IntToClaveNum(NumPos,2)+'1',false); // Modo Postpago
    end;
  end;
end;

procedure TFDISIGM.IniciaBaseDeDatos;
var i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    try
      if not swemular then begin
        ApdComPort1.Open:=false;
        ApdComPort1.ComNumber:=ptPuerto;
        ApdComPort1.Baud:=ptBaudios;
        case ptParidad[1] of
          'N':ApdComPort1.Parity:=pNone;
          'E':ApdComPort1.Parity:=pEven;
          'O':ApdComPort1.Parity:=pOdd;
        end;
        ApdComPort1.DataBits:=ptBitsDatos;
        ApdComPort1.StopBits:=ptBitsParada;
        ApdComPort1.Open:=true;
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
            ProductoPrecio:=Q_CombIbCon_ProductoPrecio.AsString;
            AgruparCon:=Q_CombIbAgrupar_con.AsInteger;
          end;
        end;
        Q_CombIb.Next;
      end;
      Q_Fact1.Active:=false;Q_Fact1.Active:=true;
      Q_Fact2.Active:=false;Q_Fact2.Active:=true;
      CargaPreciosFH(Now,true); // guarda precio actual como físico
      Q_CombIb.Active:=false;
      Q_CombIb.Active:=true;
      DespliegaPrecios;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISIGM.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum,posi,posf:integer;
    existe:boolean;
begin
  with DMCONS do begin
    ListView1.Items.Clear;
    ApPosCarga:=0;
    MaxPosCarga:=0;
    nPosIni:=1;
    for i:=1 to 32 do with TPosCarga[i] do begin
      ContadorFin:=0;
      NumPos:=i;
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      Estat_Cons:=' ';
      SwInicio1:=true;
      SwInicio2:=true;
      IniciaCarga:=false;
      SwPrepago:=false;
      SwPreset:=false;
      SwTarjeta:=false;
      Mensaje:='';
      importe:=0;
      importeant:=0;
      impopreset:=0;
      volumen:=0;
      precio:=0;
      for j:=1 to 2 do begin
        TotalLitros[i]:=0;
        TPreciosCon[i]:=0;
        TPreciosCre[i]:=0;
        ActPrecio[i]:=false;
        ActFlujo[i]:=false;
      end;
      SwCargando:=false;
      SwActualizar:=false;
      SwCargaTotales:=true;
      SwCargaPreciosCon:=true;
      SwCargaPreciosCre:=true;
      IntentosTotales:=0;
      SwDeshabilitado:=false;
      SwActivo:=false;
    end;
    // CARGA DEFAULTS IGM
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
    TL_Tcmb.Active:=true;
    while not TL_Tcmb.Eof do begin
      TL_Tcmb.Edit;
      if (TL_TcmbCon_ProductoPrecio.AsString<>'1') and
         (TL_TcmbCon_ProductoPrecio.AsString<>'2') then
      begin
        if (TL_TcmbClave.AsInteger in [1..2]) then
          TL_TcmbCon_ProductoPrecio.AsInteger:=TL_TcmbClave.AsInteger
        else
          TL_TcmbCon_ProductoPrecio.AsInteger:=1;
      end;
      TL_Tcmb.Post;
      TL_Tcmb.Next;
    end;
    // FIN
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xisla:=Q_BombIbIsla.asinteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      xcomb:=Q_BombIbCombustible.AsInteger;
      if Q_BombIbCon_DigitoAjuste.AsInteger>0 then
        TPosCarga[xpos].NumPos:=Q_BombIbCon_DigitoAjuste.AsInteger;
      if xpos>MaxPosCarga then begin
        MaxPosCarga:=xpos;
        ListView1.Items.Add;
        ListView1.Items[MaxPosCarga-1].Caption:=IntToClaveNum(TPosCarga[xpos].NumPos,2);
        ListView1.Items[MaxPosCarga-1].ImageIndex:=0;
        T_ConsIb.Active:=true;
        if not T_ConsIb.Locate('PosCarga',xpos,[]) then begin
          T_ConsIb.Insert;
          T_ConsIbPosCarga.AsInteger:=xpos;
          T_ConsIbMonVol.AsString:='M';
          T_ConsIbValor.AsFloat:=0;
          T_ConsIbEstatus.AsString:='F';
          T_ConsIbPosicion.AsInteger:=1;
          T_ConsIb.Post;
          T_ConsIb.active:=false;
        end;
      end;
      with TPosCarga[xpos] do begin
        Isla:=xisla;
        SwDesp:=false;
        SwA:=false;
        existe:=false;
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
        end;
      end;
      Q_BombIb.Next;
    end;
    nPosFin:=MaxPosCarga;
    T_ConsIb.Active:=true;
    try
      while not T_ConsIb.Eof do begin
        if T_ConsIbEstatus.AsString='P' then begin
          T_ConsIb.Edit;
          T_ConsIbEstatus.AsString:='F';
          T_ConsIb.post;
        end;
        T_ConsIb.Next;
      end;
    finally
      T_ConsIb.Active:=false;
    end;
  end;
  ListBox1.Items.Clear;
  xnum:=(MaxPosCarga)div(4);
  if (MaxPosCarga)mod(4)>0 then
    inc(xnum);
  for i:=1 to xnum do begin
    if i<xnum then begin
      posi:=i*4-3;
      posf:=i*4;
      posi:=TPosCarga[posi].NumPos;
      posf:=TPosCarga[posf].NumPos;
      ListBox1.Items.add('Posiciones '+IntToClaveNum(posi,2)+' - '+IntToClaveNum(posf,2))
    end
    else begin
      posi:=i*4-3;
      posf:=MaxPosCarga;
      posi:=TPosCarga[posi].NumPos;
      posf:=TPosCarga[posf].NumPos;
      ListBox1.Items.add('Posiciones '+IntToClaveNum(posi,2)+' - '+IntToClaveNum(posf,2));
    end;
  end;
end;


procedure TFDISIGM.FormShow(Sender: TObject);
var xposini,xposfin:integer;
    xstr:string;
begin
  if SwInicio then begin
    try
      ContDA:=0;
      SwDespPrecioCred:=false;
      ErrorInic:=true;
      SwInicio:=false;
      IniciaBaseDeDatos;
      DMCONS.ChecaTablas;
      ListBox1.ItemIndex:=0;
      SwProcesando:=false;
      SwEsperaRsp:=false;
      StaticText6.Caption:='';
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
      if DMCONS.RangoPosiciones<>'' then with DMCONS do begin
        xstr:=ExtraeElemStrSep(DMCONS.RangoPosiciones,1,'-');
        xposini:=StrToIntDef(xstr,0);
        if xposini>0 then
          nPosIni:=xposINI;
        xstr:=ExtraeElemStrSep(DMCONS.RangoPosiciones,2,'-');
        xposfin:=StrToIntDef(xstr,0);
        if xposfin>0 then
          nPosFin:=xposFin;
      end;
      ListBox1.SetFocus;
      Timer1.Enabled:=true;
      Timer2.Enabled:=true;
      DMCONS.T_ConfIb.Active:=true;
      try
        if copy(DMCONS.T_ConfIbDISPENSARIOS.AsString,1,1)<>'A' then
          PonTipoServicio('Diurno')
        else
          PonTipoServicio('Nocturno');
      finally
        DMCONS.T_ConfIb.Active:=false;
      end;
      if DMCONS.SwEmular then begin
        LineaEmular:='';
        EmularEstatus:=LlenaStr('','N',MaxPosCarga*2,'1');
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

function TFDISIGM.StringCom(ss:string):string;
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

function TFDISIGM.CalculaBCC(ss:string):char;
var i,n,m:integer;
begin
  n:=0;
  for i:=1 to length(ss) do
    n:=n+ord(ss[i]);
  m:=(n)mod(256);
  result:=char(256-m);
end;

procedure TFDISIGM.LimpiaConsola;
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

procedure TFDISIGM.DespliegaPosCarga(xpos:integer);
var i,xp,rango,posi,posf,xcomb,xc:integer;
    ss,lin,xnombre:string;
    xprecio:real;
    pscon:array[1..2] of string;
    pscre:array[1..2] of string;
begin
  try
    try
      if not (xpos in [nPosIni..nPosFin]) then
        exit;
      StaticText5.Caption:=IntToStr(ApPosCarga)+' '+IntToStr(NumPaso);
      rango:=ListBox1.ItemIndex+1;
      if rango=0 then
        rango:=1;
      posi:=rango*4-3;
      posf:=rango*4;
      with TPosCarga[xpos] do begin
        xcomb:=CombustibleEnPosicion(xpos,PosActual);
        if xcomb in [1..maxcomb] then
          xnombre:=DMCONS.TabComb[xcomb].Nombre;
        if xpos in [posi..posf] then begin
          i:=xpos-posi+1;
          TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(TPosCarga[xpos].NumPos,2);
          if not SwDesHabilitado then begin
            TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:=descestat;
            case estatus of
              5:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClLime;
              1:if not SwPreset then
                  TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClRed
                else
                  TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClGray;
              2:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClGray;
              3,4:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClYellow;
              7,10:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClBlue;
              else TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
            end;
          end
          else begin
            TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:='Deshabilidado';
            TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
          end;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Clear;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('###,##0.00',importe)+' Pesos');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',precio)+' $/Lts');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(xnombre);
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
          ss:='';
          for xp:=1 to NoComb do begin
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                     ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3));
            // precio contado
            if TPreciosCon[xp]>0.01 then
              pscon[xp]:=formatonumero(tprecioscon[xp],6,3)
            else
              pscon[xp]:='------';
            if ActPrecio[xp] then
              pscon[xp]:=pscon[xp]+'*';
            // precio credito
            if TPreciosCre[xp]>0.01 then
              pscre[xp]:=formatonumero(tprecioscre[xp],6,3)
            else
              pscre[xp]:='------';
            if ActFlujo[xp] then
              pscre[xp]:=pscre[xp]+'<='
            else
              pscre[xp]:=pscre[xp]+'  ';
          end;
          // precio contado
          if NoComb=1 then
            ss:=pscon[1]
          else if TPos[1]<TPos[2] then
            ss:=pscon[1]+'     '+pscon[2]
          else
            ss:=pscon[2]+'     '+pscon[1];
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(ss);
          // precio credito
          if NoComb=1 then
            ss:=pscre[1]
          else if TPos[1]<TPos[2] then
            ss:=pscre[1]+'      '+pscre[2]
          else
            ss:=pscre[2]+'      '+pscre[1];
          if SwDespPrecioCred then
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(ss);
        end;
      end;

      // Refresca Listas
      for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
        if not DMCONS.SwNocturno then begin
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
        ListView1.Items[i-1].Caption:=IntToClaveNum(TPosCarga[i].NumPos,2)+'-'+IntToStr(Estatus)+
                      '  '+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ');
        if SwDesp then with DMCONS do begin
          SwTarjeta:=false;
          SwDesp:=false;
          ImporteAnt:=0;
          if (importe>0.01) then begin
            SwCargaTotales:=true;
            IntentosTotales:=0;
            try
              try
                T_MoviIb.Active:=true;
                T_MoviIb.Insert;
                T_MoviIbFecha.AsDateTime:=date;
                T_MoviIbHora.AsDateTime:=now;
                T_MoviIbHoraStr.AsString:=HoraPaq(T_MoviIbHora.AsDateTime);
                T_MoviIbPosCarga.AsInteger:=i;
                xprecio:=dividefloat(importe,volumen);
                xcomb:=CombustibleEnPosicion(i,PosActual);
                if TabComb[xcomb].Agruparcon>0 then begin
                  xc:=TabComb[xcomb].Agruparcon;
                  if TabComb[xc].Activo then
                    xcomb:=xc;
                end;
                if (abs(TabComb[xcomb].Precio-xPrecio)>0.50) then begin
                  for xc:=1 to MaxComb do begin
                    if (abs(TabComb[xc].Precio-xPrecio)<=0.50) then
                      xcomb:=xc;
                  end;
                end;
                if SwImp then begin
                  SwImp:=false;
                  Inc(ContImp);
                  T_MoviIbTransaccion.AsInteger:=ContImp;
                end;
                T_MoviIbCombustible.AsInteger:=xcomb;
                T_MoviIbVolumen.AsFloat:=AjustaFloat(Volumen,3);
                T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
                T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLitros[1],3);
                T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLitros[2],3);
                T_MoviIbManguera.AsInteger:=TMang[PosActual];
                T_MoviIbTag.AsInteger:=0;
                T_MoviIb.post;
              finally
                xp:=Q_Fact1PosCarga.AsInteger;
                Q_Fact1.Active:=false;Q_Fact1.Active:=true;
                Q_Fact1.Locate('PosCarga',xp,[]);

                xp:=Q_Fact2PosCarga.AsInteger;
                Q_Fact2.Active:=false;Q_Fact2.Active:=true;
                Q_Fact2.Locate('PosCarga',xp,[]);
                T_MoviIb.Active:=false;
              end;
            except
              DespliegaMemo4(fechapaq(date)+' '+HoraPaq(time)+' '+lin);
            end;
            T_ConsIb.Active:=true;
            try
              T_ConsIb.Refresh;
              if T_ConsIb.Locate('PosCarga',i,[]) then begin
                T_ConsIb.Edit;
                // publica valores
                T_ConsIbVolumen.AsFloat:=volumen;
                T_ConsIbImporte.AsFloat:=importe;
                T_ConsIbPrecio.AsFloat:=precio;
                T_ConsIbCombustible.AsString:=xnombre;
                case estatus of
                  0:T_ConsIbEstado.AsInteger:=0; // Sin Comunicación
                  1,2:T_ConsIbEstado.AsInteger:=1; // Inactivo (Idle)
                  5:T_ConsIbEstado.AsInteger:=2; // Cargando (In Use)
                  7,10:T_ConsIbEstado.AsInteger:=3; // Fin de Carga (Used)
                  3,4:T_ConsIbEstado.AsInteger:=5; // Llamando (Calling)
                  8:T_ConsIbEstado.AsInteger:=9; // Autorizado
                  6:T_ConsIbEstado.AsInteger:=8; // Detenido (Stoped)
                  else T_ConsIbEstado.AsInteger:=0;
                end;
                T_ConsIbOtros.AsString:=FormatFloat('#######0.00',totallitros[1])+
                                        '|'+FormatFloat('#######0.00',totallitros[2]);
                // fin publica valores
                T_ConsIbEstatus.AsString:='F';
                T_ConsIb.Post;
              end;
            finally
              T_ConsIb.Active:=false;
            end;
          end;
        end;
      end;
    finally
      with DMCONS do begin
        if (T_MoviIb.State in [dsInsert,dsEdit]) then
          T_MoviIb.Cancel;
        if (T_ConsIb.State in [dsInsert,dsEdit]) then
          T_ConsIb.Cancel;
      end;
    end;
  except
  end;
end;

Function EjecutaCorte:string;
var rsp,Descrsp:string;
    xpos,xpr,xcomb:integer;
begin
  with DMCONS do begin
    rsp:='OK';
    try
      SwCorteTurno:=false;
      SwCorteOk:=true;
      if not SwCorteParcial then begin
        for xpos:=nPosIni to nPosFin do begin
          if (TPosCarga[xpos].isla=xIslaCorte)or(xIslaCorte=0) then begin
            if TPosCarga[xpos].swcargando then begin
              SwCorteOk:=false;
              DescRsp:='Existen dispensarios cargando';
            end;
          end;
        end;
      end;
      if SwCorteOk then begin
        T_Corte.Active:=true;
        try
          for xpos:=nPosIni to nPosFin do with TPosCarga[xpos] do begin
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

procedure TFDISIGM.ProcesaLinea;
label uno;
var lin,ss,rsp,xestado,ss2:string;
    simp,spre,s1,s2,s3:string[20];
    i,xpos,i2,ii,xp:integer;
    xposactual,
    xpr,xcomb,folio:integer;
    ximporte:real;
    xLista:TStrings;
    xdif,
    ximpo,xvol,xprecio:real;
    xprec,totlts:array[1..4] of real;
begin
  try
    if LineaTimer='' then
      exit;
    SwEsperaRsp:=false;
    ContEsperaRsp:=0;
    if length(LineaTimer)>4 then begin
      while (LineaTimer[1]<>idSTX)and(length(LineaTimer)>3) do
        delete(LineaTimer,1,1);
      while (LineaTimer[length(lineatimer)]<>idETX)and(length(LineaTimer)>3) do
        delete(LineaTimer,length(lineatimer),1);
      lin:=copy(lineaTimer,2,length(lineatimer)-2);
    end
    else
      lin:=LineaTimer;
    LineaTimer:='';
    if lin='' then
      exit;
    case lin[1] of
     'B':begin // estatus de una posicion
           NumPaso:=1;
           xpos:=StrToIntDef(copy(lin,2,2),0);
           xpos:=DamePosicion(xpos);
           if xpos in [nPosIni..nPosFin] then begin
             try
               ss:=copy(lin,4,2);
               with TPosCarga[xpos] do begin
                 PosActual:=StrToIntDef(ss[1],0);
                 if PosActual=0 then begin
                   PosActual:=1;
                   for i:=1 to NoComb do begin
                     xcomb:=CombustibleEnPosicion(xpos,i);
                     if abs(precio-DMCONS.TabComb[xcomb].precio)<0.1 then
                       PosActual:=i;
                   end;
                 end;
                 if estatusant<>estatus then begin
                   SwPreset:=false;
                   SwA:=true; //CAMBIO
                 end;
                 estatusant:=estatus;
                 if ss[2]='g' then
                   estatus:=10
                 else
                   estatus:=StrToIntDef(ss[2],0);
                 Mensaje:='Pos = '+inttostr(posactual);
                 if estatus=5 then
                   swcargando:=true;
                 if (estatus=0)and(SwActivo) then begin
                   if (estatusant in [1..10]) then
                     ContDA:=0
                   else
                     inc(ContDA);
                   if ContDA=5 then begin
                     DMCONS.RegistraBitacora2(1,'Desactivación de Dispensario '+inttostr(xpos));
                     SwActivo:=false;
                   end;
                 end
                 else if (estatus in [1..10])and(not SwActivo) then begin
                   if (estatusant=0) then
                     DMCONS.RegistraBitacora2(1,'Activación de Dispensario '+inttostr(xpos));
                   SwActivo:=true;
                 end;
                 case estatus of
                   0:descestat:='---';
                   1:begin
                       descestat:='Inactivo';
                       if (estatusant<>1) then begin
                         if not DMCONS.swnocturno then begin
                           ss:='K'+IntToClaveNum(NumPos,2)+'1'; // Modo PostPago
                           ComandoConsolaBuff(ss,false);
                           if swtarjeta then
                             ComandoConsolaBuff(ss,false);
                         end
                         else begin
                           ComandoConsolaBuff('K'+IntToClaveNum(NumPos,2)+'2',false); // Modo Prepago
                         end;
                       end
                       else if (DMCONS.swnocturno)and(ModoPago<>'2') then
                         ComandoConsolaBuff('K'+IntToClaveNum(NumPos,2)+'2',false);
                       SwTarjeta:=false;
                     end;
                   2:descestat:='Autorizado';
                   3:descestat:='Pistola Levantada';
                   4:descestat:='Listo para Despachar';
                   5:begin
                       if estatusant<>5 then begin
                         contadorfin:=0;
                         importeprev:=0;
                       end;
                       descestat:='Despachando';
                       IniciaCarga:=true;
                     end;
                   6:descestat:='Suspendido';
                   7:descestat:='Fin de Venta';
                   8:descestat:='Venta Pendiente';
                   9:descestat:='Error';
                  10:descestat:='Impresión Ticket';
                 end;
               end;
             except
             end;
           end;
           DespliegaPosCarga(ApPosCarga);
           // Actualiza Precios
           with TPosCarga[xpos] do begin
             for i:=1 to NoComb do begin
               if (ActPrecio[i])and(Estatus=1) then with DMCONS do begin
                 if not SwComando_U then begin
                   ss:='U'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+NivelPrecioContado+IntToStr(TPos[i])+
                       FiltraStrNum(FormatoNumeroSinComas(TabComb[TComb[i]].precio,5,3));
                   ComandoConsolaBuff(ss,false);
                   SwComando_U:=true;
                   ContComando_U:=0;
                   PosCarga_U:=xpos;
                   Manguera_U:=i;
                 end;
               end
               else if (ActFlujo[i])and(Estatus=1) then with DMCONS do begin
                 if not SwComando_F then begin
                   ss:='U'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+NivelPrecioCredito+IntToStr(TPos[i])+
                       ValorFlujo;
                   ComandoConsolaBuff(ss,false);
                   SwComando_F:=true;
                   ContComando_F:=0;
                   PosCarga_F:=xpos;
                   Manguera_F:=i;
                 end;
               end;
             end;
           end;
           // Checa las posiciones que estan solicitando autorizacion
           with TPosCarga[xpos] do begin
             case Estatus of
               1:begin
                   if SwInicio1 then begin
                     if ModoConsola then begin
                       if not DMCONS.SwNocturno then
                         ComandoConsolaBuff('K'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+'1',false)
                       else
                         ComandoConsolaBuff('K'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+'2',false);
                                  // Postpago = 1
                                  // Prepago = 2
                       ComandoConsolaBuff('L'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+NivelPrecioContado,false); // Nivel de Precios
                     end;
                     SwInicio1:=false;
                     SwPrepago:=false;
                     SwPreset:=false;
                   end;
                 end;
               3:if (not DMCONS.SwNocturno)and(not SwDesHabilitado) then begin
                   if DMCONS.SwEmular then
                     EmularEstatus[2*xpos]:='5';
                 end;
             end;
           end;
         end;
 'A','t':begin // pide estatus de una bomba
           NumPaso:=2;
           xpos:=StrToIntDef(copy(lin,2,2),0);
           xpos:=DamePosicion(xpos);
           if xpos in [nPosIni..nPosFin] then begin
             if lin[1]='t' then begin
               TPosCarga[xpos].swimp:=true;
               if DMCONS.swemular then
                 EmularEstatus[2*xpos]:='7';
             end;
             try
               with TPosCarga[xpos] do begin
                 swinicio2:=false;
                 volumen:=StrToFloat(copy(lin,5,6))/100;
                 simp:=copy(lin,11,6);
                 spre:=copy(lin,17,4);
                 importe:=StrToFloat(simp)/100;
                 precio:=StrToFloat(spre)/1000;
                 // valida ventas mayores a 10000 pesos
                 ximpo:=volumen*precio;
                 xdif:=abs(ximpo-importe);
                 if xdif>=9000 then begin
                   xdif:=AjustaFloat(xdif/10000,0);
                   importe:=xdif*10000+importe;
                 end;
                 // fin
                 xvol:=ajustafloat(dividefloat(importe,precio),3);
                 if abs(volumen-xvol)<0.05 then
                   volumen:=xvol;
                 // valida cambio de ventas
                 if (estatus in [4,5]) then begin
                   if (importeant>0.01)and(importe<importeant-0.5) then begin
                     swdesp:=true;
                     ximpo:=importe; xvol:=volumen; xprecio:=precio; xposactual:=PosActual;
                     importe:=importeant; volumen:=volumenant; precio:=precioant; PosActual:=PosAnt;
                     DespliegaPosCarga(xpos);
                     importe:=ximpo; volumen:=xvol; precio:=xprecio; PosActual:=xPosActual;
                   end;
                   importeant:=importe;
                   volumenant:=volumen;
                   precioant:=precio;
                   PosAnt:=PosActual;
                 end;
                 // fin
                 if (Estatus=7)and(swcargando) then begin
                   swcargando:=false;
                   swdesp:=true;
                 end
                 else if (not (estatus in [4,5]))and(SwCargando) then begin
                   swcargando:=false;
                   swdesp:=true;
                 end;
                 DespliegaPosCarga(xpos);
                 if Estatus=7 then begin
                   ComandoConsolaBuff('J'+IntToClaveNum(TPosCarga[xpos].NumPos,2),true); // Fin de Venta
                   if DMCONS.swemular then
                     EmularEstatus[2*xpos]:='1';
                 end;
                 if lin[1]='t' then with DMCONS do begin
                   Q_Auxi.Active:=false;
                   Q_AuxiEntero1.FieldKind:=fkInternalCalc;
                   Q_Auxi.SQL.Clear;
                   Q_Auxi.SQL.Add('Select Max(Folio) as Entero1 from  DPVGMOVI');
                   Q_Auxi.Active:=true;
                   folio:=Q_AuxiEntero1.AsInteger+1;

                   ss:=FechaToStr(Date);
                   ss:=copy(ss,7,2)+copy(ss,5,2)+copy(ss,1,4);
                   s1:=FiltraStrNum(FormatoNumeroSinComas(volumen,7,2));
                   while length(s1)<6 do
                     s1:='0'+s1;
                   s2:=FiltraStrNum(FormatoNumeroSinComas(importe,7,2));
                   while length(s2)<6 do
                     s2:='0'+s2;
                   s3:=FiltraStrNum(FormatoNumeroSinComas(precio,7,3));
                   while length(s3)<4 do
                     s3:='0'+s3;
                   ComandoConsolaBuff('zAA99999a'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+
                        inttostr(PosActual)+lin[4]+
                        s1+s2+s3+
                        ss+FiltraStrNum(HoraToStr24(time))+
                        inttoclavenum(folio,6)+inttoclavenum(folio,6)+
                        '                                ',true);
                 end;
               end
             except
               DespliegaMemo4(lin+' '+fechapaq(date)+' '+HoraPaq(time));
             end;
           end
           else DespliegaMemo4(lin+' '+fechapaq(date)+' '+HoraPaq(time));
         end;
     'k':begin // totales de la bomba
           NumPaso:=3;
           xpos:=StrToIntDef(copy(lin,2,2),0);
           xpos:=DamePosicion(xpos);
           if xpos in [nPosIni..nPosFin] then begin
             with TPosCarga[xpos] do begin
               try
                 SwCargaTotales:=false;
                 IntentosTotales:=0;
                 Totlts[1]:=StrToFloat(copy(lin,4,10))/1000;
                 Totlts[2]:=StrToFloat(copy(lin,14,10))/1000;
                 TotalLitros[1]:=TotLts[TPos[1]];
                 TotalLitros[2]:=TotLts[TPos[2]];
                 DMCONS.RegistraTotales_BD(xpos,TotalLitros[1],TotalLitros[2]);
                 DespliegaPosCarga(xpos);
               except
               end;
             end;
           end;
         end;
     'G':begin // PRECIOS POR POSICION
           NumPaso:=3;
           xpos:=StrToIntDef(copy(lin,2,2),0);
           xpos:=DamePosicion(xpos);
           if xpos in [nPosIni..nPosFin] then begin
             with TPosCarga[xpos] do begin
               try
                 if lin[4]=NivelPrecioContado then begin
                   SwCargaPreciosCon:=false;
                   xprec[1]:=StrToFloat(copy(lin,5,4))/1000;
                   xprec[2]:=StrToFloat(copy(lin,9,4))/1000;
                   xprec[3]:=StrToFloat(copy(lin,13,4))/1000;
                   xprec[4]:=StrToFloat(copy(lin,17,4))/1000;
                   TPreciosCon[1]:=xprec[TPos[1]];
                   TPreciosCon[2]:=xprec[TPos[2]];
                   DespliegaPosCarga(xpos);
                 end
                 else begin
                   SwCargaPreciosCre:=false;
                   xprec[1]:=StrToFloat(copy(lin,5,4))/1000;
                   xprec[2]:=StrToFloat(copy(lin,9,4))/1000;
                   xprec[3]:=StrToFloat(copy(lin,13,4))/1000;
                   xprec[4]:=StrToFloat(copy(lin,17,4))/1000;
                   TPreciosCre[1]:=xprec[TPos[1]];
                   TPreciosCre[2]:=xprec[TPos[2]];
                   DespliegaPosCarga(xpos);
                 end;
               except
               end;
             end;
           end;
         end;
   idAck:case CharCmnd of
          'K':begin
                xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
                xpos:=DamePosicion(xpos);
                try
                  TPosCarga[xpos].ModoPago:=LinCmnd[4];
                except
                end;
              end;
          'S':begin
                xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
                xpos:=DamePosicion(xpos);
                if (SwComando_S)and(xpos=PosCarga_S) then begin
                  SwComando_S:=false;
                  Comando_S_Autorizado(PosCarga_S);
                end;
              end;
          'U':if SwComando_U then begin
                xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
                xpos:=DamePosicion(xpos);
                if xpos=PosCarga_U then begin
                  SwComando_U:=false;
                  TPosCarga[xpos].swcargaprecioscon:=true;
                  TPosCarga[xpos].ActPrecio[Manguera_U]:=false;
                end;
              end
              else if SwComando_F then begin
                xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
                xpos:=DamePosicion(xpos);
                if xpos=PosCarga_F then begin
                  SwComando_F:=false;
                  TPosCarga[xpos].swcargaprecioscre:=true;
                  TPosCarga[xpos].ActFlujo[Manguera_F]:=false;
                end;
              end;
         end;
   idNak:case CharCmnd of
          'S':if SwComando_S then begin
                xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
                xpos:=DamePosicion(xpos);
                if xpos=PosCarga_S then
                  Comando_S_Error(PosCarga_S,'Error al activar posicion de carga');
              end;
          'U':if SwComando_U then begin
                xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
                xpos:=DamePosicion(xpos);
                if xpos=PosCarga_U then
                  SwComando_U:=false;
              end
              else if SwComando_F then begin
                xpos:=StrToIntDef(copy(LinCmnd,2,2),0);
                xpos:=DamePosicion(xpos);
                if xpos=PosCarga_F then
                  SwComando_F:=false;
              end;
         end;
    end;
    if ListaCmnd=nil then
      ListaCmnd:=TStringList.Create;
    if (ListaCmnd.Count>0)and(not SwEsperaRsp) then begin
      DespliegaPosCarga(ApPosCarga);
      if ApPosCarga>1 then
        DespliegaPosCarga(ApPosCarga-1)
      else
        DespliegaPosCarga(MaxPosCarga);
      ss:=ListaCmnd[0];
      ListaCmnd.Delete(0);
      ComandoConsola(ss);
      exit;
    end
    else inc(NumPaso);
    // checa lecturas de dispensarios
    if NumPaso=2 then begin
      with TPosCarga[ApPosCarga] do if NoComb>0 then begin
        if (estatus<>estatusant)or(estatus>=5)or(SwA)or(swinicio2)or(swcargando) then begin
          SwA:=false;
          SwActualizar:=true;
          if estatus=10 then
            ComandoConsolaBuff('t'+IntToClaveNum(TPosCarga[ApPosCarga].NumPos,2),true)
          else //if truenot SwAutorizada then
            ComandoConsolaBuff('A'+IntToClaveNum(TPosCarga[ApPosCarga].NumPos,2),true);
        end
        else DespliegaPosCarga(ApPosCarga);
      end;
      if not SwEsperaRsp then
        NumPaso:=3;
    end;
    // Lee Totales
    if NumPaso=3 then begin
      // GUARDA VALORES DE DISPENSARIOS CARGANDO
      inc(contguardaval);
      if (contguardaval>=3) then with DMCONS do begin
        // LEE ESTATUS ACTUAL
        try
          T_ConfIb.Active:=true;
          try
            if not T_ConfIb.IsEmpty then
              UltimoEstado:=T_ConfIbDispensarios.AsString;
          finally
            T_ConfIb.Active:=false;
          end;
        except
        end;
        // FIN
        contguardaval:=0;
        lin:='';
        xestado:=ExtraeElemStrSep(UltimoEstado,1,'#');
        delete(xestado,1,1);
        xestado:=llenastr(xestado,'N',MaxPosCarga,'0');
        for xpos:=nPosIni to nPosFin do with TPosCarga[xpos] do begin
          case estatus of
            0:xestado[xpos]:='0'; // Sin Comunicación
            1:xestado[xpos]:='1'; // Inactivo (Idle)
            5:xestado[xpos]:='2'; // Cargando (In Use)
            7:xestado[xpos]:='3'; // Fin de Carga (Used)
            3,4:xestado[xpos]:='5'; // Llamando (Calling)
            2,8:xestado[xpos]:='9'; // Autorizado
            6:xestado[xpos]:='8'; // Detenido (Stoped)
            else xestado[xpos]:='0';
          end;
          if SwActualizar then begin
            SwActualizar:=false;
            xcomb:=CombustibleEnPosicion(xpos,PosActual);
            ss:=inttoclavenum(xpos,2)+'/'+inttostr(xcomb);
            ss:=ss+'/'+FormatFloat('###0.00',volumen);
            ss:=ss+'/'+FormatFloat('#0.00',precio);
            ss:=ss+'/'+FormatFloat('####0.00',importe);
            lin:=lin+'#'+ss;
          end;
        end;
        ii:=NoElemStrSep(UltimoEstado,'#');
        for i:=2 to ii do begin
          ss:=ExtraeElemStrSep(UltimoEstado,i,'#');
          ss2:=ExtraeElemStrSep(ss,1,'/');
          xp:=StrToIntDef(ss2,0);
          if (xp>0)and((xp<nPosIni)or(xp>nPosFin)) then
            lin:=lin+'#'+ss;
        end;
        if lin='' then
          lin:=xestado+'#'
        else
          lin:=xestado+lin;
        try
          T_ConfIb.Active:=true;
          try
            if not T_ConfIb.IsEmpty then begin
              T_ConfIb.Edit;
              if swnocturno then
                T_ConfIbDispensarios.AsString:='A'+lin
              else
                T_ConfIbDispensarios.AsString:='D'+lin;
              T_ConfIb.Post;
            end;
          finally
            T_ConfIb.Active:=false;
          end;
        except
        end
      end;
      // FIN
      with TPosCarga[ApPosCarga] do if NoComb>0 then begin
        if swcargatotales then begin
          inc(intentostotales);
          if intentostotales>3 then
            swcargatotales:=false;
          ComandoConsolaBuff('k'+IntToClaveNum(TPosCarga[ApPosCarga].NumPos,2),false);
        end
        else if swcargaprecioscon then begin
          ComandoConsolaBuff('G'+IntToClaveNum(TPosCarga[ApPosCarga].NumPos,2)+NivelPrecioContado,false);
        end
        else if swcargaprecioscre then begin
          ComandoConsolaBuff('G'+IntToClaveNum(TPosCarga[ApPosCarga].NumPos,2)+NivelPrecioCredito,false);
        end
        else begin
          DespliegaPosCarga(ApPosCarga);
        end;
      end;
      if not SwEsperaRsp then
        NumPaso:=4;
    end;
    if (NumPaso=4) then with DMCONS do begin
      // Checa Ventas Concluidas
      xpos:=ApPosCarga;
      with TPosCarga[xpos] do if (estatus=1)and(iniciacarga) then begin
        iniciacarga:=false;
        SwPrepago:=false;
        T_ConsIb.Active:=true;
        try
          if T_ConsIb.Locate('PosCarga',xpos,[]) then begin
            if (StrToChar(T_ConsIbEstatus.AsString) in ['P','p'])or(SwPrepago) then begin
              T_ConsIb.Edit;
              T_ConsIbVolumen.AsFloat:=TPosCarga[xpos].volumen;
              T_ConsIbPrecio.AsFloat:=TPosCarga[xpos].precio;
              T_ConsIbImporte.AsFloat:=TPosCarga[xpos].importe;
              xcomb:=CombustibleEnPosicion(xpos,PosActual);
              T_ConsIbCombustible.AsString:=TabComb[xcomb].Nombre;
              T_ConsIbFolio.AsInteger:=0;
              T_ConsIb.Post;
              T_ConsIb.Edit;
              T_ConsIbEstatus.AsString:='F';
              //lcActualiza:=true;
              T_ConsIb.Post;
            end;
          end;
        finally
          T_ConsIb.Active:=false;
        end;
      end;

      // Checa peticiones de ventas con tarjeta
      if not SwComando_S then begin
        folio_s:=0;
        Q_ConsIb.Active:=false;
        Q_ConsIb.ParamByName('pestatus').asstring:='S';
        Q_ConsIb.ParamByName('pestatus2').asstring:='s';
        Q_ConsIb.Active:=true;
        if not Q_ConsIb.Eof then begin
          rsp:='OK';
          SnPosCarga:=Q_ConsIbPosCarga.AsInteger;
          if (TPosCarga[SnPosCarga].estatus in [1,2]) then begin
            Origen_S:='T';
            if Q_ConsIbMonVol.AsString='V' then begin // litros
              SnImporte:=Q_ConsIbImporte.AsFloat;
            end
            else
              SnImporte:=Q_ConsIbValor.AsFloat; // importe
            if Q_ConsIbPosicion.asinteger>0 then
              xcomb:=CombustibleEnPosicion(Q_ConsIbPosCarga.AsInteger,Q_ConsIbPosicion.asinteger)
            else xcomb:=0;
            DespliegaMemo4('Envia preset: '+inttostr(snposcarga)+' '+formatomoneda(snimporte));
            EnviaPreset(rsp,true);
          end
          else rsp:='Posición de Carga no Disponible';
          if rsp<>'OK' then
            Comando_S_Error(SnPosCarga,rsp);
        end;
      end;


      // CHECA SI HAY SOLICITUD DE CORTE
      with DMCONS do if SwCorteTurno then begin
        xLista:=TStringList.Create;
        try
          rsp:=EjecutaCorte;
          xLista.Add(rsp);
        finally
          xLista.Free;
        end;
      end;

      // REVISAR 02     (COMANDO F)
      // INICIO COMANDOS
      with DMCONS do if (Now-FechaHoraComando)>SegundosAutoriza*tmSegundo then begin
        FechaHoraComando:=Now;
        Q_Cmnd.Active:=false;
        Q_Cmnd.ParamByName('pmodulo').AsString:='DISP';
        Q_Cmnd.Active:=true;
        while not Q_Cmnd.Eof do begin
          ss:=ExtraeElemStrSep(Q_CmndComando.AsString,1,' ');
          // CMND: CERRAR CONSOLA
          if ss='CERRAR' then begin
            rsp:='OK';
            SwCerrar:=true;
          end
          // CMND: ACTIVA MODO PREPAGO
          else if ss='AMP' then begin
            PonTipoServicio('Nocturno');
            if SwNocturno then
              rsp:='OK'
            else
              rsp:='ERROR';
          end
          // CMND: DESACTIVA MODO PREPAGO
          else if ss='DMP' then begin
            PonTipoServicio('Diurno');
            if not SwNocturno then
              rsp:='OK'
            else
              rsp:='ERROR';
          end
          // ORDENA CARGA DE COMBUSTIBLE
          else if ss='OCC' then begin
            SnPosCarga:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            if not SwComando_S then begin
              folio_s:=Q_CmndFolio.AsInteger;
              rsp:='OK';
              if SwNocturno then begin
                if (SnPosCarga in [1..MaxPosCarga]) then begin
                  try
                    Origen_S:='C';
                    SnImporte:=StrToFLoat(ExtraeElemStrSep(Q_CmndComando.AsString,3,' '));
                    if (SnImporte<1)or(SnImporte>9999) then
                      rsp:='Importe fuera de rango válido: de 1.00 a 9999.00';
                  except
                    rsp:='Error en Importe';
                  end;
                  if rsp='OK' then begin
                    xcomb:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,4,' '),0);
                    EnviaPreset(rsp,false);
                  end;
                end
                else rsp:='Posicion de Carga no Existe';
              end
              else rsp:='No se encuentra en Modo Prepago';
              if rsp<>'OK' then // AQUI ENVIA ERROR
                Comando_S_Error(SnPosCarga,rsp);
            end
            else if PosCarga_S=SnPosCarga then begin
              Comando_S_Error(SnPosCarga,'Posición Ocupada');
            end;
          end
          // CMND: DESHABILITA POSICIOND DE CARGA
          else if ss='DPC' then begin
            xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            xpos:=DamePosicion(xpos);
            if xpos in [nPosIni..nPosFin] then
              TPosCarga[xpos].SwDesHabilitado:=true;
          end
          // CMND: HABILITA POSICIOND DE CARGA
          else if ss='HPC' then begin
            xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            xpos:=DamePosicion(xpos);
            if xpos in [nPosIni..nPosFin] then
              TPosCarga[xpos].SwDesHabilitado:=false;
          end
          // CMND: ACTIVA FLUJO ESTANDAR
          else if ss='FLUSTD' then begin  // FLUJO ESTANDAR
            rsp:='';
            if ValorClb<>'' then begin
              Q_Pcar.Active:=false;
              Q_Pcar.Active:=true;
              while not Q_Pcar.Eof do begin
                xpos:=Q_PcarPosCarga.AsInteger;
                if xpos in [nPosIni..nPosFin] then begin
                  i:=Trunc(10*Q_PcarSlowFlow.AsFloat+0.5);

                  TPosCarga[xpos].ValorFlujo:=FiltraStrNum(ValorClb)+inttostr(i);
                  for i2:=1 to TPosCarga[xpos].NoComb do
                    TPosCarga[xpos].ActFlujo[i2]:=true;
                  rsp:=rsp+IntToStr(xpos)+IntToStr(i)+'|';
                end;
                Q_Pcar.Next;
              end;
            end
            else rsp:='Opción no Configurada';
            DespliegaMemo4(rsp);
          end
          // CMND: ACTIVA FLUJO MINIMO
          else if ss='FLUMIN' then begin // FLUJO MINIMO
            rsp:='';
            if ValorClb<>'' then begin
              for xpos:=nPosIni to nPosFin do begin
                i:=0;
                TPosCarga[xpos].ValorFlujo:=FiltraStrNum(ValorClb)+inttostr(i);
                for i2:=1 to TPosCarga[xpos].NoComb do
                  TPosCarga[xpos].ActFlujo[i2]:=true;
                rsp:=rsp+IntToStr(xpos)+IntToStr(i)+'|';
              end;
            end
            else rsp:='Opción no Configurada';
          end
          // CMND: EJECUTA CORTE
          else if ss='CORTE' then begin
            try
              xFechaCorte:=StrToFecha(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '));
              xTurnoCorte:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,3,' '),0);
              xIslaCorte:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,4,' '),0);
              SwCorteParcial:=false;
              rsp:=EjecutaCorte;
            except
              rsp:='Comando Erroneo';
            end;
          end
          // CMND: EJECUTA CORTE PARCIAL
          else if ss='CORTEPARCIAL' then begin
            try
              xFechaCorte:=StrToFecha(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '));
              xTurnoCorte:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,3,' '),0);
              xIslaCorte:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,4,' '),0);
              SwCorteParcial:=true;
              rsp:=EjecutaCorte;
            except
              rsp:='Comando Erroneo';
            end;
          end;
          try
            T_Cmnd.Active:=true;
            if T_Cmnd.Locate('Folio',Q_CmndFolio.AsInteger,[]) then begin
              T_Cmnd.Edit;
              T_CmndAplicado.AsString:='Si';
              T_CmndResultado.AsString:=rsp;
              T_Cmnd.Post;
            end;
          except
          end;
          if SwCerrar then
            Close;
          Q_Cmnd.Next;
        end;
      end;
      // FIN COMANDOS

      if not SwEsperaRsp then
        NumPaso:=1;
    end;
  except
    with DMCONS do begin
      if (T_ConsIb.State in [dsInsert,dsEdit]) then
        T_ConsIb.Cancel;
      if (T_ConfIb.State in [dsInsert,dsEdit]) then
        T_ConfIb.Cancel;
      if (T_Cmnd.State in [dsInsert,dsEdit]) then
        T_Cmnd.Cancel;
    end;
  end;
end;

procedure TFDISIGM.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
begin
  ContadorAlarma:=0;
  Timer1.Enabled:=false;
  try
    for I := 1 to Count do begin
      C:=ApdComPort1.GetChar;
      LineaBuff:=LineaBuff+C;
    end;
    while (not FinLinea)and(Length(LineaBuff)>0) do begin
      c:=LineaBuff[1];
      delete(LineaBuff,1,1);
      Linea:=Linea+C;
      if SwBcc then begin
        if (Length(LineaBuff)>0) then begin
          c:=LineaBuff[1];
          delete(LineaBuff,1,1);
          Linea:=Linea+C;
        end;
        FinLinea:=true;
      end;
      if C=idETX then begin
        SwBcc:=true;
      end;
      if (C=idACK)or(c=idNAK) then begin
        Linea:=c;
        FinLinea:=true;
      end;
    end;
    if FinLinea then begin
      LineaTimer:=Linea;
      if LineaTimer[1]='*' then
        delete(LineaTimer,1,1);
      DMCONS.AgregaLog('R '+LineaTimer);
      Linea:='';
      SwBcc:=false;
      FinLinea:=false;
      ProcesaLinea;
      LineaTimer:='';
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISIGM.ComandoConsolaBuff(ss:string;swinicio:boolean);
begin
  if ListaCmnd=nil then
    ListaCmnd:=TStringList.Create;
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

procedure TFDISIGM.ComandoConsola(ss:string);
var s1:string;
    cc:char;
begin
  LinCmnd:=ss;
  CharCmnd:=LinCmnd[1];
  SwEsperaRsp:=true;
  ContEsperaRsp:=0;
  if DMCONS.SwEmular then begin
    DMCONS.AgregaLog('E :'+idSTX+ss+idETX+'.*');
    LineaEmular:=ss;
    exit;
  end;
  inc(ContadorAlarma);
  if not ApdComPort1.Open then begin
    MensajeErr('Puerto no esta abierto');
    Application.Terminate;
  end;
  Timer1.Enabled:=false;
  try
    LineaBuff:='';
    cc:=CalculaBCC(ss+#3);
    if cc in [':','*',idStx,idEtx,idAck,idNak] then
      cc:='X';
    s1:=':'+#2+ss+#3+CC+'*';
    if ApdComPort1.OutBuffFree >= Length(S1) then begin
      EsperaMiliSeg(100);
      DMCONS.AgregaLog('E '+s1);
      ApdComPort1.PutString(S1);
    end
    else begin
      inc(ContBuffLleno);
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;


procedure TFDISIGM.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISIGM.Restaurar1Click(Sender: TObject);
begin
  FDISIGM.Visible:=true;
end;

procedure TFDISIGM.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFDISIGM.FormCreate(Sender: TObject);
begin
  SwEmulaFalla:=false;
  SwCerrar:=false;
  ContImp:=0;
  ContPrecio:=0;
  SwComando_S:=false;
  SwComando_U:=false;
  SwComando_F:=false;
  SwInicio:=true;
  ContadorAlarma:=0;
  ContGuardaVal:=0;
  ListaCmnd:=TStringList.Create;
  SwEsperaRsp:=false;
end;

procedure TFDISIGM.BitBtn3Click(Sender: TObject);
begin
  FDISIGM.Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISIGM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdComPort1.Open:=false;
  Application.Terminate;
end;

procedure TFDISIGM.Timer1Timer(Sender: TObject);
begin
  try
    if SwComando_S then begin
      inc(ContComando_S);
      if ContComando_S>=10 then
        Comando_S_Error(PosCarga_S,'No hay respuesta de consola');
    end;
    if SwComando_U then begin
      inc(ContComando_U);
      if ContComando_U>=10 then
        SwComando_U:=false;
    end;
    if SwComando_F then begin
      inc(ContComando_F);
      if ContComando_F>=10 then
        SwComando_F:=false;
    end;
    if not SwEsperaRsp then begin // NO HAY COMANDOS EN PROCESO
      StaticText6.Caption:='';
      inc(ApPosCarga);
      if ApPosCarga>nPosFin then
        ApPosCarga:=nPosIni;
      ComandoConsolaBuff('B'+inttoclavenum(TPosCarga[ApPosCarga].NumPos,2),false);
    end
    else begin // HAY COMANDOS EN PROCESO
      inc(ContEsperaRsp);
      if ContEsperaRsp>MaxEsperaRsp then begin
        ContEsperaRsp:=0;
        case CharCmnd of
         'B':begin
               SwEsperaRsp:=false;
               inc(ApPosCarga);
               if ApPosCarga>nPosFin then
                 ApPosCarga:=nPosIni;
               ComandoConsolaBuff('B'+inttoclavenum(TPosCarga[ApPosCarga].NumPos,2),false);
               exit;
             end;
         'A','k':LineaTimer:=idStx+CharCmnd+'00'+idEtx+'.*';
         else LineaTimer:=idNak;
        end;
        ProcesaLinea;
      end;
    end;
  except
  end;
end;

procedure TFDISIGM.RadioGroup1Click(Sender: TObject);
begin
  with DMCONS do begin
    case RadioGroup1.ItemIndex of
      0:if SwNocturno then begin
          FAutoriza2.PideAutorizacion('Servicio Nocturno');
          if StrMayuscIguales(FAutoriza2.EditP.Text,DMCONS.PasswordNocturno) then begin
            PonTipoServicio('Diurno');
            GroupBox1.Visible:=false;
            Memo2.Visible:=false;
            DBGrid3.Visible:=true;
          end
          else MensajeErr('Clave Errónea');
        end;
      1:if not SwNocturno then begin
          FAutoriza2.PideAutorizacion('Servicio Nocturno');
          if StrMayuscIguales(FAutoriza2.EditP.Text,DMCONS.PasswordNocturno) then begin
            PonTipoServicio('Nocturno');
            GroupBox1.Visible:=true;
            MaskEdit1.SetFocus;
            Memo2.Visible:=true;
            DBGrid3.Visible:=false;
          end
          else MensajeErr('Clave Errónea');
        end;
    end;
  end;
end;

procedure TFDISIGM.EnviaPreset(var rsp:string;estarjeta:boolean);
var xpos,xp:integer;
    ss:string;
begin
  rsp:='OK';
  xpos:=SnPosCarga;
  if not (TPosCarga[xpos].estatus in [1..3]) then begin
    rsp:='Posición no Disponible';
    exit;
  end;
  TPosCarga[xpos].SwPreset:=true;
  if estarjeta then begin
    TPosCarga[xpos].SwTarjeta:=true;
    TPosCarga[xpos].MontoTarjeta:=SnImporte;
  end;
  ss:='K'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+'2'; // Modo PrePago
  ComandoConsolaBuff(ss,false);
  ss:='P'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+FiltraStrNum(FormatFloat('0000.00',SnImporte));
  ComandoConsolaBuff(ss,false);
  ss:='L'+IntToClaveNum(TPosCarga[xpos].NumPos,2)+NivelPrecioContado; // Nivel de Precios
  ComandoConsolaBuff(ss,false);
  ss:='S'+IntToClaveNum(TPosCarga[xpos].NumPos,2); // Autorizar
  ComandoConsolaBuff(ss,false);
  SwComando_S:=true;
  ContComando_S:=0;
  PosCarga_S:=xpos;
end;

procedure TFDISIGM.BitBtn2Click(Sender: TObject);
var ss:string;
begin
  StaticText16.Caption:='';
  try
    SnPosCarga:=StrToInt(MaskEdit1.text);
    if not (SnPosCarga in [nPosIni..nPosFin]) then
      raise Exception.Create('Posición de Carga no Existe');
  except
    MaskEdit1.SetFocus;
    raise Exception.Create('Posición de Carga no Existe');
  end;
  try
    SnImporte:=StrToFloat(MaskEdit2.text);
    MaskEdit2.text:=FormatoMoneda(SnImporte);
  except
    MaskEdit2.SetFocus;
    raise Exception.Create('Valor Numérico Erroneo');
  end;
  EnviaPreset(ss,false);
  if ss<>'OK' then
    raise Exception.Create(ss);
  BitBtn2.Enabled:=true;
  MaskEdit1.ReadOnly:=false;
  MaskEdit2.ReadOnly:=false;
  beep;
  StaticText16.Caption:='Procesada...';
  if Memo2.Lines.Count>=8 then
    Memo2.Lines.Delete(0);
  Memo2.Lines.Add(IntToClaveNum(SnPosCarga,2)+'   '+LlenaStr(FormatoMoneda(SnImporte),'D',15,' '));
  MaskEdit1.SetFocus;
  NumPaso:=1;
end;



procedure TFDISIGM.Timer3Timer(Sender: TObject);
const timpo:array[0..4] of real = (50,100,15000,200,30);
      tpos:array[0..2] of integer = (2,1,2);
var xpos,rr,i:integer;
    lin:string;
    p1,p2,xp,xcomb:integer;
    ximp:real;
begin
  if SwEmulaFalla then begin
    inc(ContadorAlarma);
    exit;
  end;
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
                xpos:=Random(nPosFin)+1;
                p1:=2*xpos-1;
                p2:=2*xpos;
                case EmularEstatus[p2] of
                  '1':if not SwNocturno then begin
                        EmularEstatus[p2]:='3';
                        rr:=Random(5);
                        xp:=Random(2)+1;
                        if xp>TPosCarga[xpos].NoComb then
                          xp:=TPosCarga[xpos].NoComb;
                        EmularEstatus[p1]:=char(xp+48);
                        xcomb:=CombustibleEnPosicion(xpos,xp);
                        TPosCarga[xpos].volumen:=Timpo[rr]/TabComb[xcomb].Precio;
                        TPosCarga[xpos].importe:=timpo[rr];
                        TPosCarga[xpos].precio:=TabComb[xcomb].Precio;
                        TPosCarga[xpos].hora:=time;
                      end;
                  '5':if (Time-TPosCarga[xpos].Hora)>10*TmSegundo then
                        EmularEstatus[p2]:='g';
                end;
              end
              else begin
                for xpos:=nPosIni to nPosFin do with TPosCarga[xpos] do begin
                  p2:=2*xpos;
                  if (EmularEstatus[p2]='5')and((Time-Hora)>30*TmSegundo)then
                    EmularEstatus[p2]:='g';
                end;
              end;
              Linea:='B'+IntToClaveNum(TPosCarga[ApPosCarga].NumPos,2)+copy(EmularEstatus,ApPosCarga*2-1,2);
            end;
        'A','t':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              xpos:=DamePosicion(xpos);
              ximp:=TPosCarga[xpos].importe;
              while ximp>=10000 do
                ximp:=ximp-10000;
              Linea:=copy(Lin,1,3)+'2'
                     +FiltraStrNum(FormatFloat('0000.00',TPosCarga[xpos].volumen))
                     +FiltraStrNum(FormatFloat('0000.00',ximp))
                     +FiltraStrNum(FormatFloat('0.000',TPosCarga[xpos].precio));
            end;
        'k':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              xpos:=DamePosicion(xpos);
              with TPosCarga[xpos] do begin
                Linea:=copy(Lin,1,3)+'0000000000'+'0000000000';
                for i:=1 to NoComb do
                  Linea[TPos[i]*10-5]:=Char(TComb[i]+48);
              end;
            end;
        'G':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              xpos:=DamePosicion(xpos);
              with TPosCarga[xpos] do begin
                Linea:=copy(Lin,1,4);
                for i:=1 to 4 do begin
                  if TPos[1]=i then
                    Linea:=Linea+FiltraStrNum(FormatoNumero(DMCONS.TabComb[TComb[1]].precio,5,3))
                  else if TPos[2]=i then
                    Linea:=Linea+FiltraStrNum(FormatoNumero(DMCONS.TabComb[TComb[2]].precio,5,3))
                  else
                    Linea:=Linea+'0000';
                end;
              end;
            end;
        'P':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              xpos:=DamePosicion(xpos);
              p2:=xpos*2;
              if EmularEstatus[p2]='1' then begin
                EmularEstatus[p2]:='5';
                TPosCarga[xpos].estatus:=5;
                TPosCarga[xpos].volumen:=SnImporte/5;
                TPosCarga[xpos].importe:=SnImporte;
                TPosCarga[xpos].precio:=5;
                TPosCarga[xpos].posactual:=1;
                TPosCarga[xpos].hora:=time;
                Linea:=idAck;
              end
              else Linea:=idNak;
            end;
        'S':linea:=idACK;
        else linea:=idACK;
      end;
      if (linea<>idACK)and(linea<>idNak) then
        LineaTimer:=idSTX+Linea+idETX+'.*'
      else
        LineaTimer:=linea;
      DMCONS.AgregaLog('R '+LineaTimer);
      ProcesaLinea;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISIGM.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    MaskEdit2.SetFocus;
  if key in [48..57] then begin
    MaskEdit2.Text:='';
    StaticText16.Caption:='';
  end;
end;

procedure TFDISIGM.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    BitBtn2.SetFocus;
end;

procedure TFDISIGM.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key='*' then
    MaskEdit1.SetFocus;
end;

procedure TFDISIGM.MaskEdit1Enter(Sender: TObject);
begin
  MaskEdit1.Text:='';
  MaskEdit2.Text:='';
end;

procedure TFDISIGM.GroupBox1Enter(Sender: TObject);
begin
  if SwProcesando then
    Memo2.SetFocus;
end;

procedure TFDISIGM.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text:=FiltraStrNum(MaskEdit1.Text);
end;

procedure TFDISIGM.registro(valor:integer;variable:string);
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


procedure TFDISIGM.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISIGM.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xpos:=DamePosicion(xpos);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISIGM.lee_registro;
var
  Registry: TRegistry;
  estado:integer;
begin
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
  finally
    Registry.CloseKey;
    Registry.Free;
    registro(0,'Estado');
  end;
end;


procedure TFDISIGM.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISIGM.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
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

function TFDISIGM.DamePosicion(xnumpos:integer):integer;
var i:integer;
begin
  result:=0;
  for i:=nPosIni to nPosFin do
    if TPosCarga[i].NumPos=xnumpos then
      result:=i;
end;

procedure TFDISIGM.ListBoxPC1DblClick(Sender: TObject);
begin
  SwDespPrecioCred:=not SwDespPrecioCred;
  SwEmulaFalla:=true;
end;

procedure TFDISIGM.Timer2Timer(Sender: TObject);
var i,j:integer;
begin
  try
    with DMCONS do begin
      inc(ContadorTot);
      if (ContadorTot>=100) then begin
        ContadorTot:=0;
        inc(ContadorTotPos);
        if ContadorTotPos in [nPosIni..nPosFin] then begin
          TPosCarga[ContadorTotPos].SwCargaTotales:=true;
        end
        else ContadorTotPos:=0;
      end;
    end;
    if ContadorAlarma>=10 then begin
      if (ContadorAlarma>=30)and(DMCONS.StLevanta='Si') then begin
        DMCONS.RegistraBitacora2(1,'Falla de Comunicación Dispensarios'); //
        DMCONS.DBGASCON.Connected:=false;
        Application.Terminate;
      end;
      if not StaticText17.Visible then
        Beep;
      StaticText17.Visible:=not StaticText17.Visible;
    end
    else begin
      ApdComPort1.tag:=0;
      StaticText17.Visible:=false;
    end;
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
      if DMCONS.T_EmprIbTIPOLICENCIA.AsString<>'Mixta' then begin
        with DMCONS do if AplicarPrecios then begin
          for i:=1 to MaxComb do with TabComb[i] do if Activo then begin
            Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
            Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=i;
            Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
            Q_AplicaPrecioF.ExecSQL;
          end;
          CargaPreciosFH(Now,true); // guarda precio actual como físico
          Q_CombIb.Active:=false;
          Q_CombIb.Active:=true;
          DespliegaPrecios;
          for i:=nPosIni to nPosFin do
            for j:=1 to TPosCarga[i].NoComb do
              TPosCarga[i].ActPrecio[j]:=true;
        end;
      end
      else begin
        if ContPrecio<=0 then begin
          with DMCONS do if AplicarPrecios then
            ContPrecio:=1;
        end
        else begin
          dec(ContPrecio);
          if ContPrecio<=0 then with DMCONS do begin
            for i:=1 to MaxComb do with TabComb[i] do if Activo then begin
              Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
              Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=i;
              Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
              Q_AplicaPrecioF.ExecSQL;
            end;
            CargaPreciosFH(Now,true); // guarda precio actual como físico
            Q_CombIb.Active:=false;
            Q_CombIb.Active:=true;
            DespliegaPrecios;
            for i:=nPosIni to nPosFin do
              for j:=1 to TPosCarga[i].NoComb do
                TPosCarga[i].ActPrecio[j]:=true;
          end;
        end;
      end;
    end;
    if NotificationIcon1.Tag=0 then begin
      if ErrorInic then begin
        EsperaMiliSeg(3000);
        Application.Terminate;
      end;
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      FDISIGM.Visible:=false;
      NotificationIcon1.Show;
    end;
  except
  end;
end;

procedure TFDISIGM.Comando_S_Autorizado(xpos:integer);
begin
  with DMCONS do begin
    try
      TPosCarga[xpos].SwPreset:=true;
      SwComando_S:=false;
      case Origen_S of
        'T':begin
              T_ConsIb.Active:=true;
              try
                if T_ConsIb.Locate('PosCarga',xpos,[]) then begin
                  T_ConsIb.Edit;
                  T_ConsIbEstatus.AsString:='P';
                  TPosCarga[xpos].EstaT_Cons:=StrToChar(T_ConsIbEstatus.AsString);
                  T_ConsIb.Post;
                  TPosCarga[xpos].SwPrepago:=true;
                end;
              finally
                T_ConsIb.Active:=false;
              end;
            end;
        'C':begin
              T_Cmnd.Active:=true;
              if T_Cmnd.Locate('Folio',Q_CmndFolio.AsInteger,[]) then begin
                T_Cmnd.Edit;
                T_CmndAplicado.AsString:='Si';
                T_CmndResultado.AsString:='OK';
                T_Cmnd.Post;
              end;
            end;
      end;
      if swemular then begin
        if (EmularEstatus[xpos*2]='1') then begin
          EmularEstatus[xpos*2]:='5';
          TPosCarga[xpos].estatus:=5;
          TPosCarga[xpos].volumen:=SnImporte/5;
          TPosCarga[xpos].importe:=SnImporte;
          TPosCarga[xpos].precio:=5;
          TPosCarga[xpos].posactual:=1;
          TPosCarga[xpos].hora:=time;
        end;
      end;
    except
    end;
  end;
end;

procedure TFDISIGM.Comando_S_Error(xpos:integer;rsp:string);
begin
  with DMCONS do begin
    try
      SwComando_S:=false;
      case Origen_S of
        'T':if (xpos in [nPosIni..nPosFin]) then begin
              T_ConsIb.Active:=true;
              try
                if T_ConsIb.Locate('PosCarga',xpos,[]) then begin
                  T_ConsIb.Edit;
                  T_ConsIbEstatus.AsString:='E';
                  TPosCarga[xpos].EstaT_Cons:=StrToChar(T_ConsIbEstatus.AsString);
                  T_ConsIb.Post;
                  TPosCarga[xpos].SwPrepago:=true;
                end;
              finally
                T_ConsIb.Active:=false;
              end;
            end;
        'C':begin
              T_Cmnd.Active:=true;
              if T_Cmnd.Locate('Folio',Q_CmndFolio.AsInteger,[]) then begin
                T_Cmnd.Edit;
                T_CmndAplicado.AsString:='Si';
                T_CmndResultado.AsString:=rsp;
                T_Cmnd.Post;
              end;
            end;
      end;
    except
    end;
  end;
end;


procedure TFDISIGM.SpeedButton1Click(Sender: TObject);
begin
  ComandoConsolaBuff(Edit1.Text,false);
end;

procedure TFDISIGM.SpeedButton3Click(Sender: TObject);
var i:integer;
begin
  for i:=nPosIni to nPosFin do begin
    ComandoConsolaBuff('v'+inttoclavenum(TPosCarga[i].NumPos,2),false);
    DespliegaMemo4('v'+inttoclavenum(TPosCarga[i].NumPos,2));
  end;
end;

end.
