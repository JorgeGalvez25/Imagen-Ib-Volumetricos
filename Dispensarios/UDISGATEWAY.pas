unit UDISGATEWAY;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  dxGDIPlusClasses,ShellApi, DateUtils, ScktComp, jpeg, WinSvc;


const
      MCxP=4;


type
  TFDISGATEWAY = class(TForm)
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
    Panel2: TPanel;
    Memo1: TMemo;
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
    Label4x: TLabel;
    StaticText9: TStaticText;
    Button3: TButton;
    StaticText7: TStaticText;
    DBGrid3: TDBGrid;
    ListView1: TListView;
    Socket1: TClientSocket;
    Image1: TImage;
    NotificationIcon1: TRxTrayIcon;
    StaticText8: TStaticText;
    TL_TcmbIDPRODUCTOOG: TIntegerField;
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
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Socket1Read(Sender: TObject; Socket: TCustomWinSocket);
    function ServicioCorriendo(sService: PChar): Boolean;
  private
    { Private declarations }
    xPosT,
    xPosStop,
    xPosStop2,
    ApEg,
    ContReset       :integer;
    SwReset,
    SwAplicaCmnd,
    SwInicio        :boolean;
    LineaBuff,
    LineaTimer,
    Linea           :string;
    SwEspera,
    SwBcc,
    Swcierrabd,
    FinLinea        :boolean;
    ContEspera1,
    ContEsperaPaso2,
    ContEsperaPaso3,
    ContEsperaPaso4,
    ContEsperaPaso5,
    NumPaso,
    PrecioCombActual,
    PosicionDispenActual,
    PosicionCargaActual,
    SnPosCarga      :integer;
    SnImporte,
    SnLitros        :real;
    EmularEstatus,
    ValorPam1,
    ValorPam2,
    ValorPam3,
    ValorPamf,
    LineaEmular     :string;
    SwError         :boolean;
    ContadorAlarma  :integer;
    HoraReset       :Tdatetime;
    folioOGGen:Integer;
    primeraRespuesta:Boolean;
  public
    { Public declarations }
    function StringCom(ss:string):string;
    function XorChar(c1,c2:char):char;
    function CalculaBCC(ss:string):char;
    procedure ComandoConsolaBuff(ss:string);
    procedure ComandoConsola(ss:string);
    procedure ProcesaLinea;
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer;swforza:boolean);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    function PosicionDeCombustible(xpos,xcomb:integer):integer;
    procedure EnviaPreset3(var rsp:string;xcomb:integer);
    procedure EnviaPreset(var rsp:string;xcomb:integer);
    procedure SetFolioOG(xpos,xfolioOG:Integer);
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
       TComb    :array[1..MCxP] of integer; // Claves de los combustibles
       TCombx   :array[1..MCxP] of integer; // Clave real de los combustibles
       TPosx      :array[1..MCxP] of integer;
       TDiga    :array[1..MCxP] of integer;
       TDigvol    :array[1..MCxP] of integer;
       TDigit    :integer;
       TMapa    :array[1..MCxP] of string[6];
       TMang     :array[1..MCxP] of integer;
       SwMapea    :array[1..MCxP] of boolean;
       TotalLitrosAnt:array[1..MCxP] of real;
       TotalLitros:array[1..MCxP] of real;
       SwTotales:array[1..MCxP] of boolean;
       SwDesp,swprec:boolean;
       SwA:boolean;
       Hora:TDateTime;
       SwInicio:boolean;
       SwInicio2:boolean;
       SwPreset,
       IniciaCarga:boolean;
       MontoPreset:string;
       ImportePreset:real;
       Mensaje:string[30];
       swnivelprec,
       swautorizada,
       swautorizando,
       swcargando:boolean;
       swAvanzoVenta:boolean;
       SwActivo,
       SwOCC,SwCmndB,
       SwDesHabilitado:boolean;
       ModoOpera:string[8];
       TipoPago:integer;
       ContOcc,
       FinVenta:integer;
       HoraOcc:TDateTime;
       HoraFinv:TDateTime;
       CmndOcc:string[25];
       folioOG:Integer;
       TotsFinv:Boolean;

       swarosmag:boolean;
       aros_cont,
       aros_mang,
       aros_cte,
       aros_vehi:integer;
       swarosmag_stop:boolean;
       esDiesel:Boolean;

     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=20;
      MaxEspera3=10;


var
  FDISGATEWAY: TFDISGATEWAY;
  TPosCarga:array[1..32] of tiposcarga;
  MaxPosCarga:integer;
  MaxPosCargaActiva:integer;
  ContDA     :integer;
  SwCerrar    :boolean;
  // CONTROL TRAFICO COMANDOS
  ListaCmnd     :TStrings;
  LinCmnd       :string;
  CharCmnd      :char;
  SwEsperaRsp,
  SwEspMin      :boolean;
  SegEspCierre  :TDateTime;
  TAdicf        :array[1..32,1..3] of integer;
  Txp           :array[1..32] of integer;


implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU, StrUtils, Math;

{$R *.DFM}



procedure TFDISGATEWAY.DespliegaPrecios;
var i:integer;
begin
  with DMCONS do begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Precios Actuales: ');
    for i:=1 to MaxComb do with TabComb[i] do if Activo then
      Memo1.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
  end;
end;

procedure TFDISGATEWAY.IniciaBaseDeDatos;
var i:integer;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    try
      // Carga Pos. Carga
      Q_BombIb.Active:=false;
      Q_BombIb.Active:=true;
      if Q_BombIb.IsEmpty then
        raise Exception.Create('Estaci�n no existe, o no tiene posiciones de carga configurados');

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
      CargaPreciosFH(Now,true); // guarda precio actual como fosico
      DBGrid3.Refresh;
      DespliegaPrecios;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISGATEWAY.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum:integer;
    existe:boolean;
begin
  with DMCONS do begin
    MaxPosCarga:=0;
    for i:=1 to 32 do with TPosCarga[i] do begin
      txp[i]:=1;
      for j:=1 to 3 do
        TAdicf[i,j]:=0;
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      SwInicio:=true;
      SwInicio2:=true;
      IniciaCarga:=false;
      SwPreset:=false;
      Mensaje:='';
      importe:=0;
      volumen:=0;
      precio:=0;
      tipopago:=0;
      finventa:=0;
      Swnivelprec:=false;
      if DMCONS.SwMapOff then
        Swnivelprec:=true;
      SwCargando:=false;
      SwAutorizada:=false;
      SwAutorizando:=false;
      for j:=1 to MCxP do begin
        SwTotales[j]:=true;
        TotalLitrosAnt[j]:=0;
        TotalLitros[j]:=0;
        swmapea[j]:=false;
        TMapa[j]:='';
        TComb[j]:=0;
        TPosx[j]:=0;
      end;
      SwActivo:=false;
      SwDeshabilitado:=false;
      SwArosMag:=false;
      SwArosMag_stop:=false;
      SwOCC:=false;
      ContOcc:=0;
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
    TL_Tcmb.Active:=True;
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xisla:=Q_BombIbIsla.asinteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      if (xpos in [1..32]) then begin
        xcomb:=Q_BombIbCOMBUSTIBLE.AsInteger;
        if (xpos>MaxPosCarga) then begin
          MaxPosCarga:=xpos;
          ListView1.Items.Add;
          ListView1.Items[MaxPosCarga-1].Caption:=IntToClaveNum(xpos,2);
          ListView1.Items[MaxPosCarga-1].ImageIndex:=0;
        end;
        with TPosCarga[xpos] do begin
          Isla:=xisla;
          SwDesp:=false;
          SwPrec:=false;
          SwA:=false;
          existe:=false;
          ModoOpera:=Q_BombIbModoOperacion.AsString;
          esDiesel:=False;
          HoraFinv:=now;
          for i:=1 to NoComb do
            if TComb[i]=xcomb then
              existe:=true;
          if not existe then begin
            inc(NoComb);
            TComb[NoComb]:=xcomb;
            TL_Tcmb.Locate('CLAVE',xcomb,[]);
            TCombx[NoComb]:=TL_TcmbIDPRODUCTOOG.AsInteger;
            if (xcomb=3) then
              esDiesel:=True;
            if Q_BombIbCon_Posicion.AsInteger>0 then
              TPosx[NoComb]:=Q_BombIbCon_Posicion.AsInteger
            else if NoComb<=2 then
              TPosx[NoComb]:=NoComb
            else
              TPosx[NoComb]:=1;
            TMang[NoComb]:=Q_BombIbManguera.AsInteger;
            TDiga[1]:=Q_BombIbCon_DigitoAjuste.AsInteger;
            TDigvol[1]:=Q_BombIbDigitoAjusteVol.AsInteger;
            TDigit:=Q_BombIbDigitosGilbarco.AsInteger;
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

procedure TFDISGATEWAY.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      ContDA:=0;
      SwEsperaRsp:=false;
      ErrorInic:=true;
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      SwEspera:=false;
      StaticText6.Caption:='';
      ContEspera1:=0;
      ContEsperaPaso2:=0;
      ContEsperaPaso3:=0;
      ContEsperaPaso4:=0;
      ContEsperaPaso5:=0;
      NumPaso:=0;
      StaticText5.Caption:=IntToStr(NumPaso);
      Linea:='';
      LineaBuff:='';
      LineaTimer:='';
      SwBcc:=false;
      FinLinea:=false;
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
      if DMCONS.SwMapOff then begin
        Label4x.Visible:=true;
        Label4x.Caption:='MapOff';
      end;
      ErrorInic:=false;
    finally
      Timer1.Enabled:=true;
      Timer3.Enabled:=DMCONS.SwEmular;
    end;
  end;
end;

function TFDISGATEWAY.StringCom(ss:string):string;
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

function TFDISGATEWAY.XorChar(c1,c2:char):char;
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

function TFDISGATEWAY.CalculaBCC(ss:string):char;
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

procedure TFDISGATEWAY.LimpiaConsola;
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

procedure TFDISGATEWAY.DespliegaPosCarga(xpos:integer;swforza:boolean);
var i,ii,xp,rango,posi,posf,
    xcomb,xc,apunt,xmang:integer;
    xnombre:string;
    xdiflts:real;
begin
  apunt:=1;
  try
    rango:=ListBox1.ItemIndex+1;
    if rango=0 then
      rango:=1;
    posi:=rango*4-3;
    posf:=rango*4;
    with TPosCarga[xpos],FDISGATEWAY do begin
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
            1,7:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClRed;
            4,5,9:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClYellow;
            2:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClLime;
            3:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=ClBlue;
            8:TPanel(FindComponent('panelPC'+IntToStr(ii))).color:=clPurple;
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
        if precio>0 then begin
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add(FormatFloat('##,##0.00',precio)+' $/Lts');
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
        if SwPreset then
          TListBox(FindComponent('ListBoxPC'+IntToStr(ii))).Items.Add('PRESET '+MontoPreset+' >>'+inttostr(finventa));
      end;
    end;
    apunt:=2;
    // Refresca Listas
    for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
      if ModoOpera='Normal' then begin
        case estatus of
          1,3,7:ListView1.Items[i-1].ImageIndex:=1;
          2:ListView1.Items[i-1].ImageIndex:=2;
          5,9:ListView1.Items[i-1].ImageIndex:=3;
          else ListView1.Items[i-1].ImageIndex:=0;
        end;
      end
      else begin
        case estatus of
          1,3,7:ListView1.Items[i-1].ImageIndex:=4;
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
          apunt:=4;
          HoraFinv:=Now;
          TotsFinv:=True;
          try
            try
              swcierrabd:=true;
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
              xdiflts:=0;
              for ii:=1 to 4 do begin
                xdiflts:=xdiflts+(TotalLitros[ii]-TotalLitrosAnt[ii]);
                TotalLitrosAnt[ii]:=TotalLitros[ii];
              end;
              if xdiflts=0 then begin
                Button1Click(nil);
                Button3Click(nil);
              end;
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
              if ModoOpera='Normal' then
                SwPreset:=false;
              if (lcLicTemporal)and(date>lcLicVence) then begin
                MensajeErr('Licencia vencida. Llame a su distribuidor');
                swcerrar:=true; FDISGATEWAY.Close;
              end;
            except
            end;
          finally
            T_MoviIb.Active:=false;
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

procedure TFDISGATEWAY.ProcesaLinea;
label uno;
var lin,ss,rsp,ss2,
    xestado,xmodo,xprodauto:string;
    simp,sval,spre:string[20];
    i,xpos,xcmnd,
    XMANG,XCTE,XVEHI,
    xcomb,xp,xc,xfolio:integer;
    xgrade:char;
    importeant,
    ximporte:real;
    xvol,ximp:real;
    swerr,SwAplicaMapa:boolean;
    tagx:array[1..3] of integer;

begin
  try
    if LineaTimer='' then
      exit;
    SwEsperaRsp:=false;
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
           try
             apeg:=0;
             StaticText18.Caption:=Lin;
             SwAplicaMapa:=true;
             ContEspera1:=0;
             ss:=copy(lin,4,length(lin)-3);
             MaxPosCargaActiva:=length(ss);
             xestado:='';
             if MaxPosCargaActiva>MaxPosCarga then
               MaxPosCargaActiva:=MaxPosCarga;
             if DMCONS.PreciosInicio then
               DMCONS.AplicarUltimosPrecios;
             apeg:=1;
             for xpos:=1 to MaxPosCargaActiva do begin
               with TPosCarga[xpos] do begin
                 if NoComb=0 then
                   Next;
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
                           DMCONS.RegistraBitacora3(1,'Desconexion de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                       end;
                     end;
                 1,7:begin              // IDLE
                       if (estatusant in [9,2])and(DMCONS.ReautorizaPam='Si') then begin
                         if (now-TPosCarga[xpos].HoraOcc)<=60*tmsegundo then begin
                           DMCONS.AgregaLog('Reenvia: '+TPosCarga[xpos].CmndOcc);
                           ComandoConsolaBuff(TPosCarga[xpos].CmndOcc);
                           esperamiliseg(100);
                           TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                           exit;
                         end;
                       end;
                       if swprec then
                         swprec:=false;
                       if estatusant=0 then begin
                         for xcomb:=1 to nocomb do
                           DMCONS.RegistraBitacora3(1,'Reconexion de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                       end;
                       swautorizada:=false;
                       descestat:='Inactivo';
                       if (estatusant<>estatus) then begin
                         FinVenta:=0;
                         SwArosMag:=false;
                         SwOcc:=false;
                         ContOcc:=0;
                       end;
                       if (SecondsBetween(Now,HoraFinv)>10) and (TotsFinv) then begin
                         SwTotales[1]:=true;
                         SwTotales[2]:=true;
                         SwTotales[3]:=true;
                         SwTotales[4]:=true;
                         TotsFinv:=False;
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
                           EsperaMiliSeg(100);
                           if DMCONS.ReautorizaPam='Si' then begin
                             TPosCarga[xpos].CmndOcc:='';
                             TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                           end;
                           SwArosMag_Stop:=true;
                           if swemular then
                             EmularEstatus[xpos]:='8';
                         end;
                       end;
                     end;
                   3:begin
                       descestat:='Fin de Venta';       // EOT
                       TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                     end;
                 4,5:descestat:='Pistola Levantada';  // CALL
                   6:begin
                       descestat:='Cerrada';            // CLOSED
                       ComandoConsolaBuff('L'+inttoclavenum(xpos,2));
                       EsperaMiliSeg(100);
                     end;
                   8:begin
                       descestat:='Detenida';           // STOP
                       if SwArosMag_Stop then begin
                         if DMCONS.ControlArosMagneticosRecon(xpos,xmang,xcte,xvehi) then begin
                           if (xmang=aros_mang)and(xcte=aros_cte)and(xvehi=aros_vehi)and(aros_cont<DMCONS.ReconexionesAros) then begin
                             ss:='G'+IntToClaveNum(xpos,2); // START
                             ComandoConsolaBuff(ss);
                             EsperaMiliSeg(100);
                             SwArosMag_Stop:=false;
                             inc(aros_cont);
                             with DMCONS do begin
                               try
                                if not DBGASCON.Connected then
                                  DBGASCON.Connected:=true;
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
                           ss:='E'+IntToClaveNum(xpos,2); // STOP
                           ComandoConsolaBuff(ss);
                           EsperaMiliSeg(100);
                           if DMCONS.ReautorizaPam='Si' then begin
                             TPosCarga[xpos].CmndOcc:='';
                             TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                           end;
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

             for xpos:=1 to MaxPosCargaActiva do begin
               with TPosCarga[xpos] do begin
                 case Estatus of
                   6:if SwInicio then begin
                       apeg:=15;
                       ss:='L'+IntToClaveNum(xpos,2); // OPEN PUMP
                       ComandoConsolaBuff(ss);
                       EsperaMiliSeg(100);
                       SwInicio:=false;
                     end;
                   4,5:if (not SwDesHabilitado)and(not swautorizada)and((now-HoraOcc)>(tmsegundo*5)) then begin
                       apeg:=16;
                       if (ModoOpera='Normal')and(not swarosmag) then begin
                         apeg:=17;
                         SnImporte:=0.00;
                         SnLitros:=0;
                         SnPosCarga:=xpos;
                         TipoPago:=0;
                         FinVenta:=0;
                         EnviaPreset3(ss,0);
                         HoraOcc:=now;
                         SwInicio:=false;
                       end;
                     end
                     else if (swautorizada)and(DMCONS.ReautorizaPam='Si') then begin
                       if (now-TPosCarga[xpos].HoraOcc)<=60*tmsegundo then begin
                         DMCONS.AgregaLog('Reenvia: '+TPosCarga[xpos].CmndOcc);
                         ComandoConsolaBuff(TPosCarga[xpos].CmndOcc);
                         esperamiliseg(100);
                         TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                         exit;
                       end;
                     end;
                 end;
               end;
             end;

             apeg:=2;
             apeg:=3;
             NumPaso:=2;
             PosicionCargaActual:=0;
           except
             NumPaso:=2;
             PosicionCargaActual:=0;
           end;
         end;
     'A':begin // RECIBE LECTURA DE BOMBA
           try
             xpos:=StrToIntDef(copy(lin,2,2),0);
             if (xpos in [1..maxposcarga]) then begin
               ContEsperaPaso2:=0;
               with TPosCarga[xpos] do begin
                 Mensaje:='';
                 swinicio2:=false;
                 if lin[4]='0' then begin // POSICION ESTA CARGANDO
                   importeant:=importe;
                   simp:=copy(lin,14,8);
                   importe:=StrToFloat(simp)/1000;
                   volumen:=0;
                   precio:=0;
                   swAvanzoVenta:=importe>0;

                   if (DMCONS.ControlAros='Si')and(importe<0.01)and(not swarosmag)and(ModoOpera='Normal') then begin
                     swarosmag:=DMCONS.ControlArosMagneticos2(xpos,aros_mang,aros_cte,aros_vehi);
                     if swarosmag then begin
                       ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
                       EsperaMiliSeg(100);
                       if DMCONS.ReautorizaPam='Si' then begin
                         TPosCarga[xpos].CmndOcc:='';
                         TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                       end;
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
                       PosActual:=TPosx[i];
                   if (PosActual=0)or(checkbox2.Checked) then begin   // Perdio el mapeo
                     for i:=1 to nocomb do
                       SwMapea[i]:=true;
                   end
                   else begin
                     try
                       volumen:=StrToFloat(copy(lin,6,8))/1000;
                       simp:=copy(lin,14,8);
                       spre:=copy(lin,22,5);
                       importeant:=importe;
                       xcomb:=CombustibleEnPosicion(xpos,PosActual);
                       precio:=StrToFloat(spre)/100;
                       importe:=StrToFloat(simp)/1000;
                       if (2*volumen*precio<importe) then
                         importe:=importe/10;
                       if (2*importe<volumen*precio) then
                         importe:=importe*10;


                       if DMCONS.AjustePAM='Si' then begin
                         ximporte:=AjustaFloat(volumen*precio,2);
                         if abs(importe-ximporte)>=0.015 then
                           importe:=ximporte;
                       end;

                       if not swAvanzoVenta then begin
                         swAvanzoVenta:=(importe<>importeant) and (Estatus=2) and (importe>0) and (importe-importeant<IfThen(xcomb=3,80,20));
                         DMCONS.AgregaLog(ifthen(swAvanzoVenta,'swAvanzoVenta','NOT')+' Estatus='+IntToStr(Estatus)+' ImporteAnt: '+FloatToStr(importeant)+' Importe: '+FloatToStr(importe));
                       end;      

                       if ((Estatus=3) or (Estatus=1)) and (SwCargando) and (swAvanzoVenta) then begin// EOT
                         SwCargando:=false;
                         swAvanzoVenta:=False;
                         swdesp:=true;
                       end;

                       DespliegaPosCarga(xpos,true);
                       if (TPosCarga[xpos].finventa=0) and (Estatus=3) and ((now-HoraFinv)>(tmsegundo*8)) then begin // EOT
                         TPosCarga[xpos].finventa:=0;
                         TipoPago:=0;
                         ss:='R'+IntToClaveNum(xpos,2); // VENTA COMPLETA
                         if DMCONS.swemular then
                           EmularEstatus[xpos]:='1';
                         ComandoConsolaBuff(ss);                     
                         HoraFinv:=now;
                         EsperaMiliSeg(100);
                       end;
                     except
                     end;
                   end;
                 end;
               end;
             end;
           except
             DMCONS.AgregaLog('ERROR EN COMANDO A');
           end
         end;
     '@':begin // RECIBE TOTAL DE LA POSICION
           try
             xpos:=StrToIntDef(copy(lin,5,2),0);
             if (xpos in [1..maxposcarga]) then begin
               with TPosCarga[xpos] do begin
                 xgrade:=lin[8];
                 for i:=1 to nocomb do begin
                   if TPosx[i]=1 then begin
                     SwTotales[i]:=false;
                     TotalLitros[i]:=StrToFloat(copy(lin,9,12))/100;
                     DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                     DespliegaPosCarga(xpos,true);
                   end;
                 end;
                 if nocomb=1 then begin
                   for i:=1 to 4 do
                     SwTotales[i]:=false;
                 end
                 else if nocomb>=2 then begin
                   xgrade:=lin[41];
                   for i:=1 to nocomb do begin
                     if TPosx[i]=2 then begin
                       SwTotales[i]:=false;
                       TotalLitros[i]:=StrToFloat(copy(lin,42,12))/100;
                       DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                       DespliegaPosCarga(xpos,true);
                     end;
                   end;
                   if nocomb>=3 then begin
                     xgrade:=lin[74];
                     for i:=1 to nocomb do begin
                       if TPosx[i]=3 then begin
                         SwTotales[i]:=false;
                         TotalLitros[i]:=StrToFloat(copy(lin,75,12))/100;
                         DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                         DespliegaPosCarga(xpos,true);
                       end;
                     end;
                     if nocomb=4 then begin
                       xgrade:=lin[107];
                       for i:=1 to nocomb do begin
                         if TPosx[i]=4 then begin
                           SwTotales[i]:=false;
                           TotalLitros[i]:=StrToFloat(copy(lin,108,12))/100;
                           DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                           DespliegaPosCarga(xpos,true);
                         end;
                       end;
                     end;
                   end;
                 end;
               end;
             end;
           except
             DMCONS.AgregaLog('ERROR EN COMANDO @');
           end
         end;
     'C':begin // RECIBE TOTAL DE UNA PISTOLA
           try
             xpos:=StrToIntDef(copy(lin,2,2),0);
             if (xpos in [1..maxposcarga]) then begin
               xgrade:=lin[4];
               with TPosCarga[xpos] do begin
                 for i:=1 to nocomb do if IntToStr(TComb[i])=xgrade then begin
                   SwTotales[i]:=false;
                   TotalLitros[i]:=StrToFloat(copy(lin,6,10))/100;
                   DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
                   DespliegaPosCarga(xpos,true);
                 end;
               end;
             end;
           except
             DMCONS.AgregaLog('ERROR EN COMANDO C');
           end
         end;
     'V':begin
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if folioOGGen<StrToIntDef(Copy(lin,4,Length(lin)-3),0) then begin
             TPosCarga[xpos].folioOG:=StrToIntDef(Copy(lin,4,Length(lin)-3),0);
             SetFolioOG(xpos,TPosCarga[xpos].folioOG);
           end;
         end;
   idAck:if NumPaso=1 then begin
           if xPosT in [1..MaxPosCargaActiva] then
             TPosCarga[xPosT].swnivelprec:=true;
         end
         else if NumPaso=4 then with DMCONS do begin // CAMBIO DE PRECIOS
           try
             ContEsperaPaso4:=0;
             with TabComb[PrecioCombActual] do begin
               AplicaPrecio:=false;
               PreciosInicio:=False;
               try
                 Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
                 Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=PrecioCombActual;
                 Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
                 Q_AplicaPrecioF.ExecSQL;
               except
                 on e:Exception do
                  DMCONS.AgregaLog('Error 1: '+inttostr(PrecioCombActual)+' - '+e.Message);
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
                 on e:Exception do
                   DMCONS.AgregaLog('Error 2: '+inttostr(PrecioCombActual)+' - '+e.Message);
               end;
             end;
           except
             DMCONS.AgregaLog('ERROR EN ACK');
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

    if (ListaCmnd.Count>0)and(not SwEsperaRsp) then begin
      ss:=ListaCmnd[0];
      ListaCmnd.Delete(0);
      ComandoConsola(ss);
      exit;
    end;

    // checa lecturas de dispensarios
    if NumPaso=2 then begin
      try
        if PosicionCargaActual<MaxPosCargaActiva then begin
          repeat
            Inc(PosicionCargaActual);
            with TPosCarga[PosicionCargaActual] do if NoComb>0 then begin
              if (estatus<>estatusant)or(estatus>1) or (((SwA)or(swinicio2))and(estatus>0)) then begin //CAMBIO
                if (estatus in [1,2,3,7,8]) then begin
                  SwA:=false;
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
        DMCONS.AgregaLog('ERROR PASO 2');
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
                0:xestado:=xestado+'0'; // Sin Comunicacion
                1:xestado:=xestado+'1'; // Inactivo (Idle)
                2:xestado:=xestado+'2'; // Cargando (In Use)
                3:xestado:=xestado+'3'; // Fin de Carga (Used)
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
                if (estatus in [1,7]) and (swtotales[PosicionDispenActual]) then begin
                  ComandoConsolaBuff('@100'+IntToClaveNum(PosicionCargaActual,2));
                  EsperaMiliSeg(100);
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
        DMCONS.AgregaLog('ERROR PASO 3');
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
                  if ValidaCifra(precio,2,2)='OK' then begin
                    if precio>=0.01 then begin
                      EsperaMiliSeg(200);
                      ComandoConsolaBuff('X00'+ProductoPrecio+'100'+IntToClaveNum(Trunc(Precio*100+0.5),4)); // contado
                      AplicaPrecio:=False;
                    end;
                  end;
                  for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
                    if estatus in [2,3,8,9] then
                      swprec:=true;
                  end;
                  if swemular then
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
        DMCONS.AgregaLog('ERROR PASO 4');
        NumPaso:=5;
        StaticText5.Caption:=IntToStr(NumPaso);
      end;
    end;
    if (NumPaso=5) then with DMCONS do begin
      try
        // Checa Comandos
        with DMCONS do begin
          if swcierrabd then begin
            DBGASCON.Connected:=false;
            Esperamiliseg(300);
            DBGASCON.Connected:=true;
            swcierrabd:=false;
            Q_CombIb.Active:=true;
          end;
          for xcmnd:=1 to 40 do if (TabCmnd[xcmnd].SwActivo)and(not TabCmnd[xcmnd].SwResp) then begin
            SwAplicaCmnd:=true;
            ss:=Mayusculas(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,1,' '));
            DMCONS.AgregaLog(TabCmnd[xcmnd].Comando);
            // CMND: PARO TOTAL
            if ss='PAROTOTAL' then begin
              rsp:='OK';
              ComandoConsolaBuff('E00');
              EsperaMiliSeg(100);
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
                ComandoConsolaBuff('U'+IntToClaveNum(0,2));
                rsp:='OK';
              end
              else if (xpos in [1..maxposcarga]) then begin
                TPosCarga[xpos].ModoOpera:='Prepago';
                ActivaModoPrepago(xpos);
                ComandoConsolaBuff('U'+IntToClaveNum(xpos,2));
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
                ComandoConsolaBuff('L'+IntToClaveNum(0,2));
                rsp:='OK';
              end
              else if (xpos in [1..maxposcarga]) then begin
                TPosCarga[xpos].ModoOpera:='Normal';
                DesActivaModoPrepago(xpos);
                ComandoConsolaBuff('L'+IntToClaveNum(xpos,2));
                rsp:='OK';
              end;
            end
            // ORDENA CARGA DE COMBUSTIBLE
            else if ss='OCC' then begin
              SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              xpos:=SnPosCarga;
              rsp:='OK';
              if (SnPosCarga in [1..MaxPosCarga]) then begin
                if (TPosCarga[SnPosCarga].estatus in [1,5,7])or(TPosCarga[SnPosCarga].SwOCC) then begin
                  if not TPosCarga[SnPosCarga].swautorizando then begin
                    // Valida que se haya aplicado el PRESET
                    if TabCmnd[xcmnd].SwNuevo then begin
                      TPosCarga[SnPosCarga].SwOCC:=false;
                      TabCmnd[xcmnd].SwNuevo:=false;
                    end;
                    Swerr:=false;
                    if (TPosCarga[SnPosCarga].SwOCC) then begin
                      if (TPosCarga[SnPosCarga].SwCmndB) then begin
                        if (TPosCarga[SnPosCarga].estatus in [1,5,7])and(TPosCarga[SnPosCarga].ContOCC>0) then begin
                          TPosCarga[SnPosCarga].SwOCC:=false;
                        end
                        else if (TPosCarga[SnPosCarga].estatus in [1,5,7])and(TPosCarga[SnPosCarga].ContOCC<=0) then begin
                          rsp:='Error al aplicar PRESET';
                          TPosCarga[SnPosCarga].SwOCC:=false;
                          TPosCarga[SnPosCarga].ContOCC:=0;
                          Swerr:=true;
                        end;
                      end
                      else SwAplicaCmnd:=false;
                    end;
                    if (TPosCarga[SnPosCarga].estatus in [1,5,7])and(not TPosCarga[SnPosCarga].SwOCC)and(not swerr) then begin
                      TPosCarga[SnPosCarga].SwOCC:=true;
                      TPosCarga[SnPosCarga].SwCmndB:=false;
                      if TPosCarga[SnPosCarga].ContOCC=0 then
                        TPosCarga[SnPosCarga].ContOCC:=3
                      else begin
                        dec(TPosCarga[SnPosCarga].ContOCC);
                        esperamiliseg(500);
                      end;
                      SwAplicaCmnd:=false;
                      try
                        SnImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                        SnLitros:=0;
                        rsp:=ValidaCifra(SnImporte,4,2);
                        if rsp='OK' then
                          if (SnImporte<0.50) then
                            rsp:='Minimo permitido: $0.50';
                      except
                        rsp:='Error en Importe';
                      end;
                      if rsp='OK' then begin
                        TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                        TPosCarga[SnPosCarga].swarosmag:=false;
                        if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                          swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                          aros_cont:=0;
                          if (not swarosmag) then
                            rsp:='Aro se encuentra desconectado';
                        end;
                        if rsp='OK' then begin
                          if (TPosCarga[SnPosCarga].estatus in [1,5,7,9]) then begin
                            ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                            xcomb:=StrToIntDef(ss,0);
                            xp:=PosicionDeCombustible(SnPosCarga,xcomb);
                            if xp>0 then begin

                              TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                              EnviaPreset3(rsp,xcomb);
                            end
                            else rsp:='Combustible no existe en esta posicion';
                          end
                          else begin
                            rsp:='Posicion de Carga no Disponible';
                            TPosCarga[SnPosCarga].swarosmag:=false;
                          end;
                        end;
                      end;
                    end;
                    if (not SwAplicaCmnd)and(rsp<>'OK') then
                       SwAplicaCmnd:=true;
                  end
                  else swaplicacmnd:=false;
                end
                else rsp:='Posicion de Carga no Disponible';
                if SwAplicaCmnd then
                  TPosCarga[SnPosCarga].SwOCC:=false;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            else if ss='OCL' then begin
              SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              xpos:=SnPosCarga;
              rsp:='OK';
              if (SnPosCarga in [1..MaxPosCarga]) then begin
                if (TPosCarga[SnPosCarga].estatus in [1,5,7])or(TPosCarga[SnPosCarga].SwOCC) then begin
                  if not TPosCarga[SnPosCarga].swautorizando then begin
                    // Valida que se haya aplicado el PRESET
                    if TabCmnd[xcmnd].SwNuevo then begin
                      TPosCarga[SnPosCarga].SwOCC:=false;
                      TabCmnd[xcmnd].SwNuevo:=false;
                    end;
                    Swerr:=false;
                    if (TPosCarga[SnPosCarga].SwOCC) then begin
                      if (TPosCarga[SnPosCarga].SwCmndB) then begin
                        if (TPosCarga[SnPosCarga].estatus in [1,5,7])and(TPosCarga[SnPosCarga].ContOCC>0) then begin
                          TPosCarga[SnPosCarga].SwOCC:=false;
                        end
                        else if (TPosCarga[SnPosCarga].estatus in [1,5,7])and(TPosCarga[SnPosCarga].ContOCC<=0) then begin
                          rsp:='Error al aplicar PRESET';
                          TPosCarga[SnPosCarga].SwOCC:=false;
                          TPosCarga[SnPosCarga].ContOCC:=0;
                          Swerr:=true;
                        end;
                      end
                      else SwAplicaCmnd:=false;
                    end;
                    if (TPosCarga[SnPosCarga].estatus in [1,5,7])and(not TPosCarga[SnPosCarga].SwOCC)and(not swerr) then begin
                      TPosCarga[SnPosCarga].SwOCC:=true;
                      TPosCarga[SnPosCarga].SwCmndB:=false;
                      if TPosCarga[SnPosCarga].ContOCC=0 then
                        TPosCarga[SnPosCarga].ContOCC:=3
                      else begin
                        dec(TPosCarga[SnPosCarga].ContOCC);
                        esperamiliseg(500);
                      end;
                      SwAplicaCmnd:=false;
                      try
                        SnImporte:=0;
                        SnLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                        rsp:=ValidaCifra(SnLitros,4,2);
                        if rsp='OK' then
                          if (SnLitros<0.10) then
                            rsp:='Minimo permitido: 0.10 lts'
                      except
                        rsp:='Error en Litros';
                      end;
                      if rsp='OK' then begin
                        TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                        TPosCarga[SnPosCarga].swarosmag:=false;
                        if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                          swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                          aros_cont:=0;
                          if (not swarosmag) then
                            rsp:='Aro se encuentra desconectado';
                        end;
                        if rsp='OK' then begin
                          if (TPosCarga[SnPosCarga].estatus in [1,5,7,9]) then begin
                            ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                            xcomb:=StrToIntDef(ss,0);
                            xp:=PosicionDeCombustible(SnPosCarga,xcomb);
                            if xp>0 then begin

                              TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                              EnviaPreset3(rsp,xcomb);
                            end
                            else rsp:='Combustible no existe en esta posicion';
                          end
                          else begin
                            rsp:='Posicion de Carga no Disponible';
                            TPosCarga[SnPosCarga].swarosmag:=false;
                          end;
                        end;
                      end;
                    end;
                    if (not SwAplicaCmnd)and(rsp<>'OK') then
                       SwAplicaCmnd:=true;
                  end
                  else swaplicacmnd:=false;
                end
                else rsp:='Posicion de Carga no Disponible';
                if SwAplicaCmnd then
                  TPosCarga[SnPosCarga].SwOCC:=false;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            // ORDENA FIN DE VENTA
            else if ss='FINV' then begin
              xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              rsp:='OK';
              if (xpos in [1..MaxPosCarga]) then begin
                TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
                if (TPosCarga[xpos].Estatus in [1,3]) then begin // EOT
                  if (not TPosCarga[xpos].swcargando) then begin
                    TPosCarga[xpos].finventa:=0;
                    ss:='R'+IntToClaveNum(xpos,2); // VENTA COMPLETA
                    ComandoConsolaBuff(ss);
                    EsperaMiliSeg(100);
                    if DMCONS.swemular then
                      EmularEstatus[xpos]:='1';
                    try
                      EsperaMiliSeg(100);
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
                      DMCONS.AgregaLog('ERROR al cambiar tipo de pago: '+e.Message);
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
                  rsp:='Posicion aun no esta en fin de venta';
                end;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            // ORDENA ESPERA FIN DE VENTA
            else if ss='EFV' then begin
              xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              rsp:='OK';
              if (xpos in [1..MaxPosCarga]) then
                if (TPosCarga[xpos].Estatus=2) then
                  TPosCarga[xpos].finventa:=1
                else rsp:='Posicion debe estar Despachando'
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
              if xpos in [1..MaxPosCarga] then begin
                if (TPosCarga[xpos].estatus in [2,9]) then begin
                  ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
                  EsperaMiliSeg(100);
                  if DMCONS.ReautorizaPam='Si' then begin
                    TPosCarga[xpos].CmndOcc:='';
                    TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
                  end;
                  if TPosCarga[xpos].estatus=9 then
                    TPosCarga[xpos].tipopago:=0;
                  if DMCONS.swemular then
                    if xpos in [1..MaxPosCarga] then
                      if EmularEstatus[xpos]='2' then
                        EmularEstatus[xpos]:='8'
                      else
                        EmularEstatus[xpos]:='1';
                end;
              end;
            end
            else if (ss='REANUDAR') then begin
              rsp:='OK';
              xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
              if xpos in [1..MaxPosCarga] then begin
                if (TPosCarga[xpos].estatus in [2,8]) then begin
                  ComandoConsolaBuff('G'+IntToClaveNum(xpos,2));
                  EsperaMiliSeg(100);
                  if DMCONS.swemular then
                    if xpos in [1..MaxPosCarga] then
                      if EmularEstatus[xpos]='8' then
                        EmularEstatus[xpos]:='2';
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
            if SwCerrar then
              Close;
          end;
        end;
        if not SwEsperaRsp then
          NumPaso:=0;
      except
        on e:Exception do begin
          DMCONS.AgregaLog('ERROR PASO 5 COMANDO: '+ss+' '+e.Message);
          NumPaso:=0;
        end;
      end;
    end;
  except
    with DMCONS do begin
      if (T_Tcmb.State in [dsInsert,dsEdit]) then
        T_Tcmb.Cancel;
    end;
  end;
end;

procedure TFDISGATEWAY.ComandoConsolaBuff(ss:string);
begin
  if (ListaCmnd.Count=0)and(not SwEsperaRsp) then
    ComandoConsola(ss)
  else
    ListaCmnd.Add(ss);
end;

procedure TFDISGATEWAY.ComandoConsola(ss:string);
var s1:string;
    cc:char;
begin
  if swreset then
    exit;
  LinCmnd:=ss;
  CharCmnd:=LinCmnd[1];
  SwError:=false;
  if DMCONS.SwEmular then begin
    LineaEmular:=ss;
    DMCONS.AgregaLog('E '+ss);
    exit;
  end;
  inc(ContadorAlarma);
  try
    LineaBuff:='';
    cc:=CalculaBCC(ss+#3);
    s1:=#2+ss+#3+CC;
    DMCONS.AgregaLog('E '+s1);
    Socket1.Socket.SendText(s1);
    SwEsperaRsp:=primeraRespuesta;
  except
    on e:Exception do begin
      DMCONS.AgregaLog('ERROR CON SOCKET: '+e.Message);
      Socket1.Active:=False;
      Button1Click(nil);
    end;
  end;
end;


procedure TFDISGATEWAY.ListBox1Click(Sender: TObject);
var xp:integer;
begin
  LimpiaConsola;
  for xp:=1 to MaxPosCarga do
    DespliegaPosCarga(xp,true);
end;

procedure TFDISGATEWAY.Restaurar1Click(Sender: TObject);
begin
  FDISGATEWAY.Visible:=true;
end;

procedure TFDISGATEWAY.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFDISGATEWAY.FormCreate(Sender: TObject);
begin
  SwReset:=false;
  SwCerrar:=false;
  SwInicio:=true;
  ContadorAlarma:=0;
  ListaCmnd:=TStringList.Create;
  SwEsperaRsp:=false;
  if DMCONS.T_EstsIbTIPODISPENSARIO.AsInteger=4 then begin
    if DMCONS.VersionPam1000='1' then
      StaticText7.Caption:=' Gilbarco(PAM)/1 '
    else
      StaticText7.Caption:=' Gilbarco(PAM)/3 ';
  end
  else begin
    if DMCONS.VersionPam1000='1' then
      StaticText7.Caption:=' Quantium(PAM)/1 '
    else
      StaticText7.Caption:=' Quantium(PAM)/3 ';
  end;
end;

procedure TFDISGATEWAY.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISGATEWAY.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Socket1.Active:=false;
  DMCONS.AgregaLog('Termino Aplicacion');
  Button1.click;
  Application.Terminate;
end;

procedure TFDISGATEWAY.Timer1Timer(Sender: TObject);
var ss:string;
    i:integer;
begin
  try
    if (not Socket1.Active) and (not DMCONS.swemular) then begin
      StaticText17.Visible:=True;
      StaticText7.Caption:='Abriendo Socket';
      for i:=60 downto 0 do begin
        if ServicioCorriendo('ogcvgateway') then begin
          StaticText17.Visible:=False;
          StaticText7.Caption:='Operando';
          Socket1.Host:=DMCONS.ServidorGateway;
          Socket1.Port:=DMCONS.PuertoGatewayDisp;
          Socket1.Open;
          Break;
        end
        else begin
          StaticText17.Caption:='Esperando servicio Gateway: '+IntToStr(i);
          Sleep(1000);
        end;
        SwCerrar:=i=0;
      end;
    end;

    if not StaticText9.Visible then begin
      StaticText9.Caption:='Puerto: '+DMCONS.PuertoServicio;
      StaticText9.Visible:=true;
    end;
    if SwReset then begin
      inc(contreset);
      if ContReset=90 then begin
        DMCONS.DBGASCON.Connected:=false;
        swcerrar:=true; FDISGATEWAY.Close;
      end;
    end;
    if (SwCerrar) and (not Socket1.Active) then
      Close;
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
          DMCONS.RegistraBitacora3(1,'Desconexion de Dispositivo','Error Comunicacion Dispensarios','U');
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
          CargaPreciosFH(Now,true); // guarda precio actual como fosico
          DespliegaPrecios;
          DBGrid3.Refresh;
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
        inc(ContEspera1);
        if ContEspera1>10 then begin
        end
        else exit;
      end;

      NumPaso:=1;
      StaticText5.Caption:=IntToStr(NumPaso);
      ss:='B00';

      ContEspera1:=0;
      SwEspera:=true;
      StaticText6.Caption:='Esperando..';
      ComandoConsolaBuff(ss);
    finally
      if NotificationIcon1.Tag=0 then begin
        if ErrorInic then begin
          EsperaMiliSeg(3000);
          swcerrar:=true; FDISGATEWAY.Close;
        end;
        NotificationIcon1.Tag:=1;
        FDISMENU.Visible:=false;
        FDISGATEWAY.Visible:=false;
        NotificationIcon1.Show;
      end;
    end;
    if not DMCONS.SwEmular then begin
      if Socket1.Active then
        Label4x.Caption:='On'
      else
        Label4x.Caption:='Off';
      Label4x.Visible:=true;
    end;
  except
    DMCONS.AgregaLog('ERROR TIMER1');
  end;
end;

procedure TFDISGATEWAY.EnviaPreset3(var rsp:string;xcomb:integer);
var xpos,xc,xp:integer;
    ss,xprodauto,NivelPrec,efv:string;
    swlitros:boolean;
begin
  try
    swlitros:=SnLitros>0.01;
    rsp:='OK';
    xpos:=SnPosCarga;
    if TPosCarga[xpos].SwDesHabilitado then begin
      rsp:='Posicion Deshabilitada';
      exit;
    end;
    if not (TPosCarga[xpos].estatus in [1,5,7,9]) then begin
      rsp:='Posicion no Disponible';
      exit;
    end;
    if TPosCarga[xpos].estatus=9 then begin
      ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
      if DMCONS.ReautorizaPam='Si' then begin
        TPosCarga[xpos].CmndOcc:='';
        TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
      end;
      Esperamiliseg(100);
    end;
    NivelPrec:='1';
    xprodauto:='000000';
    with TPosCarga[xpos] do begin
      for xc:=1 to NoComb do if xc in [1..4] then begin
        xp:=TPosx[xc];
        if xcomb>0 then begin // un producto
          if TComb[xc]=xcomb then
            if xp in [1..6] then
              xprodauto[TCombx[xc]]:='1';
        end
        else xprodauto[TCombx[xc]]:='1';
      end;
    end;
    if TPosCarga[xpos].FinVenta=1 then
      efv:='2'
    else
      efv:='1';
    if not swlitros then begin // PRESET EN IMPORTE
      ss:='@02'+'0'+IntToClaveNum(xpos,2)+'0'+efv+FiltraStrNum(FormatFloat('0000.00',snimporte))+xprodauto;
      TPosCarga[xpos].ImportePreset:=SnImporte;
      TPosCarga[xpos].MontoPreset:='$ '+FormatoMoneda(SnImporte);
    end
    else begin // PRESET EN LITROS
      ss:='@02'+'0'+IntToClaveNum(xpos,2)+'1'+efv+FiltraStrNum(FormatFloat('0000.00',snlitros))+xprodauto;
      TPosCarga[xpos].ImportePreset:=SnLitros;
      TPosCarga[xpos].MontoPreset:=FormatoMoneda(SnLitros)+' lts';
    end;
    ComandoConsolaBuff(ss);
    EsperaMiliSeg(300);
    if DMCONS.ReautorizaPam='Si' then begin
      TPosCarga[xpos].CmndOcc:=ss;
      TPosCarga[xpos].HoraOcc:=now;
    end;
    if SwError then begin
      rsp:='Error al Activar Posicion de Carga';
      exit;
    end;
    TPosCarga[xpos].SwPreset:=true;
    if not swlitros then
      DMCONS.AgregaLog('Importe Preset: '+Floattostr(SnImporte));

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
  except
    on e:Exception do
      DMCONS.AgregaLog('ERROR PRESET 3: '+e.Message);
  end;
end;


procedure TFDISGATEWAY.EnviaPreset(var rsp:string;xcomb:integer);
var xpos,xp:integer;
    ss,NivelPrec:string;
    swlitros:boolean;
begin
  swlitros:=SnLitros>0.01;
  rsp:='OK';
  xpos:=SnPosCarga;
  if TPosCarga[xpos].SwDesHabilitado then begin
    rsp:='Posicion Deshabilitada';
    exit;
  end;
  if not (TPosCarga[xpos].estatus in [1,5,9]) then begin
    rsp:='Posicion no Disponible';
    exit;
  end;
  if TPosCarga[xpos].estatus=9 then begin
    ComandoConsolaBuff('E'+IntToClaveNum(xpos,2));
    if DMCONS.ReautorizaPam='Si' then begin
      TPosCarga[xpos].CmndOcc:='';
      TPosCarga[xpos].HoraOcc:=now-1000*tmsegundo;
    end;
    Esperamiliseg(100);
  end;
  NivelPrec:='1';
  if not swlitros then begin // PRESET IMPORTE
    ss:='P'+IntToClaveNum(xpos,2)+'0'+NivelPrec+'000'+FiltraStrNum(FormatFloat('000.00',snimporte))+'0';
    TPosCarga[xpos].ImportePreset:=SnImporte;
    TPosCarga[xpos].MontoPreset:='$ '+FormatoMoneda(SnImporte);
  end
  else begin // PRESET LITROS
    for xp:=1 to 4 do
      if CombustibleEnPosicion(xpos,xp)=xcomb then
        ss:='P'+IntToClaveNum(xpos,2)+'1'+NivelPrec+'00'+FiltraStrNum(FormatFloat('000.00',snlitros))+'0'+inttostr(xp);
    TPosCarga[xpos].ImportePreset:=SnLitros;
    TPosCarga[xpos].MontoPreset:=FormatoMoneda(SnLitros)+' lts';
  end;
  ComandoConsolaBuff(ss);
  EsperaMiliSeg(100);
  if DMCONS.ReautorizaPam='Si' then begin
    TPosCarga[xpos].CmndOcc:=ss;
    TPosCarga[xpos].HoraOcc:=now;
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

procedure TFDISGATEWAY.Timer3Timer(Sender: TObject);
const timpo:array[0..4] of real = (50,100,150,200,300);
      tpos:array[0..2] of integer = (2,1,2);
var xpos,rr,xpa,xp,xcomb:integer;
    lin:string;
    //xpre:real;
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
                        xp:=Random(2)+1;
                        if xp>TPosCarga[xpos].NoComb then
                          xp:=TPosCarga[xpos].NoComb;
                        TPosCarga[xpos].posactual:=xp;
                        xcomb:=CombustibleEnPosicion(xpos,xp);

                        TPosCarga[xpos].volumen:=dividefloat(Timpo[rr],TabComb[xcomb].Precio);
                        TPosCarga[xpos].importe:=timpo[rr];
                        TPosCarga[xpos].precio:=TabComb[xcomb].Precio;
                        TPosCarga[xpos].hora:=time;
                      end;
                end;
              end
              else begin
                for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
                  if (EmularEstatus[xpos]='2')and((Time-Hora)>5*tmSegundo)then
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
              Linea:=copy(Lin,1,3)+IntToStr(TPosCarga[xpos].TComb[xpa])+'1'
                     +FiltraStrNum(FormatFloat('00000.000',TPosCarga[xpos].volumen))
                     +FiltraStrNum(FormatFloat('000000.00',TPosCarga[xpos].importe))
                     +'0'+FiltraStrNum(FormatFloat('00.00',TPosCarga[xpos].precio))+'0';

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

procedure TFDISGATEWAY.registro(valor:integer;variable:string);
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

procedure TFDISGATEWAY.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISGATEWAY.lee_registro;
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
    finally
      Registry.CloseKey;
      Registry.Free;
      registro(0,'Estado');
    end;
  end;
end;

  
procedure TFDISGATEWAY.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISGATEWAY.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    for i:=1 to NoComb do begin
      if TPosx[i]=xposcarga then
        result:=TComb[i];
    end;
  end;
end;

function TFDISGATEWAY.PosicionDeCombustible(xpos,xcomb:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    if xcomb>0 then begin
      for i:=1 to NoComb do begin
        if TComb[i]=xcomb then
          result:=TPosx[i];
      end;
    end
    else result:=1;
  end;
end;

procedure TFDISGATEWAY.Button3Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISGATEWAY.Socket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var C:Char;
begin
  try
    primeraRespuesta:=true;
    SwEspera:=false;
    ContadorAlarma:=0;
    Timer1.Enabled:=false;
    try
      LineaBuff:=Socket.ReceiveText;
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
          Linea:=c;
          FinLinea:=true;
        end;
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
      end
      else SwEspera:=true;
    except
      on e:Exception do begin
        DMCONS.AgregaLog('ERROR LECTURA PUERTO: '+e.Message);
        Socket1.Active:=false;
        Button1Click(nil);
      end;
    end;
  finally
    primeraRespuesta:=False;
    Timer1.Enabled:=true;
  end;
end;

function TFDISGATEWAY.ServicioCorriendo(sService: PChar): Boolean;
var
  SCManHandle, SvcHandle: SC_Handle;
  SS: TServiceStatus;
  dwStat: DWORD;
begin
  dwStat := 0;

  SCManHandle := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
  if (SCManHandle > 0) then
  begin
    SvcHandle := OpenService(SCManHandle, sService, SERVICE_QUERY_STATUS);

    if (SvcHandle > 0) then
    begin

      if (QueryServiceStatus(SvcHandle, SS)) then
        dwStat := ss.dwCurrentState;
      CloseServiceHandle(SvcHandle);
    end;
    CloseServiceHandle(SCManHandle);
  end;
  Result := SERVICE_RUNNING = dwStat;
end;

procedure TFDISGATEWAY.SetFolioOG(xpos, xfolioOG: Integer);
begin
  with DMCONS do begin
    try
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DPVGMOVI SET IDTRANSACCIONOG='+IntToStr(xfolioOG)+' WHERE FOLIO=(SELECT MAX(FOLIO) FROM DPVGMOVI WHERE POSCARGA='+IntToStr(xpos)+')');
      Q_Auxi.ExecSQL;
    finally
      folioOGGen:=xfolioOG;
      Q_Auxi.Close;
    end;
  end;
end;

end.

