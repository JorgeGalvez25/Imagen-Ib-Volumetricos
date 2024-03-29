unit UDisWayne;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  dxGDIPlusClasses;

type
  TFDISWAYNE = class(TForm)
    Ap1: TApdComPort;
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
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    TL_TcmbAGRUPAR_CON: TIntegerField;
    TL_TcmbDIGITOAJUSTEPRECIO: TIntegerField;
    TL_TcmbTAG: TStringField;
    TL_TcmbTAG2: TStringField;
    TL_TcmbTAG3: TStringField;
    StaticText8: TStaticText;
    Button4: TButton;
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
    procedure ListBoxPC1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  public
    { Public declarations }
    function StringCom(ss:string):string;
    function CalculaBCC(ss:string):char;
    procedure ComandoConsola(ss:string);
    procedure ComandoConsolaBuff(ss:string);
    function XorChar(c1,c2:char):char;
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
    procedure MapeaPosicion(xpos:integer);
  end;

type
     tiposcarga = record
       estatus  :integer;
       descestat:string[20];
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
       SwCargaTotales:array[1..4] of boolean;
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

     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=20;
      MaxEspera31=10;
      MaxEspera3=20;


var
  FDISWAYNE: TFDISWAYNE;
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

procedure TFDISWAYNE.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=60 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISWAYNE.DespliegaPrecios;
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


procedure TFDISWAYNE.IniciaBaseDeDatos;
var i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
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
        Ap1.Open:=true;
      end;
      Q_BombIb.Active:=false;
      Q_BombIb.Active:=true;

      if Q_BombIb.IsEmpty then
        raise Exception.Create('Estaci�n no existe, o no tiene posiciones de carga configurados');

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
      CargaPreciosFH(Now,false); // no afecta precio f�sico
      DBGrid3.Refresh;
      DespliegaPrecios;
    finally
      Q_CombIb.Active:=false;
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISWAYNE.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
begin
  with DMCONS do begin
    ListView1.Items.Clear;
    MaxPosCarga:=0;
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
        SwCargaTotales[j]:=true;
        TDiga[j]:=0;
        TDigPreset[j]:=-1;
      end;
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


procedure TFDISWAYNE.FormShow(Sender: TObject);
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
      if (DMCONS.WayneFusion='No')or(DMCONS.MapeoFusion='Si') then begin
        ComandoConsolaBuff('N'+inttoclavenum(MaxPosCarga,2)+DMCONS.ModoPrecioWayne);
        esperamiliseg(500);
        ComandoConsolaBuff('l1');
      end;
      Timer1.Enabled:=true;
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

function TFDISWAYNE.StringCom(ss:string):string;
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

function TFDISWAYNE.XorChar(c1,c2:char):char;
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

function TFDISWAYNE.CalculaBCC(ss:string):char;
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

procedure TFDISWAYNE.LimpiaConsola;
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

procedure TFDISWAYNE.DespliegaPosCarga(xpos:integer);
var i,ii,xp,rango,posi,posf,xcomb,xc:integer;
    xnombre,xcarga:string;
    xprecio,xprecio2,xdifprec,xdiflts:real;
    swdif:boolean;
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
              SwCargaTotales[PosDispActual]:=true;
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
              T_MoviIbVolumen.AsFloat:=AjustaFloat(Volumen,3);
              T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
              xprecio:=TabComb[xcomb].Precio;
              xprecio2:=dividefloat(importe,volumen);
              xdifprec:=abs(xprecio-xprecio2);
              if xdifprec<0.02 then                 //act 110913
                T_MoviIbPrecio.AsFloat:=xprecio
              else
                T_MoviIbPrecio.AsFloat:=xprecio2;
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
            despliegamemo4('Error al guardar transaccion pos '+inttostr(1));
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

procedure TFDISWAYNE.ProcesaLinea;
label uno;
var lin,ss,rsp,descrsp,xestado,xmodo,rsp2:string;
    simp,spre,sval:string[20];
    XMANG,XCTE,XVEHI,
    ndig,i,xpos,xcomb,
    xpos2,npos,xpr,xpda,xerror  :integer;
    PasoAnt:integer;
    xLista:TStrings;
    SwOk:boolean;
    xprec,
    ximpo,
    xvol:real;
    saux:string;
    contstop,contact:integer;
    xvalor:real;
begin
  try
    saux:=LineaTimer;
    if LineaTimer='' then
      exit;
    SwEsperaRsp:=false;
    //ContEsperaRsp:=0;
    StaticText6.Caption:='';
    PasoAnt:=NumPaso;
    if length(LineaTimer)>3 then begin
      lin:=copy(lineaTimer,2,length(lineatimer)-3);
    end
    else
      lin:=LineaTimer;
    LineaTimer:='';
    if lin='' then
      exit;
    if SwComandoN then begin
      if ContEsperaN>0 then
        dec(ContEsperaN)
      else begin
        SwComandoN:=false;
        if (DMCONS.WayneFusion='No')or(DMCONS.MapeoFusion='Si') then 
          ComandoConsolaBuff('N'+inttoclavenum(MaxPosCarga,2)+DMCONS.ModoPrecioWayne);
      end;
    end;
    case lin[1] of
     'l':begin
           if lin[2]='1' then
             Timer1.Enabled:=true
           else raise Exception.Create('Error en comunicacion con CONSOLA');
         end;
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
                   ComandoConsola('R'+IntToClaveNum(xpos,2)+'0');
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
                         DMCONS.RegistraBitacora3(1,'Desconexi�n de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
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
                         DMCONS.RegistraBitacora3(1,'Reconexi�n de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                     end;
                   end;
                 2:begin
                     descestat:='Despachando';
                     if SwArosMag then with TPosCarga[xpos] do begin
                       if abs(importe-importe_aros)>0.10 then begin
                         if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                           Despliegamemo4('STOP MANGUERA >> '+Formatdatetime('HH:mm:ss.zzz',now));
                           ss:='E'+IntToClaveNum(xpos,2); // STOP
                           ComandoConsola(ss);
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
                           ss:='G'+IntToClaveNum(xpos,2); // START
                           ComandoConsola(ss);
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
                       ComandoConsolaBuff('G'+inttoclavenum(xpos,2));
                     end;
                   end;
                 9:begin
                     descestat:='Autorizado';
                     swcargando:=false;
                     if SwArosMag then begin
                       if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                         Despliegamemo4('STOP MANGUERA >> '+Formatdatetime('HH:mm:ss.zzz',now));
                         ss:='E'+IntToClaveNum(xpos,2); // STOP
                         ComandoConsola(ss);
                         if swemular then
                           EmularEstatus[xpos]:='1';
                       end;
                     end
                     else if estatusant=2 then begin
                       ss:='E'+IntToClaveNum(xpos,2); // STOP
                       ComandoConsola(ss);
                     end;
                   end;
               end;
               if estatus in [1,2,3,5,9] then
                 inc(contact)
               else if estatus=8 then
                 inc(contstop);
             end;
           end;
           if (contstop>0)and(contact=0) then begin
             if (DMCONS.WayneFusion='No')or(DMCONS.MapeoFusion='Si') then
               ComandoConsolaBuff('N'+inttoclavenum(MaxPosCarga,2)+DMCONS.ModoPrecioWayne);
           end;
           // ENLLAVA O DESENLLAVA DISPENSARIOS
           for xpos:=1 to length(ss) do if xpos in [1..MaxPosCarga] then begin
             with TPosCarga[xpos] do if Estatus=1 then begin
               PosProceso:=xpos;
               if RefrescaEnllavados then begin
                 RefrescaEnllavados:=false;
                 SwReinicio:=true;  // Nuevo
                 if (DMCONS.WayneFusion='No')or(DMCONS.MapeoFusion='Si') then begin
                   ss:='h'+IntToClaveNum(xpos,2)+'00';
                   ComandoConsolaBuff(ss);
                   esperamiliseg(200);
                   ss:='k'+IntToClaveNum(xpos,2)+'00';
                   ComandoConsolaBuff(ss);
                   esperamiliseg(200);
                   exit;
                 end;
               end;
             end;
           end;
           // Checa las posiciones que estan solicitando autorizacion
           for xpos:=1 to length(ss) do if xpos in [1..MaxPosCarga] then begin
             with TPosCarga[xpos] do begin
               case Estatus of
                 5:if (ModoOpera='Normal')and(not SwDesHabilitado)and(not swcargando) then begin
                     PosProceso:=xpos;
                     TPosCarga[xpos].FinVenta:=0;
                     if DMCONS.LcSerie=78 then begin
                       ss:='S'+IntToClaveNum(xpos,2)+inttostr(TPrec[1])+'0';
                       ComandoConsola(ss);
                     end
                     else begin
                       SnPosCarga:=xpos;
                       SnImporte:=99999;
                       SnLitros:=0;
                       EnviaPreset(0,rsp);
                     end;
                     if DMCONS.swemular then
                       EmularEstatus[xpos]:='2';
                   end;
               end;
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
     'A':begin // pide estatus de una bomba
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if xpos in [1..MaxPosCarga] then begin
             ContEsperaPaso2:=0;
             xerror:=0;
             with TPosCarga[xpos] do begin
               try
                 if estatus<>9 then begin
                   xerror:=1;
                   xpda:=StrToIntDef(lin[4],0);
                   if xpda>0 then
                     PosDispActual:=xpda
                   else if PosDispActual=0 then
                     PosDispActual:=1;
                   xerror:=2;
                   volumen:=StrToFloat(copy(lin,6,8))/1000;
                   simp:=copy(lin,14+Tdiga[1],8);
                   spre:=copy(lin,22+Tdiga[1],5-Tdiga[1]);
                   xerror:=3;
                   while length(spre)<5 do
                     spre:=spre+'0';
                   importe:=StrToFloat(simp)/1000;
                   precio:=StrToFloat(spre)/1000;
                   if (2*volumen*precio<importe) then // ajuste por error en digitos
                     importe:=importe/10;
                   xerror:=4;
                   if DMCONS.AjusteWayne='Si' then begin
                     importe:=AjustaFloat(volumen*precio,2);
                   end
                   else if DMCONS.AjusteWayne='No' then begin
                     if DMCONS.AjusteWayne2='Si' then begin
                       ximpo:=Trunc(importe+0.005);
                       if abs(importe-ximpo)<=0.025 then
                         importe:=ximpo;
                     end;
                     if (importe<(volumen*precio*0.9)) then
                       importe:=trunc(volumen*precio*100)/100
                     else begin
                       xvol:=ajustafloat(dividefloat(importe,precio),3);
                       if abs(volumen-xvol)<0.02 then
                         volumen:=xvol;
                     end;
                   end;
                   xerror:=5;
                   if (Estatus=3)or(Estatus=1) then begin
                     if (swcargando) then begin // FIN DE CARGA
                       swcargando:=false;
                       swdesp:=true;
                     end;
                   end;
                   if (TPosCarga[xpos].finventa=0) then begin
                     if (Estatus=3) then begin // FIN DE CARGA
                       ComandoConsolaBuff('R'+inttoclavenum(xpos,2)+'0');
                       if sw3virtual then begin
                         sw3virtual:=false;
                         finventa:=0;
                         estatus:=1;
                         estatusant:=1;
                       end;
                     end;
                   end;
                   xerror:=6;
                 end;
                 DespliegaPosCarga(xpos);
               except
                 if estatus<>2 then
                   SwCargando:=false;
               end;
             end;
           end;
         end;
     'C':begin // TOTALES
           ContEsperaPaso5:=0;
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if xpos in [1..MaxPosCarga] then begin
             i:=StrToIntDef(copy(lin,4,1),0);
             with TPosCarga[xpos] do if (i>0)and(i<=nocomb) then begin
               try
                 for xpr:=1 to nocomb do
                   if TPos[xpr]=i then begin
                     TotalLitros[xpr]:=StrToFloat(copy(lin,6,9))/100;
                     if DMCONS.WayneFusion='Si' then
                       if TDigvol[xpr]=1 then
                         TotalLitros[xpr]:=StrToFloat(copy(lin,6,9))/10;
                     SwCargaTotales[i]:=false;
                     DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                     DespliegaPosCarga(xpos);
                   end;
               except
               end;
             end;
           end;
         end;
     'a':with DMCONS do begin // CAMBIO DE PRECIOS
           ContEsperaPaso6:=0;
           if (length(lin)<6)and(PrecioCambioProc>0) then begin // cambio precio
             if lin[2]='1' then with TabComb[PrecioCambioProc] do begin // ok
               AplicaPrecio:=false;
               Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
               Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=PrecioCambioProc;
               Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
               Q_AplicaPrecioF.ExecSQL;
               SwCambioPrecio:=true;
             end
             else with TabComb[PrecioCambioProc] do begin // error
               AplicaPrecio:=false;
               Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
               Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=PrecioCambioProc;
               Q_AplicaPrecioF.ParamByName('pError').AsString:='Si';
               Q_AplicaPrecioF.ExecSQL;
             end;
             TabComb[PrecioCambioProc].SwLeePrecioFisico:=true;
             PrecioCambioProc:=0;
           end
           else if (length(FiltraStrnum(lin))=5)and(PrecioFisicoProc>0) then with DMCONS do begin // lectura precios
             T_Tcmb.Active:=true;
             try
               if T_Tcmb.Locate('Clave',PrecioFisicoProc,[]) then begin
                 T_Tcmb.Edit;
                 if (T_TcmbDigitoAjustePrecio.AsInteger=1)and(DMCONS.WayneFusion='No') then
                   xprec:=StrToIntDef(FiltraStrnum(lin),0)/100
                 else
                   xprec:=StrToIntDef(FiltraStrnum(lin),0)/1000;
                 if abs(xprec)>0.01 then begin
                   T_TcmbPrecioFisico.AsFloat:=xprec;
                 end
                 else begin
                   i:=T_TcmbClave.AsInteger;
                   T_TcmbPrecioFisico.AsFloat:=TabComb[i].PrecioNuevo;   //act 110913
                 end;
                 T_Tcmb.Post;
               end;
             finally
               T_Tcmb.Active:=false;
               TabComb[PrecioFisicoProc].SwLeePrecioFisico:=false;
               PrecioFisicoProc:=0;
               Q_CombIb.Active:=false;
               Q_CombIb.Active:=true;
               DespliegaPrecios;
             end;
           end;
         end;
     's':with DMCONS do begin
           xpos2:=StrToIntDef(copy(lin,2,2),0);
           if xpos2 in [1..MaxPosCarga] then begin
             if (lin[4]='0') then begin
               if (DMCONS.WayneFusion='No')or(DMCONS.MapeoFusion='Si') then begin
                 MapeaPosicion(xpos2);
                 esperamiliseg(200);
                 ComandoConsola('R'+IntToClaveNum(xpos2,2)+'0');
                 esperamiliseg(200);
                 ComandoConsola('n'+IntToClaveNum(xpos2,2));
                 esperamiliseg(200);
               end;
             end;
           end;
           StEsperaPaso3:=0;
         end;
    end;
    if (ListaCmnd.Count>0)and(not SwEsperaRsp) then begin
      ss:=ListaCmnd[0];
      ListaCmnd.Delete(0);
      ComandoConsola(ss);
      exit;
    end;
    if NumPaso=2 then begin  // Checa carga de lecturas
      if PosicionCargaActual<MaxPosCarga then begin
        repeat
          Inc(PosicionCargaActual);
          with TPosCarga[PosicionCargaActual] do if NoComb>0 then begin
            if (estatus<>9)and((estatusant<>estatus)or(estatus in [2,3])or(swcargando)or(SwCargaLectura)) then begin
              SwCargaLectura:=false;
              ComandoConsolaBuff('A'+IntToClaveNum(PosicionCargaActual,2)+'00');
              exit;
            end
            else
              DespliegaPosCarga(PosicionCargaActual);
          end;
        until (PosicionCargaActual>=MaxPosCarga);
        for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do if SwMapea then begin
          SwMapea:=false;
          ComandoConsola(ValorMapeo);
          EsperaMiliSeg(1000);
          exit;
        end;
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
                0:xestado:=xestado+'0'; // Sin Comunicaci�n
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
      (*
      if PasoAnt=3 then begin
        PosPaso4:=1;
      end;
      *)
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
              if SwCargaTotales[PosicionDispenActual] then begin
                ContEsperaPaso5:=0;
                ComandoConsolaBuff('C'+IntToClaveNum(PosicionCargaActual2,2)+IntToStr(PosicionDispenActual)+'0');
                exit;
              end
              else
                DespliegaPosCarga(PosicionCargaActual2);
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
        repeat
          inc(PrecioCombActual);
          with TabComb[PrecioCombActual] do begin
            if (SwLeePrecioFisico)and(ProductoPrecio<>'')and(PrecioFisicoProc=0) then begin // Lee precios
              if TPosCarga[1].TPrec[1] in [0,2] then  // Credito
                ComandoConsolaBuff('a'+ProductoPrecio+'0'+'0'+'a')
              else                              // Contado
                ComandoConsolaBuff('a'+ProductoPrecio+'0'+'1'+'a');
              PrecioFisicoProc:=PrecioCombActual;
              ContPrecioFisico:=0;
              exit;
            end
            else if (AplicaPrecio)and(PrecioCambioProc=0) then begin // Cambia Precios
              if ProductoPrecio<>'' then begin

                if DMCONS.WayneFusion='No' then begin
                  if TPosCarga[1].TPrec[1] in [0,2] then  // Credito
                    ComandoConsolaBuff('a'+ProductoPrecio+DMCONS.TierLavelWayne+'0'+'0'+IntToClaveNum(Trunc(Precio*100+0.5),4))
                  else                              // Contado
                    ComandoConsolaBuff('a'+ProductoPrecio+DMCONS.TierLavelWayne+'1'+'0'+IntToClaveNum(Trunc(Precio*100+0.5),4));
                end

                else begin
                  if (DMCONS.WayneFusionNivelPrecio[1]='1')or(DMCONS.WayneFusionNivelPrecio[2]='1') then begin
                    ComandoConsolaBuff('a'+ProductoPrecio+'0'+'0'+'0'+IntToClaveNum(Trunc(Precio*100+0.5),4)+'0');
                    esperamiliseg(200);
                  end;
                  if (DMCONS.WayneFusionNivelPrecio[1]='2')or(DMCONS.WayneFusionNivelPrecio[2]='2') then begin
                    ComandoConsolaBuff('a'+ProductoPrecio+'0'+'1'+'0'+IntToClaveNum(Trunc(Precio*100+0.5),4)+'0');
                    esperamiliseg(200);
                  end;
                end;

                PrecioCambioProc:=PrecioCombActual;
                ContPrecioCambio:=0;
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
          SwPrecioFisico:=true;
        end;
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
            ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
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
            ComandoConsolaBuff('G'+IntToClaveNum(xpos,2));
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

procedure TFDISWAYNE.Ap1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C,xbcc:Char;
    xlin:string;
begin
  try
    if ContadorAlarma>=10 then begin
      SwComandoN:=true;
      ContEsperaN:=5;
    end;
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
        if (C=idACK)or(c=idNAK) then begin
          FinLinea:=true;
        end;
      end;
      if FinLinea then begin
        LineaTimer:=Linea;
        Linea:='';
        if length(lineatimer)>3 then begin // valida BCC
          xlin:=copy(lineatimer,2,length(lineatimer)-3);
          xbcc:=lineatimer[length(lineatimer)];
          if xbcc<>CalculaBCC(xlin+#3) then begin
            //inc(errbcc);
            LineaTimer:=idNak;
          end;
        end;
        DMCONS.AgregaLog('R '+LineaTimer);
        SwBcc:=false;
        FinLinea:=false;
        ProcesaLinea;
        LineaTimer:='';
        //SwEspera:=false;
      end;
    finally
      Timer1.Enabled:=true;
    end;
  except
  end;
end;

procedure TFDISWAYNE.ComandoConsolaBuff(ss:string);
begin
  ComandoConsola(ss);
end;

procedure TFDISWAYNE.ComandoConsola(ss:string);
var s1:string;
    cc:char;
begin
  try
    //LinCmnd:=ss;
    //CharCmnd:=ss[1];
    SwEsperaRsp:=true;
    //ContEsperaRsp:=0;
    if DMCONS.SwEmular then begin
      DMCONS.AgregaLog('E '+idSTX+ss+idETX+' ');
      LineaEmular:=ss;
      exit;
    end;
    inc(ContadorAlarma);
    Timer1.Enabled:=false;
    try
      LineaBuff:='';
      cc:=CalculaBCC(ss+#3);
      s1:=#2+ss+#3+CC;
      if Ap1.OutBuffFree >= Length(S1) then begin
        DMCONS.AgregaLog('E '+s1);
        if Ap1.Open then
          Ap1.PutString(S1);
      end;
      (*
      else begin
        inc(ContBuffLleno);
      end;*)
    finally
      Timer1.Enabled:=true;
    end;
  except
  end;
end;


procedure TFDISWAYNE.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISWAYNE.Restaurar1Click(Sender: TObject);
begin
  FDISWAYNE.Visible:=true;
end;

procedure TFDISWAYNE.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFDISWAYNE.FormCreate(Sender: TObject);
begin
  SwCerrar:=false;
  SwInicio:=true;
  SwComandoN:=false;
  ContadorAlarma:=0;
  PrecioFisicoProc:=0;
  PrecioCambioProc:=0;
  ListaCmnd:=TStringList.Create;
end;

procedure TFDISWAYNE.BitBtn3Click(Sender: TObject);
begin
  FDISWAYNE.Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISWAYNE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ap1.Open:=false;
  Application.Terminate;
end;

procedure TFDISWAYNE.Timer1Timer(Sender: TObject);
var ss,rsp,str1:string;
    i,xpos,xp,xcomb,xfolio,tag3,
    xcmnd:integer;
    xlimite,
    xprecio:real;
    swok,swerr:boolean;
begin
  try
    if not StaticText8.Visible then begin
      StaticText8.Caption:='Puerto: '+DMCONS.PuertoServicio;
      StaticText8.Visible:=true;
    end;
    with DMCONS do begin
      if PrecioFisicoProc>0 then begin
        inc(ContPrecioFisico);
        if ContPrecioFisico>20 then
          PrecioFisicoProc:=0;
      end;
      if PrecioCambioProc>0 then begin
        inc(ContPrecioCambio);
        if ContPrecioCambio>20 then
          PrecioCambioProc:=0;
      end;
      inc(ContadorTot);
      if (ContadorTot>=100) then begin
        ContadorTot:=0;
        inc(ContadorTotPos);
        if ContadorTotPos in [1..MaxPosCarga] then if TPosCarga[ContadorTotPos].estatus=1 then begin
          TPosCarga[ContadorTotPos].SwCargaTotales[1]:=true;
          TPosCarga[ContadorTotPos].SwCargaTotales[2]:=true;
          TPosCarga[ContadorTotPos].SwCargaTotales[3]:=true;
          TPosCarga[ContadorTotPos].SwCargaTotales[4]:=true;
        end
        else ContadorTotPos:=0;
      end;
    end;
    if ContadorAlarma>=10 then begin
      if not StaticText17.Visible then
        Beep;
      StaticText17.Visible:=not StaticText17.Visible;
      if ContadorAlarma=10 then
        DMCONS.RegistraBitacora3(1,'Desconexion de Dispositivo','Error Comunicaci�n Dispensarios','U');
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
                  rsp:='Importe fuera de rango v�lido: de 1.00 a 9999.00';
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
                    rsp:='Aro magn�tico se encuentra desconectado';
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
                  rsp:='Litros fuera de rango v�lido: de 0.10 a 999.00';
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
                    rsp:='Aro magn�tico se encuentra desconectado';
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
                ComandoConsola('R'+IntToClaveNum(xpos,2)+'0');
                if TPosCarga[xpos].sw3virtual then begin
                  TPosCarga[xpos].sw3virtual:=false;
                  TPosCarga[xpos].estatus:=1;
                  TPosCarga[xpos].estatusant:=1;
                  TPosCarga[xpos].finventa:=0;
                end;
                for i:=1 to 4 do
                  TPosCarga[xpos].SwCargaTotales[i]:=true;
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
            ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
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
            ComandoConsola('G'+IntToClaveNum(xpos,2));
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
        if SwCerrar then
          Close;
      end;
    end;

    // Inicia ciclo ------------------
    if NumPaso>1 then begin
      if NumPaso=2 then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera2';
        inc(ContEsperaPaso2);     // espera hasta 5 ciclos
        if ContEsperaPaso2>MaxEspera2 then begin
          ContEsperaPaso2:=0;
          LineaTimer:='.A00..';  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
          exit;
        end;
      end;
      if NumPaso=5 then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera5';
        inc(ContEsperaPaso5);     // espera hasta 5 ciclos
        if ContEsperaPaso5>5 then begin
          ContEsperaPaso5:=0;
          LineaTimer:='.C00..';  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
          exit;
        end;
      end;
      if NumPaso=6 then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera6';
        inc(ContEsperaPaso6);     // espera hasta 5 ciclos
        if ContEsperaPaso6>3 then begin
          ContEsperaPaso6:=0;
          LineaTimer:='.a00..';  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
          exit;
        end;
      end;
      if (NumPaso=3)and(StEsperaPaso3>0) then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera3';
        inc(ContEsperaPaso3);
        if (ContEsperaPaso3>MaxEspera31)and(StEsperaPaso3=1) then begin
          LineaTimer:='.h1..';
          ProcesaLinea;       // activa la respuesta automatica
          exit;
        end
        else if ContEsperaPaso3>(MaxEspera3+10) then begin
          ContEsperaPaso3:=0;
          StEsperaPaso3:=2;
          (*
          if TPosCarga[PosProceso].SwTarjeta then
            LineaTimer:='.s'+IntToClaveNum(PosProceso,2)+'0..'  // de lo contrario provoca un NAK para que continue
          else
          *)
          LineaTimer:='.s'+IntToClaveNum(PosProceso,2)+'1..';
          ProcesaLinea;       // el proceso con la siguiente solicitud
          exit;
        end;
      end
      else if (NumPaso=3) then begin
        inc(ContEsperaPaso3);
        if (ContEsperaPaso3>MaxEspera31) then begin
          if (DMCONS.StLevanta='Si') then begin
            try
              esperamiliseg(1000);
              Application.Terminate;
            finally
            end;
          end
          else begin
            NumPaso:=1;
            ss:='B00';
            ComandoConsolaBuff(ss);
          end;
        end;
      end;
      exit;
    end;

    // Espera en el paso 0 hasta que reciba respuesta
    if (NumPaso=1)and(not swreinicio) then begin
      StaticText6.Caption:='Espera1';
      inc(ContEspera);
      if ContEspera<10 then
        exit;
    end;
    if not DMCONS.swemular then begin
      if Ap1.OutBuffUsed>0 then begin
        NumPaso:=0;
        exit;
      end;
    end;

    NumPaso:=1;
    StaticText5.Caption:=IntToStr(NumPaso);
    ContEspera:=0;
    //SwEspera:=true;
    StaticText6.Caption:='Esperando..';
    if not SwReinicio then begin
      ss:='B00';
      ComandoConsolaBuff(ss);
    end
    else begin
      SwReinicio:=false;
      LineaTimer:=UltimaLineaTimer;
      ProcesaLinea;
    end;
    if NotificationIcon1.Tag=0 then begin
      if ErrorInic then begin
        EsperaMiliSeg(3000);
        Application.Terminate;
      end;
      NotificationIcon1.Tag:=1;
      FDISMENU.Visible:=false;
      FDISWAYNE.Visible:=false;
      NotificationIcon1.Show;
    end;
  except
  end;
end;


procedure TFDISWAYNE.EnviaPreset(xcomb:integer;var rsp:string);
var ss,sval:string;
    i,ndig,xpos,nc:integer;
    swlitros:boolean;
begin
  if DMCONS.SoportaSeleccionProducto<>'Si' then
    xcomb:=0;
  swlitros:=SnLitros>0.01;
  if not (SnPosCarga in [1..MaxPosCarga]) then
    exit;
  rsp:='OK';
  xpos:=SnPosCarga;
  if not (TPosCarga[xpos].estatus in [1,5,9]) then begin
    rsp:='Posici�n no Disponible';
    exit;
  end;
  if TPosCarga[xpos].SwDesHabilitado then begin
    rsp:='Posici�n Deshabilitada';
    exit;
  end;
  if TPosCarga[xpos].estatus=9 then begin
    ComandoConsola('E'+IntToClaveNum(xpos,2));
    esperamiliseg(300);
  end;
  ss:='s'+IntToClaveNum(SnPosCarga,2);
  if not swlitros then begin // pesos
    TPosCarga[xpos].importe_aros:=SnImporte;
    ss:=ss+'0';
    ss:=ss+IntToStr(TPosCarga[SnPosCarga].TPrec[1]);   // 1-contado 0,2-credito
    if DMCONS.DecimalesPresetWayne=0 then
      sval:=FiltraStrNum(FormatFloat('00000000',SnImporte))
    else if DMCONS.DecimalesPresetWayne=1 then
      sval:=FiltraStrNum(FormatFloat('0000000.0',SnImporte))
    else if DMCONS.DecimalesPresetWayne=2 then
      sval:=FiltraStrNum(FormatFloat('000000.00',SnImporte))
    else if DMCONS.DecimalesPresetWayne=3 then
      sval:=FiltraStrNum(FormatFloat('00000.000',SnImporte))
    else begin
      sval:=FiltraStrNum(FormatFloat('000000.00',SnImporte));
      if TPosCarga[SnPosCarga].tdigpreset[1]>=0 then
        ndig:=TPosCarga[SnPosCarga].tdigpreset[1]
      else
        ndig:=TPosCarga[SnPosCarga].tdiga[1];
      if ndig>0 then begin
        sval:=IntToClaveNum(0,ndig)+sval;
        sval:=copy(sval,1,8);
      end;
      if dmcons.lcserie=188 then begin
        sval:=sval+'0';
        sval:=copy(sval,1,8);
      end;
    end;
    ss:=ss+sval;
  end
  else begin // litros
    ss:=ss+'1';
    ss:=ss+IntToStr(TPosCarga[SnPosCarga].TPrec[1]);   // 1-contado 0,2-credito
    case DMCONS.DecimalesPresetWayneLitros of
      1:sval:=FiltraStrNum(FormatFloat('0000000.0',SnLitros)); //saux:='0000000.0';
      2:sval:=FiltraStrNum(FormatFloat('000000.00',SnLitros)); //saux:='000000.00';
      3:sval:=FiltraStrNum(FormatFloat('00000.000',SnLitros)); //saux:='00000.000';
      4:sval:=FiltraStrNum(FormatFloat('0000.0000',SnLitros)); //saux:='0000.0000';
    end;
    ss:=ss+sval;
  end;
  if xcomb>0 then begin
    nc:=TPosCarga[SnPosCarga].NoComb;
    i:=0;
    repeat
      inc(i);
    until (CombustibleEnPosicion(xpos,i)=xcomb)or(i>nc);
    if i>nc then
      ss:=ss+'0'+'0'
    else
      ss:=ss+inttostr(i)+'0';
  end
  else
    ss:=ss+'0'+'0';
  ComandoConsolaBuff(ss);
  if SwError then begin
    rsp:='Error al Activar Posici�n de Carga';
    exit;
  end;
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

procedure TFDISWAYNE.Timer3Timer(Sender: TObject);
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

procedure TFDISWAYNE.registro(valor:integer;variable:string);
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


procedure TFDISWAYNE.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISWAYNE.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISWAYNE.lee_registro;
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

procedure TFDISWAYNE.ListBoxPC1DblClick(Sender: TObject);
begin
  SwMensaje:=not SwMensaje;
end;

function TFDISWAYNE.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
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



procedure TFDISWAYNE.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISWAYNE.Button2Click(Sender: TObject);
begin
  if (DMCONS.WayneFusion='No')or(DMCONS.MapeoFusion='Si') then
    ComandoConsolaBuff('N'+inttoclavenum(MaxPosCarga,2)+DMCONS.ModoPrecioWayne);
end;

procedure TFDISWAYNE.MapeaPosicion(xpos:integer);
var xcomb,xpr:integer;
    ss:string;
begin
  with TPosCarga[xpos] do with DMCONS do begin
    SwMapea:=true;
    ss:='g'+IntToClaveNum(xpos,2);
    for xpr:=1 to nocomb do begin
      xcomb:=CombustibleEnPosicion(xpos,xpr);
      ss:=ss+TabComb[xcomb].ProductoPrecio;
    end;
    while length(ss)<10 do
      ss:=ss+'0';
    ValorMapeo:=ss;
  end;
end;

procedure TFDISWAYNE.Button3Click(Sender: TObject);
var xpos:integer;
begin
  if (DMCONS.WayneFusion='No')or(DMCONS.MapeoFusion='Si') then begin
    ComandoConsolaBuff('q0011'); // Inicializa TIER/LEVEL
    for xpos:=1 to MaxPosCarga do
      MapeaPosicion(xpos);
  end;
end;

procedure TFDISWAYNE.Button4Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

end.
