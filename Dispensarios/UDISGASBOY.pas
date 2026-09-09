unit UDISGASBOY;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Grids, ULibPrint,db, DBGrids, RXShell, Registry, DBTables;

const Intervalo=150;
type
  TFDISGASBOY = class(TForm)
    ApdComPort1: TApdComPort;
    Panel1: TPanel;
    PageControl1: TPageControl;
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
    MenuItem1: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem2: TMenuItem;
    PopupMenu4: TPopupMenu;
    MenuItem3: TMenuItem;
    PopupMenu5: TPopupMenu;
    MenuItem4: TMenuItem;
    TabSheet1: TTabSheet;
    StaticText17: TStaticText;
    Timer3: TTimer;
    ImageList1: TImageList;
    Panel2: TPanel;
    ListView1: TListView;
    Memo4: TMemo;
    Timer4: TTimer;
    StaticText5: TStaticText;
    Panel4: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    StaticText6: TStaticText;
    PopupMenu6: TPopupMenu;
    PonerenFullService1: TMenuItem;
    PonerenSelfService1: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Timer2: TTimer;
    NotificationIcon1: TRxTrayIcon;
    TabSheet5: TTabSheet;
    Memo1: TMemo;
    Memo2: TMemo;
    PopupMenu7: TPopupMenu;
    VerTrfico1: TMenuItem;
    OcultarTrfico1: TMenuItem;
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
    DespliegaFlujo1: TMenuItem;
    OcultaFlujo1: TMenuItem;
    DespliegaFlujo2: TMenuItem;
    OcultaFlujo2: TMenuItem;
    DespliegaFlujo3: TMenuItem;
    OcultaFlujo3: TMenuItem;
    DespliegaFlujo4: TMenuItem;
    OcultaFlujo4: TMenuItem;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    Bevel1: TBevel;
    Label4x: TLabel;
    StaticText9: TStaticText;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    StaticText10: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure ApdComPort1TriggerAvail(CP: TObject; Count: Word);
    procedure ListBox1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PonerenFullService1Click(Sender: TObject);
    procedure PonerenSelfService1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure NotificationIcon1DblClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure VerTrfico1Click(Sender: TObject);
    procedure OcultarTrfico1Click(Sender: TObject);
    procedure DespliegaFlujo1Click(Sender: TObject);
    procedure OcultaFlujo1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwPurge,
    SwEspera:boolean;
    ContEspera,
    NumPaso,
    ContBuffLleno,
    errbcc :integer;
    swprocesando,
    swconectado:boolean;
    SwInicio:boolean;
    SwInicioPPU,
    SwPTR,
    SwChecaPrecio:boolean;
    EmularEstatus,
    LineaEmular:string;
    HoraArranque,
    UltimaHora:TDateTime;
    UltimaTransac:integer;
    xUltimaFecha:string[6];
    xUltimaHora:string[4];
    xflujo:real;
    ListaLOCU,
    ListaEmular :TStrings;
    ContGuardaTotales,
    ContPpu,
    ContPpu2,
    Cont4:integer;
    SwDespliegaFlujo,
    SwAplicaCorte,
    SwPurgeSite:boolean;
    ContadorAlarma:integer;
    contguardaval:integer;
  public
    { Public declarations }
    procedure ComandoConsola(ss:string);
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer;swdb:boolean);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    function ExisteTexto(xstr:string):Boolean;
    procedure AnalizaPPR;
    procedure AnalizaPTI;
    procedure AnalizaPTR;
    procedure AnalizaPPU;        // Estatus de Pistolas
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    procedure despliegamemo1(ss:string);
  end;

type tiposcarga = record
       isla     :integer;
       estatus  :integer;
       descestat:string[20];
       importe,
       volumen,
       precio,
       flujo     :real;
       swflujoant  :boolean;
       flujoant :real;
       NoComb   :integer;
       CombActual:integer;
       MangActual:integer;
       PrGasboy,
       estatusant:integer;
       Estat_Cons:char;
       SwDesp:boolean;
       aux:integer;
       SwAutorizado,
       SwTarjeta:boolean;
       Hora:TDateTime;
       UltimaTran:longint;
       TComb    :array[1..2] of integer;
       TCombCon :array[1..2] of integer;
       TMang    :array[1..2] of integer;
       TNombre  :array[1..2] of string[20];
       TotalLts :array[1..3] of real; // Acumulado litros por pistola
       VolActual :array[1..3] of real; // Acumulado litros por pistola
       TotalLtsAnt :array[1..3] of real; // Acumulado litros por pistola
       TotalImp :array[1..3] of real; // Acumulado importe por pistola
       SwInicioTot:boolean;  // Determina si ya se inicializaron los Totales
       SwFinCarga:boolean;  // Determina si finalizó carga
       Tarjeta  :string[16];
       Kilometraje:longint;
       EstadoPos:string[2];
       FechaGasboy:string[6];
       HoraGasboy:string[4];
       swactualizar,
       swcargando:boolean;
       limitecarga:string[20];
     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=20;
      MaxEspera31=10;
      MaxEspera3=20;


var
  FDISGASBOY: TFDISGASBOY;
  TCombustible:array[1..10] of String;
  TPrecio:array[1..9] of real;
  TPosCarga:array[1..100] of tiposcarga;
  MaxPosCarga:integer;
  AvanceBar:integer;
  SwSolOk:boolean;
  StErrSol:integer;
  ruta_db:string;
  SwCerrar    :boolean;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UAutoriza2, DDMCONS2, UDISMENU;

{$R *.DFM}

Function EjecutaCorte:string;
var rsp,descrsp:string;
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
                if T_Corte.Locate('Fecha;Turno;Isla;PosCarga;Combustible',
                   VarArrayOf([xFechaCorte,xTurnoCorte,TPosCarga[xpos].isla,xpos,xcomb]),[]) then
                  T_Corte.Delete;
                T_Corte.Insert;
                T_CorteFecha.AsDateTime:=xFechaCorte;
                T_CorteTurno.AsInteger:=xTurnoCorte;
                T_CorteIsla.AsInteger:=TPosCarga[xpos].isla;
                T_CortePosCarga.AsInteger:=xpos;
                T_CorteCombustible.AsInteger:=xcomb;
                T_CorteContadorLitros.AsFloat:=AjustaFloat(Totallts[xcomb],3);
                T_CorteContadorImporte.AsFloat:=AjustaFloat(Totalimp[xcomb],2);
                T_Corte.Post;
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

procedure TFDISGASBOY.despliegamemo1(ss:string);
begin
  while Memo1.Lines.Count>60 do
    Memo1.Lines.Delete(0);
  Memo1.Lines.Add(ss);
end;

procedure TFDISGASBOY.DespliegaPrecios;
var i:integer;
begin
  with DMCONS do begin
    Memo2.Lines.Clear;
    Memo2.Lines.Add('Precios Actuales: ');
    for i:=1 to MaxComb do with TabComb[i] do if Activo then
      Memo2.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
  end;
end;

procedure TFDISGASBOY.IniciaBaseDeDatos;
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
          'S':ApdComPort1.Parity:=pSpace;
        end;
        ApdComPort1.DataBits:=ptBitsDatos;
        ApdComPort1.StopBits:=ptBitsParada;
      end;
      Q_Fact1.Active:=false;Q_Fact1.Active:=true;
      Q_Fact2.Active:=false;Q_Fact2.Active:=true;


      Q_BombIb.Active:=false;
      Q_BombIb.Active:=true;

      if Q_BombIb.IsEmpty then
        raise Exception.Create('Estación no existe, o no tiene posiciones de carga configurados');

      if swemular then begin
        Q_CombIb.Active:=true;
        Q_CombIb.First;
        while not Q_CombIb.Eof do begin
          if Q_CombIbClave.AsInteger in [1..9] then begin
            i:=Q_CombIbClave.AsInteger;
            SP_DamePrec.ParamByName('PCombust').asinteger:=i;
            SP_Dameprec.ParamByName('PFechaHora').asdatetime:=Now;
            SP_DamePrec.ExecProc;
            TPrecio[i]:=SP_DamePrec.ParamByName('RPrecio').asfloat;
          end;
          Q_CombIb.Next;
        end;
      end;
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

      CargaPreciosFH(Now,false);
      DespliegaPrecios;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISGASBOY.IniciaEstacion;
var i,j,xnum,xisla,xpos,xcomb:integer;
    existe:boolean;
begin
  with DMCONS do begin
    for i:=1 to 10 do
      TCombustible[i]:='';
    Q_CombIb.Active:=true;
    Q_CombIb.First;
    while not Q_CombIb.Eof do begin
      i:=Q_CombIbClave.AsInteger;
      if i in [1..10] then
        TCombustible[i]:=Q_CombIbNombre.AsString;
      Q_CombIb.Next;
    end;

    ListView1.Items.Clear;
    MaxPosCarga:=0;
    for i:=1 to 100 do with TPosCarga[i] do begin
      isla:=0;
      estatus:=1; // inactiva
      estatusant:=0;
      combactual:=0;
      prgasboy:=0;
      NoComb:=0;
      flujo:=-1;
      flujoant:=0;
      swflujoant:=false;
      Estat_Cons:=' ';
      SwTarjeta:=false;
      SwAutorizado:=false;
      for j:=1 to 3 do begin
        totallts[j]:=0;
        totalltsant[j]:=0;
        volactual[j]:=0;
        totalimp[j]:=0;
      end;
      SwInicioTot:=false;
      SwFinCarga:=false;
      UltimaTran:=0;
      Tarjeta:='';
      Kilometraje:=0;
      FechaGasboy:='';
      HoraGasboy:='';
      EstadoPos:='--';
      limitecarga:='';
      SwCargando:=false;
      SwActualizar:=false;
    end;

    // CARGA DEFAULTS GASBOY
    TL_Bomb.Active:=true;
    while not TL_Bomb.Eof do begin
      TL_Bomb.Edit;
      if not (TL_BombCon_Posicion.AsInteger in [1..3]) then
        TL_BombCon_Posicion.AsInteger:=TL_BombCombustible.AsInteger;
      TL_Bomb.Post;
      TL_Bomb.Next;
    end;
    TL_Tcmb.Active:=true;
    while not TL_Tcmb.Eof do begin
      TL_Tcmb.Edit;
      if (TL_TcmbCon_ProductoPrecio.AsString<>'1') and
         (TL_TcmbCon_ProductoPrecio.AsString<>'2') and
         (TL_TcmbCon_ProductoPrecio.AsString<>'3')
      then
        TL_TcmbCon_ProductoPrecio.AsInteger:=TL_TcmbClave.AsInteger;
      TL_Tcmb.Post;
      TL_Tcmb.Next;
    end;
    // FIN

    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xisla:=Q_BombIbIsla.asinteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      xcomb:=Q_BombIbCombustible.AsInteger;
      if xpos>MaxPosCarga then begin
        MaxPosCarga:=xpos;
        while ListView1.Items.Count<MaxPosCarga do
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
        isla:=xisla;
        existe:=false;
        if not existe then begin
          inc(NoComb);
          TComb[NoComb]:=xcomb;
          TCombCon[NoComb]:=Q_BombIbCon_Posicion.AsInteger;
          TMang[NoComb]:=Q_BombIbManguera.AsInteger;
          TNombre[NoComb]:=Q_BombIbNombreComb.AsString;
        end;
      end;
      Q_BombIb.Next;
    end;
    Q_BombIb.Active:=false;

    Q_ConsIb.Active:=false;
    Q_ConsIb.ParamByName('pestatus').asstring:='P';
    Q_ConsIb.Active:=true;
    try
      while not Q_ConsIb.Eof do begin
        xpos:=Q_ConsIbPosCarga.AsInteger;
        TPosCarga[xpos].estatus:=2; // cargando
        TPosCarga[xpos].estatusant:=2;
        TPosCarga[xpos].Estat_Cons:=StrToChar(Q_ConsIbEstatus.asstring);
        Q_ConsIb.Next;
      end;
    finally
      Q_ConsIb.Active:=false;
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


procedure TFDISGASBOY.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      ErrorInic:=true;
      SwInicio:=false;
      SwPurgeSite:=false;
      SwAplicaCorte:=false;
      SwDespliegaFlujo:=false;
      UltimaTransac:=0;
      xUltimaFecha:='';
      xUltimaHora:='';
      IniciaBaseDeDatos;
      with DMCONS do begin
        Q_MoviGasboy.Active:=true;
        if Q_MoviGasboyTransaccion.AsInteger>0 then begin
          UltimaTransac:=Q_MoviGasboyTransaccion.AsInteger;
          xUltimaFecha:=Q_MoviGasboyFechaGasboy.AsString;
          xUltimaHora:=Q_MoviGasboyHoraGasboy.AsString;
        end;
        Q_MoviGasboy.Active:=false;
      end;
      if not DMCONS.DBGASCON.Connected then
        exit;
      ListBox1.ItemIndex:=0;
      SwProcesando:=false;
      SwEspera:=false;
      UltimaHora:=Now;
      ContEspera:=0;
      ContBuffLleno:=0;
      Linea:='';
      LineaBuff:='';
      LineaTimer:='';
      errbcc:=0;
      IniciaEstacion;
      ListBox1.SetFocus;
      if not DMCONS.SwEmular then
        ApdComPort1.Open:=true
      else ListaEmular:=TStringList.Create;
      ContPpu:=0;Contppu2:=0;
      ContGuardaTotales:=0;
      ListaLOCU:=TStringList.Create;
      NumPaso:=0;
      if DMCONS.SwEmular then begin
        LineaEmular:='';
        EmularEstatus:=LlenaStr('','N',MaxPosCarga,'1');
      end;
      if DMCONS.SwEmular then
        Label4x.Visible:=true;
      (*
      if DMCONS.SwEmular then
        Caption:=Caption+' - Emulación';*)
      ErrorInic:=false;
      Timer3.Enabled:=DMCONS.SwEmular;
    finally
      Timer4.Enabled:=true;
      Timer3.Enabled:=DMCONS.SwEmular;
    end;
  end;
end;

procedure TFDISGASBOY.LimpiaConsola;
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

procedure TFDISGASBOY.DespliegaPosCarga(xpos:integer;swdb:boolean);
var rango,posi,posf,i,xp,xcomb,xc:integer;
    lin,xss,xnombre:string;
begin
  try
    // DESPLIEGA ISLA ACTUAL
    rango:=ListBox1.ItemIndex+1;
    if rango=0 then
      rango:=1;
    posi:=rango*4-3;
    posf:=rango*4;
    with TPosCarga[xpos] do begin
      if CombActual in [1..10] then
        xnombre:=TCombustible[CombActual];
      if xpos in [posi..posf] then begin
        i:=xpos-posi+1;
        TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(xpos,2);
        TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:=descestat;
        case estatus of
          2:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClLime;
          1:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClRed;
          9:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClYellow;
          else TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
        end;
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Clear;
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('###,##0.00',importe)+' Pesos');
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('###,##0.00',precio)+' $/Lts');
        if CombActual>0 then
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(xnombre);
        if (SwDespliegaFlujo) then
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##0.000',flujo)+' flujo');
        if swcargando then
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('PU ')
        else
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(EstadoPos);
        // totales
        for xp:=1 to NoComb do
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.
                  Add(FormatFloat('#,###,##0.000',totalltsant[TComb[xp]]+volactual[TComb[xp]])+' - '+inttostr(TComb[xp]));
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(limitecarga);
        if swtarjeta then
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('Tarjeta Activada');
      end;
    end;

    // Refresca Listas
    for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
      if swcargando then
       xss:='PU'
      else xss:=EstadoPos;
      case estatus of
        1:ListView1.Items[i-1].ImageIndex:=1;
        2:ListView1.Items[i-1].ImageIndex:=2;
        9:ListView1.Items[i-1].ImageIndex:=3;
        else ListView1.Items[i-1].ImageIndex:=0;
      end;
      if not SwTarjeta then
        ListView1.Items[i-1].Caption:=IntToClaveNum(isla,1)+'-'+IntToClaveNum(i,2)+'  '+xss+
                     ' '+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ')
      else
        ListView1.Items[i-1].Caption:=IntToClaveNum(isla,1)+'-'+IntToClaveNum(i,2)+'  '+xss+
                     '*'+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ');
      if SwDesp then with DMCONS do begin
        ContPpu:=10;
        SwDesp:=false;
        try
          if TPosCarga[i].SwTarjeta then
            TPosCarga[i].SwTarjeta:=false;
          try
            T_MoviIb.Active:=true;
            T_MoviIb.Insert;
            T_MoviIbFecha.AsDateTime:=date;
            T_MoviIbHora.AsDateTime:=now;
            T_MoviIbHoraStr.AsString:=HoraPaq(T_MoviIbHora.AsDateTime);
            T_MoviIbPosCarga.AsInteger:=i;
            xcomb:=CombActual;
            if TabComb[xcomb].Agruparcon>0 then begin
              xc:=TabComb[xcomb].Agruparcon;
              if TabComb[xc].Activo then
                xcomb:=xc;
            end;
            T_MoviIbCombustible.AsInteger:=xComb;
            T_MoviIbVolumen.AsFloat:=AjustaFloat(Volumen,3);
            T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
            T_MoviIbTransaccion.AsInteger:=UltimaTran;
            T_MoviIbTarjeta.AsString:=Tarjeta;
            T_MoviIbKilometraje.AsInteger:=Kilometraje;
            T_MoviIbFechaGasboy.AsString:=FechaGasboy;
            T_MoviIbHoraGasboy.AsString:=HoraGasboy;
            T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLtsAnt[1]+VolActual[1],3);
            T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLtsAnt[2]+VolActual[2],3);
            T_MoviIbTag.AsInteger:=0;
            T_MoviIbManguera.AsInteger:=MangActual;
            T_MoviIb.post;
          finally
            T_MoviIb.Active:=false;
            if TPosCarga[i].swflujoant then begin
              TPosCarga[i].flujo:=TPosCarga[i].flujoant;
              TPosCarga[i].swflujoant:=false;
              xflujo:=TPosCarga[i].flujo;
              if xflujo>=0.1 then
                ComandoConsola('LOAD CUTOFF '+inttostr(i)+' 950 '+FloatToStr(xflujo)) // (FormatoNumeroSinComas(xflujo,5,3));
              else
                ComandoConsola('LOAD CUTOFF '+inttostr(i)+' 950 '+FloatToStr(0.5)); // (FormatoNumeroSinComas(xflujo,5,3));
              TPosCarga[i].limitecarga:='950 lts';
            end;
            xp:=Q_Fact1PosCarga.AsInteger;
            Q_Fact1.Active:=false;Q_Fact1.Active:=true;
            Q_Fact1.Locate('PosCarga',xp,[]);

            xp:=Q_Fact2PosCarga.AsInteger;
            Q_Fact2.Active:=false;Q_Fact2.Active:=true;
            Q_Fact2.Locate('PosCarga',xp,[]);
          end;
        except
          if Memo4.Lines.Count>=60 then
            Memo4.Lines.Delete(0);
          lin:=fechapaq(date)+' '+HoraPaq(time)+' '+lin;
          Memo4.Lines.Add(lin);
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
              else T_ConsIbEstado.AsInteger:=0;
            end;
            T_ConsIbOtros.AsString:=FormatFloat('#######0.00',totalltsant[TComb[1]]+volactual[TComb[1]])+
                                    '|'+FormatFloat('#######0.00',totalltsant[TComb[2]]+volactual[TComb[2]]);
            // fin
            T_ConsIbEstatus.AsString:='F';
            //lcActualiza:=true;
            T_ConsIb.Post;
          end;
        finally
          T_ConsIb.Active:=false;
        end;
      end;
    end;
  except
    with DMCONS do begin
      if (T_MoviIb.State in [dsInsert,dsEdit]) then
        T_MoviIb.Cancel;
      if (T_ConsIb.State in [dsInsert,dsEdit]) then
        T_ConsIb.Cancel;
    end;
  end;
end;

procedure TFDISGASBOY.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
begin
  try
    ContadorAlarma:=0;
    Timer1.Enabled:=false;
    try
      if NumPaso=7 then
        Cont4:=0;
      for I := 1 to Count do begin
        C:=ApdComPort1.GetChar;
        if c>=#32 then
          LineaBuff:=LineaBuff+C
        else if LineaBuff<>'' then begin
          Memo4.Lines.Add(LineaBuff);
          LineaBuff:='';
        end;
      end;
    finally
      if not swcerrar then
        Timer4.Enabled:=true;
    end;
  except
  end;
end;

procedure TFDISGASBOY.ComandoConsola(ss:string);
var s1:string;
begin
  try
    if copy(ss,1,11)='LOAD CUTOFF' then
      DespliegaMemo1(ss);
    if DMCONS.SwEmular then begin
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
      s1:=ss;
      if ApdComPort1.OutBuffFree >= Length(S1) then begin
        Memo4.Lines.Clear;
        ApdComPort1.PutString(S1+#13);
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


procedure TFDISGASBOY.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISGASBOY.Restaurar1Click(Sender: TObject);
begin
  Visible:=true;
end;

procedure TFDISGASBOY.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if swcerrar then begin
    CanClose:=true;
  end
  else if DMCONS.SwEmular then begin
    CanClose:=true;
  end
  else begin
    CanClose:=false;
  end;
end;

procedure TFDISGASBOY.FormCreate(Sender: TObject);
begin
  ContadorAlarma:=0;
  ContGuardaVal:=0;
  SwCerrar:=false;
  SwConectado:=false;
  SwInicio:=true;
  SwInicioPPU:=true;
  SwPurge:=false;
  SwChecaPrecio:=true;
  HoraArranque:=Now;
  StaticText10.Caption:=FechaHoraToStr(Now);
end;

procedure TFDISGASBOY.BitBtn3Click(Sender: TObject);
begin
  FDISGASBOY.Visible:=false;
  NotificationIcon1.Show;
end;

function TFDISGASBOY.ExisteTexto(xstr:string):Boolean;
var i:integer;
    ss:string;
begin
  result:=false;
  for i:=0 to Memo4.Lines.Count-1 do begin
    ss:=Memo4.Lines[i];
    if Pos(xstr,ss)>0 then begin
      result:=true;
      exit;
    end;
  end;
end;

procedure TFDISGASBOY.AnalizaPPR; // Lectura de Precios
(*  Pc    Pl  Price
   1     0      7.370    2      3.000
   2     0      6.240
   3     0      5.170
   *)
var i,xpr:integer;
    ss:string;
    xprec:real;
begin
  try
    for i:=0 to Memo4.Lines.Count-1 do begin
      ss:=LlenaStr(Memo4.Lines[i],'N',100,' ');
      DespliegaMemo1(ss);
      xpr:=StrToIntDef(limpiastr(copy(ss,1,4)),0);
      if xpr>0 then with DMCONS do begin
        try
          xprec:=StrToFloat(limpiastr(copy(ss,13,9)));
        except
          xprec:=0;
        end;
        if (xprec>0) then begin
          T_Tcmb.Active:=true;
          if T_Tcmb.Locate('Con_ProductoPrecio',xpr,[]) then begin
            try
              T_Tcmb.Edit;
              T_TcmbPrecioFisico.AsFloat:=AjustaFloat(xprec,2);
              T_Tcmb.Post;
              TabComb[T_TcmbClave.AsInteger].Precio:=AjustaFloat(xprec,2);
            except
              if (T_Tcmb.State in [dsInsert,dsEdit]) then
                T_Tcmb.Cancel;
            end;
          end;
        end;
      end;
    end;
    DespliegaPrecios;
  except
  end;
end;

procedure TFDISGASBOY.AnalizaPTI; // Transacciones en proceso
var i,nc,xpos,xpr:integer;
    ss,st:string;
    xvol:real;
begin
  try
    SwPtr:=false;
    for i:=1 to MaxPosCarga do with TPosCarga[i] do
      aux:=0;
    for i:=0 to Memo4.Lines.Count-1 do begin
      ss:=LlenaStr(Memo4.Lines[i],'N',100,' ');
      xpos:=StrToIntDef(limpiastr(copy(ss,5,3)),0);
      st:=copy(ss,66,7);
      if (st='Pumping')and(xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
        swcargando:=true;
        estatusant:=estatus;
        estatus:=2; // cargando
        SwAutorizado:=false;
        prgasboy:=StrToIntDef(limpiastr(copy(ss,8,3)),0);
        xpr:=0;
        for nc:=1 to 2 do
          if TCombCon[nc]=prgasboy then begin
            CombActual:=TComb[nc];
            MangActual:=TMang[nc];
            xpr:=nc;
          end;
        try
          xvol:=StrToFloat(LimpiaStr(copy(ss,46,11)));
          if xvol<volumen then // si es una nueva transaccion
            swptr:=true;
          volumen:=xvol;
          if xpr>0 then
            volActual
            [xpr]:=volumen;
          importe:=StrToFloat(LimpiaStr(copy(ss,57,8)));
          precio:=AjustaFloat(dividefloat(importe,volumen),2);
          aux:=1;
          SwActualizar:=true;
          DespliegaPosCarga(xpos,true);
        except
        end;
      end;
    end;
    for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
      if aux=0 then begin
        if estatus=2 then begin// si esta "cargando" y ya no aparece en PTI, desactivala
          swptr:=true;
          SwFinCarga:=true;
          Swcargando:=false;
        end;
        estatus:=1; // inactiva
        swtarjeta:=false;
        DespliegaPosCarga(i,true);
      end;
    end;
    if not swptr then with DMCONS do begin
      Q_ConsIb.Active:=false;
      Q_ConsIb.ParamByName('pestatus').asstring:='P';
      Q_ConsIb.Active:=true;
      try
        while not Q_ConsIb.eof do begin
          xpos:=Q_ConsIbPosCarga.AsInteger;
          with TPosCarga[xpos] do if (estatus=1)and(not SwAutorizado) then begin
          end;
          Q_ConsIb.Next;
        end;
      finally
        Q_ConsIb.Active:=false;
      end;
    end;
  except
  end;
end;

procedure TFDISGASBOY.AnalizaPTR;        // Transacciones terminadas
var i,xpos,xtran,nc,xpr,j,pch,xano,xmessis,xmesgasboy:integer;
    ss:string;
    xFechaGasboy,xHoraGasboy:string;
    swentra,swtar:boolean;
begin
  try
    for i:=1 to MaxPosCarga do with TPosCarga[i] do
      aux:=0;
    swtar:=false;
    UltimaHora:=Now;
    for i:=0 to Memo4.Lines.Count-1 do begin
      ss:=LlenaStr(Memo4.Lines[i],'N',100,' ');
      if ss[4] in ['0'..'9'] then with DMCONS do begin
        SwPurge:=true;
        xtran:=StrToIntDef(limpiastr(copy(ss,1,4)),0);
        xfechagasboy:='      ';
        xhoragasboy:='    ';
        if xtran>0 then begin
          pch:=GasboyPtrPosicionHora;
          if pch<10 then begin
            case TipoGasboy of
              1:begin // SEVAFUSA ROSALES
                  xFechaGasboy:=copy(ss,12,2)+copy(ss,6,2)+copy(ss,9,2);
                  xHoraGasboy:=copy(ss,15,2)+copy(ss,18,2);
                end;
              2:begin // SVF OBREGON
                  xFechaGasboy:=copy(ss,29,2)+copy(ss,23,2)+copy(ss,26,2);
                  xHoraGasboy:=copy(ss,32,2)+copy(ss,35,2);
                end;
              3:begin // SERVICIO 300
                  xFechaGasboy:=copy(ss,30,2)+copy(ss,24,2)+copy(ss,27,2);
                  xHoraGasboy:=copy(ss,33,2)+copy(ss,36,2);
                end;
              4:begin // GASMAZ II
                  xFechaGasboy:=copy(ss,34,2)+copy(ss,28,2)+copy(ss,31,2);
                  xHoraGasboy:=copy(ss,37,2)+copy(ss,40,2);
                end;
              5:begin // RIO EVORA
                  xano:=GetAnoFromFecha(date);
                  xmessis:=GetMesFromFecha(date);
                  xmesgasboy:=strtointdef(limpiastr(copy(ss,26,2)),0);
                  if (xmessis=1)and(xmesgasboy=12) then
                    dec(xano);
                  xFechaGasboy:=IntToClaveNum(xano,2)+copy(ss,26,2)+copy(ss,29,2);
                  xHoraGasboy:=copy(ss,35,2)+copy(ss,38,2);
                end;
              6:begin // REVAIL
                  xFechaGasboy:=copy(ss,43,2)+copy(ss,37,2)+copy(ss,40,2);
                  xHoraGasboy:=copy(ss,46,2)+copy(ss,49,2);
                end;
              7:begin // REVAIL 2
                  xFechaGasboy:=copy(ss,32,2)+copy(ss,26,2)+copy(ss,29,2);
                  xHoraGasboy:=copy(ss,35,2)+copy(ss,38,2);
                end;
              8:begin // Revail 3
                  xano:=GetAnoFromFecha(date);
                  xmessis:=GetMesFromFecha(date);
                  xmesgasboy:=strtointdef(limpiastr(copy(ss,35,2)),0);
                  if (xmessis=1)and(xmesgasboy=12) then
                    dec(xano);
                  xFechaGasboy:=IntToClaveNum(xano,2)+copy(ss,35,2)+copy(ss,38,2);
                  xHoraGasboy:=copy(ss,41,2)+copy(ss,44,2);
                end;
            end;
          end
          else begin
            if copy(ss,pch-3,2)<>'  ' then
              xFechaGasboy:=copy(ss,pch-3,2)+copy(ss,pch-9,2)+copy(ss,pch-6,2)
            else begin
              xano:=GetAnoFromFecha(date);
              xmessis:=GetMesFromFecha(date);
              xmesgasboy:=strtointdef(limpiastr(copy(ss,pch-9,2)),0);
              if (xmessis=1)and(xmesgasboy=12) then
                dec(xano);
              xFechaGasboy:=IntToClaveNum(xano,2)+copy(ss,pch-9,2)+copy(ss,pch-6,2);
            end;
            xHoraGasboy:=copy(ss,pch,2)+copy(ss,pch+3,2);
          end;
          for j:=1 to 6 do
            if xfechagasboy[j]=' ' then
              xfechagasboy[j]:='0';
          for j:=1 to 4 do
            if xhoragasboy[j]=' ' then
              xhoragasboy[j]:='0';
          despliegamemo1(inttostr(xtran)+' '+xfechagasboy+' '+xhoragasboy);
          if Length(FiltraStrNum(xFechaGasboy+xHoraGasboy))=10 then begin
            if UltimaTransac=0 then begin
              UltimaTransac:=xtran-1;
              if UltimaTransac=0 then
                UltimaTransac:=9999;

            end;
            swentra:=(xFechaGasboy+xHoraGasboy>xUltimaFecha+xUltimaHora);
            if not swentra then
              swentra:=(xFechaGasboy+xHoraGasboy=xUltimaFecha+xUltimaHora)and
                       ((xtran>UltimaTransac)or(xtran=1));
            if (swentra)or(swemular) then begin
              xUltimaFecha:=xFechaGasboy;
              xUltimaHora:=xHoraGasboy;
              UltimaTransac:=xtran;
              if pch<10 then begin
                case TipoGasboy of
                  1:begin // SEVAFUSA ROSALES
                      xpos:=StrToIntDef(limpiastr(copy(ss,20,3)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        xpr:=StrToIntDef(limpiastr(copy(ss,23,3)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,26,10)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,36,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,42,10)));
                          ultimatran:=xtran;
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasboy;
                          tarjeta:='';
                          swtar:=false;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                  2:begin // SEVAFUSA OBREGON
                      xpos:=StrToIntDef(limpiastr(copy(ss,37,3)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        xpr:=StrToIntDef(limpiastr(copy(ss,40,3)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,43,10)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,53,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,59,10)));
                          ultimatran:=xtran;
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasBoy;
                          tarjeta:='';
                          swtar:=false;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                  3:begin // SERVICIO 300
                      xpos:=StrToIntDef(limpiastr(copy(ss,38,3)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        xpr:=StrToIntDef(limpiastr(copy(ss,41,3)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,44,10)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,54,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,60,10)));
                          ultimatran:=xtran;
                          tarjeta:=FiltraStrNum(copy(ss,6,16));
                          if limpiastr(tarjeta)<>'' then
                            swtar:=true;
                          kilometraje:=StrToIntDef(FiltraStrNum(copy(ss,70,16)),0);
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasboy;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                  4:begin // GASMAZ II
                      xpos:=StrToIntDef(limpiastr(copy(ss,42,3)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        xpr:=StrToIntDef(limpiastr(copy(ss,45,3)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,48,10)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,58,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,64,10)));
                          ultimatran:=xtran;
                          tarjeta:=FiltraStrNum(copy(ss,6,16));
                          if limpiastr(tarjeta)<>'' then
                            swtar:=true;
                          kilometraje:=StrToIntDef(FiltraStrNum(copy(ss,74,16)),0);
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasboy;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                  5:begin // RIO EVORA
                      xpos:=StrToIntDef(limpiastr(copy(ss,40,3)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        despliegamemo1(inttostr(xtran)+' ok');
                        xpr:=StrToIntDef(limpiastr(copy(ss,43,3)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,52,11)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,46,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,63,10)));
                          ultimatran:=xtran;
                          tarjeta:=FiltraStrNum(copy(ss,8,16));
                          if limpiastr(tarjeta)<>'' then
                            swtar:=true;
                          kilometraje:=StrToIntDef(FiltraStrNum(copy(ss,73,16)),0);
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasboy;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                  6:begin // RIVEIL
                      xpos:=StrToIntDef(limpiastr(copy(ss,52,2)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        despliegamemo1(inttostr(xtran)+' ok');
                        xpr:=StrToIntDef(limpiastr(copy(ss,55,2)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,57,10)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,67,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,73,10)));
                          ultimatran:=xtran;
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasboy;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                  7:begin // RIVEIL 2
                      xpos:=StrToIntDef(limpiastr(copy(ss,41,2)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        despliegamemo1(inttostr(xtran)+' ok');
                        xpr:=StrToIntDef(limpiastr(copy(ss,44,2)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,46,10)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,56,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,62,10)));
                          ultimatran:=xtran;
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasboy;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                  8:begin // RIVEIL 3
                      xpos:=StrToIntDef(limpiastr(copy(ss,47,2)),0);
                      if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                        despliegamemo1(inttostr(xtran)+' ok');
                        xpr:=StrToIntDef(limpiastr(copy(ss,50,2)),0);
                        for nc:=1 to 2 do
                          if TCombCon[nc]=xpr then begin
                            CombActual:=TComb[nc];
                            MangActual:=TMang[nc];
                          end;
                        try
                          volumen:=StrToFloat(LimpiaStr(copy(ss,52,10)));
                          precio:=StrToFloat(LimpiaStr(copy(ss,62,6)));
                          importe:=StrToFloat(LimpiaStr(copy(ss,68,10)));
                          ultimatran:=xtran;
                          FechaGasboy:=xFechaGasboy;
                          HoraGasboy:=xHoraGasboy;
                          swdesp:=true;
                          StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                          DespliegaPosCarga(xpos,true);
                          aux:=1;
                        except
                        end;
                      end;
                    end;
                end;
              end // if pch<10
              else begin
                xpos:=StrToIntDef(limpiastr(copy(ss,pch+5,3)),0);
                if (xpos>0)and(xpos<=MaxPosCarga) then with TPosCarga[xpos] do begin
                  xpr:=StrToIntDef(limpiastr(copy(ss,pch+8,3)),0);
                  for nc:=1 to 2 do
                    if TCombCon[nc]=xpr then begin
                      CombActual:=TComb[nc];
                      MangActual:=TMang[nc];
                    end;
                  try
                    volumen:=StrToFloat(LimpiaStr(copy(ss,pch+11,10)));
                    precio:=StrToFloat(LimpiaStr(copy(ss,pch+21,6)));
                    importe:=StrToFloat(LimpiaStr(copy(ss,pch+27,10)));
                    ultimatran:=xtran;
                    FechaGasboy:=xFechaGasboy;
                    HoraGasboy:=xHoraGasboy;
                    tarjeta:='';
                    swtar:=false;
                    swdesp:=true;
                    StaticText6.Caption:='Transaccion: '+inttostr(UltimaTransac);
                    DespliegaPosCarga(xpos,true);
                    aux:=1;
                  except
                  end;
                end;
              end;
            end
            else despliegamemo1(xFechaGasboy+xHoraGasboy+' '+xUltimaFecha+xUltimaHora+' '+inttostr(xtran)+' '+inttostr(UltimaTransac));
          end;
        end;
      end;
    end;
    SwPurgeSite:=(not swtar);
    for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
      if aux=1 then begin
        with DMCONS do begin
          (*
          if TPosCarga[xpos].swflujoant then begin
            TPosCarga[xpos].flujo:=TPosCarga[xpos].flujoant;
            TPosCarga[xpos].swflujoant:=false;
          end;
          xflujo:=TPosCarga[xpos].flujo;
          if xflujo>=0.1 then
            ListaLoCu.Add('LO CU '+inttostr(xpos)+' 998 '+FormatoNumeroSinComas(xflujo,5,3));
            *)
          T_ConsIb.Active:=true;
          try
            if T_ConsIb.Locate('PosCarga;Estatus',VarArrayOf([xpos,'P']),[]) then begin
              T_ConsIb.Edit;
              T_ConsIbEstatus.AsString:='F';
              T_ConsIbVolumen.AsFloat:=volumen;
              T_ConsIbPrecio.AsFloat:=precio;
              T_ConsIbImporte.AsFloat:=importe;
              T_ConsIbCombustible.AsString:=TCombustible[CombActual];
              T_ConsIbFolio.AsInteger:=0;
              //lcActualiza:=true;
              T_ConsIb.Post;
            end;
          finally
            T_ConsIb.Active:=false;
          end;
        end;
      end;
    end;
    swinicio:=false;
  except
    with DMCONS do
      if (T_ConsIb.State in [dsInsert,dsEdit]) then
        T_ConsIb.Cancel;
  end;
end;

procedure TFDISGASBOY.AnalizaPPU;        // Estatus de Pistolas
var xpos,xposant,xpr,ap:integer;
    ss,rsp,ss1:string;
    xtotlts,xtotimp:real;
    cargando,cargandoant:boolean;
    xestat:char;
    xLista:TStrings;
begin

  try
    xposant:=0;
    cargandoant:=false;
    ss1:='';
    while Memo4.Lines.Count>0 do begin
      ss:=Memo4.Lines[0]+espaciostr(100);
      xpos:=StrToIntDef(limpiastr(copy(ss,1,3)),0);
      ss1:=ss1+'-'+inttostr(xpos);
      xpr:=StrToIntDef(limpiastr(copy(ss,7,2)),0);
      cargando:=(copy(ss,64,9)='>Pumping<');
      xestat:=ss[64];
      ap:=0;
      if (xpos in [1..MaxPosCarga])and(xpr in [1..3]) then begin
        TPosCarga[xpos].swcargando:=cargando;
        case xestat of
          '>': ; //TPosCarga[xpos].EstadoPos:='PU';
          'F':TPosCarga[xpos].EstadoPos:='FS';
          ' ':TPosCarga[xpos].EstadoPos:='SS';
          'D':TPosCarga[xpos].EstadoPos:='DE';
          else TPosCarga[xpos].EstadoPos:='--';
        end;
        TPosCarga[xpos].swdesp:=false;
        DespliegaPosCarga(xpos,true);
        ap:=1;
        xposant:=xpos;
        cargandoant:=cargando;
        try
          xflujo:=StrToFloat(limpiastr(copy(ss,58,6)));
        except
          xflujo:=-1;
        end;
        if (xflujo>=0.1) then
          TPosCarga[xpos].flujo:=xflujo;
      end
      else if (xpr in [1..3]) then begin
        ap:=2;
        xpos:=xposant;
        cargando:=cargandoant;
      end;
      if (ap>0)and(xpos>0) then begin // es un renglon valido
        try
          xtotlts:=StrToFloat(limpiastr(copy(ss,18,12)));
        except
          xtotlts:=0;
        end;
        try
          xtotimp:=StrToFloat(limpiastr(copy(ss,30,11)));
        except
          xtotimp:=0;
        end;
        // guarda totales
        with TPosCarga[xpos] do begin
          TotalLts[ap]:=xtotlts;
          DespliegaMemo1(inttostr(xpos)+' '+inttostr(ap)+' '+FormatoMoneda(TotalLts[ap])+' '+FormatoMoneda(TotalLtsAnt[ap]));
          DespliegaMemo1(copy(ss,1,60));
          if (abs(TotalLts[ap]-TotalLtsAnt[ap])>0.5)or(xpr=3) then begin
            VolActual[ap]:=0;
            TotalLtsAnt[ap]:=TotalLts[ap];
          end
          else begin
          end;
          TotalImp[ap]:=xtotimp;
          SwInicioTot:=true;
          if ContGuardaTotales>=10 then begin
            ContGuardaTotales:=0;
            DMCONS.RegistraTotales_BD(xpos,TotalLtsAnt[1]+VolActual[1],TotalLts[2]+VolActual[2]);
          end
          else inc(ContGuardaTotales);
        end;
      end;
      Memo4.Lines.Delete(0);
    end;
    StaticText9.Caption:=ss1;
    with DMCONS do if SwCorteTurno then begin
      xLista:=TStringList.Create;
      try
        rsp:=EjecutaCorte;
        xLista.Add(rsp);
      finally
        xLista.Free;
      end;
    end;
  except
  end;
end;


procedure TFDISGASBOY.Timer1Timer(Sender: TObject);
var xcomb,xc,xpos,i,xtran,xtran2:integer;
    xestado,lin,ss,str,rsp:string;
    purga:boolean;
begin
  try
    if ((Now-horaarranque)>2*tmhora)and(DMCONS.StLevanta='Si') then
      Application.Terminate;
    if not Timer2.Enabled then
      Timer2.Enabled:=true;
    if ContadorAlarma>=10 then begin
      (*
      ApdComPort1.Open:=false;
      ApdComPort1.Open:=true;
      *)
      if not StaticText7.Visible then
        Beep;
      StaticText7.Visible:=not StaticText7.Visible;
    end
    else StaticText7.Visible:=false;
    try
      lee_registro;
      //lee_registro2;
      //registro(1,'Activo');
    except
    end;
    // Logs
    if (Now-DMCONS.FechaHoraRefLog)>tmMinuto then
      DMCONS.RefrescaConexion;

    Timer4.Interval:=Intervalo;
    if (not swinicio)and(not ApdComPort1.Open) then begin
      ApdComPort1.Open:=true;
      SwEspera:=false;
      ContEspera:=0;
      NumPaso:=0;
      Linea:='';
      LineaTimer:='';
    end;
    StaticText5.Caption:='Paso '+IntToStr(NumPaso)+' - '+inttostr(Timer1.interval)+' - '+inttostr(Timer4.interval);
    if NumPaso=0 then begin  // Limpia Conexion
      ComandoConsola('EXIT');
      NumPaso:=1;
    end
    else if NumPaso=2 then begin // Se conecta con password GASBOY
      inc(ContEspera);
      if ContEspera>=5 then begin
        ComandoConsola(DMCONS.PasswordGasboy);
        NumPaso:=3;
      end;
    end
    else if NumPaso=4 then begin // Pide transacciones en proceso (cargando)
      Cont4:=0;
      ComandoConsola('P TI');
      NumPaso:=5;
    end
    else if NumPaso=6 then begin // Pide transacciones terminadas
      inc(ContEspera);
      if ContEspera>=2 then begin
        Cont4:=0;
        ComandoConsola('P TR');
        NumPaso:=7;
      end;
    end
    else if NumPaso=8 then begin // Si hay transacciones terminadas las purga
      if swpurge then begin
        swpurge:=false;
        purga:=true;
        for i:=1 to MaxPosCarga do with TPosCarga[i] do // No purga si hay carga
          if swtarjeta then                             // en proceso
            purga:=false;
        if (purga)and(UltimaTransac<>0) then begin
          xtran:=UltimaTransac+1;
          if xtran>9999 then
            xtran:=1;
          xtran2:=xtran-20;
          if xtran2<1 then
            xtran2:=0;//9999+xtran2;
          if false (*SwPurgeSite*) then begin
            SwPurgeSite:=false;
            ComandoConsola('PURGE SITE');   //**
          end
          else if xtran2>0 then begin
            SwPurgeSite:=false;
            ComandoConsola('RE TR '+IntToStr(xtran2));
          end;
        end;
        NumPaso:=9;
      end
      else NumPaso:=9;
    end
    else if NumPaso=10 then begin // Checa peticiones de carga del punto de venta
      with DMCONS do begin
        Q_ConsIb.Active:=false;
        Q_ConsIb.ParamByName('pestatus').asstring:='S';
        Q_ConsIb.Active:=true;
        while not Q_ConsIb.Eof do begin
          xpos:=Q_ConsIbPosCarga.AsInteger;
          ss:='0.700';
          TPosCarga[xpos].flujoant:=TPosCarga[xpos].flujo;
          TPosCarga[xpos].swflujoant:=true;
          if (Q_ConsIbValor2.AsFloat>=1)and(Q_ConsIbValor2.AsFloat<=10) then
            TPosCarga[xpos].flujo:=Q_ConsIbValor2.AsFloat/10;
          xflujo:=TPosCarga[xpos].flujo;
          if xflujo>=0.1 then
            ss:=FloatToStr(xflujo);
          if Q_ConsIbMonVol.AsString='M' then begin
            str:='LOAD CUTOFF '+inttostr(xpos)+' $'+FloatToStr(Q_ConsIbValor.AsFloat)+' '+ss;
            TPosCarga[xpos].limitecarga:='$ '+FloatToStr(Q_ConsIbValor.AsFloat);
          end
          else begin
            str:='LOAD CUTOFF '+inttostr(xpos)+' '+FloatToStr(Q_ConsIbValor.AsFloat)+' '+ss;
            TPosCarga[xpos].limitecarga:=FloatToStr(Q_ConsIbValor.AsFloat)+' lts';
          end;
          ComandoConsola(str);
          TPosCarga[xpos].SwTarjeta:=true; // Marca posicion cargando con tarjeta
          T_ConsIb.Active:=true;
          try
            if T_ConsIb.Locate('PosCarga',xpos,[]) then begin
              T_ConsIb.Edit;
              T_ConsIbEstatus.AsString:='P';
              //lcActualiza:=true;
              T_ConsIb.Post;
              TPosCarga[xpos].SwAutorizado:=true;
              if swemular then begin
                if (EmularEstatus[xpos]='1') then begin
                  EmularEstatus[xpos]:='2';
                  TPosCarga[xpos].estatus:=2;
                end;
              end;
            end;
          finally
            T_ConsIb.Active:=false;
          end;
          Q_ConsIb.Next;
        end;
      end;
      for i:=1 to MaxPosCarga do with TPosCarga[i] do
        if estatus<>2 then
          swtarjeta:=false;
      if SwInicioPPU then begin
        Timer4.Interval:=4000;
        ComandoConsola('P PU');
        NumPaso:=11;
      end
      else if (ContPpu>=10) then begin
        Timer4.Interval:=3000;
        ComandoConsola('P PU');
        ContPpu:=0;
        NumPaso:=11;
      end
      else begin
        Memo4.Lines.Clear;
        Timer4.Interval:=200;
        Inc(ContPpu);
        NumPaso:=11;
      end;
    end
    else if NumPaso=12 then with DMCONS do begin // Checa Comandos
      // GUARDA VALORES DE DISPENSARIOS CARGANDO
      inc(contguardaval);
      if (contguardaval>=3) then with DMCONS do begin
        contguardaval:=0;
        lin:='';xestado:='';
        for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
          case estatus of
            0:xestado:=xestado+'0'; // Sin Comunicación
            1:xestado:=xestado+'1'; // Inactivo (Idle)
            2:xestado:=xestado+'2'; // Cargando (In Use)
            else xestado:=xestado+'0';
          end;
          if SwActualizar then begin
            xcomb:=CombActual;
            if TabComb[xcomb].Agruparcon>0 then begin
              xc:=TabComb[xcomb].Agruparcon;
              if TabComb[xc].Activo then
                xcomb:=xc;
            end;
            SwActualizar:=false;
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
        try
          T_ConfIb.Active:=true;
          try
            if not T_ConfIb.IsEmpty then begin
              T_ConfIb.Edit;
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
      NumPaso:=13;
      if (Now-FechaHoraComando)>5*tmSegundo then begin
        FechaHoraComando:=Now;
        Q_Cmnd.Active:=false;
        Q_Cmnd.ParamByName('pmodulo').AsString:='DISP';
        Q_Cmnd.Active:=true;
        while not Q_Cmnd.Eof do begin
          rsp:='';
          ss:=ExtraeElemStrSep(Q_CmndComando.AsString,1,' ');
          // CMND: CERRAR CONSOLA
          if ss='CERRAR' then begin
            rsp:='OK';
            SwCerrar:=true;
          end
          else if ss='DPC' then begin
            xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              ComandoConsola('DI PU '+inttostr(xpos));
          end
          else if ss='HPC' then begin
            xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              ComandoConsola('E PU '+inttostr(xpos));
          end
          else if (ss='CORTE') then begin
            if SwAplicaCorte then begin
              SwAplicaCorte:=false;
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
            else begin
              SwAplicaCorte:=true;
              ContPpu:=10;
              exit;
            end;
          end
          else if ss='CORTEPARCIAL' then begin
            if SwAplicaCorte then begin
              SwAplicaCorte:=false;
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
            else begin
              SwAplicaCorte:=true;
              ContPpu:=10;
              exit;
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
          ContPpu:=10;
          if SwCerrar then
            Close;
          Q_Cmnd.Next;
        end;
      end;
      if ListaSolicitud<>nil then begin
        if ListaSolicitud.Count>0 then begin
          ComandoConsola(ListaSolicitud[0]);
          if Mayusculas(copy(ListaSolicitud[0],4,2))='PU' then
            Contppu:=10;
          ListaSolicitud.Delete(0);
        end;
      end;
      // Checa por cambios de precios
      if (Now-DMCONS.FechaHoraPrecio)>12*tmSegundo then begin
        DMCONS.FechaHoraPrecio:=Now;
        with DMCONS do if AplicarPrecios then begin
          for i:=1 to MaxComb do if TabComb[i].AplicaPrecio then begin
            TabComb[i].AplicaPrecio:=false;
            ComandoConsola('LO PR '+TabComb[i].ProductoPrecio+' 0 '+FormatoNumero(TabComb[i].Precio,6,2));
            DespliegaMemo1('LO PR '+TabComb[i].ProductoPrecio+' 0 '+FormatoNumero(TabComb[i].Precio,6,2));
            EsperaMiliSeg(500);
            ComandoConsola('');
            DespliegaMemo1('');
            Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=TabComb[i].Folio;
            Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=i;
            Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
            Q_AplicaPrecioF.ExecSQL;
          end;
          DespliegaPrecios;
        end;
      end;
    end
    else if NumPaso=14 then begin // Checa Precios
      NumPaso:=15;
      Timer4.Interval:=300;
      ComandoConsola('P PR');
    end
    else Timer4.Enabled:=true;
  except
    with DMCONS do begin
      if (T_ConsIb.State in [dsInsert,dsEdit]) then
        T_ConsIb.Cancel;
      if (T_Cmnd.State in [dsInsert,dsEdit]) then
        T_Cmnd.Cancel;
    end;
  end;
end;

procedure TFDISGASBOY.Timer4Timer(Sender: TObject);
var i:integer;
    xestatus:string;
begin
  try
    StaticText5.Caption:='Paso '+IntToStr(NumPaso)+' - '+inttostr(Timer1.interval)+' - '+inttostr(Timer4.interval);
    Timer1.Enabled:=false;      // inicio timer 4
    (*
    if SwExit then begin
      SwCerrar:=true;
      Timer4.Enabled:=false;
      Close;
      exit;
    end;*)
    try
      if numpaso=1 then begin  // Continua sin esperar respuesta
        NumPaso:=2;ContEspera:=0;
      end
      else if numpaso=3 then begin // Espera la confirmación de conexion
        if ExisteTexto('Connected') then begin
          swconectado:=true;
          StaticText17.caption:='Conectado';
          if NotificationIcon1.Tag=0 then begin
            if ErrorInic then
              Application.Terminate;
            NotificationIcon1.Tag:=1;
            FDISMENU.Visible:=false;
            FDISGASBOY.Visible:=false;
            NotificationIcon1.Show;
          end;
          if swinicio then begin
            NumPaso:=6;
          end
          else NumPaso:=4;
          ContEspera:=0;
        end
        else begin // si no la recibe se regresa al paso 0
          numpaso:=0;
          swconectado:=false;
          StaticText17.caption:='Desconectado';
        end;
      end
      else if numpaso=5 then begin  // Analiza transacciones en proceso recibidas
        if Memo4.Lines.Count>Cont4 then begin
          Cont4:=Memo4.Lines.Count;
          NumPaso:=5;
        end
        else begin
          try
            AnalizaPTI;
          except
          end;
          Memo4.Lines.Clear;
          if ListaLOCU.Count>0 then begin
            for i:=0 to ListaLoCu.Count-1 do
              ComandoConsola(ListaLoCu[i]);
            ListaLoCu.Clear;
          end;
          if (swptr)or(Now>UltimaHora+1/1440) then
            NumPaso:=6
          else begin
            if swpurge then begin
              NumPaso:=8
            end
            else NumPaso:=10;
          end;
          ContEspera:=0;
        end;
      end
      else if numpaso=7 then begin // Analiza transacciones terminadas
        if Memo4.Lines.Count>Cont4 then begin
          Cont4:=Memo4.Lines.Count;
          NumPaso:=7;
        end
        else begin
          try
            AnalizaPTR;
          except
          end;
          if swpurge then begin
            NumPaso:=8
          end
          else NumPaso:=10;
          ContEspera:=0;
        end;
      end
      else if numpaso=9 then begin // Confirma purga de transacciones
        if Copy(LineaBuff,1,6)='Verify' then
          ComandoConsola('y');
        StaticText5.Caption:='Paso '+IntToStr(NumPaso)+' - '+inttostr(Timer1.interval)+' - '+inttostr(Timer4.interval);
        NumPaso:=10;ContEspera:=0;
      end
      else if NumPaso=11 then begin
        if (Memo4.Lines.Count>0) then begin
          try
            AnalizaPPU;
          except
            NumPaso:=12;
          end;
        end
        else begin
          NumPaso:=12;
          if SwInicioPpu then
            SwInicioPPU:=false;
        end;
      end
      else if NumPaso=13 then begin
        (*
        for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
          if swcargando then
            xestatus:=xestatus+'2'
          else if (EstadoPos='FS')or(EstadoPos='SS') then
            xestatus:=xestatus+'1'
          else
            xestatus:=xestatus+'0'
        end;
        try
          registro_disp(xestatus);
        except
        end;
        *)
        if not SwChecaPrecio then
          NumPaso:=4
        else NumPaso:=14;
      end
      else if NumPaso=15 then begin
        SwChecaPrecio:=false;
        try
          AnalizaPPR;
        except
        end;
        NumPaso:=4;
      end;
    finally
      Timer4.Enabled:=false;      // fin timer 4
      Timer4.Interval:=Intervalo;
      Timer1.Interval:=Intervalo;
      Timer1.Enabled:=true;
    end;
  except
  end;
end;

procedure TFDISGASBOY.Timer3Timer(Sender: TObject);
// ComandoConsola('LO CU '+inttostr(npos)+' 998 '+FormatoNumero(xflujo,5,3))
// ComandoConsola('LO CU '+inttostr(xpos)+' $'+FormatFloat('000000.00',Q_ConsIbValor.AsFloat)+' '+ss);
// ComandoConsola('P TI'); en proceso
// ComandoConsola('P TR'); terminadas
// ComandoConsola('PURGE SITE');
// ComandoConsola('EXIT');
// ComandoConsola('GASBOY');

const timpo:array[0..4] of real = (50,100,150,200,30);
      tpos:array[0..2] of integer = (2,1,2);
var xpos,rr,cont,nn,i:integer;
    lin,ss:string;
begin
  if LineaEmular='' then
    exit;
  Randomize;                 // inicio timer 3
  Timer1.Enabled:=false;
  try
    with DMCONS do begin
      Lin:=LineaEmular;
      LineaEmular:='';
      if lin='P TI' then begin
        rr:=Random(8);
        if rr=1 then begin
          xpos:=Random(MaxPosCarga)+1;
          case EmularEstatus[xpos] of
            '1':begin
                  EmularEstatus[xpos]:='2';
                  rr:=Random(5);
                  TPosCarga[xpos].volumen:=Timpo[rr]/5;
                  TPosCarga[xpos].importe:=timpo[rr];
                  TPosCarga[xpos].precio:=5;
                  TPosCarga[xpos].hora:=time;
                  rr:=Random(3);
                  nn:=tpos[rr];
                  if nn>TPosCarga[xpos].NoComb then
                    nn:=TPosCarga[xpos].NoComb;
                  if nn=0 then
                    nn:=1;
                  TPosCarga[xpos].CombActual:=nn;
                  i:=TPosCarga[xpos].TComb[nn];
                  if TPrecio[i]>0.01 then begin
                    TPosCarga[xpos].precio:=TPrecio[TPosCarga[xpos].TComb[nn]];
                    TPosCarga[xpos].volumen:=TPosCarga[xpos].importe/TPosCarga[xpos].precio;
                  end;
                end;
            '2':with TPosCarga[xpos] do begin
                  if TipoGasboy=1 then
                    ListaEmular.Add('   1 12/04/02 18:30'+FormatoNumeroSinComas(xpos,3,0)+
                                 FormatoNumeroSinComas(tpos[CombActual],3,0)+
                                 FormatoNumeroSinComas(volumen,10,3)+
                                 FormatoNumeroSinComas(precio,6,3)+
                                 FormatoNumeroSinComas(importe,10,2))
                  else
                    ListaEmular.Add(espaciostr(36)+FormatoNumeroSinComas(xpos,3,0)+
                                 FormatoNumeroSinComas(tpos[CombActual],3,0)+
                                 FormatoNumeroSinComas(volumen,10,3)+
                                 FormatoNumeroSinComas(precio,6,3)+
                                 FormatoNumeroSinComas(importe,10,2));
                  EmularEstatus[xpos]:='1';
                end;
          end;
        end
        else begin
          for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
            if (EmularEstatus[xpos]='2')and((Time-Hora)>20/86400)then begin
              EmularEstatus[xpos]:='1';
              with TPosCarga[xpos] do begin
                if TipoGasboy=1 then
                  ListaEmular.Add('   1 12/04/02 18:30'+FormatoNumeroSinComas(xpos,3,0)+
                               FormatoNumeroSinComas(tpos[CombActual],3,0)+
                               FormatoNumeroSinComas(volumen,10,3)+
                               FormatoNumeroSinComas(precio,6,3)+
                               FormatoNumeroSinComas(importe,10,2))
                else
                  ListaEmular.Add('4289'+espaciostr(32)+FormatoNumeroSinComas(xpos,3,0)+
                               FormatoNumeroSinComas(tpos[CombActual],3,0)+
                               FormatoNumeroSinComas(volumen,10,3)+
                               FormatoNumeroSinComas(precio,6,3)+
                               FormatoNumeroSinComas(importe,10,2));
                EmularEstatus[xpos]:='1';
              end;
            end;
          end;
          ss:='';
          for i:=1 to length(EmularEstatus) do
            if EmularEstatus[i]='2' then
              ss:=ss+'2';
          if length(ss)>2 then begin
            rr:=Random(10);
            if rr=1 then begin
              xpos:=Random(length(ss))+1;
              cont:=0;
              for i:=1 to length(EmularEstatus) do begin
                if EmularEstatus[i]='2' then
                  inc(cont);
                if cont=xpos then
                  EmularEstatus[i]:='1';
              end;
            end;
          end;
        end;
        Memo4.Clear;
        for xpos:=1 to MaxPosCarga do if EmularEstatus[xpos]='2' then with TPosCarga[xpos] do begin
          Lin:='7195 '+FormatoNumeroSinComas(xpos,2,0)+  // 7
               FormatoNumeroSinComas(tpos[CombActual],3,0)+  //3
               ' Full srv Unpaid                   '+        //35
               FormatoNumeroSinComas(volumen,11,3)+          //
               FormatoNumeroSinComas(importe,8,2)+' Pumping';
          Memo4.lines.add(Lin);
        end;
      end
      else if lin='GASBOY' then begin
        Memo4.Lines.Add('Connected');
      end
      else if lin='P TR' then begin
        Memo4.Lines.Clear;
        for i:=0 to ListaEmular.Count-1 do
          Memo4.Lines.Add(ListaEmular[i]);
        ListaEmular.Clear;
      end
      else if copy(lin,1,5)='LO CU' then begin

      end;
      SwEspera:=false;
    end;
  finally
    Timer4.Enabled:=true;        // fin timer 3
    LineaEmular:='';
  end;
end;

procedure TFDISGASBOY.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdComPort1.Open:=false;
  if DMCONS.SwEmular then
    ListaEmular.Free;
  Timer1.Enabled:=false;
  Timer4.Enabled:=true;
  Timer2.Enabled:=false;
  Application.Terminate;
end;

procedure TFDISGASBOY.PonerenFullService1Click(Sender: TObject);
var ss:string;
    xpos:integer;
begin
  ss:=ListView1.Selected.Caption;
  xpos:=StrToIntDef(copy(ss,3,2),0);
  if xpos>0 then with DMCONS do begin
    if TPosCarga[xpos].swcargando then
      exit;
    if TPosCarga[xpos].EstadoPos='FS' then
      exit;
    ComandoConsola('AC PU;A '+inttostr(xpos));
    ContPpu:=10;
  end;
end;

procedure TFDISGASBOY.PonerenSelfService1Click(Sender: TObject);
var ss:string;
    xpos:integer;
begin
  ss:=ListView1.Selected.Caption;
  xpos:=StrToIntDef(copy(ss,3,2),0);
  if xpos>0 then with DMCONS do begin
    if TPosCarga[xpos].swcargando then
      exit;
    if TPosCarga[xpos].EstadoPos='SS' then
      exit;
    ComandoConsola('DE PU;A '+inttostr(xpos));
    ContPpu:=10;
  end;
end;

procedure TFDISGASBOY.Timer2Timer(Sender: TObject);
begin
  if (not Timer4.Enabled)and(not Timer1.Enabled) then begin
    if Timer2.Tag=0 then
      Timer2.Tag:=1
    else begin
      Timer2.Tag:=0;
      Timer4.Enabled:=false;
      Timer1.Enabled:=true;
    end;
  end;
end;

procedure TFDISGASBOY.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISGASBOY.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,3,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISGASBOY.registro(valor:integer;variable:string);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create(KEY_WRITE);
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    if Registry.OpenKey('\SOFTWARE\IMAGEN\VOL\DISP', True) then // ESCRIBE EN REGISTRO
       Registry.WriteInteger(variable,Valor)
  finally
    Registry.CloseKey;
    Registry.Free;
  end;
end;

(*
procedure TFDISGASBOY.registro_disp(valor:string);
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


procedure TFDISGASBOY.VerTrfico1Click(Sender: TObject);
begin
  Memo4.Visible:=true;
end;

procedure TFDISGASBOY.OcultarTrfico1Click(Sender: TObject);
begin
  Memo4.Visible:=false;
end;

procedure TFDISGASBOY.lee_registro;
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

procedure TFDISGASBOY.DespliegaFlujo1Click(Sender: TObject);
begin
  SwDespliegaFlujo:=true;
end;

procedure TFDISGASBOY.OcultaFlujo1Click(Sender: TObject);
begin
  SwDespliegaFlujo:=false;
end;

procedure TFDISGASBOY.Button1Click(Sender: TObject);
begin
  Memo4.Visible:=true;
  ComandoConsola(Edit1.Text);
end;

end.
