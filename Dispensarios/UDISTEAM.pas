unit UDISTEAM;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  IBCtrls, SIBEABase, SIBFIBEA, FIBDatabase, pFIBDatabase, UIMGUTIL,
  dxGDIPlusClasses,ShellApi;

Const MaxEsperaRsp=2;
      MCxP=4;

type
  TFDISTEAM = class(TForm)
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
    Label2: TLabel;
    Button1: TButton;
    Timer2: TTimer;
    StaticText7: TStaticText;
    Label4x: TLabel;
    TL_BombACTIVO: TStringField;
    TL_BombIMPRIMEAUTOM: TStringField;
    TL_BombDIGITOAJUSTEPRECIO: TIntegerField;
    TL_BombCAMPOLECTURA: TStringField;
    TL_BombMODOOPERACION: TStringField;
    StaticText6: TStaticText;
    Image1: TImage;
    PageControl1: TPageControl;
    StaticText8: TStaticText;
    Button2: TButton;
    Button4: TButton;
    AbrirUbicacin1: TMenuItem;
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
    procedure Timer2Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    SwAplicaCmnd,
    SwInicio:boolean;
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwEspera,
    SwComandoB,
    FinLinea:boolean;
    ContCmndU,
    ContEspera,
    ContEsperaPaso2,
    StEsperaPaso3,
    ContEsperaPaso3,
    NumPaso,
    ContBuffLleno,
    errbcc,
    PosCiclo,
    xposactual,
    PosicionActual:integer;
    swcierrabd,
    swprocesando:boolean;

    UltimoStatus:string;
    SnPosCarga:integer;
    SnImporte,SnLitros:real;
    EmularEstatus,
    LineaEmular:string;
    CheckSumB,
    SwMensaje:boolean;
    ContLog,
    ContadorAlarma:integer;
  public
    { Public declarations }
    function StringCom(ss:string):string;
    procedure ComandoConsola(ss:string);
    procedure ComandoConsolaBuff(ss:string;swinicio:boolean);
    procedure ProcesaLinea(checksum:boolean);
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    procedure DespliegaMemo4(lin:string);
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    function PosicionDeCombustible(xpos,xcomb:integer):integer;
    procedure EnviaPreset(var rsp:string;xcomb:integer;swpreset:boolean);
    function ComandoB(xdisp,xlado:integer):string;
    function ComandoA(xdisp,xlado,xtipo:integer):string;
    function ComandoS(xdisp,xlado:integer;ximpo:real):string;
    function ComandoL(xdisp,xlado:integer;xlitros:real):string;
    function ComandoU(xdisp:integer; xprec1,xprec2,xprec3:real):string;
    function ComandoC(xdisp:integer):string;
    function ComandoD(xdisp:integer):string;
    function ComandoN(xdisp,xlado,xprod:integer):string;
    function StrToHexSep(ss:string):string;
    function HexSepToStr(ss:string):string;
    function HexToBinario(ss:string):string;
    function DamePosTeam(ss:string; swlado:boolean):integer;
    function ValidaChecksumTeam(LineaTimer:string):boolean;
  end;

type
     tiposcarga = record
       dispensario:integer;
       lado       :integer;
       estatus    :integer;
       descestat:string[20];
       importe,
       volumen,
       precio     :real;
       importepre,
       volumenpre,
       preciopre,
       importenvo,
       volumennvo,
       precionvo :real;
       impopreset :real;
       importeant :real;
       Isla,
       PosActual  :integer; // Posicion del combustible en proceso: 1..NoComb
       PosAutorizada:integer;
       estatusant:integer;
       NoComb     :integer; // Cuantos combustibles hay en la posicion
       TComb      :array[1..MCxP] of integer; // Claves de los combustibles
       TPos       :array[1..MCxP] of integer;
       TDiga      :array[1..MCxP] of integer;
       TMang      :array[1..MCxP] of integer;
       TotalLitros:array[1..MCxP] of real;
       SwDesp:boolean;
       SwA:boolean;
       SwAdic:boolean;
       Hora:TDateTime;
       SwInicio:boolean;
       SwInicio2:boolean;
       SwPreset,
       SwCargaTotales,
       SwChecaAdic,
       IniciaCarga,
       SwPrepago      :boolean;
       ContTotales    :byte;
       ActualizarPrecio:Boolean;
       Mensaje:string[30];
       swcargando:boolean;
       swcargapreset:boolean;
       SwActivo,
       SwDesHabilitado:boolean;
       ModoOpera:string[8];
       ContEsperaB,
       StCero   :integer;
       TipoPago:integer;
       TipoPagoAnt:integer;
       FinVenta:integer;
       Boucher:string[12];

       swarosmag:boolean;
       AuxCmndN,
       aros_cont,
       aros_mang,
       aros_cte,
       aros_vehi:integer;
       swarosmag_stop:boolean;

     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=5;
      MaxEspera3=5;


var
  FDISTEAM: TFDISTEAM;
  TPosCarga:array[1..100] of tiposcarga;
  MaxPosCarga:integer;
  AvanceBar:integer;
  SwSolOk:boolean;
  ContDA,
  StErrSol:integer;
  ruta_db:string;
  // CONTROL TRAFICO COMANDOS
  ListaAux,
  ListaCmnd    :TStrings;
  LinCmnd      :string;
  CharCmnd     :char;
  SwEsperaRsp  :boolean;
  ContEsperaRsp:integer;

  NumPaso      :integer;
  SwCerrar    :boolean;
  HoraComandoB:Tdatetime;
  HoraRspB:Tdatetime;
  ContB:integer;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}

procedure TFDISTEAM.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=40 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISTEAM.DespliegaPrecios;
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


procedure TFDISTEAM.IniciaBaseDeDatos;
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
        DespliegaMemo4('Puerto: '+inttostr(ptPuerto)+'  '+inttostr(ptBaudios)+' '+ptParidad+' '
                       +inttostr(ptBitsDatos)+' '+inttostr(ptBitsParada));
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

procedure TFDISTEAM.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum,
    xdisp,xlado:integer;
    existe:boolean;
begin
  with DMCONS do begin
    swcierrabd:=false;
    ListView1.Items.Clear;
    MaxPosCarga:=0;
    for i:=1 to 100 do with TPosCarga[i] do begin
      dispensario:=0;
      lado:=0;
      estatus:=0;
      estatusant:=0;
      posactual:=0;
      NoComb:=0;
      SwInicio:=true;
      SwInicio2:=true;
      IniciaCarga:=false;
      SwPrepago:=false;
      SwPreset:=false;
      ActualizarPrecio:=false;
      Mensaje:='';
      importe:=0;
      impopreset:=0;
      importeant:=0;
      volumen:=0;
      precio:=0;
      importepre:=0;
      volumenpre:=0;
      preciopre:=0;
      importenvo:=0;
      for j:=1 to MCxP do
        TotalLitros[j]:=0;
      SwCargando:=false;
      SwCargaPreset:=false;
      SwCargaTotales:=true; ContTotales:=0;
      SwChecaAdic:=false;
      PosAutorizada:=0;
      SwDeshabilitado:=false;
      SwArosMag:=false;
      SwArosMag_stop:=false;
      SwActivo:=false;
      SwAdic:=false;
      ContEsperaB:=0;
      StCero:=0;
      tipopago:=0;
      tipopagoant:=0;
      finventa:=0;
      boucher:='';
    end;
    // CARGA DEFAULTS
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
    // FIN
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xpos:=Q_BombIbPosCarga.AsInteger;
      xdisp:=Q_BombIbTeam_NoDisp.AsInteger;
      xlado:=Q_BombIbTeam_Lado.AsInteger;
      xisla:=Q_BombIbIsla.asinteger;
      xcomb:=Q_BombIbCombustible.AsInteger;
      if (xpos>MaxPosCarga)and(xpos<=DMCONS.MaximoDePosiciones) then begin
        MaxPosCarga:=xpos;
        ListView1.Items.Add;
        ListView1.Items[MaxPosCarga-1].Caption:=IntToClaveNum(xpos,2);
        ListView1.Items[MaxPosCarga-1].ImageIndex:=0;
      end;
      with TPosCarga[xpos] do begin
        Dispensario:=xdisp;
        Lado:=xlado;
        Isla:=xisla;
        ActualizarPrecio:=false;
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
          else if NoComb<=MCxP then
            TPos[NoComb]:=NoComb
          else
            TPos[NoComb]:=1;
          TDiga[TPos[NoComb]]:=Q_BombIbCon_DigitoAjuste.AsInteger;
          TMang[NoComb]:=Q_BombIbManguera.AsInteger;
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


procedure TFDISTEAM.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      ContDA:=0;
      SwMensaje:=false;
      ErrorInic:=true;
      SwInicio:=false;
      IniciaBaseDeDatos;
      ListBox1.ItemIndex:=0;
      SwProcesando:=false;
      SwEspera:=false;
      SwEsperaRsp:=false;
      ContCmndU:=0;
      ContEspera:=0;
      ContEsperaPaso2:=0;
      StEsperaPaso3:=0;
      ContEsperaPaso3:=0;
      ContBuffLleno:=0;
      NumPaso:=0;
      StaticText5.Caption:=IntToStr(NumPaso);
      Linea:='';
      LineaBuff:='';
      LineaTimer:='';
      errbcc:=0;
      FinLinea:=false;
      IniciaEstacion;
      ListBox1.SetFocus;
      Timer1.Enabled:=true;
      Timer2.Enabled:=true;
      DMCONS.T_ConfIb.Active:=true;
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

function TFDISTEAM.StringCom(ss:string):string;
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

procedure TFDISTEAM.LimpiaConsola;
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

procedure TFDISTEAM.DespliegaPosCarga(xpos:integer);
var i,xp,rango,posi,posf,xcomb,xc:integer;
    lin,xnombre,xdescrip:string;
    xprecio,xprecio2,xdifprec:real;
begin
  try
    try
      StaticText5.Caption:=IntToStr(NumPaso);
      rango:=ListBox1.ItemIndex+1;
      if rango=0 then
        rango:=1;
      posi:=rango*4-3;
      posf:=rango*4;
      with TPosCarga[xpos] do begin
        xdescrip:=descestat;
        xcomb:=CombustibleEnPosicion(xpos,PosActual);
        if xcomb in [1..maxcomb] then
          xnombre:=DMCONS.TabComb[xcomb].Nombre;
        if xpos in [posi..posf] then begin
          i:=xpos-posi+1;
          TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(xpos,2)+' '+'('+inttoclavenum(dispensario,2)+'-'+inttostr(lado)+')';
          if not SwDesHabilitado then begin
            TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:=xdescrip;
            case estatus of
              5:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClLime;
              1:if not SwPreset then
                  TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClRed
                else
                  TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClGray;
              2:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClGray;
              3,4:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClYellow;
              7:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClBlue;
              else TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
            end;
          end
          else begin
            TPanel(FindComponent('panelPC'+IntToStr(i))).Caption:='Deshabilidado';
            TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClWhite;
          end;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Clear;
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('$ '+FormatFloat('###,##0.00',importe)+' Pesos');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.00',precio)+' $/Lts');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(xnombre);
          if swmensaje then
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(Mensaje)
          else
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
          for xp:=1 to NoComb do begin
            xcomb:=CombustibleEnPosicion(xpos,xp);
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                     ' '+ExtraeElemStrSep(DMCONS.TabComb[xcomb].Nombre,1,' ')
                     );
          end;
        end;
      end;

      // Refresca Listas
      for i:=1 to MaxPosCarga do with TPosCarga[i] do begin
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
            SwCargaTotales:=true; ContTotales:=0;
            try
              try
                lin:='01';
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
                T_MoviIbPosCarga.AsInteger:=i;
                xcomb:=CombustibleEnPosicion(i,PosActual);
                lin:='02';
                if TabComb[xcomb].Agruparcon>0 then begin
                  T_MoviIbKilometraje.asinteger:=TMang[PosActual];
                  xc:=TabComb[xcomb].Agruparcon;
                  if TabComb[xc].Activo then
                    xcomb:=xc;
                end;
                lin:='03';
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
                importeant:=T_MoviIbImporte.AsFloat;
                T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLitros[1],3);
                T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLitros[2],3);
                T_MoviIbTotal03.AsFloat:=AjustaFloat(TotalLitros[3],3);
                T_MoviIbTotal04.AsFloat:=AjustaFloat(TotalLitros[4],3);
                T_MoviIbTag.AsInteger:=0;
                lin:='04';
                T_MoviIbManguera.AsInteger:=TMang[PosActual];
                T_MoviIbTipoPago.asinteger:=TPosCarga[i].TipoPago;
                T_MoviIbBoucher.Asstring:=Boucher;
                T_MoviIbCuponImpreso.AsString:='No';
                T_MoviIbReferenciaBitacora.AsInteger:=0;
                T_MoviIbGasId.AsInteger:=Random(1000000);
                lin:='05';
                TPosCarga[i].TipoPagoAnt:=TPosCarga[i].TipoPago;
                TPosCarga[i].TipoPago:=0;
                Boucher:='';
                lin:='06';
                T_MoviIb.post;
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

procedure TFDISTEAM.ProcesaLinea(checksum:boolean);
label uno;
var lin,ss,ss2,rsp,rsp2,descrsp,xestado,xmodo,
    xdisp2,xmodo2,xestado2:string;
    simp,spre,sval:string[20];
    i,j,xpos,ii,xdisp,xcmnd:integer;
    XMANG,XCTE,XVEHI,
    xp,xpr,xcomb,xfolio:integer;
    xestatus:char;
    ximporte:real;
    xLista:TStrings;
    ximpo,xdif,
    xprecio,
    xvol:real;
    xprec:array[1..3] of real;
begin
  try
    if LineaTimer='' then
      exit;
    if not checksum then
      exit;
    lin:=LineaTimer;
    LineaTimer:='';
    case lin[1] of
     'B':begin // pide estatus de todas las bombas
           NumPaso:=1;
           StaticText5.Caption:=IntToStr(NumPaso);
           ContEspera:=0;
           UltimoStatus:=LineaTimer;
           ss:=copy(lin,4,length(lin)-3);
           for xpos:=1 to MaxPosCarga do begin
             with TPosCarga[xpos] do begin
               xPosActual:=StrToIntDef(ss[xpos*2-1],0);
               if xposactual>0 then
                 PosActual:=xposactual;
               if PosActual=0 then begin
                 for i:=1 to NoComb do begin
                   xcomb:=TComb[i];
                   if abs(precio-DMCONS.TabComb[xcomb].precio)<0.1 then
                     PosActual:=TPos[i];
                 end;
               end;
               if estatusant<>estatus then begin
                 SwPreset:=false;
                 SwA:=true; //CAMBIO
               end;
               estatusant:=estatus;
               estatus:=StrToIntDef(ss[xpos*2],0);
               if (estatus=0)and(stcero<=3) then begin
                 inc(stcero);
                 estatus:=estatusant;
               end
               else stcero:=0;
               Mensaje:='Pos = '+inttostr(posactual);
               case estatus of
                 0:begin
                     descestat:='---';
                   end;
                 1:begin
                     descestat:='Inactivo';
                     if estatusant<>1 then begin
                       PosAutorizada:=0;
                       FinVenta:=0;
                       TipoPago:=0;
                     end;
                   end;
                 2:begin
                     descestat:='Autorizado';
                   end;
                 3:begin
                     swcargando:=false;
                     descestat:='Pistola Levantada';
                   end;
                 4:begin
                     descestat:='Listo para Despachar';
                   end;
                 5:begin
                     descestat:='Despachando';
                     IniciaCarga:=true;
                     if not SwCargando then
                       SwCargaPreset:=true;
                     swcargando:=true;
                     if estatusant<>5 then begin
                       importenvo:=0;
                       volumennvo:=0;
                       precionvo:=0;
                     end;
                   end;
                 6:begin
                     descestat:='Detenido';
                   end;
                 7:descestat:='Fin de Venta';
                 8:descestat:='Fin Despacho';
                 9:descestat:='Error';
               end;
             end;
           end;
           for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
             // Actualiza Precios
             if ActualizarPrecio then with DMCONS do begin
               xcomb:=CombustibleEnPosicion(xpos,1);
               if DMCONS.ValidaCifra(TabComb[xcomb].precio,2,2)='OK' then begin
                 if TabComb[xcomb].precio>=0.01 then begin
                   contlog:=20;
                   ii:=Trunc(TabComb[xcomb].precio*100+0.5);
                   ss:='U'+IntToClaveNum(xpos,2)+inttoclavenum(ii,4);
                   if NoComb=1 then begin
                     ss:=ss+inttoclavenum(ii,4)+inttoclavenum(ii,4);
                   end
                   else if NoComb=2 then begin
                     xcomb:=CombustibleEnPosicion(xpos,2);
                     ii:=Trunc(TabComb[xcomb].precio*100+0.5);
                     ss:=ss+inttoclavenum(ii,4)+'0000';
                   end
                   else begin
                     xcomb:=CombustibleEnPosicion(xpos,2);
                     ii:=Trunc(TabComb[xcomb].precio*100+0.5);
                     ss:=ss+inttoclavenum(ii,4);
                     xcomb:=CombustibleEnPosicion(xpos,3);
                     ii:=Trunc(TabComb[xcomb].precio*100+0.5);
                     ss:=ss+inttoclavenum(ii,4);
                   end;
                   EsperaMiliSeg(300);
                   ComandoConsola(ss);
                   EsperaMiliSeg(300);
                 end;
               end;
               ActualizarPrecio:=false;
             end;
           end;
         end;
     'A':begin // pide estatus de una bomba
           NumPaso:=2;
           StaticText5.Caption:=IntToStr(NumPaso);
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if (xpos>=1)and(xpos<=DMCONS.MaximoDePosiciones) then begin
             ContEsperaPaso2:=0;
             with TPosCarga[xpos] do begin
               try
                 importepre:=importenvo;
                 volumenpre:=volumennvo;
                 preciopre:=precionvo;

                 swinicio2:=false;
                 volumen:=StrToFloat(copy(lin,5,6))/100;
                 simp:=copy(lin,11,8);
                 spre:=copy(lin,19,4);
                 importe:=StrToFloat(simp)/100;
                 precio:=StrToFloat(spre)/100;

                 importenvo:=importe;
                 volumennvo:=volumen;
                 precionvo:=precio;
                 
                 if (Estatus in [1,7,8])and(swcargando) then begin
                   if (importenvo<importepre) then begin
                     DMCONS.AgregaLog('FIN DE VENTA CORREGIDO');
                     importe:=importepre;
                     volumen:=volumenpre;
                     precio:=preciopre;
                   end
                   else
                     DMCONS.AgregaLog('FIN DE VENTA');
                   swcargando:=false;
                   swdesp:=true;
                 end;
                 DespliegaPosCarga(xpos);
                 if (estatus=8) then
                   finventa:=2;
                 if (TPosCarga[xpos].finventa=0) then begin
                   if Estatus in [1,7,8] then begin
                     if DMCONS.swemular then
                       EmularEstatus[2*xpos]:='1';
                   end;
                 end;
               except
                 DespliegaMemo4(lin+' '+fechapaq(date)+' '+HoraPaq(time));
               end;
             end;
           end;
         end;
     'S',
     'L':begin
         end;
     'U':begin
           xpos:=StrToIntDef(copy(lin,2,2),0);
           xprec[1]:=strtointdef(copy(Lin,4,4),0)/100;
           xprec[2]:=strtointdef(copy(Lin,8,4),0)/100;
           xprec[3]:=strtointdef(copy(Lin,12,4),0)/100;
           xdisp:=TPosCarga[xpos].dispensario;
           for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do if dispensario=xdisp then begin
             ActualizarPrecio:=false;
           end;
         end;
     'N':begin // totales de la bomba
           NumPaso:=3;
           StaticText5.Caption:=IntToStr(NumPaso);
           xpos:=StrToIntDef(copy(lin,2,2),0);
           ii:=StrToIntDef(copy(lin,4,1),1);
           if (xpos>=1)and(xpos<=MaxPosCarga) then begin
             with TPosCarga[xpos] do begin
               ss:=copy(lin,5,12);
               if NoComb=1 then
                 ii:=1;
               if DMCONS.TresDecimTotTeam='Si' then
                 TotalLitros[ii]:=StrToFloat(ss)/1000
               else
                 TotalLitros[ii]:=StrToFloat(ss)/100;
               DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
               DespliegaPosCarga(xpos);
             end;
           end;
         end;
    end;
    if (ListaCmnd.Count>0)and(not SwEsperaRsp) then begin
      StaticText6.Caption:=inttostr(ListaCmnd.Count);
      ss:=ListaCmnd[0];
      ListaCmnd.Delete(0);
      ComandoConsola(ss);
      exit;
    end
    else begin
      inc(NumPaso);
      PosicionActual:=0;
    end;
    StaticText5.Caption:=IntToStr(NumPaso);
    // checa lecturas de dispensarios
    if NumPaso=2 then begin
      if PosicionActual<MaxPosCarga then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if (estatus<>estatusant)or(estatus>=5)or(SwA)or(swinicio2)or(swcargando) then begin
              SwA:=false;
              ComandoConsolaBuff('A'+IntToClaveNum(PosicionActual,2)+'1',false); // pesos
            end
            else
              DespliegaPosCarga(PosicionActual);
          end;
        until (PosicionActual>=MaxPosCarga);
      end;
      NumPaso:=3;
      StaticText5.Caption:=IntToStr(NumPaso);
      PosicionActual:=0;
    end;
    // Lee Totales
    if NumPaso=3 then with DMCONS do begin
      // GUARDA VALORES DE DISPENSARIOS CARGANDO
      try
        T_ConfIb.Active:=true;
        try
          if not T_ConfIb.IsEmpty then begin

            xestado2:='';xdisp2:='';xmodo2:='';
            try
              if dmcons.MaximoDePosiciones<24 then begin
                xdisp2:=DameDispensarios;

                // leo modo de operacion al final de la linea
                xmodo2:=ExtraeElemStrSep(xdisp2,2,'&');
                if length(xmodo2)>dmcons.MaximoDePosiciones then
                  delete(xmodo2,1,dmcons.MaximoDePosiciones)
                else xmodo2:='';

                // leo estados al principio de la linea
                ss:=ExtraeElemStrSep(xdisp2,1,'&');
                xestado2:=ExtraeElemStrSep(ss,1,'#');
                if xestado2<>'' then
                  if xestado2[1]='D' then
                    delete(xestado2,1,1);
                if length(xestado2)>dmcons.MaximoDePosiciones then
                  delete(xestado2,1,dmcons.MaximoDePosiciones)
                else xestado2:='';

                // saco lecturas de cada posicion
                ii:=NoElemStrSep(ss,'#');
                xdisp2:='';
                for i:=2 to ii do begin
                  ss2:=ExtraeElemStrSep(ss,i,'#');
                  rsp:=ExtraeElemStrSep(ss2,1,'/');
                  xpos:=strtointdef(rsp,0);
                  if xpos>dmcons.MaximoDePosiciones then
                    xdisp2:=xdisp2+'#'+ss2;
                end;
              end;
            except
            end;

            lin:='';xestado:='';xmodo:='';
            for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
              xmodo:=xmodo+ModoOpera[1];
              if not SwDesHabilitado then begin
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
              end
              else xestado:=xestado+'7'; // Deshabilitado
              xcomb:=CombustibleEnPosicion(xpos,PosActual);
              ss:=inttoclavenum(xpos,2)+'/'+inttostr(xcomb);
              ss:=ss+'/'+FormatFloat('###0.##',volumen);
              ss:=ss+'/'+FormatFloat('#0.##',precio);
              ss:=ss+'/'+FormatFloat('####0.##',importe);
              lin:=lin+'#'+ss;
            end;
            if lin='' then
              lin:=xestado+xestado2+'#'
            else
              lin:=xestado+xestado2+lin;
            lin:=lin+xdisp2+'&'+xmodo+xmodo2;
            DMCONS.ActualizaDispensarios('D'+lin);
          end;
        finally
          T_ConfIb.Active:=false;
        end;
      except
      end;
      // FIN

      if PosicionActual<MaxPosCarga then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if swcargatotales then begin
              for i:=1 to NoComb do begin
                Esperamiliseg(500);
                if NoComb>1 then
                  ComandoConsolaBuff('N'+IntToClaveNum(PosicionActual,2)+inttostr(i),false) // Totales
                else // diesel
                  ComandoConsolaBuff('N'+IntToClaveNum(PosicionActual,2)+inttostr(3),false); // Totales
              end;
              inc(ContTotales);
              //if ContTotales=3 then
                swcargatotales:=false;
            end
            else
              DespliegaPosCarga(PosicionActual);
          end;
        until (PosicionActual>=MaxPosCarga);
      end;
      NumPaso:=4;
      StaticText5.Caption:=IntToStr(NumPaso);
      PosicionActual:=0;
    end;
    if (NumPaso=4) then with DMCONS do begin
      // Checa Comandos
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
            if (xpos in [0..MaxPosCarga]) then begin
              if xpos=0 then begin
                for xpos:=1 to MaxPosCarga do
                  ComandoConsolaBuff('C'+inttoclavenum(xpos,2),false);
              end
              else begin
                ComandoConsolaBuff('C'+inttoclavenum(xpos,2),false);
                rsp:='OK';
              end;
            end
            else SwAplicaCmnd:=false;
          end
          // CMND: DESACTIVA MODO PREPAGO
          else if ss='DMP' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos in [0..MaxPosCarga]) then begin
              if xpos=0 then begin
                for xpos:=1 to MaxPosCarga do
                  ComandoConsolaBuff('D'+inttoclavenum(xpos,2),false);
              end
              else begin
                ComandoConsolaBuff('D'+inttoclavenum(xpos,2),false);
                rsp:='OK';
              end;
            end
            else SwAplicaCmnd:=false;
          end
          // ORDENA CARGA DE COMBUSTIBLE EN IMPORTE           OCC 1 10 1 1 1
          else if ss='OCC' then begin
            SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (SnPosCarga in [1..MaxPosCarga]) then begin
              try
                SnImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                SnLitros:=0;
                rsp:=ValidaCifra(SnImporte,4,2);
                if rsp='OK' then
                  if (SnImporte<1) then
                    rsp:='Importe minimo permitido: $1.00';
              except
                rsp:='Error en Importe';
              end;
              if rsp='OK' then begin
                xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
                xp:=PosicionDeCombustible(SnPosCarga,xcomb);
                if xp>0 then begin
                  TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                  TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                  TPosCarga[SnPosCarga].boucher:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,7,' ');
                  EnviaPreset(rsp,xcomb,false);
                end
                else rsp:='Combustible no existe en esta posición';
              end;
            end;
          end
          // ORDENA CARGA DE COMBUSTIBLE LITROS
          else if ss='OCL' then begin
            SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (SnPosCarga in [1..MaxPosCarga]) then begin
              try
                SnLitros:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                SnImporte:=0;
                rsp:=ValidaCifra(SnLitros,4,2);
                if rsp='OK' then
                  if (SnLitros<0.5) then
                    rsp:='Valor minimo permitido: 0.5 lts';
              except
                rsp:='Error en Litros';
              end;
              if rsp='OK' then begin
                xcomb:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' '),0);
                xp:=PosicionDeCombustible(SnPosCarga,xcomb);
                if xp>0 then begin
                  TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                  TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                  TPosCarga[SnPosCarga].boucher:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,7,' ');
                  EnviaPreset(rsp,xcomb,false);
                end
                else rsp:='Combustible no existe en esta posición';
              end;
            end;
          end
          // ORDENA FIN DE VENTA
          else if ss='FINV' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            rsp:='OK';
            if (xpos in [1..MaxPosCarga]) then with TPosCarga[xpos] do begin
              TipoPago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
              if (not SwCargando)and(Estatus in [1,7]) then begin // EOT
                finventa:=0;
                SwCargaTotales:=true; ContTotales:=0;
                try
                  EsperaMiliSeg(100);
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
                except
                  on e:exception do
                  DespliegaMemo4('ERROR al cambiar tipo de pago: '+e.Message);
                end;
                DespliegaPosCarga(xpos);
                Button1.Click;
              end
              else
                rsp:='Posicion no esta en fin de venta';
            end
            else rsp:='Posicion de Carga no Existe';
          end
          // CMND: DESHABILITA POSICIOND DE CARGA
          else if ss='DPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            // Primero activa modo prepago
            if (xpos in [0..MaxPosCarga]) then begin
              if xpos=0 then begin
                for xpos:=1 to MaxPosCarga do
                  ComandoConsolaBuff('C'+inttoclavenum(xpos,2),false);
              end
              else begin
                ComandoConsolaBuff('C'+inttoclavenum(xpos,2),false);
                rsp:='OK';
              end;
            end
            else SwAplicaCmnd:=false;
            // Luego deshabilita
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if xpos in [1..MaxPosCarga] then
                TPosCarga[xpos].SwDesHabilitado:=true;
            end
            else SwAplicaCmnd:=false;
          end
          // CMND: HABILITA POSICIOND DE CARGA
          else if ss='HPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            // Primero desactiva modo prepago
            if (xpos in [0..MaxPosCarga]) then begin
              if xpos=0 then begin
                for xpos:=1 to MaxPosCarga do
                  ComandoConsolaBuff('D'+inttoclavenum(xpos,2),false);
              end
              else begin
                ComandoConsolaBuff('D'+inttoclavenum(xpos,2),false);
                rsp:='OK';
              end;
            end
            else SwAplicaCmnd:=false;
            // luego habilita
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if xpos in [1..MaxPosCarga] then
                TPosCarga[xpos].SwDesHabilitado:=false;
            end
            else SwAplicaCmnd:=false;
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
        end;
      end;

      NumPaso:=1;
      StaticText5.Caption:=IntToStr(NumPaso);
    end;
  except
    with DMCONS do begin
      if (T_ConfIb.State in [dsInsert,dsEdit]) then
        T_ConfIb.Cancel;
    end;
  end;
end;


procedure TFDISTEAM.ComandoConsolaBuff(ss:string;swinicio:boolean);
begin
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

function TFDISTEAM.StrToHexSep(ss:string):string;
var i:integer;
    xaux:string;
begin
  xaux:=inttohex(ord(ss[1]),2);
  for i:=2 to length(ss) do
    xaux:=xaux+' '+inttohex(ord(ss[i]),2);
  result:=xaux;
end;

function TFDISTEAM.HexSepToStr(ss:string):string;
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

function TFDISTEAM.HexToBinario(ss:string):string;
var nn,n1,n2:byte;
  function ConvierteBin(nn:byte):string;
  begin
    case nn of
      0:result:='0000';
      1:result:='0001';
      2:result:='0010';
      3:result:='0011';
      4:result:='0100';
      5:result:='0101';
      6:result:='0110';
      7:result:='0111';
      8:result:='1000';
      9:result:='1001';
    end;
  end;
begin
  nn:=strtointdef(ss,0);
  n1:=(nn)div(10);
  n2:=(nn)mod(10);
  result:=ConvierteBin(n1)+ConvierteBin(n2);
end;

function TFDISTEAM.DamePosTeam(ss:string; swlado:boolean):integer;
var xdisp,xlado,xpos:integer;
    sd,sl:string;
begin
  result:=0;
  sd:=extraeelemstrsep(ss,2,' ');
  xdisp:=strtointdef(sd,0);
  if swlado then begin
    sl:=extraeelemstrsep(ss,5,' ');
    xlado:=strtointdef(sl,0);
  end
  else xlado:=0;
  xpos:=1;
  while xpos<=MaxPosCarga do with TPosCarga[xpos] do begin
    if (dispensario=xdisp)and((not swlado)or(xlado=lado)) then begin
      result:=xpos;
      exit;
    end;
    inc(xpos);
  end;
end;

function TFDISTEAM.ComandoB(xdisp,xlado:integer):string;   // Leer estatus de bomba
begin
  result:='A3 '+inttoclavenum(xdisp,2)+' 00 02 '+inttoclavenum(xlado,2);
end;

function TFDISTEAM.ComandoA(xdisp,xlado,xtipo:integer):string; // Leer display
begin
  result:='A1 '+inttoclavenum(xdisp,2)+' 00 03 '+inttoclavenum(xlado,2)+' '+inttoclavenum(xtipo,2);
end;

function TFDISTEAM.ComandoS(xdisp,xlado:integer;ximpo:real):string; // Presetear
var ss,ss2:string;
    ii:integer;
begin
  ss:='A5 '+inttoclavenum(xdisp,2)+' 00 07 '+inttoclavenum(xlado,2)+' 06';
  ii:=trunc(ximpo*100+0.5); ss2:=inttoclavenum(ii,8);
  result:=ss+' '+copy(ss2,1,2)+' '+copy(ss2,3,2)+' '+copy(ss2,5,2)+' '+copy(ss2,7,2);
end;

function TFDISTEAM.ComandoL(xdisp,xlado:integer;xlitros:real):string; // Presetear
var ss,ss2:string;
    ii:integer;
begin
  ss:='A5 '+inttoclavenum(xdisp,2)+' 00 07 '+inttoclavenum(xlado,2)+' 09';
  ii:=trunc(xlitros*1000+0.5); ss2:=inttoclavenum(ii,8);
  result:=ss+' '+copy(ss2,1,2)+' '+copy(ss2,3,2)+' '+copy(ss2,5,2)+' '+copy(ss2,7,2);
end;

function TFDISTEAM.ComandoU(xdisp:integer; xprec1,xprec2,xprec3:real):string;  // Cambio precios
var ss,ss2:string;
    ii:integer;
begin
  ss:='A6 '+inttoclavenum(xdisp,2)+' 00 08 ';
  ss:=ss+'06';
  ii:=trunc(xprec1*100+0.5); ss2:=inttoclavenum(ii,4);
  ss:=ss+' '+copy(ss2,1,2)+' '+copy(ss2,3,2);
  ii:=trunc(xprec2*100+0.5); ss2:=inttoclavenum(ii,4);
  ss:=ss+' '+copy(ss2,1,2)+' '+copy(ss2,3,2);
  ii:=trunc(xprec3*100+0.5); ss2:=inttoclavenum(ii,4);
  ss:=ss+' '+copy(ss2,1,2)+' '+copy(ss2,3,2);
  result:=ss;
end;

function TFDISTEAM.ComandoN(xdisp,xlado,xprod:integer):string;  // Totales
begin
  result:='A9 '+inttoclavenum(xdisp,2)+' 00 03 '+inttoclavenum(xlado,2)+' '+inttoclavenum(xprod,2);
end;

function TFDISTEAM.ComandoC(xdisp:integer):string; // Bloquea
var ss:string;
begin
  ss:='A0 '+inttoclavenum(xdisp,2)+' 00 02 ';
  ss:=ss+'06';
  result:=ss;
end;

function TFDISTEAM.ComandoD(xdisp:integer):string; // Desbloquea
var ss:string;
begin
  ss:='A0 '+inttoclavenum(xdisp,2)+' 00 02 ';
  ss:=ss+'09';
  result:=ss;
end;

procedure TFDISTEAM.ComandoConsola(ss:string);
var s1,s2,LinCmd2:string;
    n,i,xpos:integer;
    r1,r2,r3:real;
begin
  LinCmnd:=ss;
  CharCmnd:=LinCmnd[1];
  ContEsperaRsp:=0;
  if DMCONS.SwEmular then begin
    DMCONS.AgregaLog('E '+idSTX+ss+idETX+' ');
    LineaEmular:=ss;
    exit;
  end;
  inc(ContadorAlarma);
  case CharCmnd of
    'B':begin
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          if xpos in [1..MaxPosCarga] then with TPosCarga[xpos] do begin
            LinCmd2:=ComandoB(dispensario,lado);
            inc(ContEsperaB);
          end;
          HoraComandoB:=now;
          ContB:=0;
        end;
    'A':begin
          esperamiliseg(100);
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          s1:=copy(LinCmnd,4,1);
          n:=strtointdef(s1,0);
          if xpos in [1..MaxPosCarga] then with TPosCarga[xpos] do begin
            case n of
              0:LinCmd2:=ComandoA(dispensario,lado,0); // Litros
              1:LinCmd2:=ComandoA(dispensario,lado,1); // Pesos
            end;
          end;
        end;
    'S':begin
          esperamiliseg(500);
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          s1:=copy(LinCmnd,4,6);
          r1:=strtointdef(s1,0)/100;
          if xpos in [1..MaxPosCarga] then with TPosCarga[xpos] do
            LinCmd2:=ComandoS(dispensario,lado,r1);
        end;
    'L':begin
          esperamiliseg(500);
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          s1:=copy(LinCmnd,4,6);
          r1:=strtointdef(s1,0)/100;
          if xpos in [1..MaxPosCarga] then with TPosCarga[xpos] do
            LinCmd2:=ComandoL(dispensario,lado,r1);
        end;
    'U':begin  // Cambio Precio
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          s1:=copy(LinCmnd,4,4);
          r1:=strtointdef(s1,0)/100;
          s1:=copy(LinCmnd,8,4);
          r2:=strtointdef(s1,0)/100;
          s1:=copy(LinCmnd,12,4);
          r3:=strtointdef(s1,0)/100;
          with TPosCarga[xpos] do
            LinCmd2:=ComandoU(dispensario,r1,r2,r3);
        end;
    'C':begin  // Bloquea Dispensario
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          with TPosCarga[xpos] do
            LinCmd2:=ComandoC(dispensario);
        end;
    'D':begin  // Bloquea Dispensario
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          with TPosCarga[xpos] do
            LinCmd2:=ComandoD(dispensario);
        end;
    'N':begin
          s1:=copy(LinCmnd,2,2);
          xpos:=strtointdef(s1,0);
          s1:=copy(LinCmnd,4,1);
          TPosCarga[xpos].AuxCmndN:=strtointdef(s1,1);
          if xpos>0 then with TPosCarga[xpos] do
            LinCmd2:=ComandoN(dispensario,lado,TPosCarga[xpos].AuxCmndN);
        end;
    else exit;
  end;
  Timer1.Enabled:=false;
  try
    n:=0;
    for i:=5 to NoElemStrSep(LinCmd2,' ') do begin
      s2:=extraeelemstrsep(LinCmd2,i,' ');
      n:=n+strtointdef(s2,0);
    end;
    LinCmd2:=LinCmd2+' '+inttoclavenum(n,2);

    s1:=HexSepToStr(LinCmd2);
    DMCONS.AgregaLog('E '+StrToHexSep(s1));
    DespliegaMemo4('E '+StrToHexSep(s1));
    SwEsperaRsp:=true;
    if Ap1.Open then
      Ap1.OutPut:=s1;
    if CharCmnd='U' then
      ContCmndU:=5;
  finally
    Timer1.Enabled:=true;
  end;
end;

function TFDISTEAM.ValidaChecksumTeam(LineaTimer:string):boolean;
var cs,i,ne,val,tot:integer;
    ss:string;
begin
  result:=false;
  ne:=noelemstrsep(LineaTimer,' ');
  ss:=ExtraeElemStrSep(LineaTimer,ne,' ');
  cs:=StrToIntDef(ss,0);
  tot:=0;
  for i:=5 to ne-1 do begin
    ss:=ExtraeElemStrSep(LineaTimer,i,' ');
    val:=StrToIntDef(ss,0);
    tot:=tot+val;
  end;
  tot:=tot mod 100;
  result:=(tot=cs);
end;



procedure TFDISTEAM.Ap1TriggerAvail(CP: TObject; Count: Word);
var I,xpos,xcomb:Word;
    C:Char;
    ss,s1:string;
    csok:boolean;
begin
  ContEsperaRsp:=0;
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
      ss:=limpiastr(StrToHexSep(c));
      if (ss[1]='A')or(ss[1]='E') then // INICIA UN COMANDO
        linea:='';
      delete(LineaBuff,1,1);
      Linea:=Linea+C;
      LineaTimer:=StrToHexSep(Linea);
      if (copy(LineaTimer,1,2)='A3')and(noelemstrsep(LineaTimer,' ')=9) then
        FinLinea:=true
      else if (copy(LineaTimer,1,2)='A1')and(noelemstrsep(LineaTimer,' ')=11) then
        FinLinea:=true
      else if (copy(LineaTimer,1,2)='A5')and(noelemstrsep(LineaTimer,' ')=11) then
        FinLinea:=true
      else if (copy(LineaTimer,1,2)='A6')and(noelemstrsep(LineaTimer,' ')=12) then
        FinLinea:=true
      else if (copy(LineaTimer,1,2)='A0')and(noelemstrsep(LineaTimer,' ')=6) then
        FinLinea:=true
      else if (copy(LineaTimer,1,2)='A9')and(noelemstrsep(LineaTimer,' ')=12) then
        FinLinea:=true;
    end;
    if FinLinea then begin
      LineaTimer:=StrToHexSep(Linea);
      csok:=ValidaChecksumTeam(LineaTimer);
      if not csok then
        LineaTimer:=LineaTimer+' Error Checksum';
      DMCONS.AgregaLog('R '+LineaTimer);
      DespliegaMemo4('R '+LineaTimer);
      FinLinea:=false;
      if copy(LineaTimer,1,2)='A3' then begin  // Comando B
        if not csok then
          checksumb:=false;
        HoraRspB:=now;
        xpos:=DamePosTeam(LineaTimer,true);
        with TPosCarga[xpos] do begin
          ContEsperaB:=0;

          // Estatus del dispensario
          if csok then begin
            ss:=ExtraeElemStrSep(LineaTimer,6,' ');
            s1:=HexToBinario(ss);
            case s1[2] of // bit 6
              '0':ModoOpera:='Normal';
              '1':ModoOpera:='Prepago';
            end;
            case s1[7] of  // bit 1
              '0':begin
                    estatus:=1; // Inactivo
                    if s1[3]='1' then  // bit 5
                      estatus:=2; // Autorizado
                  end;
              '1':estatus:=5; // Despachando
            end;
            if s1[8]='1' then // bit 0
              estatus:=9;
            if (estatus=1)and(finventa=1) then
              estatus:=8;
            if (estatus=1)and(finventa=2) then
              estatus:=7;
            // Producto: solo cuando està ocupado
            ss:=ExtraeElemStrSep(LineaTimer,7,' ');
            xposactual:=strtointdef(ss[2],0);
            if xposactual>0 then
              PosActual:=xposactual;
          end;

        end;

      end
      else if copy(LineaTimer,1,2)='A1' then begin // COMANDO A
        xpos:=DamePosTeam(LineaTimer,true);
        with TPosCarga[xpos] do begin
          s1:=ExtraeElemStrSep(LineaTimer,6,' ');
          if s1='00' then begin // litros
            ss:=ExtraeElemStrSep(LineaTimer,7,' ')
               +ExtraeElemStrSep(LineaTimer,8,' ')
               +ExtraeElemStrSep(LineaTimer,9,' ')
               +ExtraeElemStrSep(LineaTimer,10,' ');
            try
              if (ss<>'FFFFFFFF')and(ss<>'88888888') then
                volumen:=strtoint(ss)/100
              else begin
                volumen:=0;
                importe:=0;
              end;
            except
              volumen:=0;
            end;
          end
          else if s1='01' then begin // pesos
            try
              ss:=ExtraeElemStrSep(LineaTimer,7,' ')
                 +ExtraeElemStrSep(LineaTimer,8,' ')
                 +ExtraeElemStrSep(LineaTimer,9,' ')
                 +ExtraeElemStrSep(LineaTimer,10,' ');
              if (ss<>'FFFFFFFF')and(ss<>'88888888') then begin
                importe:=strtoint(ss)/100;
                xcomb:=CombustibleEnPosicion(xpos,posactual);
                precio:=dmcons.TabComb[xcomb].precio;
                volumen:=AjustaFloat(dividefloat(importe,precio),2);
                LineaTimer:='A'+inttoclavenum(xpos,2)+'0'
                             +FormatFloat('000000',volumen*100)
                             +FormatFloat('00000000',importe*100)
                             +FormatFloat('0000',precio*100);
                DMCONS.AgregaLog(LineaTimer);
                ProcesaLinea(csok);
              end
              else begin
                //importe:=0;
                volumen:=0;
              end;
            except
              importe:=0;
            end;
          end;
        end
      end
      else if copy(LineaTimer,1,2)='A5' then begin // COMANDO S
        xpos:=DamePosTeam(LineaTimer,true);
        ss:=ExtraeElemStrSep(LineaTimer,6,' ');
        if ss='09' then
          LineaTimer:='L'+inttoclavenum(xpos,2)+'0'
        else
          LineaTimer:='S'+inttoclavenum(xpos,2)+'0';
        DMCONS.AgregaLog(LineaTimer);
        ProcesaLinea(csok);
      end
      else if copy(LineaTimer,1,2)='A6' then begin // COMANDO U
        xpos:=DamePosTeam(LineaTimer,false);
        LineaTimer:='U'+inttoclavenum(xpos,2)
                    +ExtraeElemStrSep(LineaTimer,6,' ')+ExtraeElemStrSep(LineaTimer,7,' ')
                    +ExtraeElemStrSep(LineaTimer,8,' ')+ExtraeElemStrSep(LineaTimer,9,' ')
                    +ExtraeElemStrSep(LineaTimer,10,' ')+ExtraeElemStrSep(LineaTimer,11,' ');
        DMCONS.AgregaLog(LineaTimer);
        ProcesaLinea(csok);
      end
      else if copy(LineaTimer,1,2)='A9' then begin // COMANDO N
        xpos:=DamePosTeam(LineaTimer,true);
        LineaTimer:='N'+inttoclavenum(xpos,2)+inttostr(TPosCarga[xpos].AuxCmndN)
                    +ExtraeElemStrSep(LineaTimer,6,' ')+ExtraeElemStrSep(LineaTimer,7,' ')
                    +ExtraeElemStrSep(LineaTimer,8,' ')+ExtraeElemStrSep(LineaTimer,9,' ')
                    +ExtraeElemStrSep(LineaTimer,10,' ')+ExtraeElemStrSep(LineaTimer,11,' ');
        DMCONS.AgregaLog(LineaTimer);
        ProcesaLinea(csok);
      end;
      Linea:='';
      SwEspera:=false;
    end
    else SwEspera:=true;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISTEAM.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISTEAM.Restaurar1Click(Sender: TObject);
begin
  Visible:=true;
end;

procedure TFDISTEAM.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFDISTEAM.FormCreate(Sender: TObject);
begin
  SwCerrar:=false;
  SwComandoB:=true;
  PosCiclo:=1;
  SwInicio:=true;
  ContadorAlarma:=0;
  ContLog:=0;
  HoraComandoB:=now;
  HoraRspB:=now;
  ContB:=0;
  ListaCmnd:=TStringList.Create;
  ListaAux:=TStringList.Create;
end;

procedure TFDISTEAM.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISTEAM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ap1.Open:=false;
  Application.Terminate;
end;

procedure TFDISTEAM.Timer1Timer(Sender: TObject);
var xpos:integer;
    ss:string;
begin
  try
    if not StaticText8.Visible then begin
      StaticText8.Caption:='Puerto: '+DMCONS.PuertoServicio;
      StaticText8.Visible:=true;
    end;
    if (now-HoraComandoB>5*TmSegundo)or(now-HoraRspB>5*TmSegundo) then begin
      DespliegaMemo4('Reset');
      ListaCmnd.Clear;
      ContCmndU:=0;
      SwComandoB:=true;
      SwEsperaRsp:=false;
      HoraComandoB:=now;
      HoraRspB:=now;
      inc(contB);
      Ap1.Open:=false;
      EsperaMiliSeg(500);
      Ap1.Open:=true;
      if ContB>3 then
        Application.Terminate;
    end;
    if ContCmndU>0 then begin
      Dec(ContCmndU);
      exit;
    end;
    if SwComandoB then begin
      ComandoConsolaBuff('B'+IntToClavenum(PosCiclo,2),true);
      inc(PosCiclo);
      if PosCiclo>MaxPosCarga then begin
        PosCiclo:=1;
        LineaTimer:='B00';
        CheckSumB:=true;
        for xpos:=1 to MaxPosCarga do
          with TPosCarga[xpos] do begin
            if ContEsperaB>=3 then
              estatus:=0;
            if posactual>=10 then
              posactual:=(posactual)mod(10);
            LineaTimer:=LineaTimer+inttostr(PosActual)+inttostr(estatus);
          end;
        DMCONS.AgregaLog(LineaTimer);
        SwComandoB:=false;
        ProcesaLinea(CheckSumB);
      end;
      exit;
    end;
    if SwEsperaRsp then begin
      inc(ContEsperaRsp);
      if ContEsperaRsp>MaxEsperaRsp then
        SwEsperaRsp:=false;
    end;
    if not SwEsperaRsp then begin
      ContEsperaRsp:=0;
      if (ListaCmnd.Count>0) then begin
        StaticText6.Caption:=inttostr(ListaCmnd.Count);
        ss:=ListaCmnd[0];
        ListaCmnd.Delete(0);
        ComandoConsola(ss);
        exit;
      end
      else SwComandoB:=true;
    end;
  except
  end;
end;

procedure TFDISTEAM.EnviaPreset(var rsp:string;xcomb:integer;swpreset:boolean);
var xpos:integer;
    ss:string;
begin
  Esperamiliseg(100);
  rsp:='OK';
  xpos:=SnPosCarga;
  if not (TPosCarga[xpos].estatus=1) then begin
    rsp:='Posición no Disponible';
    exit;
  end;
  if TPosCarga[xpos].SwDesHabilitado then begin
    rsp:='Posición Deshabilitada';
    exit;
  end;
  if SnLitros>=0.5 then
    ss:='L'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',SnLitros))
  else
    ss:='S'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',SnImporte));
  ComandoConsolaBuff(ss,false);
end;


procedure TFDISTEAM.Timer3Timer(Sender: TObject);
const timpo:array[0..4] of real = (50,100,150,200,30);
      tpos:array[0..2] of integer = (2,1,3);
var xpos,rr,i:integer;
    lin:string;
    p1,p2,xp,xcomb:integer;
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
              rr:=Random(16);
              if rr=1 then begin
                xpos:=Random(MaxPosCarga)+1;
                p1:=2*xpos-1;
                p2:=2*xpos;
                case EmularEstatus[p2] of
                  '1':if TPosCarga[xpos].ModoOpera='Normal' then begin
                        EmularEstatus[p2]:='3';
                        rr:=Random(5);
                        xp:=Random(2)+1;
                        if xp>TPosCarga[xpos].NoComb then
                          xp:=TPosCarga[xpos].NoComb;
                        EmularEstatus[p1]:=char(xp+48);
                        xcomb:=CombustibleEnPosicion(xpos,xp);
                        TPosCarga[xpos].volumen:=dividefloat(Timpo[rr],TabComb[xcomb].Precio);
                        TPosCarga[xpos].importe:=timpo[rr];
                        TPosCarga[xpos].precio:=TabComb[xcomb].Precio;
                        TPosCarga[xpos].hora:=time;
                      end;
                  '5':EmularEstatus[p2]:='7';
                end;
              end
              else begin
                for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
                  p2:=2*xpos;
                  if (EmularEstatus[p2]='5')and((Time-Hora)>20/86400)then
                    EmularEstatus[p2]:='7';
                end;
              end;
              Linea:='B00'+EmularEstatus;
            end;
        'A':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              Linea:=copy(Lin,1,3)+'1'
                     +FiltraStrNum(FormatFloat('0000.00',TPosCarga[xpos].volumen))
                     +FiltraStrNum(FormatFloat('0000.00',TPosCarga[xpos].importe))
                     +FiltraStrNum(FormatFloat('0.000',TPosCarga[xpos].precio));
            end;
        'N':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              with TPosCarga[xpos] do begin
                Linea:=copy(Lin,1,3)+'0000000000'+'0000000000'+'0000000000'+'0000000000';
                for i:=1 to NoComb do
                  Linea[TPos[i]*10-5]:=Char(TComb[i]+48);
              end;
            end;
        else linea:=idACK;
      end;
      if linea<>idACK then
        LineaTimer:=idSTX+Linea+idETX+' '
      else
        LineaTimer:=linea;
      DMCONS.AgregaLog('R '+LineaTimer);
      DespliegaMemo4('R '+LineaTimer);
      ProcesaLinea(true);
      SwEspera:=false;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;


procedure TFDISTEAM.registro(valor:integer;variable:string);
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

procedure TFDISTEAM.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISTEAM.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISTEAM.lee_registro;
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

procedure TFDISTEAM.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISTEAM.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
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

function TFDISTEAM.PosicionDeCombustible(xpos,xcomb:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    result:=0;
    if xcomb>0 then begin
      for i:=1 to NoComb do begin
        if TComb[i]=xcomb then
          result:=TComb[i];
      end;
    end
    else result:=1;
  end;
end;


procedure TFDISTEAM.ListBoxPC1DblClick(Sender: TObject);
begin
  SwMensaje:=not SwMensaje;
  with DMCONS do if swemular then begin
    if EmularEstatus[2]='0' then
      EmularEstatus[2]:='1'
    else
      EmularEstatus[2]:='0';
  end;
end;

procedure TFDISTEAM.Timer2Timer(Sender: TObject);
var i,folioBit:integer;
    fecha:TDateTime;
begin
  try
    with DMCONS do begin
      if contlog>0 then begin
        dec(contlog);
        if contlog=0 then
          Button1.Click;
      end;
      inc(ContadorTot);
      if (ContadorTot>=100) then begin
        ContadorTot:=0;
        inc(ContadorTotPos);
        if ContadorTotPos in [1..MaxPosCarga] then begin
          TPosCarga[ContadorTotPos].SwCargaTotales:=true;
          TPosCarga[ContadorTotPos].ContTotales:=0;
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
    if (Now-DMCONS.FechaHoraPrecio)>12*tmSegundo then begin
      DMCONS.FechaHoraPrecio:=Now;
      with DMCONS do if AplicarPrecios then begin // checa si hay precio pendiente de aplicar
        for i:=1 to MaxComb do with TabComb[i] do if Activo then begin
          Q_AplicaPrecioF.ParamByName('pFolio').AsInteger:=Folio;
          Q_AplicaPrecioF.ParamByName('pCombustible').AsInteger:=i;
          Q_AplicaPrecioF.ParamByName('pError').AsString:='No';
          Q_AplicaPrecioF.ExecSQL;                                  // cambia estatus del precio a aplicado

          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Add('SELECT COALESCE(MAX(FOLIO),0)+1 AS ENTERO1 FROM DPVGBTCC');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          folioBit:=Q_AuxiEntero1.AsInteger;

          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('INSERT INTO DPVGBTCC (FECHAHORA, TIPOEVENTO, INFOEVENTO, VALORANTERIOR, VALORNUEVO, HASH) '+
                         'VALUES (:FECHAHORA, :TIPOEVENTO, :INFOEVENTO, :VALORANTERIOR, :VALORNUEVO, :HASH)');
          fecha:=Now;
          Q_Auxi.ParamByName('FECHAHORA').AsString:=FormatDateTime('mm/dd/yyyy hh:mm:ss',fecha);
          Q_Auxi.ParamByName('TIPOEVENTO').AsString:='CMBP';
          Q_Auxi.ParamByName('INFOEVENTO').AsString:='Producto: '+TabComb[i].Nombre;
          Q_Auxi.ParamByName('VALORANTERIOR').AsString:=FormatoMoneda(TabComb[i].PrecioAnt);
          Q_Auxi.ParamByName('VALORNUEVO').AsString:=FormatoMoneda(TabComb[i].PrecioNuevo);
          Q_Auxi.ParamByName('HASH').AsString:=LowerCase(HashMd5(IntToStr(folioBit)+'|'+FormatDateTime('mm/dd/yyyy hh:mm:ss',fecha)+'|CMBP|Producto: '+TabComb[i].Nombre+'|'
                                                      +FormatoMoneda(TabComb[i].PrecioAnt)+'|'+FormatoMoneda(TabComb[i].PrecioNuevo)));
          Q_Auxi.ExecSQL;
        end;
        CargaPreciosFH(Now,true); // carga el ultimpo recio aplicado
        Q_CombIb.Active:=false;
        Q_CombIb.
        Active:=true;
        DespliegaPrecios;
        for i:=1 to MaxPosCarga do
          TPosCarga[i].ActualizarPrecio:=true;
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


procedure TFDISTEAM.Button2Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFDISTEAM.Button4Click(Sender: TObject);
var
  ruta:PAnsiChar;
begin
  ruta:=PChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)));
  ShellExecute(Handle, 'open','explorer.exe',ruta, nil, SW_SHOWNORMAL);
end;

end.


