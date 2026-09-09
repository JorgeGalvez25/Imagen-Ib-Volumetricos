unit UDISPAM1000;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry;

const
      MCxP=4;


type
  TFDISPAM1000 = class(TForm)
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
    TabSheet1: TTabSheet;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    Timer3: TTimer;
    ImageList1: TImageList;
    CheckBox2: TCheckBox;
    Memo4: TMemo;
    Label2: TLabel;
    Panel2: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
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
    StaticText18: TStaticText;
    Button1: TButton;
    PageControl1: TPageControl;
    StaticText7: TStaticText;
    Label4x: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure ApdComPort1TriggerAvail(CP: TObject; Count: Word);
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
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ListBoxPC1DblClick(Sender: TObject);
    procedure ListBoxPC2Click(Sender: TObject);
    procedure ListBoxPC3Click(Sender: TObject);
    procedure ListBoxPC4Click(Sender: TObject);
  private
    { Private declarations }
    xPosStop,
    xPosStop2,
    PasoPumpStop,
    StEsperaStop,
    ContPumpStop :integer;
    SwAplicaCmnd,
    SwInicio:boolean;
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwEspera,
    SwBcc,
    FinLinea:boolean;
    ContEspera,
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
    EmularEstatus,
    LineaEmular:string;
    SwError:boolean;
    ContadorAlarma:integer;
    contguardaval:integer;
  public
    { Public declarations }
    function StringCom(ss:string):string;
    function XorChar(c1,c2:char):char;
    function CalculaBCC(ss:string):char;
    procedure ComandoConsola(ss:string);
    procedure ProcesaLinea;
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    procedure DespliegaMemo4(lin:string);
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    procedure EnviaPreset(var rsp:string;xcomb:integer);
    function DigitosDispensario(xpos:integer):integer;
    function DecimalesDispensario(xpos:integer):integer;
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
       TDecim    :integer;
       TDigit    :integer;
       TMapa    :array[1..MCxP] of string[6];
       TMang     :array[1..MCxP] of integer;
       SwMapea    :array[1..MCxP] of boolean;
       TotalLitros:array[1..MCxP] of real;
       SwTotales:array[1..MCxP] of boolean;
       SwDesp:boolean;
       SwA:boolean;
       Hora:TDateTime;
       SwInicio:boolean;
       SwInicio2:boolean;
       SwInicio3:boolean;
       SwPreset,
       IniciaCarga,
       SwPrepago:boolean;
       ImportePreset:real;
       ActualizarPrecio:Boolean;
       Mensaje:string[30];
       swnivelprec,
       swactualizar,
       swcargando:boolean;
       SwActivo,
       SwDesHabilitado:boolean;
       ModoOpera:string[8];
       TipoPago:integer;
       FinVenta:integer;
     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=20;
      MaxEspera31=10;
      MaxEspera3=10;


var
  FDISPAM1000: TFDISPAM1000;
  TPosCarga:array[1..100] of tiposcarga;
  MaxPosCarga:integer;
  MaxPosCargaActiva:integer;
  AvanceBar:integer;
  SwSolOk:boolean;
  ContDA,
  StErrSol:integer;
  ruta_db:string;
  SwCerrar    :boolean;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UAutoriza2, DDMCONS2, UDISMENU;

{$R *.DFM}

procedure TFDISPAM1000.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=60 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISPAM1000.DespliegaPrecios;
var i:integer;
begin
  with DMCONS do begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Precios Actuales: ');
    for i:=1 to MaxComb do with TabComb[i] do if Activo then
      Memo1.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
  end;
end;

(*
procedure TFDISPAM1000.PonTipoServicio(xtipo:string);
begin
  with DMCONS do begin
    if xtipo='Nocturno' then begin
      StaticText15.Caption:='Servicio Nocturno';
      StaticText15.Color:=clNavy;
      StaticText15.Font.Color:=clWhite;
      SwNocturno:=true;
      RadioGroup1.ItemIndex:=1;
    end
    else begin
      StaticText15.Caption:='Servicio Diurno';
      StaticText15.Color:=clYellow;
      StaticText15.Font.Color:=clBlack;
      SwNocturno:=false;
      RadioGroup1.ItemIndex:=0;
    end;
  end;
end;
*)

procedure TFDISPAM1000.IniciaBaseDeDatos;
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
            ProductoPrecio:=inttostr(i); //Q_CombIbCon_ProductoPrecio.AsString;
            AgruparCon:=Q_CombIbAgrupar_con.AsInteger;
          end;
        end;
        Q_CombIb.Next;
      end;
      Q_Fact1.Active:=false;Q_Fact1.Active:=true;
      Q_Fact2.Active:=false;Q_Fact2.Active:=true;
      CargaPreciosFH(Now,true); // guarda precio actual como físico
      DBGrid3.Refresh;
      DespliegaPrecios;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISPAM1000.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
    ss:string;
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
      SwPreset:=false;
      ActualizarPrecio:=false;
      Mensaje:='';
      importe:=0;
      volumen:=0;
      precio:=0;
      tipopago:=0;
      finventa:=0;
      SwActualizar:=false;
      Swnivelprec:=false;
      SwCargando:=false;
      for j:=1 to MCxP do begin
        SwTotales[j]:=true;
        TotalLitros[j]:=0;
        swmapea[j]:=false;
        TMapa[j]:='';
      end;
      SwActivo:=false;
      SwDeshabilitado:=false;
    end;
    // CARGA DEFAULTS PAM
    TL_Bomb.Active:=true;
    while not TL_Bomb.Eof do begin
      TL_Bomb.Edit;
      if not (TL_BombCon_Posicion.AsInteger in [1,2,3]) then
        TL_BombCon_Posicion.AsInteger:=TL_BombCombustible.AsInteger;
      if (TL_BombCon_DigitoAjuste.IsNull)or (not (TL_BombCon_DigitoAjuste.AsInteger in [0,1])) then
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
          TMapa[NoComb]:='X'+IntToClaveNum(xpos,2)+TabComb[xcomb].ProductoPrecio+IntToStr(Q_BombIbCon_Posicion.AsInteger);
          SwMapea[NoComb]:=true;
          TDiga[TPos[NoComb]]:=Q_BombIbCon_DigitoAjuste.AsInteger;
          TDigvol[TPos[NoComb]]:=Q_BombIbDigitoAjusteVol.AsInteger;
          TDecim:=Q_BombIbDecimalesGilbarco.AsInteger;
          TDigit:=Q_BombIbDigitosGilbarco.AsInteger;
        end;
      end;
      Q_BombIb.Next;
    end;
    T_ConsIb.Active:=true;
    try
      while not T_ConsIb.Eof do begin
        if T_ConsIbEstatus.AsString='P' then begin
          T_ConsIb.Edit;
          T_ConsIbEstatus.AsString:='F';
          //lcActualiza:=true;
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
    if i<xnum then
      ListBox1.Items.add('Posiciones '+IntToClaveNum(i*4-3,2)+' - '+IntToClaveNum(i*4,2))
    else
      ListBox1.Items.add('Posiciones '+IntToClaveNum(i*4-3,2)+' - '+IntToClaveNum(MaxPosCarga,2));
  end;
end;

function TFDISPAM1000.DigitosDispensario(xpos:integer):integer;
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

function TFDISPAM1000.DecimalesDispensario(xpos:integer):integer;
begin
  with DMCONS,TPosCarga[xpos] do begin
    if (TDecim in [2,1]) then
      result:=TDecim
    else begin
      if DecimalesPam1000='1' then
        result:=1
      else result:=2;
    end;
  end;
end;

procedure TFDISPAM1000.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      ContDA:=0;
      //SwMapear:=true;
      ErrorInic:=true;
      SwInicio:=false;
      IniciaBaseDeDatos;
      DMCONS.ChecaTablas;
      ListBox1.ItemIndex:=0;
      SwProcesando:=false;
      SwEspera:=false;
      StaticText6.Caption:='';
      ContEspera:=0;
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
      IniciaEstacion;
      ListBox1.SetFocus;
      Timer1.Enabled:=true;
      DMCONS.T_ConfIb.Active:=true;
      (*
      try
        if copy(DMCONS.T_ConfIbDISPENSARIOS.AsString,1,1)<>'A' then
          PonTipoServicio('Diurno')
        else
          PonTipoServicio('Nocturno');
      finally
        DMCONS.T_ConfIb.Active:=false;
      end;*)
      if DMCONS.SwEmular then begin
        LineaEmular:='';
        EmularEstatus:=LlenaStr('','N',MaxPosCarga,'1');
      end;
      Timer3.Enabled:=DMCONS.SwEmular;
      if DMCONS.SwEmular then
        Label4x.Visible:=true;
      (*
      if DMCONS.SwEmular then
        Caption:=Caption+' - Emulación';*)
      ErrorInic:=false;
    finally
      Timer1.Enabled:=true;
      Timer3.Enabled:=DMCONS.SwEmular;
    end;
  end;
end;

function TFDISPAM1000.StringCom(ss:string):string;
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

function TFDISPAM1000.XorChar(c1,c2:char):char;
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

function TFDISPAM1000.CalculaBCC(ss:string):char;
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

procedure TFDISPAM1000.LimpiaConsola;
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

procedure TFDISPAM1000.DespliegaPosCarga(xpos:integer);
var i,ii,xp,rango,posi,posf,xcomb,xc,apunt:integer;
    lin,xnombre:string;
    xprecio,xprecio2,xdifprec:real;
begin
  try
    apunt:=1;
    rango:=ListBox1.ItemIndex+1;
    if rango=0 then
      rango:=1;
    posi:=rango*4-3;
    posf:=rango*4;
    with TPosCarga[xpos],FDISPAM1000 do begin
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
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Clear;
        TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('###,##0.00',importe)+' Pesos');
        if not SwCargando then begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.000',precio)+' $/Lts');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(xnombre);
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(Mensaje);
        end
        else begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('');
        end;
        for xp:=1 to NoComb do
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                   ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3)
                   );
        if SwPreset then
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('PRESET $'+FormatoMoneda(ImportePreset));
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
        DMCONS.AgregaLog('> Va a guardar pos '+inttostr(i));
        SwDesp:=false;
        if (importe>0.01)and(PosActual in [1..MCxP]) then begin
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
              if TabComb[xcomb].Agruparcon>0 then begin
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
              T_MoviIbTag.AsInteger:=0;
              T_MoviIbManguera.AsInteger:=TMang[PosActual];
              T_MoviIbTipoPago.asinteger:=TipoPago;
              T_MoviIbBoucher.Asstring:='';
              T_MoviIbCuponImpreso.AsString:='No';
              T_MoviIbReferenciaBitacora.AsInteger:=0;
              TipoPago:=0;
              apunt:=7;
              DMCONS.AgregaLog('> va a ejecutar POST');
              T_MoviIb.post;
              apunt:=8;
              if ModoOpera='Normal' then
                SwPreset:=false;
              DMCONS.AgregaLog('> ya guardó pos '+inttostr(i));
              apunt:=9;
              if (lcLicTemporal)and(date>lcLicVence) then begin
                MensajeErr('Licencia vencida. Llame a su distribuidor');
                Application.Terminate;
              end;

              apunt:=10;
              xp:=Q_Fact1PosCarga.AsInteger;
              Q_Fact1.Active:=false;Q_Fact1.Active:=true;
              Q_Fact1.Locate('PosCarga',xp,[]);

              xp:=Q_Fact2PosCarga.AsInteger;
              Q_Fact2.Active:=false;Q_Fact2.Active:=true;
              Q_Fact2.Locate('PosCarga',xp,[]);
            finally
              T_MoviIb.Active:=false;
            end;
          except
            on e:exception do begin
              lin:='Error Movi: pos:'+inttostr(i)+' comb:'+inttostr(xcomb)+'  cod:'+inttostr(apunt);
              DespliegaMemo4(lin);
              DespliegaMemo4(e.Message);
              // Error Movi: pos:3 comb:1  cod:7
              // Non-blob column in table required to perform operation.
            end;
          end;
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
        end;
      end;
    end;
  except
    DespliegaMemo4('Error: '+inttostr(apunt));
    with DMCONS do begin
      if (T_MoviIb.State in [dsInsert,dsEdit]) then
        T_MoviIb.Cancel;
      if (T_ConsIb.State in [dsInsert,dsEdit]) then
        T_ConsIb.Cancel;
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
      SwCorteTurno:=false;
      SwCorteOk:=true;
      if not SwCorteParcial then begin
        for xpos:=1 to MaxPosCarga do
          if ((TPosCarga[xpos].isla=xIslaCorte)or(xIslaCorte=0))and(TPosCarga[xpos].swcargando) then begin
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

procedure TFDISPAM1000.ProcesaLinea;
label uno;
var lin,ss,rsp,descrsp,xestado,xmodo,
    ss2,UltimoEstado:string;
    simp,spre,sval:string[20];
    i,xpos:integer;
    ii,nposini,nposfin,
    xcomb,xp,xpr,xc,xfolio:integer;
    xgrade:char;
    xestatus:char;
    ximporte:real;
    xLista:TStrings;
    xvol,ximp:real;
    SwAplicaMapa:boolean;
begin
  try
    try
      if LineaTimer='' then
        exit;
      StaticText6.Caption:='';
      if length(LineaTimer)>3 then begin
        lin:=copy(lineaTimer,2,length(lineatimer)-3);
      end
      else
        lin:=LineaTimer;
      LineaTimer:='';
      if lin='' then
        exit;
      case lin[1] of
       'B':begin // pide estatus de todas las bombas
             StaticText18.Caption:=Lin;
             SwAplicaMapa:=true;
             ContEspera:=0;
             UltimoStatus:=LineaTimer;
             ss:=copy(lin,4,length(lin)-3);
             MaxPosCargaActiva:=length(ss);
             xestado:='';
             for xpos:=1 to MaxPosCargaActiva do begin
               with TPosCarga[xpos] do begin
                 if estatusant<>estatus then
                   SwA:=true; //CAMBIO
                 estatusant:=estatus;
                 estatus:=StrToIntDef(ss[xpos],0);
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
                   0:descestat:='---';  // OFFLINE
                   1:begin              // IDLE
                       descestat:='Inactivo';
                       if not swnivelprec then begin
                         ComandoConsola('T'+inttoclavenum(xpos,2)+'1');
                         swnivelprec:=true;
                         SwAPlicaMapa:=false;
                       end;
                       if (estatusant<>estatus) then
                         FinVenta:=0;
                     end;
                   2:begin              // BUSY
                       descestat:='Despachando';
                       IniciaCarga:=true;
                       SwCargando:=true;
                     end;
                   3:descestat:='Fin de Venta';       // EOT
                   5:descestat:='Pistola Levantada';  // CALL
                   6:descestat:='Cerrada';            // CLOSED
                   8:descestat:='Detenida';           // STOP
                   9:descestat:='Autorizada';         // AUTHORIZED
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
             if ContPumpStop<=0 then begin
               // MAPEA LOS PRODUCTOS
               if SwAplicaMapa then begin
                 for xpos:=1 to MaxPosCargaActiva do with TPosCarga[xpos] do begin
                   for i:=1 to MCxP do if SwMapea[i] then begin
                     ComandoConsola(TMapa[i]);
                     SwMapea[i]:=false;
                     ContEspera:=10;
                     exit;
                   end;
                 end;
               end
               else begin
                 ContEspera:=10;
                 exit;
               end;
               // Checa las posiciones que estan en fin de venta
               for xpos:=1 to MaxPosCargaActiva do begin
                 with TPosCarga[xpos] do begin
                   case Estatus of
                     6:if SwInicio then begin
                         ss:='L'+IntToClaveNum(xpos,2); // OPEN PUMP
                         ComandoConsola(ss);
                         SwInicio:=false;
                         SwPrepago:=false;
                         //SwPreset:=false;
                       end;
                     5:if (ModoOpera='Normal')and(not SwDesHabilitado) then begin
                         ss:='S'+IntToClaveNum(xpos,2); // AUTHORIZATION FOR FILLUP
                         ComandoConsola(ss);
                         SwInicio:=false;
                       end;
                   end;
                 end;
               end;
             end;
             NumPaso:=2;
             StaticText5.Caption:=IntToStr(NumPaso)+' '+IntToStr(ContPumpStop);
             PosicionCargaActual:=0;
           end;
       'A':begin // RECIBE LECTURA DE BOMBA
             xpos:=StrToIntDef(copy(lin,2,2),0);
             if xpos<>0 then begin
               ContEsperaPaso2:=0;
               with TPosCarga[xpos] do begin
                 Mensaje:='';
                 if lin[4]='0' then begin // POSICION ESTA CARGANDO
                   swinicio2:=false;
                   if DigitosDispensario(xpos)=6 then begin
                     simp:=copy(lin,14,8);
                     if TPosCarga[xpos].TDiga[1]=2 then
                       importe:=StrToFloat(simp)/10
                     else if TPosCarga[xpos].TDiga[1]=1 then
                       importe:=StrToFloat(simp)/100
                     else
                       importe:=StrToFloat(simp)/1000;
                     simp:=copy(lin,6,8);
                     if TPosCarga[xpos].TDiga[1]=2 then
                       volumen:=StrToFloat(simp)/10
                     else if TPosCarga[xpos].TDiga[1]=1 then
                       volumen:=StrToFloat(simp)/100
                     else
                       volumen:=StrToFloat(simp)/1000;
                     ximp:=ajustafloat(volumen*precio,2);
                     if abs(importe-ximp)<0.1 then
                       importe:=ximp
                     else
                       volumen:=dividefloat(importe,precio);
                   end
                   else begin
                     simp:=copy(lin,14,8);
                     if TPosCarga[xpos].TDiga[1]=2 then
                       importe:=StrToFloat(simp)/10
                     else if TPosCarga[xpos].TDiga[1]=1 then
                       importe:=StrToFloat(simp)/100
                     else
                       importe:=StrToFloat(simp)/1000;
                     volumen:=dividefloat(importe,precio);
                   end;
                   DespliegaPosCarga(xpos);
                 end
                 else if lin[4]='\' then begin // POSICION NO MAPEADA
                   SwMapea[1]:=true;
                   SwMapea[2]:=true;
                   SwMapea[3]:=true;
                   SwMapea[4]:=true;
                   Mensaje:='No Mapeada';
                 end
                 else begin // VENTA CONCLUIDA
                   xGrade:=lin[4];
                   PosActual:=0;
                   for i:=1 to MCxP do
                     if xGrade=IntToStr(TComb[i]) then
                       PosActual:=TPos[i];
                   if (PosActual=0)or(checkbox2.Checked) then begin   // Perdió el mapeo
                     SwMapea[1]:=true;
                     SwMapea[2]:=true;
                     SwMapea[3]:=true;
                     SwMapea[4]:=true;
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
                       precio:=StrToFloat(spre)/1000;
                       if TPosCarga[xpos].TDiga[1]=2 then
                         importe:=StrToFloat(simp)/10
                       else if TPosCarga[xpos].TDiga[1]=1 then begin
                         // Despliegamemo4(inttostr(xpos)+' ..2 decimales imp '+simp);
                         importe:=StrToFloat(simp)/100;
                       end
                       else
                         importe:=StrToFloat(simp)/1000;
                       if (2*volumen*precio<importe) then
                         importe:=importe/10;
                       if (2*importe<volumen*precio) then
                         importe:=importe*10;
                       if (Estatus=3)and(SwCargando) then begin// EOT
                         SwCargando:=false;
                         swdesp:=true;
                         DMCONS.AgregaLog('> Fin de venta');
                       end;
                       DespliegaPosCarga(xpos);
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
                       if DMCONS.HayConsolaAlterna<>'Si' then begin
                         if (TPosCarga[xpos].finventa=0)or(TPosCarga[xpos].ModoOpera='Normal') then begin
                           if Estatus=3 then begin // EOT
                             ss:='R'+IntToClaveNum(xpos,2); // VENTA COMPLETA
                             if DMCONS.swemular then
                               EmularEstatus[xpos]:='1';
                             ComandoConsola(ss);
                           end;
                         end;
                       end;
                     except
                       //Dec(PosicionCargaActual);
                     end;
                   end;
                 end;
               end;
             end;
           end;
       'C':begin // RECIBE TOTAL DE UNA PISTOLA
             xpos:=StrToIntDef(copy(lin,2,2),0);
             if xpos<>0 then begin
               xgrade:=lin[4];
               with TPosCarga[xpos] do begin
                 for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                   SwTotales[i]:=false;
                   TotalLitros[i]:=StrToFloat(copy(lin,6,10))/100;
                   DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                   swinicio3:=false;
                   DespliegaPosCarga(xpos);
                 end;
               end;
             end;
           end;
       '@':begin // RECIBE TOTAL DE LA POSICION
             xpos:=StrToIntDef(copy(lin,5,2),0);
             if xpos<>0 then begin
               with TPosCarga[xpos] do begin
                 xgrade:=lin[8];
                 for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                   SwTotales[i]:=false;
                   TotalLitros[i]:=StrToFloat(copy(lin,9,10))/100;
                   DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                   swinicio3:=false;
                   DespliegaPosCarga(xpos);
                 end;
                 if nocomb>=2 then begin
                   xgrade:=lin[37];
                   for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                     SwTotales[i]:=false;
                     TotalLitros[i]:=StrToFloat(copy(lin,38,10))/100;
                     DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                     swinicio3:=false;
                     DespliegaPosCarga(xpos);
                   end;
                   if nocomb>=3 then begin
                     xgrade:=lin[66];
                     for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                       SwTotales[i]:=false;
                       TotalLitros[i]:=StrToFloat(copy(lin,67,10))/100;
                       DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                       swinicio3:=false;
                       DespliegaPosCarga(xpos);
                     end;
                     if nocomb=4 then begin
                       xgrade:=lin[95];
                       for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                         SwTotales[i]:=false;
                         TotalLitros[i]:=StrToFloat(copy(lin,96,10))/100;
                         DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                         swinicio3:=false;
                         DespliegaPosCarga(xpos);
                       end;
                     end;
                   end;
                 end;
               end;
             end;
           end;
     idAck:if NumPaso=4 then with DMCONS do begin // CAMBIO DE PRECIOS
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
               SwCambioPrecio:=true;
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
      if ContPumpStop<=0 then begin
        if NumPaso=2 then begin
          if PosicionCargaActual<MaxPosCargaActiva then begin
            repeat
              Inc(PosicionCargaActual);
              with TPosCarga[PosicionCargaActual] do if NoComb>0 then begin
                if (estatus<>estatusant)or(estatus>1) or (((SwA)or(swinicio2))and(estatus>0)) then begin //CAMBIO
                  if (estatus in [1,2,3]) then begin
                    SwActualizar:=true;
                    SwA:=false;
                    ComandoConsola('A'+IntToClaveNum(PosicionCargaActual,2));
                    exit;
                  end;
                end
                else begin
                  if Random(30)=1 then
                    SwActualizar:=true;
                  DespliegaPosCarga(PosicionCargaActual);
                end;
              end;
            until (PosicionCargaActual>=MaxPosCargaActiva);
            NumPaso:=3;
            StaticText5.Caption:=IntToStr(NumPaso);
            PosicionCargaActual:=0;
          end
          else begin
            NumPaso:=3;
            StaticText5.Caption:=IntToStr(NumPaso);
            PosicionCargaActual:=0;
          end;
        end;
        // Lee Totales
        if NumPaso=3 then begin // TOTALES
          // GUARDA VALORES DE DISPENSARIOS CARGANDO
          inc(contguardaval);
          if true (*(contguardaval>=3)*) then with DMCONS do begin
            contguardaval:=0;
            lin:='';xestado:='';xmodo:='';
            for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
              xmodo:=xmodo+ModoOpera[1];
              case estatus of
                0:xestado:=xestado+'0'; // Sin Comunicación
                1:xestado:=xestado+'1'; // Inactivo (Idle)
                2:xestado:=xestado+'2'; // Cargando (In Use)
                3:begin
                    xestado:=xestado+'3'; // Fin de Carga (Used)
                    if (finventa>0)and(ModoOpera<>'Normal')and(swcargando) then begin
                      xestado:=xestado+'2';
                      DMCONS.AgregaLog('> Espera hasta que guarde transaccion: pos '+inttostr(xpos));
                    end;
                  end;
                5:xestado:=xestado+'5'; // Llamando (Calling) Pistola Levantada
                9:xestado:=xestado+'9'; // Autorizado
                8:xestado:=xestado+'8'; // Detenido (Stoped)
                else xestado:=xestado+'0';
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
            if lin='' then
              lin:=xestado+'#'
            else
              lin:=xestado+lin;
            lin:=lin+'&'+xmodo;
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
                    if DMCONS.VersionPam1000='2' then
                      ComandoConsola('@10'+'0'+IntToClaveNum(PosicionCargaActual,2))
                    else begin
                      ComandoConsola('C'+IntToClaveNum(PosicionCargaActual,2)+IntToStr(TComb[PosicionDispenActual])+'1');
                    end;
                    exit;
                  end
                  else
                    DespliegaPosCarga(PosicionCargaActual);
                end;
              end
              else begin
                NumPaso:=4;
                PrecioCombActual:=0;
                StaticText5.Caption:=IntToStr(NumPaso);
              end;
            until (PosicionCargaActual>MaxPosCarga);
            NumPaso:=4;
            PrecioCombActual:=0;
            StaticText5.Caption:=IntToStr(NumPaso);
          end
          else begin
            NumPaso:=4;
            PrecioCombActual:=0;
            StaticText5.Caption:=IntToStr(NumPaso);
          end;
        end;

        if NumPaso=4 then begin // CAMBIO DE PRECIOS
          if PrecioCombActual<MaxComb then with DMCONS do begin
            repeat
              inc(PrecioCombActual);
              with TabComb[PrecioCombActual] do begin
                if AplicaPrecio then begin // Cambia Precios
                  if ProductoPrecio<>'' then begin
                    ComandoConsola('X'+'00'+ProductoPrecio+'1'+'00'+IntToClaveNum(Trunc(Precio*1000+0.5),4));
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
            if SwCambioPrecio then begin
              SwCambioPrecio:=false;
            end;
            NumPaso:=5;
            StaticText5.Caption:=IntToStr(NumPaso);
          end
          else with DMCONS do begin
            if SwCambioPrecio then begin
              SwCambioPrecio:=false;
            end;
            NumPaso:=5;
            StaticText5.Caption:=IntToStr(NumPaso);
          end;
        end;
      end
      else NumPaso:=5;
      if (NumPaso=5) then with DMCONS do begin
        if ContPumpStop<=0 then begin
          (*
          // Checa Ventas Concluidas
          for xpos:=1 to MaxPosCargaActiva do with TPosCarga[xpos] do if (estatus=1)and(iniciacarga) then begin
            iniciacarga:=false;
            SwPrepago:=false;
            T_ConsIb.Active:=true;
            try
              if T_ConsIb.Locate('PosCarga',xpos,[]) then begin
                if (StrToChar(T_ConsIbEstatus.AsString) in ['P','p'])or(SwPrepago) then begin
                  T_ConsIb.Edit;
                  T_ConsIbVolumen.AsFloat:=0; //TPosCarga[xpos].volumen;
                  T_ConsIbPrecio.AsFloat:=0; //TPosCarga[xpos].precio;
                  T_ConsIbImporte.AsFloat:=0; //TPosCarga[xpos].importe;
                  xcomb:=CombustibleEnPosicion(xpos,PosActual);
                  T_ConsIbCombustible.AsString:=TabComb[xcomb].Nombre;
                  T_ConsIbFolio.AsInteger:=0;
                  T_ConsIb.Post;
                  T_ConsIb.Edit;
                  T_ConsIbEstatus.AsString:='F';
                  T_ConsIb.Post;
                end;
              end;
            finally
              T_ConsIb.Active:=false;
            end;
          end;
          *)
          // Checa peticiones de ventas con tarjeta
          Q_ConsIb.Active:=false;
          Q_ConsIb.ParamByName('pestatus').asstring:='S';
          Q_ConsIb.ParamByName('pestatus2').asstring:='s';
          Q_ConsIb.Active:=true;
          if not Q_ConsIb.Eof then begin
            rsp:='OK';
            SnPosCarga:=Q_ConsIbPosCarga.AsInteger;
            if (TPosCarga[SnPosCarga].estatus in [1,5,9]) then begin
              if Q_ConsIbMonVol.AsString='V' then begin // litros
                SnImporte:=Q_ConsIbImporte.AsFloat;
              end
              else
                SnImporte:=Q_ConsIbValor.AsFloat; // importe
              if Q_ConsIbPosicion.asinteger>0 then
                xcomb:=CombustibleEnPosicion(Q_ConsIbPosCarga.AsInteger,Q_ConsIbPosicion.asinteger)
              else xcomb:=0;
              EnviaPreset(rsp,xcomb);
            end
            else rsp:='Posición de Carga no Disponible';
            if rsp<>'OK' then
              xestatus:='E'
            else
              xestatus:='P';
            T_ConsIb.Active:=true;
            try
              if T_ConsIb.Locate('PosCarga',SnPosCarga,[]) then begin
                T_ConsIb.Edit;
                T_ConsIbEstatus.AsString:=xestatus;
                TPosCarga[SnPosCarga].EstaT_Cons:=StrToChar(T_ConsIbEstatus.AsString);
                T_ConsIb.Post;
                TPosCarga[SnPosCarga].SwPrepago:=true;
              end;
            finally
              T_ConsIb.Active:=false;
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
        end;
        // Checa Comandos
        with DMCONS do if true(*((Now-FechaHoraComando)>tmSegundo)or(ContPumpStop>0)*) then begin
          FechaHoraComando:=Now;
          Q_Cmnd.Active:=false;
          Q_Cmnd.ParamByName('pmodulo').AsString:='DISP';
          Q_Cmnd.Active:=true;
          while not Q_Cmnd.Eof do begin
            SwAplicaCmnd:=true;
            ss:=ExtraeElemStrSep(Q_CmndComando.AsString,1,' ');
            // CMND: PARO TOTAL
            if ss='PAROTOTAL' then begin
              rsp:='OK';
              ComandoConsola('E 00');
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
            // CMND: ACTIVA MODO PREPAGO
            else if ss='AMP' then begin
              xpos:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
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
            // CMND: DESACTIVA MODO PREPAGO
            else if ss='DMP' then begin
              xpos:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
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
            // ORDENA CARGA DE COMBUSTIBLE
            else if ss='OCC' then begin
              SnPosCarga:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
              rsp:='OK';
              if (SnPosCarga in [1..MaxPosCarga]) then begin
                if TPosCarga[SnPosCarga].ModoOpera='Prepago' then begin
                  try
                    SnImporte:=StrToFLoat(ExtraeElemStrSep(Q_CmndComando.AsString,3,' '));
                    if (SnImporte<1)or(SnImporte>9999) then
                      rsp:='Importe fuera de rango válido: de 1.00 a 9999.00';
                  except
                    rsp:='Error en Importe';
                  end;
                  if rsp='OK' then begin
                    xcomb:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,4,' '),0);
                    TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,5,' '),0);
                    TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,6,' '),0);
                    EnviaPreset(rsp,xcomb);
                  end;
                end
                else rsp:='No se encuentra en Modo Prepago';
              end
              else rsp:='Posicion de Carga no Existe';
            end
            // ORDENA FIN DE VENTA
            else if ss='FINV' then begin
              rsp:='Ok';
              xpos:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
              if (xpos in [1..MaxPosCarga]) then begin
                TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,3,' '),0);
                if TPosCarga[xpos].Estatus=3 then begin // EOT
                  SwAplicaCmnd:=false;
                  if (not TPosCarga[xpos].swcargando) then begin
                    ss:='R'+IntToClaveNum(xpos,2); // VENTA COMPLETA
                    if DMCONS.swemular then
                      EmularEstatus[xpos]:='1';
                    EsperaMiliSeg(500);
                    ComandoConsola(ss);
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
                    end;
                  end;
                end
                else begin // EOT
                  SwAplicaCmnd:=true;
                end;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            // CMND: DESHABILITA POSICIOND DE CARGA
            else if ss='DPC' then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
              if xpos in [1..MaxPosCarga] then
                TPosCarga[xpos].SwDesHabilitado:=true;
            end
            else if ss='HPC' then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
              if xpos in [1..MaxPosCarga] then
                TPosCarga[xpos].SwDesHabilitado:=false;
            end
            // CMND: DESAUTORIZA VENTA DE COMBUSTIBLE
            else if (ss='DVC')or(ss='PARAR') then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
              if (TPosCarga[xpos].estatus in [2,9]) then begin
                ComandoConsola('E'+IntToClaveNum(xpos,2));
                if DMCONS.swemular then
                  if xpos in [1..MaxPosCarga] then
                    if EmularEstatus[xpos]='2' then
                      EmularEstatus[xpos]:='8'  // Si el flujo ya inició, para el despache momentaneamente y se puede reanudar.
                    else
                      EmularEstatus[xpos]:='1'; // Si el flujo no ha iniciado, la ventra se cancela totalmente.
              end;
            end
            else if (ss='REANUDAR') then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
              if (TPosCarga[xpos].estatus in [8]) then begin
                ComandoConsola('G'+IntToClaveNum(xpos,2));
                if DMCONS.swemular then
                  if xpos in [1..MaxPosCarga] then
                    if EmularEstatus[xpos]='8' then
                      EmularEstatus[xpos]:='2'
              end;
            end
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
            end
            // CMND: ACTIVA FLUJO ESTANDAR
            else if ss='FLUSTD' then begin  // FLUJO ESTANDAR
              if true (*Licencia2Ok*) then begin
                rsp:='';
                if DMCONS.TipoClb='1' then begin // PRECIO
                  // X CAMBIO DE PRECIO
                  for i:=1 to MCxP do if TPosCarga[1].TPos[i]=1 then
                    ComandoConsola('X'+'00'+IntToStr(TPosCarga[1].TComb[i])+'2'+'00'+IntToClaveNum(Trunc(3.823*1000+0.5),4));
                  EsperaMiliSeg(500);
                  Timer2.Enabled:=false;
                  Timer2.Tag:=0;
                  Timer2.Enabled:=true;
                  rsp:=rsp+'OK';
                end
                  // E - STOP PUMP
                  // G - RESTART PUMP
                else if DMCONS.TipoClb='2' then begin // PUMP STOP
                  SwAplicaCmnd:=false;
                  if ContPumpStop=0 then begin
                    ContPumpStop:=5;
                    xPosStop:=0;
                    xPosStop2:=0;
                    PasoPumpStop:=1;
                    StEsperaStop:=0;
                  end;
                  if xPosStop=0 then begin
                    xpos:=2;
                    repeat
                      if TPosCarga[xpos].estatus=1 then
                        xPosStop:=xpos
                      else
                        inc(xpos,2);
                    until (xpos>MaxPosCarga)or(xPosStop>0)or(xpos>12);
                  end;
                  if MaxPosCarga>12 then begin
                    if xPosStop2=0 then begin
                      xpos:=14;
                      repeat
                        if TPosCarga[xpos].estatus=1 then
                          xPosStop2:=xpos
                        else
                          inc(xpos,2);
                      until (xpos>MaxPosCarga)or(xPosStop2>0);
                    end;
                  end;
                  if (xPosStop>0)and((xPosStop2>0)or(MaxPosCarga<=12)) then begin
                    if stesperastop=0 then begin
                      case PasoPumpStop of
                        1:begin // START
                            ComandoConsola('S'+IntToClaveNum(xPosStop,2));
                            PasoPumpStop:=2;
                          end;
                        2:begin // STOP
                            ComandoConsola('E'+IntToClaveNum(xPosStop,2));
                            if MaxPosCarga<=12 then begin
                              PasoPumpStop:=1;
                              dec(ContPumpStop);
                              StEsperaStop:=2;
                              if ContPumpStop=0 then begin
                                SwAplicaCmnd:=true;
                                rsp:='OK';
                              end;
                            end
                            else
                              PasoPumpStop:=3;
                          end;
                        3:begin // START
                            ComandoConsola('S'+IntToClaveNum(xPosStop2,2));
                            PasoPumpStop:=4;
                          end;
                        4:begin // STOP
                            ComandoConsola('E'+IntToClaveNum(xPosStop2,2));
                            PasoPumpStop:=1;
                            dec(ContPumpStop);
                            StEsperaStop:=2;
                            if ContPumpStop=0 then begin
                              SwAplicaCmnd:=true;
                              rsp:='OK';
                            end;
                          end;
                      end;
                    end
                    else dec(stesperastop);
                  end
                  else begin
                    SwAplicaCmnd:=true;
                    rsp:='Error: No hay pos.disp.'
                  end;
                end;
              end
              else begin // if licencia2ok
                rsp:='Opción no Habilitada';
              end;
            end
            // CMND: ACTIVA FLUJO MINIMO
            else if ss='FLUMIN' then begin  // FLUJO MINIMO
              if true (*Licencia2Ok*) then begin
                rsp:='';
                if DMCONS.TipoClb='1' then begin // PRECIO
                  for i:=1 to MCxP do if TPosCarga[1].TPos[i]=1 then
                    ComandoConsola('X'+'00'+IntToStr(TPosCarga[1].TComb[i])+'2'+'00'+IntToClaveNum(Trunc(3.714*1000+0.5),4));
                  EsperaMiliSeg(500);
                  Timer2.Enabled:=false;
                  Timer2.Tag:=0;
                  Timer2.Enabled:=true;
                  rsp:=rsp+'OK';
                end
                else if DMCONS.TipoClb='2' then begin // PUMP STOP
                  SwAplicaCmnd:=false;
                  if ContPumpStop=0 then begin
                    ContPumpStop:=5;
                    xPosStop:=0;
                    xPosStop2:=0;
                    PasoPumpStop:=1;
                    StEsperaStop:=0;
                  end;
                  if xPosStop=0 then begin
                    xpos:=1;
                    repeat
                      if TPosCarga[xpos].estatus=1 then
                        xPosStop:=xpos
                      else
                        inc(xpos,2);
                    until (xpos>MaxPosCarga)or(xPosStop>0)or(xpos>12);
                  end;
                  if MaxPosCarga>12 then begin
                    if xPosStop2=0 then begin
                      xpos:=13;
                      repeat
                        if TPosCarga[xpos].estatus=1 then
                          xPosStop2:=xpos
                        else
                          inc(xpos,2);
                      until (xpos>MaxPosCarga)or(xPosStop2>0);
                    end;
                  end;
                  if (xPosStop>0)and((xPosStop2>0)or(MaxPosCarga<=12)) then begin
                  //if (xPosStop>0)and(xPosStop2>0) then begin
                    if stesperastop=0 then begin
                      case PasoPumpStop of
                        1:begin // RESTART
                            ComandoConsola('S'+IntToClaveNum(xPosStop,2));
                            PasoPumpStop:=2;
                          end;
                        2:begin // START
                            ComandoConsola('E'+IntToClaveNum(xPosStop,2));
                            if MaxPosCarga<=12 then begin
                              PasoPumpStop:=1;
                              dec(ContPumpStop);
                              StEsperaStop:=2;
                              if ContPumpStop=0 then begin
                                SwAplicaCmnd:=true;
                                rsp:='OK';
                              end;
                            end
                            else
                              PasoPumpStop:=3;
                            (*
                            dec(ContPumpStop);
                            StEsperaStop:=2;
                            if ContPumpStop=0 then begin
                              SwAplicaCmnd:=true;
                              rsp:='OK';
                            end;*)
                          end;
                        3:begin // RESTART
                            ComandoConsola('S'+IntToClaveNum(xPosStop2,2));
                            PasoPumpStop:=4;
                          end;
                        4:begin // START
                            ComandoConsola('E'+IntToClaveNum(xPosStop2,2));
                            PasoPumpStop:=1;
                            dec(ContPumpStop);
                            StEsperaStop:=2;
                            if ContPumpStop=0 then begin
                              SwAplicaCmnd:=true;
                              rsp:='OK';
                            end;
                          end;
                      end;
                    end
                    else dec(stesperastop);
                  end
                  else begin
                    SwAplicaCmnd:=true;
                    rsp:='Error: No hay pos.disp.'
                  end;
                end;
              end
              else begin // if licencia2ok
                rsp:='Opción no Habilitada';
              end;
            end
            else rsp:='Comando no existe';
            if SwAplicaCmnd then begin
              try
                if rsp='' then
                  rsp:='OK';
                T_Cmnd.Active:=true;
                if T_Cmnd.Locate('Folio',Q_CmndFolio.AsInteger,[]) then begin
                  T_Cmnd.Edit;
                  T_CmndAplicado.AsString:='Si';
                  T_CmndResultado.AsString:=rsp;
                  T_Cmnd.Post;
                end;
              except
              end;
            end;
            if SwCerrar then
              Close;
            Q_Cmnd.Next;
          end;
        end;
        NumPaso:=0;
      end;
    except
      with DMCONS do begin
        if (T_ConsIb.State in [dsInsert,dsEdit]) then
          T_ConsIb.Cancel;
        if (T_Cmnd.State in [dsInsert,dsEdit]) then
          T_Cmnd.Cancel;
        if (T_Tcmb.State in [dsInsert,dsEdit]) then
          T_Tcmb.Cancel;
      end;
    end;
  finally
    //Timer1.Enabled:=true;
    //Timer2.Enabled:=true;
    //Timer3.Enabled:=true;
  end;
end;

procedure TFDISPAM1000.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
begin
  try
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
        SwError:=(lineaTimer=idNak);
        ProcesaLinea;
        LineaTimer:='';
        SwEspera:=false;
      end
      else SwEspera:=true;
    finally
      Timer1.Enabled:=true;
    end;
  except
  end;
end;

procedure TFDISPAM1000.ComandoConsola(ss:string);
var s1:string;
    cc:char;
begin
  try
    SwError:=false;
    if DMCONS.SwEmular then begin
      LineaEmular:=ss;
      DMCONS.AgregaLog('E '+ss);
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
      s1:=#2+ss+#3+CC;
      if ApdComPort1.OutBuffFree >= Length(S1) then begin
        DMCONS.AgregaLog('E '+s1);
        ApdComPort1.PutString(S1);
      end
      else begin
        inc(ContBuffLleno);
      end;
    finally
      Timer1.Enabled:=true;
    end;
  except
  end;
end;


procedure TFDISPAM1000.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISPAM1000.Restaurar1Click(Sender: TObject);
begin
  FDISPAM1000.Visible:=true;
end;

procedure TFDISPAM1000.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFDISPAM1000.FormCreate(Sender: TObject);
begin
  ContPumpStop:=0;
  SwCerrar:=false;
  SwInicio:=true;
  ContadorAlarma:=0;
  ContGuardaVal:=0;
end;

procedure TFDISPAM1000.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISPAM1000.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdComPort1.Open:=false;
  Application.Terminate;
end;

procedure TFDISPAM1000.Timer1Timer(Sender: TObject);
var ss:string;
    i:integer;
begin
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
      if (DMCONS.StLevanta='Si')and(ContadorAlarma>=40) then begin
        if DMCONS.VersionPam1000='2' then
           ComandoConsola('@070'); // reset pam
        EsperaMiliSeg(1000);
        //DMCONS.ListaLog.Add('Error de Comunicación');
        //DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
        try
          esperamiliseg(1000);
          Application.Terminate;
        finally
        end;
      end;
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
        StaticText6.Caption:='Espera2';
        inc(ContEsperaPaso2);     // espera hasta 5 ciclos
        if ContEsperaPaso2>MaxEspera2 then begin
          ContEsperaPaso2:=0;
          LineaTimer:='.A00..';  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
        end;
      end;
      if NumPaso=3 then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera3';
        inc(ContEsperaPaso3);     // espera hasta 5 ciclos
        if ContEsperaPaso3>MaxEspera3 then begin
          ContEsperaPaso3:=0;
          LineaTimer:='.N00..';  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
        end;
      end;
      if NumPaso=4 then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera6';
        inc(ContEsperaPaso4);     // espera hasta 5 ciclos
        if ContEsperaPaso4>3 then begin
          ContEsperaPaso4:=0;
          LineaTimer:=idNak;  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
        end;
      end;
      if NumPaso=5 then begin
        StaticText6.Caption:='Espera7';
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
      StaticText6.Caption:='Espera1';
      inc(ContEspera);
      if ContEspera>10 then begin
      end
      else exit;
    end;

    if not DMCONS.swemular then begin
      if ApdComPort1.OutBuffUsed>0 then begin
        NumPaso:=0;
        exit;
      end;
    end;

    NumPaso:=1;
    StaticText5.Caption:=IntToStr(NumPaso);
    ss:='B00';
    ContEspera:=0;
    SwEspera:=true;
    StaticText6.Caption:='Esperando..';
    ComandoConsola(ss);
    if NotificationIcon1.Tag=0 then begin
      if ErrorInic then begin
        EsperaMiliSeg(3000);
        Application.Terminate;
      end;
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      FDISPAM1000.Visible:=false;
      NotificationIcon1.Show;
    end;
  except
  end;
end;

procedure TFDISPAM1000.EnviaPreset(var rsp:string;xcomb:integer);
var xpos,xc,xp:integer;
    ss,xprodauto:string;
    xprecio,xvolumen:real;
begin
  rsp:='OK';
  xpos:=SnPosCarga;
  //TPosCarga[xpos].FinVenta:=0;
  if not (TPosCarga[xpos].estatus in [1,5,9]) then begin
    rsp:='Posición no Disponible';
    DespliegaMemo4(rsp+' Pos: '+inttostr(xpos)+'   Estatus: '+inttostr(TPosCarga[xpos].estatus));
    exit;
  end;
  if TPosCarga[xpos].estatus=9 then begin
    ComandoConsola('E'+IntToClaveNum(xpos,2));
    Esperamiliseg(100);
  end;
  if snimporte>9000 then
    snimporte:=9000;
  if DMCONS.VersionPam1000='2' then begin
    xprodauto:='000000';
    xp:=0;
    with TPosCarga[xpos] do begin
      for xc:=1 to NoComb do begin
        xp:=TPos[xc];
        if xcomb>0 then begin // un producto
          if TComb[xc]=xcomb then
            xprodauto[xp]:='1';
        end
        else xprodauto[xp]:='1';
      end
    end;
    //if DMCONS.DigitosPam1000='6' then begin
    if DigitosDispensario(xpos)=6 then begin
      DespliegaMemo4('Digitos=6');
      //if DMCONS.DecimalesPam1000='1' then begin
      if DecimalesDispensario(xpos)=1 then begin
        ss:='@02'+'0'+IntToClaveNum(xpos,2)+'0'+'1'+FiltraStrNum(FormatFloat('00000.0',snimporte))+xprodauto;
        DespliegaMemo4('Decimales=1');
        DespliegaMemo4(ss);
      end
      else begin
        ss:='@02'+'0'+IntToClaveNum(xpos,2)+'0'+'1'+FiltraStrNum(FormatFloat('0000.00',snimporte))+xprodauto;
        DespliegaMemo4('Decimales=2');
        DespliegaMemo4(ss);
      end;
    end
    else
      ss:='@02'+'0'+IntToClaveNum(xpos,2)+'0'+'1'+FiltraStrNum(FormatFloat('00000.0',snimporte))+xprodauto;
    if copy(ss,9,6)<'000010' then begin
      rsp:='Importe mínimo $10.00';
      exit;
    end;
  end
  else begin
    //if DMCONS.DigitosPam1000='6' then begin
    if DigitosDispensario(xpos)=6 then begin
      if snimporte>999.00 then
        snimporte:=999.00;
      ss:='P'+IntToClaveNum(xpos,2)+'0'+'1'+'000'+FiltraStrNum(FormatFloat('00000',snimporte))+'0';
    end
    else begin
      //if DMCONS.DecimalesPam1000='1' then
      if DecimalesDispensario(xpos)=1 then
        ss:='P'+IntToClaveNum(xpos,2)+'0'+'1'+'000'+FiltraStrNum(FormatFloat('0000.0',snimporte))+'0'
      else begin
        if snimporte>999.00 then
          snimporte:=999.00;
        ss:='P'+IntToClaveNum(xpos,2)+'0'+'1'+'000'+FiltraStrNum(FormatFloat('000.00',snimporte))+'0';
      end;
    end;


    if copy(ss,9,5)<'00010' then begin
      rsp:='Importe mínimo $10.00';
      exit;
    end;
  end;
  ComandoConsola(ss);
  EsperaMiliSeg(300);
  if SwError then begin
    rsp:='Error al Activar Posición de Carga';
    exit;
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

procedure TFDISPAM1000.Timer3Timer(Sender: TObject);
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
                //EmularEstatus[xpos]:='1';
                case EmularEstatus[xpos] of
                  '1':if TPosCarga[xpos].ModoOpera<>'Prepago' then begin
                        EmularEstatus[xpos]:='2';
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
              //if xpos=2 then
                //linea[4]:='\';
            end;
        'C':begin
              //xpos:=StrToIntDef(copy(lin,2,2),1);
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
        'E','G','S':Linea:=idAck;
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

(*
procedure TFDISPAM1000.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    MaskEdit2.SetFocus;
  if key in [48..57] then begin
    MaskEdit2.Text:='';
    StaticText16.Caption:='';
  end;
end;

procedure TFDISPAM1000.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    BitBtn2.SetFocus;
end;

procedure TFDISPAM1000.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key='*' then
    MaskEdit1.SetFocus;
end;

procedure TFDISPAM1000.MaskEdit1Enter(Sender: TObject);
begin
  MaskEdit1.Text:='';
  MaskEdit2.Text:='';
end;

procedure TFDISPAM1000.GroupBox1Enter(Sender: TObject);
begin
  if SwProcesando then
    Memo2.SetFocus;
end;

procedure TFDISPAM1000.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text:=FiltraStrNum(MaskEdit1.Text);
end;
  *)
procedure TFDISPAM1000.registro(valor:integer;variable:string);
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

(*
procedure TFDISPAM1000.registro_disp(valor:string);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create(KEY_WRITE);
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    if Registry.OpenKey('\SOFTWARE\IMAGEN\VOL\POS', True) then // ESCRIBE EN REGISTRO
       Registry.WriteString('ESTADOS',copy(Valor,1,MaxPosCarga))
  finally
    Registry.CloseKey;
    Registry.Free;
  end;
end;
  *)
procedure TFDISPAM1000.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISPAM1000.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISPAM1000.lee_registro;
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

  
procedure TFDISPAM1000.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISPAM1000.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
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

procedure TFDISPAM1000.SpeedButton1Click(Sender: TObject);
begin
  ComandoConsola(Edit1.Text);
end;

procedure TFDISPAM1000.Timer2Timer(Sender: TObject);
var i:integer;
begin
  Timer2.Tag:=Timer2.Tag+1;
  if Timer2.Tag>15 then with DMCONS do begin
    Timer2.Enabled:=false;
    for i:=1 to MCxP do if TPosCarga[1].TPos[i]=1 then
      ComandoConsola('X'+'00'+IntToStr(TPosCarga[1].TComb[i])+'2'+'00'+IntToClaveNum(Trunc(0.000*1000+0.5),4));
  end;
end;

procedure TFDISPAM1000.ListBoxPC1DblClick(Sender: TObject);
begin
  if DMCONS.swemular then
    if EmularEstatus[1]='1' then
      EmularEstatus[1]:='5'
    else if EmularEstatus[1]='5' then
      EmularEstatus[1]:='1'
end;

procedure TFDISPAM1000.ListBoxPC2Click(Sender: TObject);
begin
  if DMCONS.swemular then
    if EmularEstatus[2]='1' then
      EmularEstatus[2]:='5'
    else if EmularEstatus[2]='5' then
      EmularEstatus[2]:='1'
end;

procedure TFDISPAM1000.ListBoxPC3Click(Sender: TObject);
begin
  if DMCONS.swemular then
    if EmularEstatus[3]='1' then
      EmularEstatus[3]:='5'
    else if EmularEstatus[3]='5' then
      EmularEstatus[3]:='1'
end;

procedure TFDISPAM1000.ListBoxPC4Click(Sender: TObject);
begin
  if DMCONS.swemular then
    if EmularEstatus[4]='1' then
      EmularEstatus[4]:='5'
    else if EmularEstatus[4]='5' then
      EmularEstatus[4]:='1'
end;

end.
