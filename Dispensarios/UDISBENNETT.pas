unit UDISBENNETT;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry;

{
 U: Cambio de Precios
 G: Lee precios
 P: Presets
 N: Totales
 }

type
  TFDISBENNETT = class(TForm)
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
  private
    { Private declarations }
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
    NumPaso,
    ContBuffLleno,
    errbcc,
    PosicionActual:integer;
    swprocesando,
    swcerrar:boolean;
    UltimoStatus:string;
    SnPosCarga:integer;
    SnImporte:real;
    EmularEstatus,
    LineaEmular:string;
    SwMensaje,
    SwError:boolean;
    ContadorAlarma:integer;
    contguardaval:integer;
  public
    { Public declarations }
    function StringCom(ss:string):string;
    function CalculaBCC(ss:string):char;
    procedure ComandoConsola(ss:string);
    procedure ProcesaLinea;
    procedure LimpiaConsola;
    procedure DespliegaPosCarga(xpos:integer;swdb:boolean);
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure PonTipoServicio(xtipo:string);
    procedure DespliegaPrecios;
    procedure registro(valor:integer;variable:string);
    //procedure registro_disp(valor:string);
    procedure lee_registro;
    //procedure lee_registro2;
    procedure DespliegaMemo4(lin:string);
    function CombustibleEnPosicion(xpos,xposcarga:integer):integer;
    procedure EnviaPreset(var rsp:string;xcomb:integer);
  end;

type
     tiposcarga = record
       estatus  :integer;
       descestat:string[20];
       importe,
       volumen,
       precio   :real;
       impopreset:real;
       Isla,
       PosActual:integer; // Posicion del combustible en proceso: 1..NoComb
       estatusant:integer;
       NoComb   :integer; // Cuantos combustibles hay en la posicion
       Estat_Cons:char;
       SwTarjeta:boolean;
       TComb    :array[1..2] of integer; // Claves de los combustibles
       TPos     :array[1..2] of integer;
       //TNombre  :array[1..2] of string[20];
       TotalLitros:array[1..2] of real;
       SwDesp:boolean;
       SwA:boolean;
       Hora:TDateTime;
       SwInicio:boolean;
       SwInicio2:boolean;
       SwPreset,
       SwCargaTotales,
       IniciaCarga,
       SwPrepago:boolean;
       IntentosTotales:byte;
       ActualizarPrecio:Boolean;
       Mensaje:string[30];
       swactualizar,
       swcargando:boolean;
       swcargapreset:boolean;
       SwDesHabilitado:boolean;
     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=5;
      MaxEspera3=5;


var
  FDISBENNETT: TFDISBENNETT;
  TPosCarga:array[1..100] of tiposcarga;
  MaxPosCarga:integer;
  MaxPosCargaActiva:integer;
  AvanceBar:integer;
  SwSolOk:boolean;
  StErrSol:integer;
  ruta_db:string;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UAutoriza2, DDMCONS2, UDISMENU;

{$R *.DFM}

procedure TFDISBENNETT.DespliegaMemo4(lin:string);
begin
  if Memo4.Lines.Count>=40 then
    Memo4.Lines.Delete(0);
  Memo4.Lines.Add(lin);
end;

procedure TFDISBENNETT.DespliegaPrecios;
var i:integer;
begin
  with DMCONS do begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Precios Actuales: ');
    for i:=1 to MaxComb do with TabComb[i] do if Activo then
      Memo1.Lines.Add(IntToClaveNum(i,2)+' '+Nombre+' '+FormatoMoneda(precio));
  end;
end;

procedure TFDISBENNETT.PonTipoServicio(xtipo:string);
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

procedure TFDISBENNETT.IniciaBaseDeDatos;
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

procedure TFDISBENNETT.IniciaEstacion;
var i,xisla,xpos,xcomb,xnum:integer;
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
      SwTarjeta:=true;
      SwInicio:=true;
      SwInicio2:=true;
      IniciaCarga:=false;
      SwPrepago:=false;
      SwPreset:=false;
      ActualizarPrecio:=false;
      Mensaje:='';
      importe:=0;
      impopreset:=0;
      volumen:=0;
      precio:=0;
      TotalLitros[1]:=0;
      TotalLitros[2]:=0;
      SwCargando:=false;
      SwActualizar:=false;
      SwCargaPreset:=false;
      SwCargaTotales:=true;
      IntentosTotales:=0;
      SwDeshabilitado:=false;
    end;
    // CARGA DEFAULTS BENNETT
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
          //TNombre[NoComb]:=Q_BombIbNombreComb.AsString;
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


procedure TFDISBENNETT.FormShow(Sender: TObject);
begin
  if SwInicio then begin
    try
      SwMensaje:=false;
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
        Caption:=Caption+' - Emulación';
      ErrorInic:=false;
    finally
      Timer1.Enabled:=true;
      Timer3.Enabled:=DMCONS.SwEmular;
    end;
  end;
end;

function TFDISBENNETT.StringCom(ss:string):string;
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

function TFDISBENNETT.CalculaBCC(ss:string):char;
var i,n,m:integer;
begin
  n:=0;
  for i:=1 to length(ss) do
    n:=n+ord(ss[i]);
  m:=(n)mod(256);
  result:=char(256-m);
end;

procedure TFDISBENNETT.LimpiaConsola;
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

procedure TFDISBENNETT.DespliegaPosCarga(xpos:integer;swdb:boolean);
var i,xp,rango,posi,posf,xcomb,xc:integer;
    lin,xnombre:string;
begin
  try
    try
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
          TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(xpos,2);
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
              7:TPanel(FindComponent('panelPC'+IntToStr(i))).color:=ClBlue;
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
          if swmensaje then
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(Mensaje)
          else
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
          for xp:=1 to NoComb do
            TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,###,##0.00',totallitros[xp])+
                     ' '+copy(DMCONS.TabComb[TComb[xp]].Nombre,1,3)
                     );
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
        ListView1.Items[i-1].Caption:=IntToClaveNum(i,2)+'-'+IntToStr(Estatus)+
                      '  '+LlenaStr(FormatFloat('##,##0.00',importe),'D',10,' ');
        if SwDesp then with DMCONS do begin
          SwDesp:=false;
          if (importe>0.01) then begin
            (* jul05
            if not (PosActual in [1..2]) then
              PosActual:=1;
              *)
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
                xcomb:=CombustibleEnPosicion(i,PosActual);
                //xcomb:=TComb[PosActual];
                if TabComb[xcomb].Agruparcon>0 then begin
                  xc:=TabComb[xcomb].Agruparcon;
                  if TabComb[xc].Activo then
                    xcomb:=xc;
                end;
                (*
                precio:=dividefloat(importe,volumen);
                if (precio>0.01) then begin // determino combustible en base a precio
                  xp:=1;
                  while (xp<=MaxComb) do begin
                    if abs(precio-DMCONS.TabComb[xp].precio)<0.3 then begin
                      xcomb:=xp;
                      xp:=MaxComb;
                    end;
                    inc(xp);
                  end;
                end;*)
                T_MoviIbCombustible.AsInteger:=xcomb;
                T_MoviIbVolumen.AsFloat:=AjustaFloat(Volumen,3);
                T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
                T_MoviIbTotal01.AsFloat:=AjustaFloat(TotalLitros[1],3);
                T_MoviIbTotal02.AsFloat:=AjustaFloat(TotalLitros[2],3);
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
                  7:T_ConsIbEstado.AsInteger:=3; // Fin de Carga (Used)
                  3,4:T_ConsIbEstado.AsInteger:=5; // Llamando (Calling)
                  8:T_ConsIbEstado.AsInteger:=9; // Autorizado
                  6:T_ConsIbEstado.AsInteger:=8; // Detenido (Stoped)
                  else T_ConsIbEstado.AsInteger:=0;
                end;
                T_ConsIbOtros.AsString:=FormatFloat('#######0.00',totallitros[1])+
                                        '|'+FormatFloat('#######0.00',totallitros[2]);
                // fin publica valores
                if SwTarjeta then
                  T_ConsIbEstatus.AsString:='F'
                else
                  T_ConsIbEstatus.AsString:='f';
                //lcActualiza:=true;
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
                (*     23jun
                if TPos[1]=xpr then
                  xcomb:=TComb[1]
                else if TPos[2]=xpr then
                  xcomb:=TComb[2];
                  *)
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

(*
NumPaso:
        1:Estatus de Dispensarios: Comando "B"
        2:Lectura de Dispensarios: Comando "A"
        3:Checa Ventas Concluidas
*)

procedure TFDISBENNETT.ProcesaLinea;
label uno;
var lin,ss,rsp,descrsp,xestado:string;
    simp,spre,sval:string[20];
    i,xpos:integer;
    xp,xpr,xcomb:integer;
    xestatus:char;
    ximporte:real;
    xLista:TStrings;
    xvol:real;
    totlts:array[1..4] of real;
begin
  try
    if LineaTimer='' then
      exit;
    StaticText6.Caption:='';
    if length(LineaTimer)>3 then begin
      while (LineaTimer[1]<>idSTX)and(length(LineaTimer)>3) do
        delete(LineaTimer,1,1);
      lin:=copy(lineaTimer,2,length(lineatimer)-3);
    end
    else
      lin:=LineaTimer;
    LineaTimer:='';
    if lin='' then
      exit;
    case lin[1] of
     'B':begin // pide estatus de todas las bombas
           ContEspera:=0;
           UltimoStatus:=LineaTimer;
           ss:=copy(lin,4,length(lin)-3);
           MaxPosCargaActiva:=(length(ss))div(2);
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do begin
               PosActual:=StrToIntDef(ss[xpos*2-1],0);
               if PosActual=0 then begin
                 PosActual:=1;
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
               Mensaje:='Pos = '+inttostr(posactual);
               case estatus of
                 0:descestat:='---';
                 1:begin
                     descestat:='Inactivo';
                     swtarjeta:=true;
                     swcargando:=false;
                   end;
                 2:descestat:='Autorizado';
                 3:begin
                     swcargando:=false;
                     descestat:='Pistola Levantada';
                   end;
                 4:descestat:='Listo para Despachar';
                 5:begin
                     descestat:='Despachando';
                     IniciaCarga:=true;
                     if not SwCargando then
                       SwCargaPreset:=true;
                     swcargando:=true;
                   end;
                 6:descestat:='Suspendido';
                 7:descestat:='Fin de Venta';
                 8:descestat:='Venta Pendiente';
                 9:descestat:='Error';
               end;
             end;
           end;
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do begin
               // Actualiza Precios
               if ActualizarPrecio then with DMCONS do begin
                 for i:=1 to NoComb do begin
                   ss:='U'+IntToClaveNum(xpos,2)+'1'+IntToStr(TPos[i])+FiltraStrNum(FormatoNumeroSinComas(TabComb[TComb[i]].precio,5,3));
                   ComandoConsola(ss);
                   EsperaMiliSeg(300);
                   ss:='U'+IntToClaveNum(xpos,2)+'2'+IntToStr(TPos[i])+FiltraStrNum(FormatoNumeroSinComas(TabComb[TComb[i]].precio,5,3));
                   ComandoConsola(ss);
                   EsperaMiliSeg(300);
                   DespliegaMemo4(ss);
                 end;
                 ActualizarPrecio:=false;
                 Q_CombIb.Active:=false;
                 Q_CombIb.Active:=true;
                 DBGrid3.Refresh;
               end;
             end;
           end;
           // Checa las posiciones que estan solicitando autorizacion
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do begin
               case Estatus of
                 1:if SwInicio then begin
                     ss:='K'+IntToClaveNum(xpos,2)+'1'; // Postpago
                     ComandoConsola(ss);
                     EsperaMiliSeg(300);
                     ss:='L'+IntToClaveNum(xpos,2)+'1'; // Nivel de Precios
                     ComandoConsola(ss);
                     EsperaMiliSeg(300);
                     ss:='E'+IntToClaveNum(xpos,2); // Desautorizar
                     ComandoConsola(ss);
                     EsperaMiliSeg(300);
                     SwInicio:=false;
                     SwPrepago:=false;
                     SwPreset:=false;
                   end;
                 3:if (not DMCONS.SwNocturno)and(not SwDesHabilitado) then begin
                     ss:='S'+IntToClaveNum(xpos,2); // Autorizar
                     ComandoConsola(ss);
                     EsperaMiliSeg(300);
                     SwInicio:=false;
                     if DMCONS.SwEmular then
                       EmularEstatus[2*xpos]:='5';
                   end;
               end;
             end;
           end;
           NumPaso:=2;
           StaticText5.Caption:=IntToStr(NumPaso);
           PosicionActual:=0;
         end;
     'A':begin // pide estatus de una bomba
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if xpos<>0 then begin
             ContEsperaPaso2:=0;
             with TPosCarga[xpos] do begin
               try
                 swinicio2:=false;
                 volumen:=StrToFloat(copy(lin,5,6))/100;
                 simp:=copy(lin,11,6);
                 spre:=copy(lin,17,4);
                 importe:=StrToFloat(simp)/100;
                 precio:=StrToFloat(spre)/1000;
                 xvol:=ajustafloat(dividefloat(importe,precio),3);
                 if abs(volumen-xvol)<0.05 then
                   volumen:=xvol;
                 if (Estatus=7)and(swcargando) then begin
                   swcargando:=false;
                   swdesp:=true;
                 end;
                 DespliegaPosCarga(xpos,true);
                 if Estatus=7 then begin
                   ss:='J'+IntToClaveNum(xpos,2); // Fin de Venta
                   DespliegaMemo4(ss+' '+fechapaq(date)+' '+HoraPaq(time));
                   if DMCONS.swemular then
                     EmularEstatus[2*xpos]:='1';
                   ComandoConsola(ss);
                   EsperaMiliSeg(100);
                 end;
               except
                 DespliegaMemo4(lin+' '+fechapaq(date)+' '+HoraPaq(time));
               end;
             end;
           end
           else DespliegaMemo4(lin+' '+fechapaq(date)+' '+HoraPaq(time));
         end;
     'N':begin // totales de la bomba
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if xpos<>0 then begin
             ContEsperaPaso3:=0;
             with TPosCarga[xpos] do begin
               SwCargaTotales:=false;
               IntentosTotales:=0;
               Totlts[1]:=StrToFloat(copy(lin,4,10))/1000;
               Totlts[2]:=StrToFloat(copy(lin,14,10))/1000;
               Totlts[3]:=StrToFloat(copy(lin,24,10))/1000;
               Totlts[4]:=StrToFloat(copy(lin,34,10))/1000;
               TotalLitros[1]:=TotLts[TPos[1]];
               TotalLitros[2]:=TotLts[TPos[2]];
               DMCONS.RegistraTotales_BD(xpos,TotalLitros[1],TotalLitros[2]);
               DespliegaPosCarga(xpos,true);
             end;
           end;
         end;
    end;
    // checa lecturas de dispensarios
    if NumPaso=2 then begin
      if PosicionActual<MaxPosCargaActiva then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if (estatus<>estatusant)or(estatus>=5)or(SwA)or(swinicio2)or(swcargando) then begin
              SwA:=false;
              SwActualizar:=true;
              ComandoConsola('A'+IntToClaveNum(PosicionActual,2));
              exit;
            end
            else
              DespliegaPosCarga(PosicionActual,false);
          end;
        until (PosicionActual>=MaxPosCargaActiva);
        NumPaso:=3;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionActual:=0;
      end
      else begin
        NumPaso:=3;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionActual:=0;
      end;
    end;
    // Lee Totales
    if NumPaso=3 then begin
      // GUARDA VALORES DE DISPENSARIOS CARGANDO
      inc(contguardaval);
      if (contguardaval>=3) then with DMCONS do begin
        contguardaval:=0;
        lin:='';xestado:='';
        for xpos:=1 to MaxPosCarga do with TPosCarga[xpos] do begin
          case estatus of
            0:xestado:=xestado+'0'; // Sin Comunicación
            1:xestado:=xestado+'1'; // Inactivo (Idle)
            5:xestado:=xestado+'2'; // Cargando (In Use)
            7:xestado:=xestado+'3'; // Fin de Carga (Used)
            3,4:xestado:=xestado+'5'; // Llamando (Calling)
            2,8:xestado:=xestado+'9'; // Autorizado
            6:xestado:=xestado+'8'; // Detenido (Stoped)
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
      if PosicionActual<MaxPosCargaActiva then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if swcargatotales then begin
              inc(intentostotales);
              if intentostotales>3 then
                swcargatotales:=false;
              ComandoConsola('N'+IntToClaveNum(PosicionActual,2));
              Esperamiliseg(200);
              exit;
            end
            else
              DespliegaPosCarga(PosicionActual,false);
          end;
        until (PosicionActual>=MaxPosCargaActiva);
        NumPaso:=4;
        StaticText5.Caption:=IntToStr(NumPaso);
      end
      else begin
        NumPaso:=4;
        StaticText5.Caption:=IntToStr(NumPaso);
      end;
    end;
    if (NumPaso=4) then with DMCONS do begin
      // Checa Ventas Concluidas
      for xpos:=1 to MaxPosCargaActiva do with TPosCarga[xpos] do if (estatus=1)and(iniciacarga) then begin
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
              if SwTarjeta then
                T_ConsIbEstatus.AsString:='F'
              else
                T_ConsIbEstatus.AsString:='f';
              T_ConsIb.Post;
            end;
          end;
        finally
          T_ConsIb.Active:=false;
        end;
      end;

      // Checa peticiones de ventas con tarjeta
      Q_ConsIb.Active:=false;
      Q_ConsIb.ParamByName('pestatus').asstring:='S';
      Q_ConsIb.ParamByName('pestatus2').asstring:='s';
      Q_ConsIb.Active:=true;
      while not Q_ConsIb.Eof do begin
        xpos:=Q_ConsIbPosCarga.AsInteger;
        TPosCarga[xpos].SwTarjeta:=(Q_ConsIbEstatus.AsString<'a');
        if TPosCarga[xpos].SwTarjeta then
          xestatus:='P'
        else
          xestatus:='p';
        try
          if not (TPosCarga[xpos].estatus in [1,2]) then
            raise Exception.Create('Error al Activar Posición de Carga');
          ss:='K'+IntToClaveNum(xpos,2)+'2'; // Modo PrePago
          lin:=ss;
          ComandoConsola(ss);
          EsperaMiliSeg(100);
          if SwError then
            raise Exception.Create('Error al Activar Posición de Carga');

          if Q_ConsIbMonVol.AsString='V' then begin // litros
            ximporte:=Q_ConsIbImporte.AsFloat;
          end
          else
            ximporte:=Q_ConsIbValor.AsFloat; // importe
          ss:='P'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',ximporte)); // Set Preset Limit
          lin:=lin+' '+ss;
          ComandoConsola(ss);
          EsperaMiliSeg(100);
          if swemular then begin
            if (EmularEstatus[xpos*2]='1') then begin
              EmularEstatus[xpos*2]:='5';
              TPosCarga[xpos].estatus:=5;
              if SwNocturno then begin
                TPosCarga[xpos].volumen:=SnImporte/5;
                TPosCarga[xpos].importe:=SnImporte;
                TPosCarga[xpos].precio:=5;
              end
              else begin
                TPosCarga[xpos].volumen:=Q_ConsIbValor.AsFloat/5;
                TPosCarga[xpos].importe:=Q_ConsIbValor.AsFloat;
                TPosCarga[xpos].precio:=5;
              end;
              TPosCarga[xpos].posactual:=1;
              TPosCarga[xpos].hora:=time;
              TPosCarga[xpos].SwTarjeta:=false;
            end;
          end;
          if SwError then
            raise Exception.Create('Error al Activar Posición de Carga');

          ss:='L'+IntToClaveNum(xpos,2)+'1'; // Nivel de Precios
          lin:=lin+' '+ss;
          ComandoConsola(ss);
          EsperaMiliSeg(100);
          if SwError then
            raise Exception.Create('Error al Activar Posición de Carga');

          ss:='S'+IntToClaveNum(xpos,2); // Autorizar
          case Q_ConsIbPosicion.asinteger of
            1:ss:=ss+char(33);   // 21h
            2:ss:=ss+char(34);   // 22h
          end;
          DespliegaPosCarga(xpos,false);
          lin:=lin+' '+ss;
          ComandoConsola(ss);
          EsperaMiliSeg(100);
          if SwError then
            raise Exception.Create('Error al Activar Posición de Carga');
        except
          if TPosCarga[xpos].SwTarjeta then
            xestatus:='E'
          else
            xestatus:='e';
        end;
        T_ConsIb.Active:=true;
        try
          if T_ConsIb.Locate('PosCarga',xpos,[]) then begin
            T_ConsIb.Edit;
            T_ConsIbEstatus.AsString:=xestatus;
            TPosCarga[xpos].EstaT_Cons:=StrToChar(T_ConsIbEstatus.AsString);
            //lcActualiza:=true;
            T_ConsIb.Post;
            TPosCarga[xpos].SwPrepago:=true;
          end;
        finally
          T_ConsIb.Active:=false;
        end;
        Q_ConsIb.Next;
      end;

      // Checa peticiones de Calibración
      Q_ConsIb.Active:=false;
      Q_ConsIb.ParamByName('pestatus').asstring:='C';
      Q_ConsIb.ParamByName('pestatus2').asstring:='c';
      Q_ConsIb.Active:=true;
      while not Q_ConsIb.Eof do begin
        xpos:=Q_ConsIbPosCarga.AsInteger;
        xestatus:='F';
        try
          ss:='W'+IntToClaveNum(xpos,2);
          sval:=FormatFloat('0.00',Abs(Q_ConsIbValor.AsFloat));
          if Q_ConsIbValor.AsFloat<0 then
            sval:='-'+sval
          else
            sval:='+'+sval;
          ss:=ss+sval;
          ComandoConsola(ss);
          EsperaMiliSeg(100);
          if SwError then
            raise Exception.Create('Error al Activar Posición de Carga');

        except
          xestatus:='E'
        end;
        T_ConsIb.Active:=true;
        try
          if T_ConsIb.Locate('PosCarga',xpos,[]) then begin
            T_ConsIb.Edit;
            T_ConsIbEstatus.AsString:=xestatus;
            T_ConsIb.Post;
          end;
        finally
          T_ConsIb.Active:=false;
        end;

        Q_ConsIb.Next;
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

      // Checa Comandos
      with DMCONS do if (Now-FechaHoraComando)>5*tmSegundo then begin
        FechaHoraComando:=Now;
        Q_Cmnd.Active:=false;
        Q_Cmnd.ParamByName('pmodulo').AsString:='DISP';
        Q_Cmnd.Active:=true;
        while not Q_Cmnd.Eof do begin
          ss:=ExtraeElemStrSep(Q_CmndComando.AsString,1,' ');
          // CMND: ACTIVA MODO PREPAGO
          if ss='AMP' then begin
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
            rsp:='OK';
            if SwNocturno then begin
              SnPosCarga:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
              if (SnPosCarga in [1..MaxPosCarga]) then begin
                try
                  SnImporte:=StrToFLoat(ExtraeElemStrSep(Q_CmndComando.AsString,3,' '));
                  if (SnImporte<1)or(SnImporte>9999) then
                    rsp:='Importe fuera de rango válido: de 1.00 a 9999.00';
                except
                  rsp:='Error en Importe';
                end;
                if rsp='OK' then begin
                  xcomb:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,4,' '),0);
                  EnviaPreset(rsp,xcomb);
                end;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            else rsp:='No se encuentra en Modo Prepago';
          end
          // CMND: DESHABILITA POSICIOND DE CARGA
          else if ss='DPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              TPosCarga[xpos].SwDesHabilitado:=true;
          end
          // CMND: HABILITA POSICIOND DE CARGA
          else if ss='HPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            if xpos in [1..MaxPosCarga] then
              TPosCarga[xpos].SwDesHabilitado:=false;
          end
          // CMND: DESAUTORIZA VENTA DE COMBUSTIBLE
          else if ss='DVC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            ComandoConsola('E'+IntToClaveNum(xpos,2));
            if xpos in [1..MaxPosCarga] then
              if DMCONS.swemular then
                EmularEstatus[2*xpos]:='1';
          end
          // CMND: ACTIVA FLUJO ESTANDAR
          else if ss='FLUSTD' then begin  // FLUJO ESTANDAR
            rsp:='OK';
            Q_Pcar.Active:=false;
            Q_Pcar.Active:=true;
            while not Q_Pcar.Eof do begin
              xpos:=Q_PcarPosCarga.AsInteger;
              if xpos in [1..MaxPosCarga] then begin
                i:=Trunc(10*Q_PcarSlowFlow.AsFloat+0.5);
                if i>9 then
                  i:=9;
                ComandoConsola('F'+IntToClaveNum(xpos,2)+'995'+IntToStr(i));
                rsp:=rsp+IntToStr(xpos)+IntToStr(i)+'|';
                EsperaMiliSeg(250);
              end;
              Q_Pcar.Next;
            end;
          end
          // CMND: ACTIVA FLUJO MINIMO
          else if ss='FLUMIN' then begin // FLUJO MINIMO
            rsp:='OK';
            for xpos:=1 to MaxPosCarga do begin
              ComandoConsola('F'+IntToClaveNum(xpos,2)+'9950');
              rsp:=rsp+IntToStr(xpos)+'0'+'|';
              EsperaMiliSeg(250);
            end;
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
          Q_Cmnd.Next;
        end;
      end;

      NumPaso:=0;
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

procedure TFDISBENNETT.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
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
end;

procedure TFDISBENNETT.ComandoConsola(ss:string);
var s1:string;
    cc:char;
begin
  SwError:=false;
  if DMCONS.SwEmular then begin
    DMCONS.AgregaLog('E '+idSTX+ss+idETX+' ');
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
end;


procedure TFDISBENNETT.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISBENNETT.Restaurar1Click(Sender: TObject);
begin
  FDISBENNETT.Visible:=true;
end;

procedure TFDISBENNETT.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DMCONS.SwEmular then begin
    CanClose:=true;
  end
  else begin
    CanClose:=false;
    if swcerrar then
      CanClose:=true;
  end;
end;

procedure TFDISBENNETT.FormCreate(Sender: TObject);
begin
  SwInicio:=true;
  ContadorAlarma:=0;
  ContGuardaVal:=0;
  SwCerrar:=false;
end;

procedure TFDISBENNETT.BitBtn3Click(Sender: TObject);
begin
  FDISBENNETT.Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISBENNETT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdComPort1.Open:=false;
  Application.Terminate;
end;

procedure TFDISBENNETT.Timer1Timer(Sender: TObject);
var ss:string;
    i:integer;
begin
  try
    with DMCONS do begin
      (* julio01
      if abs(now-HoraReset)>tmHora then begin
        HoraReset:=Now;
        if not SwEmular then begin
          try
            ApdComPort1.Open:=false;
            EsperaMiliSeg(2000);
            ApdComPort1.Open:=true;
          except
          end;
        end;
      end;
      *)
      inc(ContadorTot);
      if (ContadorTot>=100) then begin
        ContadorTot:=0;
        inc(ContadorTotPos);
        if ContadorTotPos in [1..MaxPosCarga] then begin
          TPosCarga[ContadorTotPos].SwCargaTotales:=true;
        end
        else ContadorTotPos:=0;
      end;
    end;
    if ContadorAlarma>=10 then begin
      try
        ApdComPort1.Open:=false;
        EsperaMiliSeg(2000);
        ApdComPort1.Open:=true;
      except
      end;
      if not StaticText17.Visible then
        Beep;
      StaticText17.Visible:=not StaticText17.Visible;
    end
    else StaticText17.Visible:=false;
    try
      lee_registro;
      //lee_registro2;
      //registro(1,'Activo');
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
        Q_CombIb.Active:=false;
        Q_CombIb.Active:=true;
        DespliegaPrecios;
        for i:=1 to MaxPosCarga do
          TPosCarga[i].ActualizarPrecio:=true;
      end;
    end;
    if NumPaso>1 then begin
      if NumPaso=2 then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera2';
        inc(ContEsperaPaso2);     // espera hasta 5 ciclos
        if ContEsperaPaso2>MaxEspera2 then begin
          (*
          if not DMCONS.SwEmular then begin
            try
              ApdComPort1.Open:=false;
              EsperaMiliSeg(2000);
              ApdComPort1.Open:=true;
            except
            end;
          end;
          *)
          ContEsperaPaso2:=0;
          LineaTimer:=idStx+'A00..';  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
        end;
      end;
      if NumPaso=3 then begin // si esta en espera de respuesta ACK
        StaticText6.Caption:='Espera3';
        inc(ContEsperaPaso3);     // espera hasta 5 ciclos
        if ContEsperaPaso3>MaxEspera3 then begin
          (*
          if not DMCONS.SwEmular then begin
            try
              ApdComPort1.Open:=false;
              EsperaMiliSeg(2000);
              ApdComPort1.Open:=true;
            except
            end;
          end;
          *)
          ContEsperaPaso3:=0;
          LineaTimer:=idStx+'N00..';  // de lo contrario provoca un NAK para que continue
          ProcesaLinea;       // el proceso con la siguiente solicitud
        end;
      end;
      exit;
    end;

    // Espera en el paso 0 hasta que reciba respuesta
    if NumPaso=1 then begin
      StaticText6.Caption:='Espera1';
      inc(ContEspera);
      if ContEspera>5 then begin
        (*
        if not DMCONS.SwEmular then begin
          try
            ApdComPort1.Open:=false;
            EsperaMiliSeg(2000);
            ApdComPort1.Open:=true;
          except
          end;
        end;
        *)
        NumPaso:=2;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionActual:=0;
        LineaTimer:=idStx+'x..';
        ProcesaLinea;       // el proceso con la siguiente solicitud
      end;
      exit;
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
      FDISBENNETT.Visible:=false;
      NotificationIcon1.Show;
    end;
  except
  end;
end;

procedure TFDISBENNETT.RadioGroup1Click(Sender: TObject);
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

procedure TFDISBENNETT.EnviaPreset(var rsp:string;xcomb:integer);
var xpos,xp:integer;
    ss:string;
begin
  rsp:='OK';
  xpos:=SnPosCarga;
  if not (TPosCarga[xpos].estatus in [1..3]) then begin
    rsp:='Posición no Disponible';
    exit;
  end;
  ss:='K'+IntToClaveNum(xpos,2)+'2'; // Modo PrePago
  ComandoConsola(ss);
  EsperaMiliSeg(100);
  if SwError then begin
    rsp:='Error al Activar Posición de Carga';
    exit;
  end;

  ss:='P'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',SnImporte));
  ComandoConsola(ss);
  EsperaMiliSeg(100);
  if DMCONS.swemular then begin
    if EmularEstatus[xpos*2]='1' then begin
      EmularEstatus[xpos*2]:='5';
      TPosCarga[xpos].estatus:=5;
      TPosCarga[xpos].volumen:=SnImporte/5;
      TPosCarga[xpos].importe:=SnImporte;
      TPosCarga[xpos].precio:=5;
      TPosCarga[xpos].posactual:=1;
      TPosCarga[xpos].hora:=time;
      TPosCarga[xpos].SwTarjeta:=false;
    end;
  end;
  if SwError then begin
    rsp:='Error al Activar Posición de Carga';
    exit;
  end;

  ss:='L'+IntToClaveNum(xpos,2)+'1'; // Nivel de Precios
  ComandoConsola(ss);
  EsperaMiliSeg(100);
  if SwError then begin
    rsp:='Error al Activar Posición de Carga';
    exit;
  end;

  ss:='S'+IntToClaveNum(xpos,2); // Autorizar
  if xcomb>0 then with TPosCarga[xpos] do begin
    xp:=0;
    if TComb[1]=xcomb then xp:=TPos[1];
    if TComb[2]=xcomb then xp:=TPos[2];
    case xp of
      1:ss:=ss+char(33);   // 21h
      2:ss:=ss+char(34);   // 22h
    end;
  end;
  ComandoConsola(ss);
  EsperaMiliSeg(100);
  if SwError then begin
    rsp:='Error al Activar Posición de Carga';
    exit;
  end;
  TPosCarga[xpos].SwPreset:=true;
end;

procedure TFDISBENNETT.BitBtn2Click(Sender: TObject);
var ss:string;
begin
  StaticText16.Caption:='';
  try
    SnPosCarga:=StrToInt(MaskEdit1.text);
    if not (SnPosCarga in [1..MaxPosCarga]) then
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
  EnviaPreset(ss,0);
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



procedure TFDISBENNETT.Timer3Timer(Sender: TObject);
const timpo:array[0..4] of real = (50,100,150,200,30);
      tpos:array[0..2] of integer = (2,1,2);
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
              rr:=Random(8);
              if rr=1 then begin
                xpos:=Random(MaxPosCarga)+1;
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
            (*
        'H':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              if TPosCarga[xpos].Estatus=5 then
                Linea:=copy(Lin,1,3)+FiltraStrNum(FormatFloat('0000.00',TPosCarga[xpos].importe))
              else
                Linea:=copy(Lin,1,3)+FiltraStrNum(FormatFloat('0000.00',0));
            end;*)
        'N':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              with TPosCarga[xpos] do begin
                Linea:=copy(Lin,1,3)+'0000000000'+'0000000000'+'0000000000'+'0000000000';
                for i:=1 to NoComb do
                  Linea[TPos[i]*10-5]:=Char(TComb[i]+48);
              end;
            end;
        'P':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              p2:=xpos*2;
              if EmularEstatus[p2]='1' then begin
                EmularEstatus[p2]:='5';
                TPosCarga[xpos].estatus:=5;
                TPosCarga[xpos].volumen:=SnImporte/5;
                TPosCarga[xpos].importe:=SnImporte;
                TPosCarga[xpos].precio:=5;
                TPosCarga[xpos].posactual:=1;
                TPosCarga[xpos].hora:=time;
                Linea:=' ';
              end
              else Linea:=' ';
            end;
        'J':linea:=idACK;
        else exit;
      end;
      if linea<>idACK then
        LineaTimer:=idSTX+Linea+idETX+' '
      else
        LineaTimer:=linea;
      DMCONS.AgregaLog('R '+LineaTimer);
      ProcesaLinea;
      SwEspera:=false;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISBENNETT.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    MaskEdit2.SetFocus;
  if key in [48..57] then begin
    MaskEdit2.Text:='';
    StaticText16.Caption:='';
  end;
end;

procedure TFDISBENNETT.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    BitBtn2.SetFocus;
end;

procedure TFDISBENNETT.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key='*' then
    MaskEdit1.SetFocus;
end;

procedure TFDISBENNETT.MaskEdit1Enter(Sender: TObject);
begin
  MaskEdit1.Text:='';
  MaskEdit2.Text:='';
end;

procedure TFDISBENNETT.GroupBox1Enter(Sender: TObject);
begin
  if SwProcesando then
    Memo2.SetFocus;
end;

procedure TFDISBENNETT.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text:=FiltraStrNum(MaskEdit1.Text);
end;

procedure TFDISBENNETT.registro(valor:integer;variable:string);
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
procedure TFDISBENNETT.registro_disp(valor:string);
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

procedure TFDISBENNETT.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISBENNETT.ListView1DblClick(Sender: TObject);
var xpos,xind:integer;
begin
  xpos:=strtointdef(copy(ListView1.ItemFocused.Caption,1,2),0);
  xind:=(xpos)div(4);
  if (xpos)mod(4)>0 then
    inc(xind);
  ListBox1.ItemIndex:=xind-1;
  ListBox1Click(sender);
end;

procedure TFDISBENNETT.lee_registro;
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

(*
procedure TFDISBENNETT.lee_registro2;
var
  Registry: TRegistry;
  Cerrar:integer;
begin
  Registry := TRegistry.Create(KEY_READ);
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    cerrar:=0;
    try
      if Registry.OpenKey('\SOFTWARE\IMAGEN\VOL\DISP', True) then
        Cerrar:=Registry.ReadInteger('Cerrar');
    except
    end;
    if Cerrar=1 then begin
      SwCerrar:=true;
      registro(0,'Cerrar');
      Close;
      Exit;
    end;
  finally                
    Registry.CloseKey;
    Registry.Free;
    registro(0,'Cerrar');
  end;
end;
  *)
procedure TFDISBENNETT.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISBENNETT.CombustibleEnPosicion(xpos,xposcarga:integer):integer;
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

procedure TFDISBENNETT.ListBoxPC1DblClick(Sender: TObject);
begin
  SwMensaje:=not SwMensaje;
end;

end.
