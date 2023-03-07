unit UDISHONGJANG;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  IBCtrls, SIBEABase, SIBFIBEA, FIBDatabase, pFIBDatabase, UIMGUTIL,
  dxGDIPlusClasses,ShellApi;

type
  TFDISHONGJANG = class(TForm)
    Ap1: TApdComPort;
    Panel1: TPanel;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Restaurar1: TMenuItem;
    BitBtn3: TBitBtn;
    Timer3: TTimer;
    ImageList1: TImageList;
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
    Timer2: TTimer;
    StaticText7: TStaticText;
    Label4x: TLabel;
    TL_BombACTIVO: TStringField;
    TL_BombIMPRIMEAUTOM: TStringField;
    TL_BombDIGITOAJUSTEPRECIO: TIntegerField;
    TL_BombCAMPOLECTURA: TStringField;
    TL_BombMODOOPERACION: TStringField;
    pFIBDatabase1: TpFIBDatabase;
    SIBfibEventAlerter1: TSIBfibEventAlerter;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Image1: TImage;
    ListBox1: TListBox;
    ListBoxPC11: TListBox;
    ListBoxPC12: TListBox;
    ListBoxPC21: TListBox;
    ListBoxPC22: TListBox;
    PanelPC11: TPanel;
    PanelPC12: TPanel;
    PanelPC21: TPanel;
    PanelPC22: TPanel;
    StaticText1: TStaticText;
    DBGrid3: TDBGrid;
    ListBoxPC13: TListBox;
    PanelPC13: TPanel;
    ListBoxPC23: TListBox;
    PanelPC23: TPanel;
    Panel2: TPanel;
    ListView1: TListView;
    StaticText2: TStaticText;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    StaticText5: TStaticText;
    Memo4: TMemo;
    Memo1: TMemo;
    Button1: TButton;
    StaticText6: TStaticText;
    PopupMenu11: TPopupMenu;
    E1: TMenuItem;
    Colgar1: TMenuItem;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Button2: TButton;
    Button3: TButton;
    AbrirUbicacion1: TMenuItem;
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
    procedure ListBoxPC11DblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure Colgar1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    SwAplicaCmnd,
    SwInicio:boolean;
    LineaBuff,
    LineaProc:string;
    FinLinea:boolean;
    swprocesando:boolean;
    EmularEstatus,
    LineaEmular:string;
    ContadorAlarma:integer;
  public
    { Public declarations }
    procedure ComandoConsola(ss:string);
    procedure LimpiaConsola;
    procedure DespliegaManguera(xmang:integer);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    procedure DespliegaMemo4(lin:string);
    function ComandoA(xaddr,xlado:integer):string;
    function ComandoC(xaddr,xlado:integer):string;    // Modo prepago
    function ComandoD(xaddr,xlado:integer):string;    // Modo Normal
    function ComandoN(xaddr,xlado:integer):string;
    function ComandoU(xaddr,xlado,xprecio:integer):string;
    function ComandoV(xaddr,xlado:integer):string;
    function ComandoS(xaddr,xlado,ximporte:integer):string;
    function ComandoL(xaddr,xlado,xlitros:integer):string;
    function StrToHexSep(ss:string):string;
    function HexSepToStr(ss:string):string;
    function HexToBinario(ss:string):string;
    function DameManguera(xaddr,xlado:integer):integer;
    function CalculaBCC(ss:string):char;
    function ConvierteBCD(xvalor:real;xlong:integer):string;
    function ExtraeBCD(xstr:string;xini,xfin:integer):real;
    procedure ProcesoComandoA(xResp:string);
    procedure ProcesoComandoC(xResp:string);
    procedure ProcesoComandoD(xResp:string);
    procedure ProcesoComandoN(xResp:string);
    procedure ProcesoComandoU(xResp:string);
    procedure ProcesoComandoV(xResp:string);
    procedure ProcesoComandoS(xResp:string);
    procedure ProcesoComandoL(xResp:string);
    function DameEstatus(xstr:string;var swlocked,swerror:boolean):integer;
    procedure ProcesaLineaRec(LineaRsp:string);
    procedure ProcesaComandosExternos;
    procedure PublicaEstatusDispensarios;
    procedure MeteACola(xstr:string);
    procedure SacaDeCola(var xstr:string);
  end;

type
     TipoPosCarga = record
       posactual    :integer;
       posactual2   :integer;
       PosManguera  :array [1..3] of integer;
       PosEstatus   :array [1..3] of integer;
      end;

     TipoManguera = record
       address    :integer;
       lado       :integer;
       PosCarga   :integer;
       PosComb    :integer;
       estatus    :integer;
       isla       :integer;
       descestat  :string[20];
       importe,
       volumen,
       importeant,
       volumenant,
       precioant,
       precio     :real;
       preciofisico,
       litrospreset,
       impopreset :real;
       ContInicDesp,
       ContTotErr,
       estatusant :integer;
       Estat_Cons :char;
       Combustible :integer;
       TotalLitros,
       TotalLitrosAnt :real;
       SwDespTot,
       SwDesp:boolean;
       HoraFV,
       Hora:TDateTime;
       SwInicio2,
       SwPreset,
       SwPresetImp,
       SwCargaTotales,
       IniciaCarga,
       SwPrepagoM,
       ActualizarPrecio,
       LeerPrecio,
       SwErrorCmnd,
       swcargando,
       Swfinventa,
       SwVentaValidada,
       swcargapreset,
       SwEnllavado,
       SwActivo    :boolean;
       TipoPago,
       FinVenta,
       ContBrinca,
       ContParo   :integer;
       Boucher    :string[12];
       ModoOpera  :string[8];
     end;


const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=5;
      MaxEspera3=5;


var
  FDISHONGJANG: TFDISHONGJANG;
  TPosCarga :array[1..32] of tipoposcarga;
  TMangueras:array[1..100] of tipomanguera;
  MaxMangueras:integer;
  MaxPosiciones:integer;
  SwCerrar    :boolean;
  CmndProc        :char;
  MangCiclo,
  MangueraActual  :integer;
  SwDespEmular,
  SwReintentoCmnd,
  swcierrabd,
  SwEsperaCmnd    :boolean;
  TimeCmnd,
  TimeResp        :TDateTime;  // Momento de envio de comando, es para medir la espera
  LinCmndHJ,
  LinCmnd         :string;
  CharCmnd        :char;
  MangCmnd        :integer;
  TotalTramas,
  TotalErrores    :LongInt;
  TColaCmnd       :array[1..50] of string[50];
  ApCola          :integer;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}


function TFDISHONGJANG.CalculaBCC(ss:string):char;
var i,n,m:integer;
begin
  n:=0;
  for i:=1 to length(ss) do
    n:=n+ord(ss[i]);
  m:=(n)mod(256);
  result:=char(256-m);
end;

procedure TFDISHONGJANG.MeteACola(xstr:string);
begin
  if ApCola<50 then begin
    inc(ApCola);
    TColaCmnd[ApCola]:=xstr;
  end;
end;

procedure TFDISHONGJANG.SacaDeCola(var xstr:string);
var i:integer;
begin
  xstr:='';
  if ApCola>0 then begin
    xstr:=TColaCmnd[1];
    dec(ApCola);
    if ApCola>0 then
      for i:=1 to ApCola do
        TColaCmnd[i]:=TColaCmnd[i+1];
  end;
end;

procedure TFDISHONGJANG.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=40 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISHONGJANG.DespliegaPrecios;
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


procedure TFDISHONGJANG.IniciaBaseDeDatos;
var i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    DespliegaMemo4('Inicio Base de Datos');
    try
      if not swemular then begin
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
        try
          Ap1.Open:=true;
          DespliegaMemo4('Puerto abierto');
        except
          MensajeErr('No Puedo abrir puerto: '+inttostr(ptPuerto)+'  '+inttostr(ptBaudios)+' '+ptParidad+' '
                       +inttostr(ptBitsDatos)+' '+inttostr(ptBitsParada));
        end;
      end;

      // Carga Pos. Carga
      Q_BombIb.Active:=false;
      Q_BombIb.SQL[6]:='order by manguera,combustible';
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

procedure TFDISHONGJANG.IniciaEstacion;
var i,xisla,xpos,j,
    xcomb,xnum,xpcomb,
    xaddr,xlado,xmang:integer;
begin
  with DMCONS do begin
    swcierrabd:=false;
    ApCola:=0;
    ListView1.Items.Clear;
    MaxMangueras:=0;
    MaxPosiciones:=0;
    for i:=1 to 32 do with TPosCarga[i] do begin
      posactual:=1;
      posactual2:=1;
      for j:=1 to 3 do begin
        posmanguera[j]:=0;
        posestatus[j]:=0;
      end;
    end;
    for i:=1 to 100 do with TMangueras[i] do begin
      address:=0;
      lado:=0;
      poscarga:=0;
      poscomb:=0;
      isla:=0;
      estatus:=0;
      estatusant:=0;
      Estat_Cons:=' ';
      SwInicio2:=true;
      IniciaCarga:=false;
      SwPrepagoM:=false;
      SwEnllavado:=false;
      SwPreset:=false;
      ActualizarPrecio:=false;
      LeerPrecio:=false;
      importe:=0;
      importeant:=0;
      impopreset:=0;
      volumen:=0;
      volumenant:=0;
      precio:=0;
      precioant:=0;
      preciofisico:=0;
      TotalLitros:=0;
      TotalLitrosAnt:=0;
      SwCargando:=false;
      ContInicDesp:=0;
      ContTotErr:=0;
      SwFinVenta:=false;
      SwVentaValidada:=false;
      SwErrorCmnd:=false;
      SwCargaPreset:=false;
      SwCargaTotales:=true;
      SwActivo:=false;
      tipopago:=0;
      finventa:=0;
      boucher:='';
      contbrinca:=0;
      contparo:=0;
    end;
    // FIN
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xmang:=Q_BombIbManguera.AsInteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      xaddr:=Q_BombIbHJ_Addr.AsInteger;
      xlado:=Q_BombIbHJ_Lado.AsInteger;
      xisla:=Q_BombIbIsla.asinteger;
      xcomb:=Q_BombIbCombustible.AsInteger;
      xpcomb:=Q_BombIbCON_Posicion.AsInteger;
      if (xpos>MaxPosiciones) then
        MaxPosiciones:=xpos;
      if xpcomb in [1..3] then
        TPosCarga[xpos].posmanguera[xpcomb]:=xmang;
      if (xmang>MaxMangueras)and(xpos<=DMCONS.MaximoDePosiciones) then begin
        MaxMangueras:=xmang;
        ListView1.Items.Add;
        ListView1.Items[MaxMangueras-1].Caption:=IntToClaveNum(xmang,2);
        ListView1.Items[MaxMangueras-1].ImageIndex:=0;
      end;
      with TMangueras[xmang] do begin
        address:=xaddr;
        Lado:=xlado;
        Isla:=xisla;
        PosCarga:=xpos;
        PosComb:=xpcomb;
        Combustible:=xcomb;
        ActualizarPrecio:=true;
        SwDesp:=false;
        SwDespTot:=false;
        ModoOpera:=Q_BombIbModoOperacion.AsString;
        SwPrepagoM:= (ModoOpera='Prepago');

      end;
      Q_BombIb.Next;
    end;
  end;
  ListBox1.Items.Clear;
  xnum:=(MaxPosiciones)div(2);
  if (MaxPosiciones)mod(2)>0 then
    inc(xnum);
  for i:=1 to xnum do begin
    if i<xnum then
      ListBox1.Items.add('Posiciones '+IntToClaveNum(i*2-1,2)+' - '+IntToClaveNum(i*2,2))
    else
      ListBox1.Items.add('Posiciones '+IntToClaveNum(i*2-1,2)+' - '+IntToClaveNum(MaxPosiciones,2));
  end;
end;


procedure TFDISHONGJANG.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      ErrorInic:=true;
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      SwProcesando:=false;
      LineaProc:='';
      LineaBuff:='';
      FinLinea:=false;
      IniciaEstacion;
      ListBox1.SetFocus;
      Timer1.Enabled:=true;
      Timer2.Enabled:=true;
      DMCONS.T_ConfIb.Active:=true;
      if DMCONS.SwEmular then begin
        LineaEmular:='';
        EmularEstatus:=LlenaStr('','N',MaxMangueras,'1');
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

procedure TFDISHONGJANG.LimpiaConsola;
begin
  StaticText1.Caption:='  ';
  StaticText2.Caption:='  ';
  ListBoxPC11.Items.Clear;
  ListBoxPC12.Items.Clear;
  ListBoxPC13.Items.Clear;
  ListBoxPC21.Items.Clear;
  ListBoxPC22.Items.Clear;
  ListBoxPC23.Items.Clear;
  panelPC11.color:=ClWhite;
  panelPC12.color:=ClWhite;
  panelPC13.color:=ClWhite;
  panelPC21.color:=ClWhite;
  panelPC22.color:=ClWhite;
  panelPC23.color:=ClWhite;
  panelPC11.Caption:='';
  panelPC12.Caption:='';
  panelPC13.Caption:='';
  panelPC21.Caption:='';
  panelPC22.Caption:='';
  panelPC23.Caption:='';
end;

procedure TFDISHONGJANG.DespliegaManguera(xmang:integer);
var i,rango,posi,posf,xcomb,xc,xm:integer;
    lin,xnombre,xdescrip,xpanel:string;
    xprecio,xprecio2,xdifprec:real;
begin
  try
    try
      rango:=ListBox1.ItemIndex+1;
      if rango=0 then
        rango:=1;
      posi:=rango*2-1;
      posf:=rango*2;
      with TMangueras[xmang] do begin
        xdescrip:=descestat;
        xcomb:=Combustible;
        if xcomb in [1..maxcomb] then
          xnombre:=DMCONS.TabComb[xcomb].Nombre;
        if poscarga in [posi..posf] then begin
          i:=poscarga-posi+1;
          TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(poscarga,2);
          xpanel:='panelPC'+IntToStr(i)+inttostr(poscomb);
          TPanel(FindComponent(xpanel)).Caption:=xdescrip;
          case estatus of
            5,8:TPanel(FindComponent(xpanel)).color:=ClLime;
            1:if not SwPreset then
                TPanel(FindComponent(xpanel)).color:=ClRed
              else
                TPanel(FindComponent(xpanel)).color:=ClGray;
            2:TPanel(FindComponent(xpanel)).color:=ClGray;
            3,4:TPanel(FindComponent(xpanel)).color:=ClYellow;
            7:TPanel(FindComponent(xpanel)).color:=ClBlue;
            else TPanel(FindComponent(xpanel)).color:=ClWhite;
          end;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Clear;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add(FormatFloat('###,##0.00',importe)+' Pesos');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add(FormatFloat('###,##0.00',volumen)+' Litros');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add(FormatFloat('###,##0.00',precio)+' $/Lts');
          if TPosCarga[poscarga].PosManguera[TPosCarga[poscarga].posactual]=xmang then
            TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add('* '+xnombre)
          else
            TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add(xnombre);
          TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add('Precio: $'+FormatFloat('#0.00',preciofisico));
          TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add('Total:'+FormatFloat('##,###,##0.00',totallitros)+' lts');
          if swpreset then begin
            TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add('');
            if swpresetimp then
              TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add('Preset: $'+FormatFloat('#,##0.00',impopreset))
            else
              TListBox(FindComponent('ListBoxPC'+IntToStr(i)+inttostr(poscomb))).Items.Add('Preset: '+FormatFloat('##0.00',litrospreset)+' lts');
          end;
        end;
      end;

      // Refresca Listas
      for i:=1 to MaxMangueras do with TMangueras[i] do begin
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
            //SwCargaTotales:=true;
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
                T_MoviIbPosCarga.AsInteger:=PosCarga;
                xcomb:=Combustible;
                if TabComb[xcomb].Agruparcon>0 then begin
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
                end
                else begin
                  DespliegaMemo4('pos:'+inttostr(i)+' comb:'+inttostr(xcomb)+' prec:'+formatomoneda(xprecio)+' prec2:'+formatomoneda(xprecio2)+
                                  ' vol:'+formatomoneda(volumen)+' imp:'+formatomoneda(importe));
                end;
                for xm:=1 to MaxMangueras do begin
                  if TMangueras[xm].PosCarga=PosCarga then
                    case TMangueras[xm].PosComb of
                      1:T_MoviIbTotal01.AsFloat:=AjustaFloat(TMangueras[xm].TotalLitros,3);
                      2:T_MoviIbTotal02.AsFloat:=AjustaFloat(TMangueras[xm].TotalLitros,3);
                      3:T_MoviIbTotal03.AsFloat:=AjustaFloat(TMangueras[xm].TotalLitros,3);
                      4:T_MoviIbTotal04.AsFloat:=AjustaFloat(TMangueras[xm].TotalLitros,3);
                    end;
                end;
                T_MoviIbTag.AsInteger:=0;
                T_MoviIbManguera.AsInteger:=i;
                T_MoviIbTipoPago.asinteger:=TMangueras[i].TipoPago;
                DMCONS.AgregaLog('>>Guarda venta Manguera '+inttostr(i)+'  Tipo Pago: '+inttostr(TMangueras[i].TipoPago)+'   Importe: '+FormatoMoneda(importe));
                T_MoviIbBoucher.Asstring:=Boucher;
                T_MoviIbCuponImpreso.AsString:='No';
                T_MoviIbReferenciaBitacora.AsInteger:=0;
                T_MoviIbGasId.AsInteger:=Random(1000000);
                T_MoviIbHexhash.AsString:=EncriptaCadena(T_EstsIbNUMEROESTACION.AsString, FormatFloat('###0.00',T_MoviIbImporte.AsFloat));
                TMangueras[i].TipoPago:=0;
                Boucher:='';
                T_MoviIb.post;
                TPosCarga[PosCarga].posactual2:=TMangueras[i].poscomb;
                if (lcLicTemporal)and(date>lcLicVence) then begin
                  MensajeErr('Licencia vencida. Llame a su distribuidor');
                  Application.Terminate;
                end;
                lin:='07';
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
var rsp,Descrsp:string;
    xmang:integer;
begin
  with DMCONS do begin
    rsp:='OK';
    try
      SwCorteOk:=true;
      if not SwCorteParcial then begin
        for xmang:=1 to MaxMangueras do begin
          if (TMangueras[xmang].isla=xIslaCorte)or(xIslaCorte=0) then begin
            if TMangueras[xmang].swcargando then begin
              SwCorteOk:=false;
              DescRsp:='Existen dispensarios cargando';
            end;
          end;
        end;
      end;
      if SwCorteOk then begin
        T_Corte.Active:=true;
        try
          for xmang:=1 to MaxMangueras do with TMangueras[xmang] do begin
            if (TMangueras[xmang].isla=xIslaCorte)or(xIslaCorte=0) then begin
              if T_Corte.Locate('Fecha;Turno;Isla;PosCarga;Combustible',
                 VarArrayOf([xFechaCorte,xTurnoCorte,TMangueras[xmang].isla,PosCarga,Combustible]),[]) then
                T_Corte.Delete;
              T_Corte.Insert;
              T_CorteFecha.AsDateTime:=xFechaCorte;
              T_CorteTurno.AsInteger:=xTurnoCorte;
              T_CorteIsla.AsInteger:=TMangueras[xmang].isla;
              T_CortePosCarga.AsInteger:=PosCarga;
              T_CorteCombustible.AsInteger:=Combustible;
              T_CorteContadorLitros.AsFloat:=AjustaFloat(Totallitros,3);
              T_CorteContadorImporte.AsFloat:=0;
              T_Corte.Post;
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


function TFDISHONGJANG.StrToHexSep(ss:string):string;
var i:integer;
    xaux:string;
begin
  xaux:=inttohex(ord(ss[1]),2);
  for i:=2 to length(ss) do
    xaux:=xaux+' '+inttohex(ord(ss[i]),2);
  result:=xaux;
end;

function TFDISHONGJANG.HexSepToStr(ss:string):string;
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

function TFDISHONGJANG.HexToBinario(ss:string):string;
  function ConvierteBin(ch:char):string;
  begin
    case ch of
      '0':result:='0000';
      '1':result:='0001';
      '2':result:='0010';
      '3':result:='0011';
      '4':result:='0100';
      '5':result:='0101';
      '6':result:='0110';
      '7':result:='0111';
      '8':result:='1000';
      '9':result:='1001';
      'A':result:='1010';
      'B':result:='1011';
      'C':result:='1100';
      'D':result:='1101';
      'E':result:='1110';
      'F':result:='1111';
    end;
  end;
begin
  result:=ConvierteBin(ss[1])+ConvierteBin(ss[2]);
end;


function TFDISHONGJANG.DameManguera(xaddr,xlado:integer):integer;
var xmang:integer;
begin
  result:=0;
  for xmang:=1 to MaxMangueras do with TMangueras[xmang] do
    if (address=xaddr)and(lado=xlado) then
      result:=xmang;
end;

function TFDISHONGJANG.ComandoA(xaddr,xlado:integer):string; // Lee venta o display
// Send  01 06 01 0F 00 00 E9
//       xaddr xlong xlado cmnd
var ss:string;
begin
  ss:=char(xaddr)+char(6)+char(xlado)+char(15)+char(0)+char(0);
  result:=ss+CalculaBCC(ss);
end;

function TFDISHONGJANG.ComandoC(xaddr,xlado:integer):string; // Enllava
// Send  01 06 01 15 00 00 E9
//       xaddr xlong xlado cmnd
(*
25/Sep/2019 06:41:35.794 E 01 06 01 15 00 00 E3  >>C01
25/Sep/2019 06:41:36.216 E 02 06 01 15 00 00 E2  >>C02
25/Sep/2019 06:41:36.638 E 03 06 01 15 00 00 E1  >>C03
25/Sep/2019 06:41:37.062 E 01 06 02 15 00 00 E2  >>C04
25/Sep/2019 06:41:37.484 E 02 06 02 15 00 00 E1  >>C05
25/Sep/2019 06:41:37.905 E 03 06 02 15 00 00 E0  >>C06
*)
var ss:string;

begin
  ss:=char(xaddr)+char(6)+char(xlado)+char(21)+char(0)+char(0);
  result:=ss+CalculaBCC(ss);
end;

function TFDISHONGJANG.ComandoD(xaddr,xlado:integer):string; // DesEnllava
// Send  01 06 01 14 00 00 E9
//       xaddr xlong xlado cmnd
var ss:string;
begin
  ss:=char(xaddr)+char(6)+char(xlado)+char(20)+char(0)+char(0);
  result:=ss+CalculaBCC(ss);
end;

function TFDISHONGJANG.ComandoN(xaddr,xlado:integer):string; // Lee totalizador
// CPU=1   LADO=1
// Send  01 06 01 0E 00 00 EA
//       xaddr xlong xlado cmnd
var ss:string;
begin
  ss:=char(xaddr)+char(6)+char(xlado)+char(14)+char(0)+char(0);
  result:=ss+CalculaBCC(ss);
end;

function TFDISHONGJANG.ComandoU(xaddr,xlado,xprecio:integer):string; // Cambio de precios
// Precio=10.55   CPU=1  LADO=2
// Send  01 06 02 00 55 10 92
var ss:string;
    xval:real;
begin
  xval:=xprecio/100;
  ss:=char(xaddr)+char(6)+char(xlado)+char(0)+ConvierteBCD(xval,4);
  result:=ss+CalculaBCC(ss);
end;

function TFDISHONGJANG.ComandoV(xaddr,xlado:integer):string;    // Lee precios
// CPU=1  LADO=1
// Send  01 06 01 0C 00 00 EC
var ss:string;
begin
  ss:=char(xaddr)+char(6)+char(xlado)+char(12)+char(0)+char(0);
  result:=ss+CalculaBCC(ss);
end;

function TFDISHONGJANG.ComandoS(xaddr,xlado,ximporte:integer):string;    // Prefijar venta en importe
// Importe 10.00
// Send  01 07 02 09 00 10 00 DD
var ss:string;
    xval:real;
begin
  xval:=ximporte/100;
  ss:=char(xaddr)+char(7)+char(xlado)+char(9)+ConvierteBCD(xval,6);
  result:=ss+CalculaBCC(ss);
end;

function TFDISHONGJANG.ComandoL(xaddr,xlado,xlitros:integer):string; // Prefijado en litros
// Litros 2.00
// Send  01 07 02 0B 00 02 00 E9
var ss:string;
    xval:real;
begin
  xval:=xlitros/100;
  ss:=char(xaddr)+char(7)+char(xlado)+char(11)+ConvierteBCD(xval,6);
  result:=ss+CalculaBCC(ss);
end;

procedure TFDISHONGJANG.ComandoConsola(ss:string);
var s1,s2:string;
    xmang,xprecio,ximporte,xlitros:integer;
begin
  LinCmnd:=ss;
  MangCmnd:=strtointdef(copy(LinCmnd,2,2),0);
  if (MangCmnd>=1)and(MangCmnd<=MaxMangueras) then begin
    CharCmnd:=LinCmnd[1];
    SwEsperaCmnd:=true;
    TimeCmnd:=Now;
    TimeResp:=Now;
    case Charcmnd of
      'A':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoA(address,lado);
          end;
      'C':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoC(address,lado);
          end;
      'D':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoD(address,lado);
          end;
      'N':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoN(address,lado);
          end;
      'U':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            xprecio:=strtointdef(copy(LinCmnd,4,4),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoU(address,lado,xprecio);
          end;
      'V':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoV(address,lado);
          end;
      'S':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            ximporte:=strtointdef(copy(LinCmnd,4,6),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoS(address,lado,ximporte);
          end;
      'L':begin
            xmang:=strtointdef(copy(LinCmnd,2,2),0);
            xlitros:=strtointdef(copy(LinCmnd,4,6),0);
            if xmang in [1..MaxMangueras] then with TMangueras[xmang] do
              LinCmndHJ:=ComandoL(address,lado,xlitros);
          end;
      else exit;
    end;
    Inc(TotalTramas);
    if DMCONS.SwEmular then begin
      DMCONS.AgregaLog('E '+StrToHexSep(LinCmndHJ)+'  >>'+ss);
      LineaEmular:=ss;
      exit;
    end;
    //Timer1.Enabled:=false;
    try
      try
        s1:=copy(LinCmndHJ,1,1);
        s2:=copy(LinCmndHJ,2,length(LinCmndHJ)-1);
        try
          Ap1.Parity:=pNone;
          Ap1.Parity:=pMark;
        except
        end;
        Ap1.RTS:=false;
        if Ap1.Open then
          Ap1.Output:=s1;
        try
          Ap1.Parity:=pNone;
          Ap1.Parity:=pSpace;
        except
        end;
        if Ap1.Open then
          Ap1.OutPut:=s2;
        try
          Ap1.Parity:=pSpace;
        except
        end;
        DMCONS.AgregaLog('E '+StrToHexSep(LinCmndHJ)+'  >>'+ss);
      except
      end;
    finally
      Timer1.Enabled:=true;
    end;
  end;
end;

function TFDISHONGJANG.DameEstatus(xstr:string;var SwLocked,swerror:boolean):integer;
//  [5] Motor encendido
//  [2] Pistola levantada

{

8   CAMBIO DE PRECIO
7   CAMBIO IMPORTE
6   CAMBIO TOTALES
5   MOTOR ON
4   BLOQUEADO
3   ESTATUS ERROR
2   PISTOLA LEVANTADA NO USADO

FIN DE VENTA
46 - 06 - 02
4A - 06 - 02
46 - 12 - 52 - 02
12  0001 0010   inactivo enllavado
02  0000 0010   inactivo desenllavado
4A  0100 1010   despachando
06  0000 0110   fin venta PISTOLA COLGADA
16  0001 0110   fin venta PISTOLA COLGADA
0A  0000 1010   despachando
1A  0001 1010   despachando
0E  0000 1110   despachando
46  0100 0110   FIN VENTA PISTOLA LEVANTADA
52  0101 0010
4E  0100 1110}
var xst,ss:string;
    ee:integer;
begin
  ee:=0;
  ss:=ExtraeElemStrSep(xstr,2,' ');
  xst:=HexToBinario(ss);
  if (xst[5]='0')and(xst[2]='0') then       // Inactivo
    ee:=1
  else if (xst[5]='1')and(xst[7]='1') then  // Despachando
    ee:=5
  else if (xst[5]='1')and(xst[2]='1') then  // Despachando
    ee:=5
  else if (xst[5]='0')and(xst[2]='1') then  // Pistola levantada
    ee:=1
  else if (xst[5]='1')and(xst[2]='0') then  // Autorizado
    ee:=2
  else if (xst[4]='1') then                 // Enllavado
    ee:=9;
  swerror:=(xst[3]='1');

  if (ss='06')or(ss='16')or(ss='46') then      // fin venta
    ee:=1
  else if (ss='02')or(ss='12') then            // inativo
    ee:=1
  else if (ss='4A')or(ss='0A')or(ss='0E')or(ss='1A') then  // despachando
    ee:=5;

  SwLocked:=false;
  if (ss='12')or(ss='16')or(ss='1A')or(ss='52') then  // enllavado
    swlocked:=true;

  result:=ee;
end;

procedure TFDISHONGJANG.ProcesoComandoA(xResp:string);
// Receiver  0C  03  * 64 17 00  * 00 00 00 * 07 13 00 5C
//                IMPORTE=0013.07          LITROS=0017.64
//           0C  12    00 40 00    00 00 00   92 01 00 0F
var ss:string;
    ee,xp,ne:integer;
    swestat:boolean;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    ne:=NoElemStrSep(ss,' ');
    ee:=DameEstatus(ss,SwEnllavado,SwErrorCmnd);
    if SwErrorCmnd then
      exit;
    if ne<9 then
      exit;
    try
      estatusant:=estatus;
      importeant:=importe;
      volumenant:=volumen;
      importe:=ExtraeBCD(ss,3,5);
      volumen:=ExtraeBCD(ss,9,11);
      precio:=ajustafloat(dividefloat(importe,volumen),2);
      if precio>0.01 then
        precioant:=precio;
      estatus:=ee;
      if (estatusant=0)and(estatus<>0) then begin
        SwCargaTotales:=true;
        ActualizarPrecio:=true;
      end;
      swestat:=false;
      if (estatus=1)and(finventa=1)and(swfinventa) then begin
        if not SwVentaValidada then begin
          estatus:=8;
          if estatusant=5 then
            HoraFV:=Now;
          DMCONS.AgregaLog('>>Estatus 8 en Manguera '+inttostr(MangCmnd));
        end
        else
          estatus:=7;
      end;
      if (estatus in [7,8])and((now-HoraFV)>10*tmsegundo) then begin
        estatus:=1;
        swfinventa:=false;
      end;
      case estatus of
        1:begin  // Inactivo
            descestat:='Inactivo';
            SwPreset:=false;
            Swfinventa:=false;
            ContInicDesp:=0;
            if EstatusAnt<>1 then begin
              FinVenta:=0;
            end
            else if importe<>importeant then begin
              importe:=importeant;
              volumen:=volumenant;
              precio:=ajustafloat(dividefloat(importe,volumen),2);
              if (swprepagom)and(not swenllavado) then
                MeteACola('C'+inttoclavenum(MangCmnd,2));
            end;
          end;
        2:descestat:='Autorizado';
        3:descestat:='Pistola Levantada';
        5:begin                // Despachando
            descestat:='Despachando';
            swcargando:=true;
            swfinventa:=true;
            ContTotErr:=0;
            SwVentaValidada:=false;
            (*
            if not swestat then
              ContInact:=0;*)
            if (SwPrepagoM)and(Importe<=0.001) then
              descestat:='Autorizado';
            Inc(ContInicDesp);
          end;
        7,8:descestat:='Fin de Venta';
        9:descestat:='Enllavado';
      end;
      if (Estatus in [1,8])and(swcargando) then begin
        swcargando:=false;
        swdesptot:=true;
        SwCargaTotales:=true;
      end;
      DespliegaManguera(MangCmnd);
      if poscomb in [1..3] then with TPosCarga[PosCarga] do begin
        PosEstatus[poscomb]:=estatus;
        if estatus in [5,7] then
          posactual2:=poscomb;
        posactual:=1;
        for xp:=2 to 3 do
          if posestatus[xp]>posestatus[posactual] then
            posactual:=xp;
      end;
    except
      DespliegaMemo4('Error BCD: '+xresp);
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesoComandoC(xResp:string);
// Receiver  03  07 F6
var ss:string;
    swerr:boolean;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    DameEstatus(ss,SwEnllavado,SwErr);
    if not SwErr then begin
      //ActualizarPrecio:=false;
      //LeerPrecio:=true;
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesoComandoD(xResp:string);
// Receiver  03  07 F6
var ss:string;
    swerr:boolean;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    DameEstatus(ss,SwEnllavado,SwErr);
    if not SwErr then begin
      //ActualizarPrecio:=false;
      //LeerPrecio:=true;
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesoComandoN(xResp:string);
// Receiver  15  03
//           00 00 00 00 00 00
//           07 03 08 00 00 00   litros
//           14 84 10 00 00 00   importe
//           2E
var ss:string;
    totlts:array[1..4] of real;
    xmang,xpos,i:integer;
    diflitrostot:real;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    try
      totallitrosant:=totallitros;
      totallitros:=ExtraeBCD(ss,9,14);
      for i:=1 to 4 do
        totlts[i]:=0;
      xpos:=PosCarga;
      for xmang:=1 to MaxMangueras do with TMangueras[xmang] do
        if PosCarga=xpos then
          if PosComb in [1..4] then
            totlts[PosComb]:=totallitros;
      DMCONS.RegistraTotales_BD4(xpos,Totlts[1],Totlts[2],Totlts[3],Totlts[4]);
      SwCargaTotales:=false;
      if swdesptot then begin
        diflitrostot:=abs(totallitros-totallitrosant);
        if diflitrostot>0.01 then begin // hay venta
          if (abs(diflitrostot-volumen)>0.05)and(ContTotErr<2) then begin
            DMCONS.AgregaLog('Diferencia Volumen Manguera '+inttostr(MangCmnd)+'  litros: '+FormatoNumero(abs(diflitrostot-volumen),5,2));
            //inc(ContTotErr);
            //exit;
          end;
          swdesp:=true;
          (*
          if (importe<=0.01)and((totallitros-totallitrosant)>0.01) then begin
            volumen:=totallitros-totallitrosant;
            precio:=precioant;
            importe:=ajustafloat(volumen*precio,2);
            DMCONS.AgregaLog('>>Corrijo importe Manguera '+inttostr(MangCmnd));
          end;
          *)
          if TMangueras[MangCmnd].SwPrepagoM then begin
            MeteACola('C'+inttoclavenum(MangCmnd,2));
          end;
          if (finventa=1)and(swfinventa) then begin
            estatus:=7;
            HoraFV:=Now;
          end;
          DMCONS.AgregaLog('>>Fin de Venta Manguera '+inttostr(MangCmnd));
          SwVentaValidada:=true;
        end
        else 
          SwFinVenta:=false;
        swdesptot:=false;
      end;
      DespliegaManguera(MangCmnd);
    except
      DespliegaMemo4('Error BCD: '+xresp);
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesoComandoU(xResp:string);
// Receiver  03  07 F6
var ss:string;
    swerr:boolean;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    DameEstatus(ss,SwEnllavado,SwErr);
    if not SwErr then begin
      ActualizarPrecio:=false;
      LeerPrecio:=true;
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesoComandoV(xResp:string);
// Receiver  07  02 00 00 23 11 C3
// PRICE=11.23
var ss:string;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    try
      preciofisico:=ExtraeBCD(ss,5,6);
      LeerPrecio:=false;
      DespliegaManguera(MangCmnd);
    except
      DespliegaMemo4('Error BCD: '+xresp);
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesoComandoS(xResp:string);
// Receiver  03  07 F6
var ss:string;
    swerr:boolean;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    DameEstatus(ss,SwEnllavado,SwErr);
    if not SwErr then begin
      SwPreset:=true;
      SwPresetImp:=true;
      DespliegaManguera(MangCmnd);
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesoComandoL(xResp:string);
// Receiver  03  07 F6
var ss:string;
    swerr:boolean;
begin
  with TMangueras[MangCmnd] do begin
    ss:=StrToHexSep(xResp);
    DameEstatus(ss,SwEnllavado,SwErr);
    if not SwErr then begin
      SwPreset:=true;
      SwPresetImp:=false;
      DespliegaManguera(MangCmnd);
    end;
  end;
end;

procedure TFDISHONGJANG.ProcesaLineaRec(LineaRsp:string);
var xstr,xstr2,xdv,xdv2:string;
begin
  try
    FinLinea:=false;  LineaProc:='';
    SwEsperaCmnd:=false;
    xstr:=StrToHexSep(LineaRsp);
    DMCONS.AgregaLog('R '+xstr);
    xdv:=copy(xstr,length(xstr)-1,2);
    xstr2:=copy(LineaRsp,1,length(LineaRsp)-1);
    xdv2:=StrToHexSep(CalculaBCC(xstr2));
    if xdv<>xdv2 then begin
      Inc(TotalErrores);
      DMCONS.AgregaLog('>> error '+xdv+' '+xdv2);
      if not SwReintentoCmnd then begin
        //SwEsperaCmnd:=true;
        SwReintentoCmnd:=true;
        MeteACola(LinCmnd);
      end;
      exit;
    end;
    case CharCmnd of
      'A':if length(LineaRsp)=12 then
            ProcesoComandoA(LineaRsp);
      'C':if length(LineaRsp)=3 then
            ProcesoComandoC(LineaRsp);
      'D':if length(LineaRsp)=3 then
            ProcesoComandoD(LineaRsp);
      'N':if length(LineaRsp)=21 then
            ProcesoComandoN(LineaRsp);
      'U':if length(LineaRsp)=3 then
            ProcesoComandoU(LineaRsp);
      'V':if length(LineaRsp)=7 then
            ProcesoComandoV(LineaRsp);
      'S':if length(LineaRsp)=3 then
            ProcesoComandoS(LineaRsp);
      'L':if length(LineaRsp)=3 then
            ProcesoComandoL(LineaRsp);
    end;
  except
  end;
end;

procedure TFDISHONGJANG.Ap1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
    xlong:integer;
begin
  ContadorAlarma:=0;
  //Timer1.Enabled:=false;
  try
    for I := 1 to Count do begin
      C:=Ap1.GetChar;
      LineaBuff:=LineaBuff+C;
    end;
    while (not FinLinea)and(Length(LineaBuff)>0) do begin
      c:=LineaBuff[1];
      delete(LineaBuff,1,1);
      LineaProc:=LineaProc+C;
      xlong:=ord(LineaProc[1]);
      if length(LineaProc)=xlong then
        FinLinea:=true;
    end;
    if FinLinea then begin
      ProcesaLineaRec(LineaProc);
      SwEsperaCmnd:=false;
    end;
  finally
    TimeResp:=Now;
    Timer1.Enabled:=true;
  end;
end;

// CONTROLADOR DEL PROCESO
procedure TFDISHONGJANG.Timer1Timer(Sender: TObject);
label uno;
var ii,xmang,ncant:integer;
    swestatus7:boolean;
    xcmnd:string;
begin
  try
    if not StaticText4.Visible then begin
      StaticText4.Caption:='Puerto: '+DMCONS.PuertoServicio;
      StaticText4.Visible:=true;
    end;
    // ENVIO DE COMANDOS
    if not SwEsperaCmnd then begin
      StaticText3.Caption:='Tramas: '+inttostr(TotalTramas)+'   Errores: '+inttostr(TotalErrores)
                           +'  >> '+Formatomoneda(dividefloat(TotalErrores,TotalTramas)*100)+'%';
      SwReintentoCmnd:=false;
      uno:
      Case CmndProc of
        // LEE DISPLAY Y STATUS
        'A':begin
              if MangCiclo<=MaxMangueras then with TMangueras[MangCiclo] do begin
                if ContParo<=0 then begin
                  if (ContBrinca<=0)or(Estatus<>1)or(SwPreset) then begin
                    if Estatus=1 then
                      ContBrinca:=4;
                    StaticText5.Caption:='(A) Mang '+IntToClavenum(MangCiclo,2);
                    ComandoConsola('A'+IntToClavenum(MangCiclo,2));
                    inc(MangCiclo);
                  end
                  else begin
                    dec(ContBrinca);
                    inc(MangCiclo);
                    goto uno;
                  end;
                end
                else begin
                  dec(ContParo);
                  inc(MangCiclo);
                  goto uno;
                end;
              end
              else begin
                MangCiclo:=1;
                SwEstatus7:=false;
                for xmang:=1 to MaxMangueras do
                  if TMangueras[xmang].estatus=7 then
                    SwEstatus7:=true;
                if SwEstatus7 then begin
                  ProcesaComandosExternos;
                end;
                CmndProc:='N';
              end;
            end;
        // LEE TOTALES
        'N':begin
              if MangCiclo<=MaxMangueras then with TMangueras[MangCiclo] do begin
                if (SwCargaTotales)and(estatus>0) then begin
                  StaticText5.Caption:='(N) Mang '+IntToClavenum(MangCiclo,2);
                  ComandoConsola('N'+IntToClavenum(MangCiclo,2));
                  inc(MangCiclo);
                end
                else begin
                  inc(MangCiclo);
                  goto uno;
                end;
              end
              else begin
                MangCiclo:=1;
                CmndProc:='U';
              end;
            end;
        // CAMBIO DE PRECIOS
        'U':begin
              if MangCiclo<=MaxMangueras then with TMangueras[MangCiclo] do begin
                if (ActualizarPrecio)and(estatus>0) then begin
                  if DMCONS.ValidaCifra(DMCONS.TabComb[combustible].precio,2,2)='OK' then begin
                    if DMCONS.TabComb[combustible].precio>=0.01 then begin
                      StaticText5.Caption:='(U) Mang '+IntToClavenum(MangCiclo,2);
                      ii:=Trunc(DMCONS.TabComb[combustible].precio*100+0.5);
                      ComandoConsola('U'+IntToClaveNum(MangCiclo,2)+inttoclavenum(ii,4));
                    end;
                  end;
                  inc(MangCiclo);
                end
                else begin
                  inc(MangCiclo);
                  goto uno;
                end;
              end
              else begin
                MangCiclo:=1;
                CmndProc:='V';
              end;
            end;
        // LEER PRECIOS
        'V':begin
              if MangCiclo<=MaxMangueras then with TMangueras[MangCiclo] do begin
                if (LeerPrecio)and(estatus>0) then begin
                  StaticText5.Caption:='(V) Mang '+IntToClavenum(MangCiclo,2);
                  ComandoConsola('V'+IntToClaveNum(MangCiclo,2));
                  inc(MangCiclo);
                end
                else begin
                  inc(MangCiclo);
                  goto uno;
                end;
              end
              else begin
                MangCiclo:=1;
                CmndProc:='Z';
              end;
            end;
        // REVISA COMANDOS
        'Z':begin
              PublicaEstatusDispensarios;
              ProcesaComandosExternos;
              MangCiclo:=1;
              CmndProc:='W';
            end;
        // REVISA COMANDOS
        'W':begin
              if ApCola>0 then begin
                SacaDeCola(xcmnd);
                ComandoConsola(xcmnd);
              end
              else begin
                MangCiclo:=1;
                CmndProc:='A';
              end;
            end;
      end;
    end
    // MANEJO DE ESPERA
    else begin
      if ((Now-TimeResp)>TmSegundo*0.15)and(LineaProc<>'') then begin
        SwEsperaCmnd:=false;
        ProcesaLineaRec(LineaProc);
      end
      else if ((Now-TimeCmnd)>TmSegundo) then begin
        SwEsperaCmnd:=false;
        with TMangueras[MangCmnd] do begin
          estatus:=0;
          descestat:='Sin Comunicacion';
          contparo:=5;
          DespliegaManguera(MangCmnd);
        end;
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
  end;
end;

procedure TFDISHONGJANG.PublicaEstatusDispensarios;
var xpos,xmang:integer;
    lin,xestado,
    xmodo,ss        :string;
begin
  try
    with DMCONS do begin
      T_ConfIb.Active:=true;
      try
        if not T_ConfIb.IsEmpty then begin
          lin:='';xestado:='';xmodo:='';
          for xpos:=1 to MaxPosiciones do with TPosCarga[xpos] do begin
            xmang:=PosManguera[PosActual2];            
            with TMangueras[xmang] do begin
              xmodo:=xmodo+ModoOpera[1];
              case estatus of
                0:xestado:=xestado+'0'; // Sin Comunicación
                1:xestado:=xestado+'1'; // Inactivo (Idle)
                5,8:xestado:=xestado+'2'; // Cargando (In Use)
                7:if not swcargando then
                    xestado:=xestado+'3' // Fin de Carga (Used)
                  else
                    xestado:=xestado+'2';
                3,4:xestado:=xestado+'5'; // Llamando (Calling)
                2:xestado:=xestado+'9'; // Autorizado
                6:xestado:=xestado+'8'; // Detenido (Stoped)
                else xestado:=xestado+'0';
              end;
              ss:=inttoclavenum(xpos,2)+'/'+inttostr(combustible);
              ss:=ss+'/'+FormatFloat('###0.##',volumen);
              ss:=ss+'/'+FormatFloat('#0.##',precio);
              ss:=ss+'/'+FormatFloat('####0.##',importe);
              lin:=lin+'#'+ss;
            end;
          end;
          if lin='' then
            lin:=xestado+'#'
          else
            lin:=xestado+lin;
          lin:=lin+'&'+xmodo;
          DMCONS.ActualizaDispensarios('D'+lin);
        end;
      finally
        T_ConfIb.Active:=false;
      end;
    end;
  except
  end;
end;

procedure TFDISHONGJANG.ProcesaComandosExternos;
var swsalir:boolean;
    ss,rsp:string;
    xcmnd,xpos,xcomb,xmang,ximp,i,xfolio:integer;
    ximporte,xlitros:real;
begin
  try
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
      // PROCESA COMANDOS EXTERNOS
      SwSalir:=false;
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
          if (xpos in [0..MaxPosiciones]) then begin
            if xpos=0 then begin
              for xpos:=1 to MaxPosiciones do begin
                for i:=1 to MaxMangueras do begin
                  //if (TMangueras[i].PosCarga=xpos) then begin
                    MeteACola('C'+inttoclavenum(i,2));
                    TMangueras[i].SwPrepagoM:=true;
                    TMangueras[i].ModoOpera:='Prepago';
                  //end;
                end;
                ActivaModoPrepago(0);
              end
            end
            else begin
              for i:=1 to MaxMangueras do begin
                if (TMangueras[i].PosCarga=xpos) then begin
                  MeteACola('C'+inttoclavenum(i,2));
                  TMangueras[i].SwPrepagoM:=true;
                  TMangueras[i].ModoOpera:='Prepago';
                end;
              end;
              ActivaModoPrepago(xpos);
            end;
            rsp:='OK';
          end
          else SwAplicaCmnd:=false;
        end
        // CMND: DESACTIVA MODO PREPAGO
        else if ss='DMP' then begin
          xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          if (xpos in [0..MaxPosiciones]) then begin
            if xpos=0 then begin
              for xpos:=1 to MaxPosiciones do begin
                for i:=1 to MaxMangueras do begin
                  //if (TMangueras[i].PosCarga=xpos) then begin
                    MeteACola('D'+inttoclavenum(i,2));
                    TMangueras[i].SwPrepagoM:=false;
                    TMangueras[i].ModoOpera:='Normal';
                  //end;
                end;
              end;
              DesActivaModoPrepago(0);
            end
            else begin
              for i:=1 to MaxMangueras do begin
                if (TMangueras[i].PosCarga=xpos) then begin
                  MeteACola('D'+inttoclavenum(i,2));
                  TMangueras[i].SwPrepagoM:=false;
                  TMangueras[i].ModoOpera:='Normal';
                end;
              end;
              DesActivaModoPrepago(xpos);
            end;
            rsp:='OK';
          end
          else SwAplicaCmnd:=false;
        end
        // ORDENA CARGA DE COMBUSTIBLE (PESOS)
        else if ss='OCC' then begin
          rsp:='OK';
          xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
          xmang:=0;
          for i:=1 to MaxMangueras do begin
            if (TMangueras[i].PosCarga=xpos)and(TMangueras[i].Combustible=xcomb) then
              xmang:=i;
          end;
          if (xmang in [1..MaxMangueras]) then begin
            if (TMangueras[xmang].estatus in [1,3])then begin
              try
                xImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                rsp:=ValidaCifra(xImporte,4,2);
                if rsp='OK' then
                  if (xImporte<1) then
                    rsp:='Importe minimo permitido: $1.00';
              except
                xImporte:=0;
                rsp:='Error en Importe';
              end;
              if rsp='OK' then begin
                TMangueras[xmang].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                TMangueras[xmang].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                TMangueras[xmang].boucher:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,7,' ');
                TMangueras[xmang].impopreset:=ximporte;
                ximp:=Trunc(xImporte*100+0.5);

                if TMangueras[xmang].SwPrepagoM then begin
                  //MeteACola('D'+inttoclavenum(xmang,2));
                end;

                MeteACola('S'+inttoclavenum(xmang,2)+InttoClaveNum(ximp,6));
                SwSalir:=true;
              end;
            end
            else rsp:='Manguera no esta disponible';
          end
          else rsp:='Manguera no existe';
        end
        // ORDENA CARGA DE COMBUSTIBLE (LITROS)
        else if ss='OCL' then begin
          rsp:='OK';
          xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
          xmang:=0;
          for i:=1 to MaxMangueras do begin
            if (TMangueras[i].PosCarga=xpos)and(TMangueras[i].Combustible=xcomb) then
              xmang:=i;
          end;
          if (xmang in [1..MaxMangueras]) then begin
            if (TMangueras[xmang].estatus in [1,3])then begin
              try
                xLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                rsp:=ValidaCifra(xLitros,4,2);
                if rsp='OK' then
                  if (xLitros<0.5) then
                    rsp:='Valor minimo permitido: 0.5 lts';
              except
                xLitros:=0;
                rsp:='Error en Valor';
              end;
              if rsp='OK' then begin
                TMangueras[xmang].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                TMangueras[xmang].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                TMangueras[xmang].boucher:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,7,' ');
                TMangueras[xmang].litrospreset:=xlitros;
                ximp:=Trunc(xLitros*100+0.5);

                if TMangueras[xmang].SwPrepagoM then begin
                  //MeteACola('D'+inttoclavenum(xmang,2));
                end;

                MeteACola('L'+inttoclavenum(xmang,2)+InttoClaveNum(ximp,6));
                SwSalir:=true;
              end;
            end
            else rsp:='Manguera no esta disponible';
          end
          else rsp:='Manguera no existe';
        end
        // ORDENA FIN DE VENTA
        else if ss='FINV' then begin
          xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
          rsp:='OK';
          if (xpos in [1..MaxPosiciones]) then with TPosCarga[xpos] do begin
            xmang:=PosManguera[PosActual];
            if (xmang in [1..MaxMangueras]) then with TMangueras[xmang] do begin
              TipoPago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              if (not SwCargando)and(Estatus in [1,7]) then begin // EOT
                finventa:=0;
                //SwCargaTotales:=true;
                try
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
                    Q_Auxi.SQL.Add('Update DPVGMOVI set tipopago='+inttostr(tipopago));
                    Q_Auxi.SQL.Add('Where Folio='+inttostr(xfolio));
                    Q_Auxi.ExecSQL;
                    tipopago:=0;
                  end;
                except
                  on e:exception do
                  DespliegaMemo4('ERROR al cambiar tipo de pago: '+e.Message);
                end;
                DespliegaManguera(xmang);
              end
              else
                rsp:='Posicion no esta en fin de venta';
            end;
          end
          else rsp:='Posicion de Carga no Existe';
        end
        // CMND: EJECUTA CORTE
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
        // CMND: EJECUTA CORTE PARCIAL
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
        if SwAplicaCmnd then begin
          TabCmnd[xcmnd].SwResp:=true;
          TabCmnd[xcmnd].Respuesta:=rsp;
          DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
        end;
        if SwCerrar then
          Close;
        if SwSalir then exit;
      end;
    end;
  except
  end;
end;

procedure TFDISHONGJANG.ListBox1Click(Sender: TObject);
var xm:integer;
begin
  LimpiaConsola;
  For xm:=1 to MaxMangueras do
    DespliegaManguera(xm);
end;

procedure TFDISHONGJANG.Restaurar1Click(Sender: TObject);
begin
  Visible:=true;
end;

procedure TFDISHONGJANG.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFDISHONGJANG.FormCreate(Sender: TObject);
begin
  SwCerrar:=false;
  CmndProc:='A';
  MangCiclo:=1;
  SwInicio:=true;
  SwDespEmular:=false;
  ContadorAlarma:=0;
  pFIBDatabase1.DatabaseName := ruta_db_from_alias(ParamStr(1));
  pFIBDatabase1.Open;
  SIBfibEventAlerter1.AutoRegister := True;
  TotalTramas:=0;
  TotalErrores:=0;
end;

procedure TFDISHONGJANG.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISHONGJANG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ap1.Open:=false;
  pFIBDatabase1.Close;
  Application.Terminate;
end;



function TFDISHONGJANG.ConvierteBCD(xvalor:real;xlong:integer):string;
var xstr,xres,ss,xaux:string;
    i,nc,nn,num:integer;
begin
  num:=trunc(xvalor*100+0.5);
  xstr:=inttoclavenum(num,xlong);
  nc:=xlong div 2;
  xres:='';
  for i:=1 to nc do begin
    ss:=copy(xstr,xlong-2*i+1,2);
    nn:=StrToIntDef(ss[1],0)*16+StrToIntDef(ss[2],0);
    xres:=xres+char(nn);
  end;
  xaux:=StrToHexSep(xres);
  result:=xres;
end;

function TFDISHONGJANG.ExtraeBCD(xstr:string;xini,xfin:integer):real;
var i:integer;
    ss:string;
begin
  i:=xfin;
  ss:='';
  while i>=xini do begin
    ss:=ss+ExtraeElemStrSep(xstr,i,' ');
    dec(i);
  end;
  result:=strtoint(ss)/100;
end;


procedure TFDISHONGJANG.Timer3Timer(Sender: TObject);
var linea,ss:string;
     ok:boolean;
begin
  if LineaEmular='' then
    exit;
  try
    if LineaEmular<>'' then begin
      LineaEmular:='';
      Linea:=LinCmnd;
      case CharCmnd of
        'A':begin
              // Receiver  0C  03 64 17 00 00 00 00 07 13 00 5C
              // IMPORTE=0013.07   LITROS=0017.64
              with TMangueras[MangCmnd] do begin
                volumen:=17.64;
                importe:=13.07;
                if (not SwDespEmular)or(MangCmnd<>1) then
                  ss:=char(12)+char(3)+ConvierteBCD(importe,6)+ConvierteBCD(0,6)+ConvierteBCD(volumen,6)
                else begin
                  ss:=char(12)+char(74)+ConvierteBCD(importe,6)+ConvierteBCD(0,6)+ConvierteBCD(volumen,6);
                  DameEstatus('00 4A',SwEnllavado,OK);
                end;
                ss:=ss+CalculaBCC(ss);
                SwEsperaCmnd:=false;
                ProcesaLineaRec(ss);
              end;
            end;
        'N':begin
              // Receiver  15  03 00 00 00 00 00 00 07 03 08 00 00 00 14 84 10 00 00 00 2E
              // LITROS=803.07
              with TMangueras[MangCmnd] do begin
                totallitros:=803.07;
                ss:=char(15)+char(3)+ConvierteBCD(0,12)
                    +ConvierteBCD(totallitros,12)+ConvierteBCD(0,12);
                ss:=ss+CalculaBCC(ss);
                SwEsperaCmnd:=false;
                ProcesaLineaRec(ss);
              end;
            end;
        'U':begin
              // Receiver  03  07 F6
              with TMangueras[MangCmnd] do begin
                ss:=char(3)+char(7);
                ss:=ss+CalculaBCC(ss);
                SwEsperaCmnd:=false;
                ProcesaLineaRec(ss);
              end;
            end;
        'V':begin
              // Receiver  07  02 00 00 23 11 C3
              // PRICE=11.23
              with TMangueras[MangCmnd] do begin
                preciofisico:=11.23;
                ss:=char(7)+char(2)+char(0)+char(0)+ConvierteBCD(preciofisico,4);
                ss:=ss+CalculaBCC(ss);
                SwEsperaCmnd:=false;
                ProcesaLineaRec(ss);
              end;
            end;
        'S':begin
              // Receiver  03  07 F6
              with TMangueras[MangCmnd] do begin
                ss:=char(3)+char(7);
                ss:=ss+CalculaBCC(ss);
                SwEsperaCmnd:=false;
                ProcesaLineaRec(ss);
              end;
            end;
        'L':begin
              // Receiver  03  07 F6
              with TMangueras[MangCmnd] do begin
                ss:=char(3)+char(7);
                ss:=ss+CalculaBCC(ss);
                SwEsperaCmnd:=false;
                ProcesaLineaRec(ss);
              end;
            end;
      end;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;


procedure TFDISHONGJANG.registro(valor:integer;variable:string);
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

procedure TFDISHONGJANG.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISHONGJANG.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(6);
  if (xpos)mod(6)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISHONGJANG.lee_registro;
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

procedure TFDISHONGJANG.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISHONGJANG.ListBoxPC11DblClick(Sender: TObject);
begin
  with DMCONS do if swemular then begin
    if EmularEstatus[2]='0' then
      EmularEstatus[2]:='1'
    else
      EmularEstatus[2]:='0';
  end;
end;

procedure TFDISHONGJANG.Timer2Timer(Sender: TObject);
var i:integer;
begin
  try
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
        for i:=1 to MaxMangueras do
          TMangueras[i].ActualizarPrecio:=true;
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


procedure TFDISHONGJANG.E1Click(Sender: TObject);
begin
  if DMCONS.SwEmular then
    SwDespEmular:=true;
end;

procedure TFDISHONGJANG.Colgar1Click(Sender: TObject);
begin
  if DMCONS.SwEmular then
    SwDespEmular:=false;
end;

procedure TFDISHONGJANG.Button2Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISHONGJANG.Button3Click(Sender: TObject);
var
  ruta:PAnsiChar;
begin
  ruta:=PChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)));
  ShellExecute(Handle, 'open','explorer.exe',ruta, nil, SW_SHOWNORMAL);
end;

end.
