unit UDISFUSION;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus, DateUtils,
  DB, DBTables, RXShell, ImgList, Grids, DBGrids, dxGDIPlusClasses, Math,
  Mask, ULibPrint, Registry, IdHTTP, IdSSLOpenSSL, IdIOHandlerSocket,IdIOHandler,
  IdSSLOpenSSLHeaders, IdHashMessageDigest, IdHash, uLkJSON, StrUtils,
  IdBaseComponent, IdHL7, IdComponent, IdTCPConnection, IdTCPClient, jpeg;

type
  TFDISFUSION = class(TForm)
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
    TabSheet1: TTabSheet;
    Timer3: TTimer;
    ImageList1: TImageList;
    Panel2: TPanel;
    ListView1: TListView;
    NotificationIcon1: TRxTrayIcon;
    Memo1: TMemo;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    Panel6: TPanel;
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
    StaticText7: TStaticText;
    Label4x: TLabel;
    TL_BombACTIVO: TStringField;
    TL_BombIMPRIMEAUTOM: TStringField;
    TL_BombDIGITOAJUSTEPRECIO: TIntegerField;
    Memo4: TMemo;
    TL_TcmbAGRUPAR_CON: TIntegerField;
    TL_TcmbDIGITOAJUSTEPRECIO: TIntegerField;
    TL_TcmbTAG: TStringField;
    TL_TcmbTAG2: TStringField;
    TL_TcmbTAG3: TStringField;
    StaticText8: TStaticText;
    Button4: TButton;
    Timer2: TTimer;
    IdHL71: TIdHL7;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
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
    procedure ListBoxPC1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    SwComandoN,
    SwInicio:Boolean;
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwMensaje,
    SwBcc,
    SwAplicaCmnd,
    FinLinea:boolean;
    ContEspera,
    ContEsperaN,
    ContEsperaPaso2,
    ContEsperaPaso5,
    ContEsperaPaso6,
    StEsperaPaso3,
    ContEsperaPaso3,
    ContPaso3,
    NumPaso,
    PosProceso,
    PosicionDispenActual,
    PrecioCombActual,
    ContPrecioFisico,
    ContPrecioCambio,
    PrecioFisicoProc,
    PrecioCambioProc,
    PosicionCargaActual:integer;
    PosicionCargaActual2:integer;
    SnPosCarga:integer;
    SnImporte:real;
    SnLitros:real;
    SwReinicio:boolean;
    EmularEstatus,
    UltimaLineaTimer,
    LineaEmular:string;
    ContadorAlarma:integer;
    SwError:boolean;
    Token:string;
  public
    { Public declarations }
    function MD5(const usuario: string): string;
    procedure ProcesaLinea;
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    procedure EnviaPreset(xcomb:integer;var rsp:string);
    procedure DespliegaMemo4(lin:string);
    function HTTP:TIdHTTP; overload;
    function HTTP(tipoPost:string):TIdHTTP; overload;
    procedure CargaTransaccion(posCarga:Integer; js:TlkJSONbase);
    procedure CargaTotales(posCarga:Integer; js:TlkJSONbase);
    procedure Login;
  end;

type
     tiposcarga = record
       estatus  :integer;
       descestat:string[20];
       importePreset,
       volumenPreset,
       importe,
       volumen,
       precio   :real;
       isla,
       PosDispActual:integer;
       estatusrsp,
       estatusant:integer;
       NoComb   :integer;
       TComb    :array[1..4] of integer;
       TPos     :array[1..4] of integer;
       TPrec    :array[1..4] of integer;
       TDiga    :array[1..4] of integer;
       TDigvol  :array[1..4] of integer;
       TDigpreset:array[1..4] of integer;
       TMang     :array[1..4] of integer;
       TotalLitros:array[1..4] of real;
       TotalLtsAnt:array[1..4] of real;
       SwCargaTotales:boolean;
       RefrescaEnllavados,
       SwDesp,
       SwCargaLectura,
       SwMapea,
       Sw3virtual,
       SwCargando,
       SwActivo,
       SwParado,
       SwDesHabilitado,
       SwOCC,SwCmndB,
       SwFINV             :boolean;
       Mensaje :string[12];
       ValorMapeo :string[10];
       ModoOpera:string[8];

       ContOcc,
       TipoPago,
       FinVenta:integer;

       Hora,
       HoraSw3  :TDateTime;

       swarosmag:boolean;
       aros_cont,
       aros_cont2,
       aros_mang,
       aros_cte,
       aros_vehi:integer;
       swarosmag_stop:boolean;
       importe_aros:real;
       esDiesel:Boolean;

     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=20;
      MaxEspera31=10;
      MaxEspera3=20;


var
  FDISFUSION: TFDISFUSION;
  TPrecio:array[1..9] of real;
  TPosCarga:array[1..32] of tiposcarga;
  MaxPosCarga:integer;
  ContDA    :integer;
  SwCerrar    :boolean;
  ListaCmnd    :TStrings;
  SwEsperaRsp  :boolean;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}

procedure TFDISFUSION.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=60 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISFUSION.DespliegaPrecios;
var i:integer;
begin
  with DMCONS do begin
    Q_CombIb.First;
    while not Q_Combib.Eof do begin
      i:=Q_CombIbClave.AsInteger;
      if i in [1..3] then
        TabComb[i].Precio:=Q_CombibPrecioFisico.AsFloat;
      Q_CombIb.Next;
    end;
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Precios Actuales: ');
    for i:=1 to MaxComb do with TabComb[i] do if Activo then
      Memo1.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
  end;
end;


procedure TFDISFUSION.IniciaBaseDeDatos;
var
  i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    try
      if not swemular then
        Login;
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
            SP_DamePrec.ParamByName('PFechaHora').asdatetime:=Now;
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
        DigitoPrec:=0;
        SwLeePrecioFisico:=true;
        tag3:=-1;
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
            DigitoPrec:=Q_CombIbDigitoAjustePrecio.AsInteger;
          end;
        end;
        Q_CombIb.Next;
      end;
      CargaPreciosFH(Now,false); // no afecta precio físico
      DBGrid3.Refresh;
      DespliegaPrecios;
    finally
      Q_CombIb.Active:=false;
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISFUSION.IniciaEstacion;
var i,j,xisla,xpos,xposAnt,xcomb,xnum,state:integer;
    existe:boolean;
    js,console,product,dispenser,hose: TlkJSONobject;
    consoles,products,dispensers,hoses: TlkJSONlist;
    rspJson:TlkJSONbase;
begin
  with DMCONS do begin
    ListView1.Items.Clear;
    MaxPosCarga:=0;

    js:=TlkJSONobject.Create;

    consoles:=TlkJSONlist.Create;

    console:=TlkJSONobject.Create;
    console.Add('ConsoleId', 1);
    console.Add('Connection', UrlFDC);
    console.Add('Protocol', 'PAM');
    console.Add('LastDispenser', 32);
    consoles.Add(console);

    js.Add('Consoles',consoles);

    for i:=1 to 32 do with TPosCarga[i] do begin
      tag:=1;
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      //Estat_Cons:=' ';
      //Sn_Estatus:=' ';
      //SwTarjeta:=false;
      //SwPreset:=false;
      for j:=1 to 4 do begin
        TotalLitros[j]:=0;
        TotalLtsAnt[j]:=0;
        TDiga[j]:=0;
        TDigPreset[j]:=-1;
      end;
      SwCargaTotales:=true;
      Mensaje:='';
      SwCargando:=false;
      Sw3virtual:=false;
      SwCargaLectura:=true;
      SwMapea:=false;
      SwActivo:=false;
      SwParado:=false;
      SwDeshabilitado:=false;
      SwFINV:=false;
      SwOCC:=false;
      ContOcc:=0;
      tipopago:=0;
      finventa:=0;
      SwArosMag:=false;
      SwArosMag_stop:=false;
    end;
    // CARGA DEFAULTS WAYNE
    TL_Bomb.Active:=true;
    while not TL_Bomb.Eof do begin
      TL_Bomb.Edit;
      if not (TL_BombCon_Posicion.AsInteger in [1..4]) then begin
        if (TL_BombCombustible.AsInteger in [1..2]) then
          TL_BombCon_Posicion.AsInteger:=TL_BombCombustible.AsInteger
        else
          TL_BombCon_Posicion.AsInteger:=1;
      end;
      if (TL_BombDigitoAjustePrecio.IsNull)or (not (TL_BombDigitoAjustePrecio.AsInteger in [0,1])) then
        TL_BombDigitoAjustePrecio.AsInteger:=0;
      TL_Bomb.Post;
      TL_Bomb.Next;
    end;
    products:=TlkJSONlist.Create;
    TL_Tcmb.Active:=true;
    while not TL_Tcmb.Eof do begin
      product:=TlkJSONobject.Create;
      product.Add('ProductID',TL_TcmbCLAVE.AsInteger);
      product.Add('Name',TL_TcmbNOMBRE.AsString);
      product.Add('Price',TL_TcmbPRECIOFISICO.AsFloat);
      products.Add(product);

      TL_Tcmb.Edit;
      if (TL_TcmbCon_ProductoPrecio.AsString<>'1') and
         (TL_TcmbCon_ProductoPrecio.AsString<>'2') and
         (TL_TcmbCon_ProductoPrecio.AsString<>'3')
      then
        TL_TcmbCon_ProductoPrecio.AsInteger:=TL_TcmbClave.AsInteger;
      TL_Tcmb.Post;
      TL_Tcmb.Next;
    end;
    js.Add('Products',products);
    // FIN

    dispensers:=TlkJSONlist.Create;
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xisla:=Q_BombIbIsla.asinteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      xcomb:=Q_BombIbCombustible.AsInteger;

      if (xpos>0)and(xpos>MaxPosCarga) then begin
        MaxPosCarga:=xpos;
        while ListView1.Items.Count<MaxPosCarga do
          ListView1.Items.Add;
        ListView1.Items[MaxPosCarga-1].Caption:=IntToClaveNum(xpos,2);
        ListView1.Items[MaxPosCarga-1].ImageIndex:=0;
      end;
      with TPosCarga[xpos] do begin
        Isla:=xisla;
        //CodigoEnllava:='01';
        SwDesp:=false;
        ModoOpera:=Q_BombIbModoOperacion.AsString;
        esDiesel:=True;

        if xpos<>xposAnt then begin
          dispenser.Add('Hoses',hoses);
          dispensers.Add(dispenser);

          dispenser:=TlkJSONobject.Create;
          dispenser.Add('DispenserId',xpos);
          dispenser.Add('MaximumSale',1);
          dispenser.Add('Units','LITERS');
          dispenser.Add('OperationMode',IfThen(ModoOpera='Normal','FULLSERVICE','SELFSERVICE'));
          dispenser.Add('Blocked',False);
          hoses:=TlkJSONlist.Create;
          xposAnt:=xpos;
        end;

        if DMCONS.InicializaWayne='Si' then
          RefrescaEnllavados:=true
        else
          RefrescaEnllavados:=false;
        existe:=false;
        for i:=1 to NoComb do
          if TComb[i]=xcomb then
            existe:=true;
        if not existe then begin
          inc(NoComb);
          TComb[NoComb]:=xcomb;
          if (xcomb=1) or (xcomb=2) then
            esDiesel:=False;
          if Q_BombIbCon_Posicion.AsInteger>0 then
            TPos[NoComb]:=Q_BombIbCon_Posicion.AsInteger
          else if NoComb<=4 then
            TPos[NoComb]:=NoComb
          else
            TPos[NoComb]:=1;
          TMang[NoComb]:=Q_BombIbManguera.AsInteger;
          TPrec[TPos[NoComb]]:=Q_BombIbCon_Precio.AsInteger;
          TDiga[TPos[NoComb]]:=Q_BombIbCon_DigitoAjuste.AsInteger;
          TDigvol[TPos[NoComb]]:=Q_BombIbDigitoAjusteVol.AsInteger;
          TDigPreset[TPos[NoComb]]:=Q_BombIbDigitoAjustePreset.AsInteger;

          hose:=TlkJSONobject.Create;
          hose.Add('HoseId',Q_BombIbManguera.AsInteger);
          hose.Add('ProductId',xcomb);
          hoses.Add(hose);
        end;
      end;
      Q_BombIb.Next;
    end;
    dispenser.Add('Hoses',hoses);
    dispensers.Add(dispenser);
    js.Add('Dispensers',dispensers);

    state:=TlkJSON.ParseText(UTF8Decode(HTTP.Get('https://'+UrlServFDC+'/api/Dispensers/State'))).Field['data'].Value;
    if state=1 then begin
      HTTP.Post('https://'+UrlServFDC+'/api/Dispensers/Halt',TStringStream.Create('{}'));
      Sleep(200);
      HTTP.Post('https://'+UrlServFDC+'/api/Dispensers/Terminate',TStringStream.Create('{}'));
    end
    else if state=0 then
      HTTP.Post('https://'+UrlServFDC+'/api/Dispensers/Terminate',TStringStream.Create('{}'));
    Sleep(200);

    i:=0;
    rspJson:=TlkJSON.ParseText(UTF8Decode(HTTP('application/json').Post('https://'+UrlServFDC+'/api/Dispensers/Initialize', TStringStream.Create(UTF8Encode(GenerateReadableText(js,i))))));
    if not rspJson.Field['success'].Value then begin
      MensajeErr('Error al inicializar FDC: '+rspJson.Field['message'].Value);
      Application.Terminate;
    end;
    rspJson.Destroy;
    Sleep(200);

    js:=TlkJSONobject.Create;
    js.Add('AllowedCommErrors',3);
    js.Add('AllowNonWorkingPosition',True);
    js.Add('AllowedZeroSales',2);
    js.Add('CentsToRound',2);
    js.Add('CounterToAuthorizeSale',5);
    js.Add('CounterToFinalizeSale',2);
    js.Add('CounterToPaySale',4);
    js.Add('Interval',IntervaloFDC);
    js.Add('LoadSalesProgress',True);
    js.Add('PriceChangeAtStartup',True);
    js.Add('ProvisionTimeout',10);
    js.Add('SaveZeroSales',False);
    HTTP('application/json').Post('https://'+UrlServFDC+'/api/Dispensers/Parameters',TStringStream.Create(UTF8Encode(GenerateReadableText(js,i))));
    js.Destroy;
    Sleep(300);
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


procedure TFDISFUSION.FormShow(Sender: TObject);
var
  rspJson:TlkJSONbase;
begin
  if SwInicio then begin
    try
      ContDA:=0;
      //SwPrepago:=false;
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      //SwProcesando:=false;
      //SwEspera:=false;
      SwMensaje:=false;
      SwReinicio:=false;
      SwEsperaRsp:=false;
      StaticText6.Caption:='';
      ContEspera:=0;
      ContEsperaPaso2:=0;
      ContPaso3:=0;
      ContEsperaPaso3:=0;
      ContEsperaPaso5:=0;
      ContEsperaPaso6:=0;
      StEsperaPaso3:=0;
      //ContBuffLleno:=0;
      NumPaso:=0;
      StaticText5.Caption:=IntToStr(NumPaso);
      Linea:='';
      LineaBuff:='';
      LineaTimer:='';
      //errbcc:=0;
      SwBcc:=false;
      FinLinea:=false;
      IniciaEstacion;
      ListBox1.SetFocus;
      rspJson:=TlkJSON.ParseText(UTF8Decode(HTTP.Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Run',TStringStream.Create('{}'))));
      if not rspJson.Field['success'].Value then begin
        MensajeErr('Error al iniciar proceso FDC: '+rspJson.Field['message'].Value);
        Application.Terminate;
      end;
      rspJson.Destroy;
      DMCONS.T_ConfIb.Active:=true;
      if DMCONS.SwEmular then begin
        LineaEmular:='';
        EmularEstatus:=LlenaStr('','N',MaxPosCarga,'2');
      end;
      Timer3.Enabled:=dmcons.SwEmular;
      if DMCONS.SwEmular then
        Label4x.Visible:=true;
      ErrorInic:=false;
    finally
      Timer1.Enabled:=true;
    end;
  end;
end;

procedure TFDISFUSION.LimpiaConsola;
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

procedure TFDISFUSION.DespliegaPosCarga(xpos:integer);
var i,ii,xp,rango,posi,posf,xcomb,xc:integer;
    xnombre,xcarga:string;
    xprecio,xprecio2,xdifprec,xdiflts:real;
    swdif:boolean;
    json:TlkJSONbase;
begin
  try
    // DESPLIEGA ISLA ACTUAL
    rango:=ListBox1.ItemIndex+1;
    if rango=0 then
      rango:=1;
    posi:=rango*4-3;
    posf:=rango*4;
    with TPosCarga[xpos] do begin
      xcarga:='';
      if swcargando then xcarga:=' *';
      xcomb:=CombustibleEnPosicion(xpos,PosDispActual);
      if xcomb in [1..maxcomb] then
        xnombre:=DMCONS.TabComb[xcomb].Nombre;
      if xpos in [posi..posf] then begin
        i:=xpos-posi+1;
        TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(xpos,2);
        if not SwDesHabilitado then begin
          TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:=descestat+' - '+inttostr(estatus);
          case estatus of
            2:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClLime;
            1:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClRed;
            9,3:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClYellow;
            else TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
          end;
        end
        else begin
          TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:='Deshabilidado';
          TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
        end;
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Clear;
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('$ '+FormatFloat('###,##0.00',importe)+' Pesos');
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',precio)+' $/Lts');
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(xnombre+xcarga);
        TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
        for xp:=1 to NoComb do
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                   ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3)
                   );
        if swmensaje then
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('('+mensaje+')');
      end;
    end;

    // Refresca Listas
    for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
      if ModoOpera='Normal' then begin
        case estatus of
          1:ListView1.Items[i-1].ImageIndex:=1;
          2:ListView1.Items[i-1].ImageIndex:=2;
          9:ListView1.Items[i-1].ImageIndex:=3;
          else ListView1.Items[i-1].ImageIndex:=0;
        end;
      end
      else begin
        case estatus of
          1:ListView1.Items[i-1].ImageIndex:=4;
          2:ListView1.Items[i-1].ImageIndex:=5;
          9:ListView1.Items[i-1].ImageIndex:=6;
          else ListView1.Items[i-1].ImageIndex:=0;
        end;
      end;
      ListView1.Items[i-1].Caption:=IntToClaveNum(i,2)+
                    '  '+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ');
      if (SwDesp)and(estatusrsp<>2) then with DMCONS do begin
        SwDesp:=false;
        if (importe>0.001)or(tipopago>0) then begin
          try
            try
              json:=TlkJSON.ParseText(UTF8Decode(HTTP.Get('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Totals?noDispenser='+IntToStr(i))));
              CargaTotales(i,json.Field['data']);
              json.Destroy;
              T_MoviIb.Active:=true;
              T_MoviIb.Insert;
              T_MoviIbFecha.AsDateTime:=date;
              T_MoviIbHora.AsDateTime:=now;
              T_MoviIbHoraStr.AsString:=HoraPaq(T_MoviIbHora.AsDateTime);
              T_MoviIbPosCarga.AsInteger:=i;
              xcomb:=CombustibleEnPosicion(i,PosDispActual);
              if TabComb[xcomb].Agruparcon>0 then begin
                T_MoviIbKilometraje.asinteger:=TMang[PosDispActual];
                xc:=TabComb[xcomb].Agruparcon;
                if TabComb[xc].Activo then
                  xcomb:=xc;
              end;
              T_MoviIbCombustible.AsInteger:=xcomb;
              T_MoviIbVolumen.AsFloat:=volumen;
              T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
              T_MoviIbPrecio.AsFloat:=precio;
              if DMCONS.WayneFusion='Si' then begin // Checo combustible por el precio
                xprecio:=T_MoviIbPrecio.AsFloat;
                for xcomb:=1 to MaxComb do with TabComb[xcomb] do if Activo then begin
                  if abs(xprecio-precio)<0.005 then
                    T_MoviIbCombustible.AsInteger:=xcomb;
                end;
              end;
              T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLitros[1],3);
              T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLitros[2],3);
              T_MoviIbTotal03.AsFloat:=AjustaFloat(TotalLitros[3],3);
              T_MoviIbTotal04.AsFloat:=AjustaFloat(TotalLitros[4],3);
              xdiflts:=0;swdif:=false;
              for ii:=1 to 4 do begin
                if TotalLtsAnt[ii]>0 then begin
                  xdiflts:=xdiflts+abs(TotalLtsAnt[ii]-TotalLitros[ii]);
                  swdif:=true;
                end;
                TotalLtsAnt[ii]:=TotalLitros[ii];
              end;
              T_MoviIbTag.AsInteger:=0;
              T_MoviIbTipoPago.asinteger:=TipoPago;
              T_MoviIbManguera.AsInteger:=TMang[PosDispActual];
              T_MoviIbBoucher.Asstring:='';
              T_MoviIbCuponImpreso.AsString:='No';
              T_MoviIbReferenciaBitacora.AsInteger:=0;
              T_MoviIbGasId.AsInteger:=Random(1000000);
              TipoPago:=0;
              T_MoviIb.post;
              if (swdif)and(abs(xdiflts)<0.005) then begin
                DMCONS.AgregaLog('TOTALES IGUALES');
                Button1.Click;
              end;
              if (lcLicTemporal)and(date>lcLicVence) then begin
                MensajeErr('Licencia vencida. Llame a su distribuidor');
                Application.Terminate;
              end;
            finally
              T_MoviIb.Active:=false;
            end;
          except
//            on e:Exception do begin                             
//              despliegamemo4(e.Message);
////              despliegamemo4('Error al guardar transaccion pos '+inttostr(i));
//            end;
          end;
        end;
      end
      else if estatusrsp=2 then begin
        swcargando:=true;
        swdesp:=false;
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
        for xpos:=1 to MaxPosCarga do begin
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
          for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
            if xpos<=dmcons.MaximoDePosiciones then begin
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

procedure TFDISFUSION.ProcesaLinea;
label uno;
var lin,ss,rsp,descrsp,xestado,xmodo,rsp2:string;
    simp,spre,sval:string[20];
    XMANG,XCTE,XVEHI,
    ndig,i,xpos,xcomb,
    xpos2,npos,xpr,xpda,xerror  :integer;
    PasoAnt:integer;
    SwOk:boolean;
    xprec,
    ximpo,
    xvol:real;
    saux:string;
    contstop,contact:integer;
    xvalor:real;
    js:TlkJSONobject;
    json:TlkJSONbase;
    stream:TStringStream;
begin
  try
    saux:=LineaTimer;
    if LineaTimer='' then
      exit;
    SwEsperaRsp:=false;
    //ContEsperaRsp:=0;
    StaticText6.Caption:='';
    PasoAnt:=NumPaso;
    lin:=LineaTimer;
    LineaTimer:='';
    if lin='' then
      exit;
    case lin[1] of
     'B':begin
           NumPaso:=1; // then begin // pide estatus de todas las bombas
           UltimaLineaTimer:=saux;
           ContEspera:=0;
           ss:=copy(lin,4,length(lin)-3);
           contstop:=0;
           contact:=0;
           for xpos:=1 to length(ss) do if xpos in [1..maxposcarga] then  begin
             with TPosCarga[xpos] do begin
               SwCmndB:=true;
               if estatusant<>estatus then begin
                 SwDesp:=false;
                 DespliegaPosCarga(xpos);
                 mensaje:=mensaje+inttostr(estatus);
                 while length(mensaje)>10 do
                   delete(mensaje,1,1);
               end;
               estatusant:=estatus;
               estatus:=StrToIntDef(ss[xpos],0);
               estatusrsp:=estatus;
               if estatus=2 then
                 swcargando:=true;
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
               if TPosCarga[xpos].ModoOpera<>'Normal' then begin
                 if (estatus=1)and(estatusant=2) then begin
                   sw3virtual:=true;
                   horasw3:=now;
                   estatus:=3;
                 end;
                 if (estatus=1)and(sw3virtual) then begin
                   estatus:=3;
                 end;
               end;
               if not (estatus in [2,8]) then
                 swarosmag_stop:=false;
               if SwFINV then begin
                 if estatus=3 then begin
                   esperamiliseg(100);
                   stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
                   HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Payment',stream);
                   stream.Destroy;
                   if DMCONS.swemular then
                     EmularEstatus[xpos]:='1';
                 end
                 else SwFinv:=false;
               end;
               case estatus of
                 0:begin
                     descestat:='-0-';
                     if estatusant<>0 then begin
                       for xcomb:=1 to nocomb do
                         DMCONS.RegistraBitacora3(1,'Desconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                     end;
                   end;
                 1:begin
                     descestat:='Inactivo';
                     SwParado:=false;
                     if estatusant<>1 then begin
                       tag:=1;
                       SwArosMag:=false;
                       FinVenta:=0;
                       TipoPago:=0;
                       SwOcc:=false;
                       ContOcc:=0;
                     end;
                     if estatusant=0 then begin
                       for xcomb:=1 to nocomb do
                         DMCONS.RegistraBitacora3(1,'Reconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                     end;
                   end;
                 2:begin
                     descestat:='Despachando';
                     if SwArosMag then with TPosCarga[xpos] do begin
                       if abs(importe-importe_aros)>0.10 then begin
                         if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                           Despliegamemo4('STOP MANGUERA >> '+Formatdatetime('HH:mm:ss.zzz',now));
                           stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
                           HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Stop',stream);
                           stream.Destroy;
                           Despliegamemo4('Stop aros: mang'+inttostr(aros_mang)+' cte '+inttostr(aros_cte)+' vehic '+inttostr(aros_vehi));
                           SwArosMag_Stop:=true;
                           aros_cont2:=0;
                           if swemular then
                             EmularEstatus[xpos]:='8';
                         end;
                       end;
                     end;
                   end;
                 3:descestat:='Fin de Venta';
                 4:descestat:='-4-';
                 5:descestat:='Llamando'; // SOLICITANDO CARGAR
                 6:descestat:='-6-';
                 7:descestat:='-7-';
                 8:begin
                     descestat:='Detenido';
                     if (SwArosMag_Stop)and(aros_cont2<10) then begin
                       inc(aros_cont2);
                       if DMCONS.ControlArosMagneticosRecon(xpos,xmang,xcte,xvehi) then begin
                         if (xmang=aros_mang)and(xcte=aros_cte)and(xvehi=aros_vehi)and(aros_cont<DMCONS.ReconexionesAros) then begin
                           Despliegamemo4('Reconecta aros: mang'+inttostr(xmang)+' cte '+inttostr(xcte)+' vehic '+inttostr(xvehi));
                           stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
                           HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Start',stream);
                           stream.Destroy;
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
                     end
                     else if (not SwParado) then begin
                       stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
                       HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Start',stream);
                       stream.Destroy;
                     end;
                   end;
                 9:begin
                     descestat:='Autorizado';
                     swcargando:=false;
                     if SwArosMag then begin
                       if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                         Despliegamemo4('STOP MANGUERA >> '+Formatdatetime('HH:mm:ss.zzz',now));
                         stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
                         HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Stop',stream);
                         stream.Destroy;
                         if swemular then
                           EmularEstatus[xpos]:='1';
                       end;
                     end
                     else if estatusant=2 then begin
                       stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
                       HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Stop',stream);
                       stream.Destroy;
                     end;
                   end;
               end;
               if estatus in [1,2,3,5,9] then
                 inc(contact)
               else if estatus=8 then
                 inc(contstop);
             end;
           end;
           SwReinicio:=false;
           PasoAnt:=1;
           NumPaso:=2;
           StaticText5.Caption:=IntToStr(NumPaso);
           StaticText6.Caption:='';
           if PosicionCargaActual>=MaxPosCarga then
             PosicionCargaActual:=0;
         end;
    end;
    if NumPaso=2 then begin  // Checa carga de lecturas
      if PosicionCargaActual<MaxPosCarga then begin
        repeat
          Inc(PosicionCargaActual);
          with TPosCarga[PosicionCargaActual] do if NoComb>0 then begin
            if (estatus<>9)and((estatusant<>estatus)or(estatus in [2,3])or(swcargando)or(SwCargaLectura)) then begin
              SwCargaLectura:=false;
              json:=TlkJSON.ParseText(UTF8Decode(HTTP.Get('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Transaction?noDispenser='+IntToStr(PosicionCargaActual))));
              CargaTransaccion(PosicionCargaActual,json.Field['data']);
              json.Destroy;
            end
            else
              DespliegaPosCarga(PosicionCargaActual);
          end;
        until (PosicionCargaActual>=MaxPosCarga);
        PasoAnt:=2;
        NumPaso:=3;StEsperaPaso3:=0; ContPaso3:=0;
        StaticText5.Caption:=IntToStr(NumPaso);
      end
      else begin
        PasoAnt:=2;
        NumPaso:=3;StEsperaPaso3:=0; ContPaso3:=0;
        StaticText5.Caption:=IntToStr(NumPaso);
      end;
    end;

    if (NumPaso=3) then with DMCONS do begin
      inc(ContPaso3);
      StaticText6.Caption:='001';
      if ContPaso3>12 then begin
        ContPaso3:=0;
        NumPaso:=4;
        StaticText5.Caption:=IntToStr(NumPaso);
        //PosPaso4:=0;
        StaticText6.Caption:='002';
      end
      else begin
        // GUARDA VALORES DE DISPENSARIOS CARGANDO
        StaticText6.Caption:='003';
        with DMCONS do begin
          StaticText6.Caption:='003.01';
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
                5:xestado:=xestado+'5'; // Llamando (Calling)
                9:xestado:=xestado+'9'; // Autorizado (Calling)
                8:xestado:=xestado+'8'; // Detenido (Stoped)
                else xestado:=xestado+'0';
              end;
            end
            else xestado:=xestado+'7'; // Deshabilitado
            ss:=inttoclavenum(xpos,2)+'/'+inttostr(TComb[TPos[PosDispActual]]);
            ss:=ss+'/'+FormatFloat('###0.##',volumen);
            ss:=ss+'/'+FormatFloat('#0.##',precio);
            ss:=ss+'/'+FormatFloat('####0.##',importe);
            lin:=lin+'#'+ss;
          end;
          // fin 01
          if lin='' then
            lin:=xestado+'#'
          else
            lin:=xestado+lin;
          lin:=lin+'&'+xmodo;
          DMCONS.ActualizaDispensarios('D'+lin);
        end;
        PasoAnt:=3;
        NumPaso:=4;
        StaticText5.Caption:=IntToStr(NumPaso);
        StaticText6.Caption:='';
        //PosPaso4:=0;
      end;
    end;
    if (NumPaso=4) then with DMCONS do begin
      StaticText6.Caption:='006';
      NumPaso:=5;
      if PosicionCargaActual2>=MaxPosCarga then
        PosicionCargaActual2:=0;
      StaticText5.Caption:=IntToStr(NumPaso);
    end;
    if NumPaso=5 then begin // TOTALES
      if PosicionCargaActual2<=MaxPosCarga then begin
        repeat
          if PosicionCargaActual2=0 then begin
            PosicionCargaActual2:=1;
            PosicionDispenActual:=1;
          end
          else if PosicionDispenActual<TPosCarga[PosicionCargaActual2].NoComb then
            inc(PosicionDispenActual)
          else begin
            Inc(PosicionCargaActual2);
            PosicionDispenActual:=1;
          end;
          if PosicionCargaActual2<=MaxPosCarga then begin
            if PosicionCargaActual2<1 then
              PosicionCargaActual2:=1;
            with TPosCarga[PosicionCargaActual2] do begin
              if SwCargaTotales then begin
                ContEsperaPaso5:=0;
                json:=TlkJSON.ParseText(UTF8Decode(HTTP.Get('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Totals?noDispenser='+IntToStr(PosicionCargaActual2))));
                CargaTotales(PosicionCargaActual2,json.Field['data']);
                json.Destroy;
                Exit;
              end;
            end;
          end
          else begin
            NumPaso:=6;
            PrecioCombActual:=0;
            StaticText5.Caption:=IntToStr(NumPaso);
          end;
        until (PosicionCargaActual2>MaxPosCarga);
        NumPaso:=6;
        PrecioCombActual:=0;
        StaticText5.Caption:=IntToStr(NumPaso);
      end
      else begin
        NumPaso:=6;
        PrecioCombActual:=0;
        StaticText5.Caption:=IntToStr(NumPaso);
      end;
    end;
    if NumPaso=6 then begin // CAMBIO DE PRECIOS
      if PrecioCombActual<MaxComb then with DMCONS do begin
        js:=TlkJSONobject.Create;
        repeat
          inc(PrecioCombActual);
          with TabComb[PrecioCombActual] do begin
            if (AplicaPrecio)and(PrecioCambioProc=0) then begin // Cambia Precios
              if ProductoPrecio<>'' then
                js.Add('Precio'+ProductoPrecio,Precio)
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
        if js.Count>0 then begin
          i:=0;
          try
            stream:=TStringStream.Create(UTF8Encode(GenerateReadableText(js,i)));
            if TlkJSON.ParseText(UTF8Decode(HTTP('application/json').Post('https://'+UrlServFDC+'/api/Dispensers/Prices',stream))).Field['success'].Value then begin
              PrecioCombActual:=0;
              T_Tcmb.Active:=true;
              repeat
                inc(PrecioCombActual);
                TabComb[PrecioCombActual].AplicaPrecio:=false;
                Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=TabComb[PrecioCombActual].Folio;
                Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=PrecioCombActual;
                Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
                Q_AplicaPrecioF.ExecSQL;
                if T_Tcmb.Locate('Clave',PrecioCombActual,[]) then begin
                  T_Tcmb.Edit;
                  T_TcmbPrecioFisico.AsFloat:=js.Field['Precio'+inttostr(PrecioCombActual)].Value;
                  T_Tcmb.Post;
                end;
              until (PrecioCombActual>=MaxComb);
              T_Tcmb.Active:=False;
              Q_CombIb.Active:=false;
              Q_CombIb.Active:=true;
              DespliegaPrecios;
            end;
            stream.Destroy;
          except
            on e:Exception do
              raise Exception.Create(e.Message);
          end;
        end;
        js.Destroy;
        NumPaso:=7;
        StaticText5.Caption:=IntToStr(NumPaso);
      end
      else with DMCONS do begin
        if SwCambioPrecio then begin
          SwCambioPrecio:=false;
          SwPrecioFisico:=true;
        end;
        NumPaso:=7;
        StaticText5.Caption:=IntToStr(NumPaso);
      end;
    end;
    if (NumPaso=7) then with DMCONS do begin // Habilitar y Deshabilitar
      if ListaSolicitud.Count>0 then begin
        lin:=ListaSolicitud[0];
        ListaSolicitud.Delete(0);
        ss:=ExtraeElemStrSep(lin,1,' ');
        if ss='DPC' then begin
          ss:=ExtraeElemStrSep(lin,2,' ');
          xpos:=strtointdef(ss,0);
          if xpos in [1..MaxPosCarga] then begin
            stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
            HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Stop',stream);
            stream.Destroy;
            if swemular then begin
              TPosCarga[xpos].SwDesHabilitado:=true;
              EmularEstatus[xpos]:='0';
            end;
          end;
        end
        else if ss='HPC' then begin
          ss:=ExtraeElemStrSep(lin,2,' ');
          xpos:=strtointdef(ss,0);
          if xpos in [1..MaxPosCarga] then begin
            stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
            HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Start',stream);
            stream.Destroy;
            if swemular then begin
              TPosCarga[xpos].SwDesHabilitado:=false;
              EmularEstatus[xpos]:='1';
            end;
          end;
        end
      end;
      NumPaso:=0;
      StaticText5.Caption:=IntToStr(NumPaso);
    end;
  except
    with DMCONS do begin
      if (T_Tcmb.State in [dsInsert,dsEdit]) then
        T_Tcmb.Cancel;
    end;
  end;
end;


procedure TFDISFUSION.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISFUSION.Restaurar1Click(Sender: TObject);
begin
  FDISFUSION.Visible:=true;
end;

procedure TFDISFUSION.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if SwCerrar then begin
    CanClose:=true;
  end
  else  if DMCONS.SwEmular then begin
    CanClose:=true;
  end
  else begin
    CanClose:=false;
  end;
end;

procedure TFDISFUSION.FormCreate(Sender: TObject);
begin
  SwCerrar:=false;
  SwInicio:=true;
  SwComandoN:=false;
  ContadorAlarma:=0;
  PrecioFisicoProc:=0;
  PrecioCambioProc:=0;
  ListaCmnd:=TStringList.Create;
end;

procedure TFDISFUSION.BitBtn3Click(Sender: TObject);
begin
  FDISFUSION.Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISFUSION.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    HTTP.Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Halt',TStringStream.Create('{}'));
    Sleep(200);
    HTTP.Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Terminate',TStringStream.Create('{}'));
  except 
  end;
  Application.Terminate;
end;

procedure TFDISFUSION.Timer1Timer(Sender: TObject);
var ss,rsp,str1:string;
    i,xpos,xp,xcomb,xfolio,tag3,
    xcmnd,sumAdi:integer;
    xlimite,
    xprecio:real;
    swok,swerr:boolean;
    lista:TStringList;
    rspJson:TlkJSONbase;
    stream:TStringStream;
begin
  try
    Timer1.Enabled:=False;
    if not StaticText8.Visible then begin
      StaticText8.Caption:='Puerto: '+DMCONS.PuertoServicio;
      StaticText8.Visible:=true;
    end;
    with DMCONS do begin
      inc(ContadorTot);
      if (ContadorTot>=2000) then begin
        ContadorTot:=0;
        inc(ContadorTotPos);
        if ContadorTotPos in [1..MaxPosCarga] then if TPosCarga[ContadorTotPos].estatus=1 then
          TPosCarga[ContadorTotPos].SwCargaTotales:=true
        else ContadorTotPos:=0;
      end;
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
      with DMCONS do if AplicarPrecios then begin
        Memo1.Lines.Clear;
        Memo1.Lines.Add('Precios Actuales: ');
        for i:=1 to MaxComb do with TabComb[i] do if Activo then
          Memo1.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
      end;
    end;

    // Checa sw3virtual
    for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
      if sw3virtual then begin
        if (now-horasw3)>12*tmSegundo then begin
          sw3virtual:=false;
          DMCONS.InsertaComandoFinv(xpos,1);
        end;
      end;
    end;

    // Checa comandos
    with DMCONS do begin
      for xcmnd:=1 to 40 do if (TabCmnd[xcmnd].SwActivo)and(not TabCmnd[xcmnd].SwResp) then begin
        SwAplicaCmnd:=true;
        rsp:='';
        ss:=UpperCase(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,1,' '));
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
          if xpos=0 then begin
            ActivaModoPrepago(0);
            for xpos:=1 to MaxPosCarga do begin
              TPosCarga[xpos].ModoOpera:='Prepago';
              stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
              HTTP('application/x-www-form-urlencoded').Post('https://'+UrlServFDC+'/api/Dispensers/SelfService',stream);
              stream.Destroy;
              Sleep(100);
            end;
            rsp:='OK';
          end
          else if (xpos in [1..maxposcarga]) then begin
            TPosCarga[xpos].ModoOpera:='Prepago';
            ActivaModoPrepago(xpos);
            stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
            HTTP('application/x-www-form-urlencoded').Post('https://'+UrlServFDC+'/api/Dispensers/SelfService',stream);
            stream.Destroy;
            rsp:='OK';
          end;
        end
        // CMND: DESACTIVA MODO PREPAGO
        else if ss='DMP' then begin
          xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if xpos=0 then begin
            DesActivaModoPrepago(0);
            for xpos:=1 to MaxPosCarga do begin
              TPosCarga[xpos].ModoOpera:='Normal';
              stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
              HTTP('application/x-www-form-urlencoded').Post('https://'+UrlServFDC+'/api/Dispensers/FullService',stream);
              stream.Destroy;
              Sleep(100);
            end;
            rsp:='OK';
          end
          else if (xpos in [1..maxposcarga]) then begin
            TPosCarga[xpos].ModoOpera:='Normal';
            DesActivaModoPrepago(xpos);
            stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
            HTTP('application/x-www-form-urlencoded').Post('https://'+UrlServFDC+'/api/Dispensers/FullService',stream);
            stream.Destroy;
            rsp:='OK';
          end;
        end
        // ORDENA CARGA DE COMBUSTIBLE
        else if ss='OCC' then begin
          rsp:='OK';
          SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if (SnPosCarga in [1..MaxPosCarga]) then begin

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
                if (SnImporte<1)or(SnImporte>9999) then
                  rsp:='Importe fuera de rango válido: de 1.00 a 9999.00';
              except
                rsp:='Error en Importe';
              end;
              if rsp='OK' then begin
                xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
                TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                SnLitros:=0;
                TPosCarga[SnPosCarga].swarosmag:=false;
                if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                  swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                  aros_cont:=0;
                  Despliegamemo4('Activa aros: mang'+inttostr(aros_mang)+' cte '+inttostr(aros_cte)+' vehic '+inttostr(aros_vehi));
                  if (not swarosmag) then
                    rsp:='Aro magnético se encuentra desconectado';
                end;
                if rsp='OK' then
                  EnviaPreset(xcomb,rsp);
              end;
            end;
          end
          else rsp:='Posicion de Carga no Existe';
        end
        // ORDENA CARGA DE COMBUSTIBLE LITROS
        else if ss='OCL' then begin
          rsp:='OK';
          SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if (SnPosCarga in [1..MaxPosCarga]) then begin

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
              try
                SnImporte:=0;
                SnLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                if (SnLitros<0.1)or(SnLitros>999) then
                  rsp:='Litros fuera de rango válido: de 0.10 a 999.00';
              except
                rsp:='Error en Litros';
              end;
              if rsp='OK' then begin
                xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
                TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                TPosCarga[SnPosCarga].swarosmag:=false;
                if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                  swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                  aros_cont:=0;
                  Despliegamemo4('Activa aros: mang'+inttostr(aros_mang)+' cte '+inttostr(aros_cte)+' vehic '+inttostr(aros_vehi));
                  if (not swarosmag) then
                    rsp:='Aro magnético se encuentra desconectado';
                end;
                if rsp='OK' then
                  EnviaPreset(xcomb,rsp);
              end;
            end;
          end
          else rsp:='Posicion de Carga no Existe';
        end
        // ORDENA FIN DE VENTA
        else if ss='FINV' then begin
          rsp:='Ok';
          xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if (xpos in [1..MaxPosCarga]) then begin
            TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
            if (TPosCarga[xpos].Estatus=3)or(TPosCarga[xpos].Estatus=1) then begin // EOT
                TPosCarga[xpos].SwFINV:=true;
                EsperaMiliSeg(100);
                stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
                HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Payment',stream);
                stream.Destroy;
                if TPosCarga[xpos].sw3virtual then begin
                  TPosCarga[xpos].sw3virtual:=false;
                  TPosCarga[xpos].estatus:=1;
                  TPosCarga[xpos].estatusant:=1;
                  TPosCarga[xpos].finventa:=0;
                end;
                TPosCarga[xpos].SwCargaTotales:=true;
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
                DespliegaPosCarga(xpos);
            end
            else begin // EOT
              rsp:='Posicion aun no esta en fin de venta: Estat='+inttostr(TPosCarga[xpos].Estatus);
            end;
          end
          else rsp:='Posicion de Carga no Existe';
        end
        // CMND: DESHABILITA POSICIOND DE CARGA
        else if ss='DPC' then begin
          xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if xpos in [1..MaxPosCarga] then
            TPosCarga[xpos].SwDesHabilitado:=true;
        end
        else if ss='HPC' then begin
          xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if xpos in [1..MaxPosCarga] then
            TPosCarga[xpos].SwDesHabilitado:=false;
        end
        else if (ss='DVC')or(ss='PARAR') then begin
          rsp:='OK';
          xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if xpos in [1..MaxPosCarga] then begin
            stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
            HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Stop',stream);
            stream.Destroy;
            TPosCarga[xpos].SwParado:=true;
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
          if xpos in [1..MaxPosCarga] then begin
            stream:=TStringStream.Create('noDispenser='+IntToStr(xpos));
            HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Start',stream);
            stream.Destroy;
            TPosCarga[xpos].SwParado:=false;
            if DMCONS.swemular then begin
              if xpos in [1..MaxPosCarga] then
                if EmularEstatus[xpos]='8' then
                  EmularEstatus[xpos]:='2'
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
        end;
        if SwAplicaCmnd then begin
          TabCmnd[xcmnd].SwResp:=true;
          TabCmnd[xcmnd].Respuesta:=rsp;
          DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
        end;
        if SwCerrar then begin
          Close;
          Exit;
        end;
      end;
    end;

    NumPaso:=1;

    if (ContadorAlarma>=10) then begin
      if not StaticText17.Visible then
        Beep;
      StaticText17.Visible:=not StaticText17.Visible;
      if ContadorAlarma=10 then
        DMCONS.RegistraBitacora3(1,'Desconexion de Dispositivo','Error Comunicación Dispensarios','U');
      Application.ProcessMessages;
    end;

    Inc(ContadorAlarma);
    StaticText5.Caption:=IntToStr(NumPaso);
    ContEspera:=0;
    StaticText6.Caption:='Esperando..';
    
    try
      rspJson:=TlkJSON.ParseText(UTF8Decode(HTTP.Get('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Status')));
    except
      Login;
    end;

    if (rspJson.Field['data'].Count>0) and (ContadorAlarma>=10) then begin
      ContadorAlarma:=0;
      StaticText17.Visible:=False;
    end;

    LineaTimer:='B00';
    for i:=0 to rspJson.Field['data'].Count-1 do
      LineaTimer:=LineaTimer+IntToStr(rspJson.Field['data'].Child[i].Field['status'].Value);
    rspJson.Destroy;
    ProcesaLinea;

    if NotificationIcon1.Tag=0 then begin
      if ErrorInic then begin
        EsperaMiliSeg(3000);
        Application.Terminate;
      end;
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      FDISFUSION.Visible:=false;
      NotificationIcon1.Show;
    end;
  finally
    Timer1.Enabled:=True;
  end;
end;


procedure TFDISFUSION.EnviaPreset(xcomb:integer;var rsp:string);
var ss,sval:string;
    i,ndig,xpos,nc:integer;
    swlitros:boolean;
    js:TlkJSONobject;
    stream:TStringStream;
begin
  if DMCONS.SoportaSeleccionProducto<>'Si' then
    xcomb:=0;
  swlitros:=SnLitros>0.01;
  if not (SnPosCarga in [1..MaxPosCarga]) then
    exit;
  rsp:='OK';
  xpos:=SnPosCarga;
  if xcomb<=0 then begin
    rsp:='Favor de indicar un combustible';
    exit;
  end;
  if not (TPosCarga[xpos].estatus in [1,5,9]) then begin
    rsp:='Posición no Disponible';
    exit;
  end;
  if TPosCarga[xpos].SwDesHabilitado then begin
    rsp:='Posición Deshabilitada';
    exit;
  end;
  if TPosCarga[xpos].estatus=9 then begin
    HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Stop',TStringStream.Create('noDispenser='+IntToStr(xpos)));
    esperamiliseg(300);
  end;
  
  js:=TlkJSONobject.Create;
  js.Add('AutoPago',TPosCarga[xpos].FinVenta=0);
  js.Add('NoDispenser',SnPosCarga);
  js.Add('NoProducto',xcomb);
  if swlitros then begin
    js.Add('Litros',SnLitros);
    TPosCarga[xpos].volumenPreset:=SnLitros;
  end
  else begin
    js.Add('Pesos',SnImporte);
    TPosCarga[xpos].importePreset:=SnImporte;
  end;

  i:=0;
  stream:=TStringStream.Create(UTF8Encode(GenerateReadableText(js,i)));
  HTTP('application/json').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Authorize',stream);
  stream.Destroy;
  js.Destroy;

  if DMCONS.swemular then begin
    if EmularEstatus[xpos]='1' then begin
      EmularEstatus[xpos]:='2';
      TPosCarga[xpos].estatus:=2;
      TPosCarga[xpos].volumen:=SnImporte/5;
      TPosCarga[xpos].importe:=SnImporte;
      TPosCarga[xpos].precio:=5;
      TPosCarga[xpos].posdispactual:=1;
      TPosCarga[xpos].hora:=time;
    end;
  end;
end;

procedure TFDISFUSION.Timer3Timer(Sender: TObject);
const timpo:array[0..4] of real = (50,100,150,200,30);
      tpos:array[0..2] of integer = (2,1,2);
var xpos,xp,rr,i,cont,nn,dig,xcomb:integer;
    lin,ss:string;
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
              rr:=Random(8);
              if rr=1 then begin
                xpos:=Random(MaxPosCarga)+1;
                if not TPosCarga[xpos].SwDesHabilitado then begin
                  case EmularEstatus[xpos] of
                    '1':if TPosCarga[xpos].ModoOpera='Normal' then begin
                          EmularEstatus[xpos]:='5';
                          rr:=Random(5);
                          TPosCarga[xpos].volumen:=Timpo[rr]/5;
                          TPosCarga[xpos].importe:=timpo[rr]+0.01;
                          TPosCarga[xpos].precio:=5;
                          TPosCarga[xpos].hora:=time;
                          rr:=Random(3);
                          nn:=tpos[rr];
                          if nn>TPosCarga[xpos].NoComb then
                            nn:=TPosCarga[xpos].NoComb;
                          if nn=0 then
                            nn:=1;
                          TPosCarga[xpos].PosDispActual:=nn;
                          if TPrecio[TPosCarga[xpos].TComb[nn]]>0.01 then begin
                            TPosCarga[xpos].precio:=TPrecio[TPosCarga[xpos].TComb[nn]];
                            TPosCarga[xpos].volumen:=TPosCarga[xpos].importe/TPosCarga[xpos].precio;
                          end;
                        end;
                    '2':EmularEstatus[xpos]:='3';
                  end;
                end
                else
                  EmularEstatus[xpos]:='0';
              end
              else begin
                for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
                  if not SwDeshabilitado then begin
                    if (EmularEstatus[xpos]='2')and((Time-Hora)>20/86400)then
                      EmularEstatus[xpos]:='1';
                  end
                  else
                    EmularEstatus[xpos]:='0';
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
                    for i:=1 to length(EmularEstatus) do if EmularEstatus[i]<>'0' then begin
                      if EmularEstatus[i]='2' then
                        inc(cont);
                      if cont=xpos then
                        EmularEstatus[i]:='1';
                    end;
                  end;
                end;
              end;
              Linea:='B00'+EmularEstatus;
            end;
        'A':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              dig:=TPosCarga[xpos].TDiga[TPosCarga[xpos].PosDispActual];
              if dig=0 then
                Linea:=copy(Lin,1,3)+IntToStr(TPosCarga[xpos].PosDispActual)
                       +'0'
                       +FiltraStrNum(FormatFloat('00000.000',TPosCarga[xpos].volumen))
                       +FiltraStrNum(FormatFloat('00000.000',TPosCarga[xpos].importe))
                       +FiltraStrNum(FormatFloat('00.000',TPosCarga[xpos].precio))
              else
                Linea:=copy(Lin,1,3)+IntToStr(TPosCarga[xpos].PosDispActual)
                       +'0'
                       +FiltraStrNum(FormatFloat('00000.000',TPosCarga[xpos].volumen))
                       +FiltraStrNum(FormatFloat('000000.00',TPosCarga[xpos].importe))
                       +FiltraStrNum(FormatFloat('00.00',TPosCarga[xpos].precio));
            end;
        'U':Linea:='U1';
        'C':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              xp:=StrToIntDef(copy(lin,4,1),1);
              xcomb:=CombustibleEnPosicion(xpos,xp);
              Linea:=copy(Lin,1,5)+'0'+inttostr(xcomb)+'0000000';
            end;
        'h':Linea:='h1';
        'k':Linea:='k1';
        'a':if length(lin)=5 then begin
              case lin[2] of
                '1':Linea:='a07380';
                '2':Linea:='a06250';
                '3':Linea:='a05190';
              end;
            end
            else begin
              Linea:='a1';
            end;
        's':begin
              Linea:=copy(Lin,1,3)+'1';
            end;
        else exit;
      end;
      LineaTimer:=idSTX+Linea+idETX+' ';
      DMCONS.AgregaLog('R '+LineaTimer);
      ProcesaLinea;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISFUSION.registro(valor:integer;variable:string);
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


procedure TFDISFUSION.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISFUSION.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISFUSION.lee_registro;
var
  Registry: TRegistry;
  estado:integer;
begin
  with DMCONS do begin
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

procedure TFDISFUSION.ListBoxPC1DblClick(Sender: TObject);
begin
  SwMensaje:=not SwMensaje;
end;

function TFDISFUSION.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
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


procedure TFDISFUSION.Button1Click(Sender: TObject);
begin
  HTTP.Get('https://'+DMCONS.UrlServFDC+'/api/Dispensers/TraceLog')
end;

procedure TFDISFUSION.Button4Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISFUSION.MD5(const usuario: string): string;
var
  idmd5:TIdHashMessageDigest5;
  hash:T4x4LongWordRecord;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  hash := idmd5.HashValue(usuario);
  Result := idmd5.AsHex(hash);
  Result := AnsiLowerCase(Result);
  idmd5.Destroy;
end;

function TFDISFUSION.HTTP: TIdHTTP;
begin
  IdHTTP.Request.ContentType:='';
  IdHTTP.Request.CustomHeaders.Clear;
  if Token<>'' then begin
    IdHTTP.Request.CustomHeaders.FoldLines := False;
    IdHTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
  end;
  Result:=IdHTTP;
end;

function TFDISFUSION.HTTP(tipoPost:string): TIdHTTP;
begin
  IdHTTP.Request.ContentType:=tipoPost;
  IdHTTP.Request.CustomHeaders.Clear;
  if Token<>'' then begin
    IdHTTP.Request.CustomHeaders.FoldLines := False;
    IdHTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
  end;
  Result:=IdHTTP;
end;

procedure TFDISFUSION.CargaTransaccion(posCarga:Integer; js:TlkJSONbase);
var
  stream:TStringStream;
begin
  with TPosCarga[posCarga] do begin
    try
      if estatus<>9 then begin
        if js.Field['litros'].Value>0 then begin
          importe:=js.Field['pesos'].Value;
          precio:=js.Field['precio'].Value;
          volumen:=AjustaFloat(importe/precio,3);
          PosDispActual:=js.Field['noManguera'].Value;
        end;
        if (Estatus=3)or(Estatus=1) then begin
          if (swcargando) then begin // FIN DE CARGA
            swcargando:=false;
            swdesp:=true;
            importePreset:=0;
            volumenPreset:=0;
          end;
        end;

        if (estatus=2) and (((importePreset>0) and (importe>importePreset)) or ((volumenPreset>0) and (volumen>volumenPreset))) then begin
          stream:=TStringStream.Create('noDispenser='+IntToStr(posCarga));
          HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Stop',stream);
          stream.Destroy;
          DMCONS.AgregaLogCmnd('Se envió comando para detener venta. Posición: '+IntToStr(posCarga)+' Cantidad presetada: '+FormatoMoneda(ifthen(importePreset>0,importePreset,volumenPreset))+' Cantidad en curso: '+FormatoMoneda(ifthen(importePreset>0,importe,volumen)));
          DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
        end;

        if (TPosCarga[posCarga].finventa=0) then begin
          if (Estatus=3) then begin // FIN DE CARGA
            stream:=TStringStream.Create('noDispenser='+IntToStr(posCarga));
            HTTP('application/x-www-form-urlencoded').Post('https://'+DMCONS.UrlServFDC+'/api/Dispensers/Payment',stream);
            stream.Destroy;
            if sw3virtual then begin
              sw3virtual:=false;
              finventa:=0;
              estatus:=1;
              estatusant:=1;
            end;
          end;
        end;
      end;
      DespliegaPosCarga(posCarga);
    except
      if estatus<>2 then
        SwCargando:=false;
    end;
  end;
end;

procedure TFDISFUSION.CargaTotales(posCarga: Integer; js: TlkJSONbase);
var i:Integer;
begin
  if posCarga in [1..MaxPosCarga] then begin
    with TPosCarga[posCarga] do begin
      try
        for i:=1 to nocomb do begin
          try
            TotalLitros[i]:=StrToFloatDef(js.Field['litros'+inttostr(i)].Value,0);      
          except
            TotalLitros[i]:=0;
            SwCargaTotales:=false;
          end;     
        end;
        SwCargaTotales:=false;
        DMCONS.RegistraTotales_BD4(posCarga,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
        DespliegaPosCarga(posCarga);
      except
      end;
    end;
  end;
end;

procedure TFDISFUSION.Login;
var
  params:TStringList;
  rspJson:TlkJSONbase;
begin
  with DMCONS do
  begin
    try
      try
        params:=TStringList.Create;
        params.Add('username='+UsuarioFDC);
        params.Add('password='+MD5(UsuarioFDC+'|'+FormatDateTime('yyyy-mm-dd',Date)+'T'+FormatDateTime('hh:nn',Now)));
        params.Add('grant_type=password');
        rspJson:=TlkJSON.ParseText(UTF8Decode(HTTP('application/x-www-form-urlencoded').Post('https://'+UrlServFDC+'/api/auth/login',params)));
        Token := rspJson.Field['access_token'].Value;
        Timer2.Enabled:=False;
//        if rspJson.Field['expires_in'].Value>0 then begin
//          Timer2.Interval:=(rspJson.Field['expires_in'].Value*1000)-5000;
//          Timer2.Enabled:=True;
//        end;
        if Token='' then begin
          MensajeErr('No fue posible autenticar con servidor FDC.');
          Application.Terminate;
          Application.ProcessMessages;
        end;
      except
        on e:Exception do begin
          MensajeErr('Error login: '+e.Message);
          Application.Terminate;
          Application.ProcessMessages;
        end;
      end;
    finally
      if rspJson<>nil then
        rspJson.Destroy;
      params.Destroy;
    end;
  end;    
end;

procedure TFDISFUSION.Timer2Timer(Sender: TObject);
begin
  Login;
end;

end.
