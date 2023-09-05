unit UDISBENNETT2;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OoMisc, AdPort, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  Mask, ImgList, Db, DBTables, Grids, ULibPrint, DBGrids, RXShell, Registry,
  IBCtrls, SIBEABase, SIBFIBEA, FIBDatabase, pFIBDatabase, UIMGUTIL,
  dxGDIPlusClasses;

Const MaxEsperaRsp=5;
      NivelPrecioContado='1';
      NivelPrecioCredito='2';
      MCxP=4;

type
  TFDISBENNETT2 = class(TForm)
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
    Panel2: TPanel;
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
    Button1: TButton;
    Timer2: TTimer;
    Label4x: TLabel;
    TL_BombACTIVO: TStringField;
    TL_BombIMPRIMEAUTOM: TStringField;
    TL_BombDIGITOAJUSTEPRECIO: TIntegerField;
    TL_BombCAMPOLECTURA: TStringField;
    TL_BombMODOOPERACION: TStringField;
    PageControl1: TPageControl;
    Button2: TButton;
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
    procedure Button1Click(Sender: TObject);
    procedure ListBoxPC1DblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    swcierrabd,
    SwInicio:boolean;
    LineaBuff,
    LineaTimer,
    Linea:string;
    SwEspera,
    SwBcc,
    SwFlumin,
    FinLinea:boolean;
    ContEspera,
    ContEsperaPaso2,
    StEsperaPaso3,
    ContEsperaPaso3,
    NumPaso,
    ContBuffLleno,
    errbcc,
    PosicionActual:integer;
    swprocesando:boolean;
    UltimoStatus:string;
    SnPosCarga,SnLitros:integer;
    SnImporte:real;
    EmularEstatus,
    LineaEmular:string;
    SwMensaje:boolean;
    ContadorAlarma:integer;
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
    procedure registro(valor:integer;variable:string);
    procedure lee_registro;
    function CombustibleEnPosicion(xpos,xposcarga,xdef:integer):integer;
    procedure EnviaPreset(var rsp:string;xcomb:integer;xprec:string;swreintento:boolean);
    procedure ActualizaAdic(xval:integer);
    procedure ProcesaFlujo(xpos:integer;swarriba:boolean);
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
       PosAutorizada:integer;
       estatusant:integer;
       NoComb   :integer; // Cuantos combustibles hay en la posicion
       Estat_Cons:char;
       TComb    :array[1..MCxP] of integer; // Claves de los combustibles
       TPos     :array[1..MCxP] of integer;
       TDiga    :array[1..MCxP] of integer;
       TAjuPos   :array[1..MCxP] of integer;
       SwAjuPos   :array[1..MCxP] of boolean;
       TMang        :array[1..MCxP] of integer;
       TAdic     :array[1..MCxP] of integer;
       TCmndZ    :array[1..MCxP] of string[14];
       TotalLitros  :array[1..MCxP] of real;
       TotalLtsAnt  :array[1..MCxP] of real;
       SwDesp,SwA,SwPrec,
       SwAdic       :boolean;
       HoraFinv,
       Hora         :TDateTime;
       SwInicio,
       SwInicio2    :boolean;
       SwPreset,
       SwCargaTotales,
       IniciaCarga,
       SwPrepago:boolean;
       IntentosTotales:byte;
       ActualizarPrecio:Boolean;
       Mensaje:string[10];
       swcargando,
       swcargapreset,
       SwActivo,
       SwCmndF,
       SwDesHabilitado,
       SwContStop,
       SwOcc,SwCmndB  :boolean;
       ModoOpera    :string[8];
       TipoDisp,
       ContPreset,
       ContOcc,
       ContStop,
       StCero,
       TipoPago,
       TipoPagoAnt,
       FinVenta     :integer;
       Boucher      :string[12];
       swarosmag:boolean;
       aros_cont,
       aros_mang,
       aros_cte,
       aros_vehi:integer;
       swarosmag_stop:boolean;

       horaprotegida:TDateTime;

       swflujovehiculo:boolean;
       flujovehiculo  :integer;

       stflujo,
       auxprotec      :integer;

       PresetCont,
       PresetComb,
       PresetImpoN:integer;
       PresetImpo:real;
     end;

const idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxEspera2=5;
      MaxEspera3=5;


var
  FDISBENNETT2: TFDISBENNETT2;
  TPosCarga:array[1..100] of tiposcarga;
  MaxPosCarga:integer;
  MaxPosCargaActiva:integer;
  AvanceBar:integer;
  SwAplicaCmnd,
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
  // FLUJO
  SwFlujoStd:boolean;
  //TabAju  :array[1..4] of integer;

implementation

uses ULIBGRAL, ULIBLICENCIAS, DDMCONS, UDISMENU;

{$R *.DFM}

procedure TFDISBENNETT2.ActualizaAdic(xval:integer);
begin
  with DMCONS do begin
    if xval=0 then begin
      stadic:=1;
    end
    else begin
      stadic:=2;
    end;
    try
      T_ConfIb.Active:=true;
      try
        if not T_ConfIb.IsEmpty then begin
          T_ConfIb.Edit;
          T_ConfIbPosCliente.AsInteger:=xval;
          T_ConfIb.Post;
        end;
      finally
        T_ConfIb.Active:=false;
      end;
    except
    end
  end;
end;



procedure TFDISBENNETT2.IniciaBaseDeDatos;
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
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFDISBENNETT2.IniciaEstacion;
var i,j,xisla,xpos,xcomb,xnum,ii,jj:integer;
    existe:boolean;
begin
  with DMCONS do begin
    MaxPosCarga:=0;
    for i:=1 to 100 do with TPosCarga[i] do begin
      estatus:=-1;
      estatusant:=-1;
      NoComb:=0;
      Estat_Cons:=' ';
      SwInicio:=true;
      SwInicio2:=true;
      IniciaCarga:=false;
      SwPrepago:=false;
      SwPreset:=false;
      ContPreset:=0;
      ActualizarPrecio:=false;
      tipodisp:=0;
      Mensaje:='';
      importe:=0;
      impopreset:=0;
      volumen:=0;
      precio:=0;
      for j:=1 to MCxP do begin
        TotalLitros[j]:=0;
        TotalLtsAnt[j]:=0;
      end;
      for j:=1 to 4 do begin
        TAdic[j]:=0;
        TAjuPos[j]:=0;
        SwAjuPos[j]:=true;
        TCmndZ[j]:='';
      end;
      SwCargando:=false;
      SwCargaPreset:=false;
      SwCargaTotales:=true;
      IntentosTotales:=0;
      PosAutorizada:=0;
      SwDeshabilitado:=false;
      SwArosMag:=false;
      SwArosMag_stop:=false;
      HoraProtegida:=0;
      SwActivo:=false;
      SwCmndF:=false;
      StCero:=0;
      tipopago:=0;
      tipopagoant:=0;
      finventa:=0;
      boucher:='';
      SwOCC:=false;
      ContOcc:=0;
      ContStop:=0;
      SwContStop:=false;
      SwAdic:=false;
      PresetImpo:=0;
      PresetImpoN:=0;
      PresetComb:=0;
      StFlujo:=0;
    end;
    //CargaAdicional;
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
    // FIN
    Q_BombIb.First;
    while not Q_BombIb.Eof do begin
      xisla:=Q_BombIbIsla.asinteger;
      xpos:=Q_BombIbPosCarga.AsInteger;
      xcomb:=Q_BombIbCombustible.AsInteger;
      if (xpos>MaxPosCarga)and(xpos<=DMCONS.MaximoDePosiciones) then begin
        MaxPosCarga:=xpos;
      end;
      with TPosCarga[xpos] do begin
        Isla:=xisla;
        SwDesp:=false;
        SwPrec:=false;
        SwA:=false;
        existe:=false;
        ModoOpera:=Q_BombIbModoOperacion.AsString;
        TipoDisp:=Q_BombIbTeam_NoDisp.AsInteger;
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
            
          ii:=TPos[NoComb];
          case ii of
            1:TAjuPos[ii]:=10;
            2:TAjuPos[ii]:=13;
            else
              TAjuPos[ii]:=12;
          end;
          if nocomb=3 then begin
            for jj:=1 to 4 do
              if SwAjuPos[jj] then
                TAjuPos[jj]:=9+jj;
          end;
          jj:=Q_BombIbDigitoAjusteVol.AsInteger;
          if jj in [10,11,12,13] then begin
            TAjuPos[ii]:=jj;
            SwAjuPos[ii]:=false;
          end;

          TDiga[TPos[NoComb]]:=Q_BombIbCon_DigitoAjuste.AsInteger;
          TAdic[TPos[NoComb]]:=Q_BombIbHj_Addr.AsInteger;
          if TPos[NoComb]=4 then
            TAdic[3]:=Q_BombIbHj_Addr.AsInteger;
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


procedure TFDISBENNETT2.FormShow(Sender: TObject);
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
      SwFlumin:=false;
      SwEsperaRsp:=false;
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
      Timer2.Enabled:=true;
      DMCONS.T_ConfIb.Active:=true;
      ActualizaAdic(2); 
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

function TFDISBENNETT2.StringCom(ss:string):string;
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

function TFDISBENNETT2.CalculaBCC(ss:string):char;
var i,n,m:integer;
begin
  n:=0;
  for i:=1 to length(ss) do
    n:=n+ord(ss[i]);
  m:=(n)mod(256);
  result:=char(256-m);
end;

procedure TFDISBENNETT2.LimpiaConsola;
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

procedure TFDISBENNETT2.DespliegaPosCarga(xpos:integer);
var i,ii,xp,rango,posi,posf,xcomb,xc:integer;
    xnombre,xdescrip:string;
    xdiflts:real;
    swdif:boolean;
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
        xcomb:=CombustibleEnPosicion(xpos,PosActual,1);
        if xcomb in [1..maxcomb] then
          xnombre:=DMCONS.TabComb[xcomb].Nombre;
        if xpos in [posi..posf] then begin
          i:=xpos-posi+1;
          TStaticText(FindComponent('StaticText'+IntToStr(i))).Caption:=IntToClaveNum(xpos,2);
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
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',precio)+' $/Lts');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add('');
          TListBox(FindComponent('ListBoxPC'+IntToStr(i))).Items.Add(FormatFloat('##,##0.000',volumen)+' Litros');
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
        if SwDesp then with DMCONS do begin
          SwDesp:=false;
          if (importe>0.001)or(tipopago>0) then begin
            SwCargaTotales:=true;
            IntentosTotales:=0;
            try
              try
                swcierrabd:=true;
                T_MoviIb.Active:=true;
                T_MoviIb.Insert;
                T_MoviIbFecha.AsDateTime:=date;
                T_MoviIbHora.AsDateTime:=now;
                T_MoviIbHoraStr.AsString:=HoraPaq(T_MoviIbHora.AsDateTime);
                T_MoviIbPosCarga.AsInteger:=i;
                xcomb:=CombustibleEnPosicion(i,PosActual,1);
                if TabComb[xcomb].Agruparcon>0 then begin
                  T_MoviIbKilometraje.asinteger:=TMang[PosActual];
                  xc:=TabComb[xcomb].Agruparcon;
                  if TabComb[xc].Activo then
                    xcomb:=xc;
                end;
                T_MoviIbCombustible.AsInteger:=xcomb;
                T_MoviIbVolumen.AsFloat:=AjustaFloat(Volumen,3);
                T_MoviIbImporte.AsFloat:=AjustaFloat(Importe,2);
                T_MoviIbPrecio.AsFloat:=AjustaFloat(precio,2);
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
                T_MoviIbManguera.AsInteger:=TMang[PosActual];
                T_MoviIbTipoPago.asinteger:=TPosCarga[i].TipoPago;
                T_MoviIbBoucher.Asstring:=Boucher;
                T_MoviIbCuponImpreso.AsString:='No';
                T_MoviIbReferenciaBitacora.AsInteger:=0;
                T_MoviIbGasId.AsInteger:=Random(1000000);
                TPosCarga[i].TipoPagoAnt:=TPosCarga[i].TipoPago;
                TPosCarga[i].TipoPago:=0;
                Boucher:='';

                if swprec then begin
                  dmcons.ActualizaTotalesPrecio(i,posactual,volumen);
                  swprec:=false;
                end;


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
        for xpos:=1 to MaxPosCargaActiva do begin
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
          for xpos:=1 to MaxPosCargaActiva do with TPosCarga[xpos] do begin
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

procedure TFDISBENNETT2.ProcesaFlujo(xpos:integer;swarriba:boolean);
var xp,xcmb:integer;
    xadic:real;
    ss,sval:string;
begin
  with DMCONS do begin
    // Ver 4.4
    for xcmb:=1 to TPosCarga[xpos].NoComb do begin
      xp:=TPosCarga[xpos].TPos[xcmb];
      if swarriba then begin  // arriba
        if swflujostd then
          ComandoConsolaBuff(TPosCarga[xpos].TCmndZ[xp],true);
        TPosCarga[xpos].stflujo:=1;
      end
      else begin // abajo
        xadic:=TPosCarga[xpos].Tadic[xp]/100;
        if xadic>9.5 then
          xadic:=9.99;
        if xadic>0 then
          sval:='+'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)))
        else
          sval:='-'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)));
        ss:='Z'+IntToClaveNum(xpos,2)+InttoClaveNum(TPosCarga[xpos].TAjuPos[xp],4)+sval;
        ComandoConsolaBuff(ss,false);
        if swflumin then
          ComandoConsolaBuff(ss,false);
        TPosCarga[xpos].stflujo:=0;
      end;
    end;
    // Fin ver4.4                               
  end;
end;

procedure TFDISBENNETT2.ProcesaLinea;
label uno;
var lin,ss,ss2,rsp,
    xestado,xmodo,
    xdisp2,xmodo2,xestado2,
    sprec,sslin           :string;
    simp,spre,sval  :string[20];
    xcmnd,
    i,j,xpos,ii     :integer;
    XMANG,XCTE,XVEHI,
    xcmb,
    xp,xpr,xcomb,xfolio:integer;
    ximporte,xadic,
    ximpo,xdif,
    xprecio,xvol    :real;
    swaux:boolean;
    swerr           :boolean;
    totlts:array[1..4] of real;
begin
  try
    if LineaTimer='' then
      exit;
    SwEsperaRsp:=false;
    ContEsperaRsp:=0;
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
           NumPaso:=1;
           StaticText5.Caption:=IntToStr(NumPaso);
           ContEspera:=0;
           UltimoStatus:=LineaTimer;
           sslin:=copy(lin,4,length(lin)-3);
           MaxPosCargaActiva:=(length(sslin))div(2);
           if MaxPosCargaActiva>MaxPosCarga then
             MaxPosCargaActiva:=MaxPosCarga;
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do begin
               SwCmndB:=true;
               PosActual:=StrToIntDef(sslin[xpos*2-1],0);
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
               estatus:=StrToIntDef(sslin[xpos*2],0);
               if (estatus=0)and(stcero<=3) then begin
                 inc(stcero);
                 estatus:=estatusant;
               end
               else stcero:=0;
               Mensaje:='Pos = '+inttostr(posactual);
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
               if not (estatus in [5,6]) then
                 swarosmag_stop:=false;
               case estatus of
                 0:begin
                     descestat:='---';
                     if estatusant<>0 then begin
                       for xcomb:=1 to nocomb do
                         DMCONS.RegistraBitacora3(1,'Desconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                     end;
                   end;
                 1:begin
                     auxprotec:=0;
                     descestat:='Inactivo';
                     swcargando:=false;
                     SwContStop:=false;
                     if swprec then
                       swprec:=false;
                     if (estatusant=2)and(PresetImpo>=0.01) then begin  // vuelve a autorizar
                       SnPosCarga:=xpos;
                       SnImporte:=PresetImpo;
                       inc(PresetImpoN);
                       if PresetImpoN<=3 then
                         estatus:=estatusant;
                       EnviaPreset(rsp,PresetComb,'',false);
                     end
                     else begin
                       if estatusant<>1 then begin
                         if (swflujostd) then begin
                           ProcesaFlujo(xpos,false);
                           esperamiliseg(100);
                         end;
                         if swflujovehiculo then begin
                           swflujovehiculo:=false;
                           swadic:=true;
                         end;
                         SwArosMag:=false;
                         PosAutorizada:=0;
                         FinVenta:=0;
                         TipoPago:=0;
                         SwOcc:=false;
                         ContOcc:=0;
                         PresetImpo:=0;
                         PresetImpoN:=0;
                         if SwCmndF then begin
                           if DMCONS.BennettOmitirComandoF='No' then begin
                             ss:='F'+IntToClaveNum(xpos,2)+'9999';
                             ComandoConsolaBuff(ss,false);
                             EsperaMiliseg(100);
                           end;
                           SwCmndF:=false;
                         end;
                       end;
                       if estatusant=0 then begin
                         for xcomb:=1 to nocomb do
                           DMCONS.RegistraBitacora3(1,'Reconexión de Manguera','Pos Carga '+inttostr(xpos)+' / Combustible '+DMCONS.TabComb[TComb[xcomb]].Nombre,'U');
                       end;
                     end;
                   end;
                 2:begin
                     descestat:='Autorizado';
                     if estatusant=4 then begin
                       SwContStop:=true;ContStop:=0;
                     end;
                     (*
                     if stflujo=1 then begin
                       if (swflujostd) then begin
                         ProcesaFlujo(xpos,false);
                         esperamiliseg(100);
                       end;
                     end;
                     *)
                     if SwContStop then begin
                       inc(ContStop);
                       if ContStop>=8 then begin
                         SwContStop:=false;
                         PresetImpo:=0;
                         PresetImpoN:=0;
                         ss:='E'+IntToClaveNum(xpos,2); // Desautorizar
                         ComandoConsolaBuff(ss,false);
                       end;
                     end
                     else if SwArosMag then begin
                       if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                         PresetImpo:=0;PresetImpoN:=0;
                         ss:='E'+IntToClaveNum(xpos,2); // STOP
                         ComandoConsolaBuff(ss,false);
                         HoraProtegida:=now+10*tmsegundo;
                         if swemular then
                           EmularEstatus[2*xpos]:='1';
                       end;
                     end;
                   end;
                 3:begin
                     swcargando:=false;
                     descestat:='Pistola Levantada';
                     if (estatusant=4)and(PresetImpo>=0.01) then begin  // vuelve a autorizar
                       SnPosCarga:=xpos;
                       SnImporte:=PresetImpo;
                       inc(PresetImpoN);
                       if PresetImpoN<=3 then
                         estatus:=estatusant;
                       EnviaPreset(rsp,PresetComb,'',false);
                     end;
                   end;
                 4:begin
                     descestat:='Listo para Despachar';
                     (*
                     if stflujo=1 then begin
                       if (swflujostd) then begin
                         ProcesaFlujo(xpos,false);
                         esperamiliseg(100);
                       end;
                     end;
                     *)
                     if (SwArosMag) then begin
                       if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                         PresetImpo:=0; PresetImpoN:=0;
                         ss:='E'+IntToClaveNum(xpos,2); // STOP
                         ComandoConsolaBuff(ss,false);
                         SwArosMag_Stop:=true;
                         HoraProtegida:=now+10*tmsegundo;
                         if swemular then
                           EmularEstatus[2*xpos]:='6';
                       end;
                     end;
                     if (not SwDesHabilitado)and(SwArosMag_Stop) then begin
                       if (DMCONS.ControlArosMagneticosRecon(xpos,xmang,xcte,xvehi)) then begin
                         if (xmang=aros_mang)and(xcte=aros_cte)and(xvehi=aros_vehi)and(aros_cont<DMCONS.ReconexionesAros) then begin
                           ss:='S'+IntToClaveNum(xpos,2); // START
                           ComandoConsolaBuff(ss,false);
                           inc(aros_cont);
                           SwArosMag_Stop:=false;
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
                             EmularEstatus[2*xpos]:='5';
                         end;
                       end;
                     end;
                   end;
                 5:begin
                     descestat:='Despachando';
                     IniciaCarga:=true;
                     if not SwCargando then
                       SwCargaPreset:=true;
                     swcargando:=true;
                     (*
                     if stflujo=1 then begin
                       if (swflujostd) then begin
                         ProcesaFlujo(xpos,false);
                         esperamiliseg(100);
                       end;
                     end;
                     *)
                     if SwArosMag then begin
                       if (not DMCONS.ConexionArosActiva(xpos)) then with DMCONS do begin
                         PresetImpo:=0; PresetImpoN:=0;
                         ss:='E'+IntToClaveNum(xpos,2); // STOP
                         ComandoConsolaBuff(ss,false);
                         SwArosMag_Stop:=true;
                         if swemular then
                           EmularEstatus[2*xpos]:='6';
                       end;
                     end;
                     if (DMCONS.BennettPararVentaCompleta='Si')and(TPosCarga[xpos].presetimpo>0.5) then begin
                       inc(TPosCarga[xpos].PresetCont);
                       if (TPosCarga[xpos].importe>=abs(TPosCarga[xpos].presetimpo+0.01)) then begin
                         if TPosCarga[xpos].PresetCont>=3 then begin
                           PresetImpo:=0; PresetImpoN:=0;
                           ss:='E'+IntToClaveNum(xpos,2); // STOP
                           ComandoConsolaBuff(ss,false);
                           Button1.Click;
                           if DMCONS.swemular then
                             EmularEstatus[2*xpos]:='6';
                         end;
                       end;
                     end;
                   end;
                 6:begin
                     descestat:='Detenido';
                     if (not SwDesHabilitado)and(SwArosMag_Stop) then begin
                       if DMCONS.ControlArosMagneticosRecon(xpos,xmang,xcte,xvehi) then begin
                         if (xmang=aros_mang)and(xcte=aros_cte)and(xvehi=aros_vehi)and(aros_cont<DMCONS.ReconexionesAros) then begin
                           ss:='S'+IntToClaveNum(xpos,2); // START
                           ComandoConsolaBuff(ss,false);
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
                             EmularEstatus[2*xpos]:='5';
                         end;
                       end;
                     end;
                   end;
                 7:begin
                     descestat:='Fin de Venta';
                     if Estatus<>Estatusant then
                       HoraFinv:=Now;
                     if (Now-HoraFinv)>=2*TmMinuto then begin
                       ComandoConsola('J'+IntToClaveNum(xpos,2));
                       if DMCONS.swemular then
                         EmularEstatus[2*xpos]:='1';
                     end;
                   end;
                 8:descestat:='Venta Pendiente';
                 9:descestat:='Error';
               end;
             end;
           end;
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do if xpos<=dmcons.MaximoDePosiciones then begin
               // Actualiza Precios
               if ActualizarPrecio then with DMCONS do begin
                 for i:=1 to NoComb do begin
                   esperamiliseg(100);
                   ss:='U'+IntToClaveNum(xpos,2)+NivelPrecioContado+IntToStr(TPos[i])+FiltraStrNum(FormatoNumeroSinComas(TabComb[TComb[i]].precio,5,2));
                   ComandoConsolaBuff(ss,false);
                   esperamiliseg(100);
                   if estatus in [2,4,5,6] then
                     swprec:=true;
                 end;
                 ActualizarPrecio:=false;
               end;
             end;
           end;
           // Checa las posiciones que estan solicitando autorizacion
           for xpos:=1 to MaxPosCargaActiva do begin
             with TPosCarga[xpos] do if xpos<=dmcons.MaximoDePosiciones then begin
               if contpreset>0 then
                 dec(contpreset);
               case Estatus of
                 1:if SwInicio then begin
                     SwInicio:=false;
                     SwPrepago:=false;
                     SwPreset:=false;
                   end;
                 3:if (not SwDesHabilitado)and(ModoOpera='Normal')and(now>=HoraProtegida) then begin
                     if ContPreset<=0 then begin
                       SwArosMag:=false;
                       PosAutorizada:=0;
                       FinVenta:=0;
                       swaux:=true;
                       with DMCONS do if CantProtec>0 then begin
                         if auxprotec<2 then begin
                           inc(auxprotec);
                           comandoconsola('Y'+IntToClaveNum(xpos,2));
                           esperamiliseg(100);
                           swaux:=false;
                         end;
                       end;
                       if swaux then begin
                         if TipoDisp=400 then begin
                           if DMCONS.BennettOmitirComandoF='No' then begin
                             ss:='F'+IntToClaveNum(xpos,2)+'9999'; // Alocate Limit
                             ComandoConsolaBuff(ss,true);
                             EsperaMiliseg(100);
                           end;
                         end;
                         if DMCONS.ModoAutorizaBennett=0 then begin
                           // Autoriza
                           if (swflujostd)and(not swflujovehiculo) then begin
                             ProcesaFlujo(xpos,true);
                             esperamiliseg(100);
                           end;
                           ss:='S'+IntToClaveNum(xpos,2); // Autorizar
                           ComandoConsolaBuff(ss,false);
                         end
                         else begin
                           SnImporte:=9990.00;
                           SnPosCarga:=xpos;
                           EnviaPreset(ss,0,'',false);
                         end;
                         TPosCarga[xpos].presetimpo:=0;
                         TPosCarga[xpos].presetimpon:=0;
                         SwInicio:=false;
                         if DMCONS.SwEmular then
                           EmularEstatus[2*xpos]:='5';
                       end;
                     end;
                   end;
               end;
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
                 swinicio2:=false;
                 volumen:=StrToFloat(copy(lin,5,6))/100;
                 simp:=copy(lin,11,6);
                 spre:=copy(lin,17,4);
                 importe:=StrToFloat(simp)/100;
                 precio:=StrToFloat(spre)/1000;
                 if TPosCarga[xpos].TDiga[1]=22 then
                   precio:=StrToFloat(spre)/100;
                 // valida ventas mayores a 10000 pesos
                 ximpo:=volumen*precio;
                 xdif:=abs(ximpo-importe);
                 if xdif>=900 then begin
                   importe:=AjustaFloat(ximpo,2);
                 end;
                 // fin
                 xvol:=ajustafloat(dividefloat(importe,precio),3);
                 if abs(volumen-xvol)<0.05 then
                   volumen:=xvol;
                 if (Estatus in [7,8])and(swcargando) then begin
                   swcargando:=false;
                   swdesp:=true;
                   DMCONS.AgregaLog('GUARDA VENTA Pos:'+inttostr(xpos)+' Estatus:'+inttostr(estatus)+' - ant:'+inttostr(estatusant));
                 end;
                 DespliegaPosCarga(xpos);
                 if (TPosCarga[xpos].finventa=0) then begin
                   if Estatus in [7,8] then begin
                     ss:='J'+IntToClaveNum(xpos,2); // Fin de Venta
                     if DMCONS.swemular then
                       EmularEstatus[2*xpos]:='1';
                     ComandoConsola(ss);
                   end;
                 end;
                 if (presetimpo>0.5) then begin
                   if (estatus=5)and(importe>presetimpo+0.01) then begin
                     PresetImpo:=0; PresetImpoN:=0;
                     ss:='E'+IntToClaveNum(xpos,2); // STOP
                     ComandoConsolaBuff(ss,false);
                   end;
                 end;
               except
               end;
             end;
           end;
         end;
         // 4.3x
     '1':begin // pide estatus de una bomba
           NumPaso:=2;
           StaticText5.Caption:=IntToStr(NumPaso);
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if (xpos>=1)and(xpos<=DMCONS.MaximoDePosiciones) then begin
             ContEsperaPaso2:=0;
             with TPosCarga[xpos] do begin
               try
                 swinicio2:=false;
                 volumen:=StrToFloat(copy(lin,5,8))/100;
                 simp:=copy(lin,13,8);
                 spre:=copy(lin,21,5);
                 importe:=StrToFloat(simp)/100;
                 precio:=StrToFloat(spre)/100;
                 (*
                 // valida ventas mayores a 10000 pesos
                 ximpo:=volumen*precio;
                 xdif:=abs(ximpo-importe);
                 if xdif>=900 then begin
                   importe:=AjustaFloat(ximpo,2);
                 end;
                 // fin
                   *)
                 xvol:=ajustafloat(dividefloat(importe,precio),3);
                 if abs(volumen-xvol)<0.05 then
                   volumen:=xvol;
                 if (Estatus in [7,8])and(swcargando) then begin
                   swcargando:=false;
                   swdesp:=true;
                   DMCONS.AgregaLog('GUARDA VENTA Pos:'+inttostr(xpos)+' Estatus:'+inttostr(estatus)+' - ant:'+inttostr(estatusant));
                 end;
                 DespliegaPosCarga(xpos);
                 if (TPosCarga[xpos].finventa=0) then begin
                   if Estatus in [7,8] then begin
                     ss:='J'+IntToClaveNum(xpos,2); // Fin de Venta
                     if DMCONS.swemular then
                       EmularEstatus[2*xpos]:='1';
                     ComandoConsola(ss);
                   end;
                 end;

               except
               end;
             end;
           end;
         end;
     'Y':with DMCONS do begin // proteccion lts
           if lin[4]='2' then begin
             xpos:=StrToIntDef(copy(lin,2,2),0);
             if TPosCarga[xpos].auxprotec=2 then begin

               ii:=strtoint(copy(lin,5,3));
               DMCONS.AgregaLog('AuxProtec:'+inttostr(TPosCarga[xpos].auxprotec)+'  '+inttostr(ii));
               for i:=1 to CantProtec do begin
                 DMCONS.AgregaLog('Protec:'+inttostr(TabProtec[i]));
                 if ii=TabProtec[i] then begin
                   TPosCarga[xpos].swflujovehiculo:=true;
                 end;
                   //ProcesaFlujo(xpos,false);
               end;
             end;
           end;
         end;
         // fin
     'N':begin // totales de la bomba
           NumPaso:=3;
           StaticText5.Caption:=IntToStr(NumPaso);
           xpos:=StrToIntDef(copy(lin,2,2),0);
           if (xpos>=1)and(xpos<=DMCONS.MaximoDePosiciones) then begin
             ContEsperaPaso3:=0;
             with TPosCarga[xpos] do begin
               SwCargaTotales:=false;
               IntentosTotales:=0;
               Totlts[1]:=StrToFloat(copy(lin,4,10))/1000;
               Totlts[2]:=StrToFloat(copy(lin,14,10))/1000;
               Totlts[3]:=StrToFloat(copy(lin,24,10))/1000;
               Totlts[4]:=StrToFloat(copy(lin,34,10))/1000;
               for j:=1 to MCxP do
                 if TPos[j] in [1..4] then
                   TotalLitros[j]:=TotLts[TPos[j]];
               DMCONS.RegistraTotales_BD4(xpos,TotalLitros[1],TotalLitros[2],TotalLitros[3],TotalLitros[4]);
               DespliegaPosCarga(xpos);
             end;
           end;
         end;
    end;
    if (ListaCmnd.Count>0)and(not SwEsperaRsp) then begin
      ss:=ListaCmnd[0];
      if swflumin then begin
        if ss[1]='Z' then begin
          if not DMCONS.swemular then begin
            Ap1.Open:=false;
            EsperaMiliSeg(100);
            Ap1.Open:=true;
            EsperaMiliSeg(100);
          end;
        end;
      end;
      ListaCmnd.Delete(0);
      ComandoConsola(ss);
      if not swflumin then
        esperamiliseg(300);
      exit;
    end
    else begin
      inc(NumPaso);
      PosicionActual:=0;
      if (swflumin)and(ListaCmnd.Count<=0) then
        swcerrar:=true;
    end;
    StaticText5.Caption:=IntToStr(NumPaso);
    // checa lecturas de dispensarios
    if NumPaso=2 then begin
      if PosicionActual<MaxPosCargaActiva then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if (estatus<>estatusant)or(estatus>=5)or(SwA)or(swinicio2)or(swcargando) then begin
              SwA:=false;
              if DMCONS.Bennett8Digitos<>'Si' then
                ComandoConsolaBuff('A'+IntToClaveNum(PosicionActual,2),false)
              else
                ComandoConsolaBuff('1'+IntToClaveNum(PosicionActual,2),false);
            end
            else
              DespliegaPosCarga(PosicionActual);
          end;
        until (PosicionActual>=MaxPosCargaActiva);
      end;
      if not SwEsperaRsp then begin
        NumPaso:=3;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionActual:=0;
      end;
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
            for xpos:=1 to MaxPosCargaActiva do with TPosCarga[xpos] do begin
              xmodo:=xmodo+ModoOpera[1];
              if not SwDesHabilitado then begin
                case estatus of
                  0:xestado:=xestado+'0'; // Sin Comunicación
                  1:xestado:=xestado+'1'; // Inactivo (Idle)
                  5:xestado:=xestado+'2'; // Cargando (In Use)
                  7:if not swcargando then
                      xestado:=xestado+'3' // Fin de Carga (Used)
                    else
                      xestado:=xestado+'2';
                  3,4:xestado:=xestado+'5'; // Llamando (Calling)
                  2,8:xestado:=xestado+'9'; // Autorizado
                  6:xestado:=xestado+'8'; // Detenido (Stoped)
                  else xestado:=xestado+'0';
                end;
              end
              else xestado:=xestado+'7'; // Deshabilitado
              xcomb:=CombustibleEnPosicion(xpos,PosActual,1);
              ss:=inttoclavenum(xpos,2)+'/'+inttostr(xcomb);
              ss:=ss+'/'+FormatFloat('###0.##',volumen);
              ss:=ss+'/'+FormatFloat('#0.##',precio);
              ss:=ss+'/'+FormatFloat('####0.##',importe);
              lin:=lin+'#'+ss;
              //end;
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

      if PosicionActual<MaxPosCargaActiva then begin
        repeat
          Inc(PosicionActual);
          with TPosCarga[PosicionActual] do if NoComb>0 then begin
            if swcargatotales then begin
              inc(intentostotales);
              if intentostotales>3 then
                swcargatotales:=false;
              ComandoConsolaBuff('N'+IntToClaveNum(PosicionActual,2),false); // Totales
            end
            else
              DespliegaPosCarga(PosicionActual);
          end;
        until (PosicionActual>=MaxPosCargaActiva);
      end;
      if not SwEsperaRsp then begin
        NumPaso:=4;
        StaticText5.Caption:=IntToStr(NumPaso);
        PosicionActual:=0;
      end;
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
            for xpos:=1 to MaxPosCargaActiva do if TPosCarga[xpos].TipoDisp=400 then  begin
              ss:='F'+IntToClaveNum(xpos,2)+'9999'; // Alocate Limit
              ComandoConsola(ss);
              EsperaMiliseg(100);
            end;
            rsp:='OK';
            SwCerrar:=true;
          end
          // GLOG: GUARDA LOG
          else if ss='GLOG' then begin
            rsp:='OK';
            Button1.Click;
          end
          // STAT: VALIDA ESTATUS ADIC
          else if ss='STAT' then begin
            rsp:='OK';
            ii:=StrToIntDef(ExtraeElemStrSep(Q_CmndComando.AsString,2,' '),0);
            if (ii<>stadic-1) then begin
              rsp:='ERROR '+inttostr(stadic-1);
            end
            else begin
              for xpos:=1 to MaxPosCargaActiva do
                TPosCarga[xpos].SwAdic:=true;
            end;
          end
          // CMND: ACTIVA MODO PREPAGO
          else if ss='AMP' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if xpos=0 then begin
                for xpos:=1 to MaxPosCargaActiva do
                  TPosCarga[xpos].ModoOpera:='Prepago';
                ActivaModoPrepago(0);
                rsp:='OK';
              end
              else if (xpos in [1..maxposcargaactiva]) then begin
                TPosCarga[xpos].ModoOpera:='Prepago';
                ActivaModoPrepago(xpos);
                rsp:='OK';
              end;
            end
            else rsp:='Posicion no Existe';
          end
          // CMND: DESACTIVA MODO PREPAGO
          else if ss='DMP' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              TPosCarga[xpos].TipoPago:=0;
              if xpos=0 then begin
                for xpos:=1 to MaxPosCargaActiva do
                  TPosCarga[xpos].ModoOpera:='Normal';
                DesActivaModoPrepago(0);
                rsp:='OK';
              end
              else if (xpos in [1..maxposcargaactiva]) then begin
                TPosCarga[xpos].ModoOpera:='Normal';
                DesActivaModoPrepago(xpos);
                rsp:='OK';
              end;
            end
            else rsp:='Posicion no Existe';
          end
          // ORDENA CARGA DE COMBUSTIBLE
          else if ss='OCC' then begin     // OCC POSCARGA IMPORTE COMBUSTIBLE TIPOVENTA FINVENTA BOUCHER
            SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            xpos:=SnPosCarga;
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
                rsp:='OK';
                if (SnPosCarga in [1..MaxPosCargaActiva]) then begin
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
                      TPosCarga[SnPosCarga].ContOCC:=DMCONS.BennettReintentosPreset
                    else begin
                      dec(TPosCarga[SnPosCarga].ContOCC);
                      esperamiliseg(500);
                    end;
                    SwAplicaCmnd:=false;
                    try
                      SnImporte:=StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '));
                      if (SnImporte<1) then
                        rsp:='Importe fuera de rango válido: de 1.00 a 9999.00';
                      if (DMCONS.BennettPresetExtendido='No')and(SnImporte>9999.99) then
                        rsp:='Importe fuera de rango válido: de 1.00 a 9999.00';
                    except
                      rsp:='Error en Importe';
                    end;
                    if rsp='OK' then begin
                      ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                      xcomb:=StrToIntDef(ExtraeElemStrSep(ss,1,'P'),0);
                      sprec:=ExtraeElemStrSep(ss,2,'P');
                      TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                      TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                      TPosCarga[SnPosCarga].boucher:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,7,' ');
                      TPosCarga[SnPosCarga].swflujovehiculo:=false;
                      if DMCONS.FlujoPorVehiculo='Si' then begin
                        ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,8,' ');
                        if ss<>'' then begin
                          TPosCarga[SnPosCarga].swflujovehiculo:=true;
                          TPosCarga[SnPosCarga].flujovehiculo:=StrToIntDef(ss,0);
                        end;
                      end;
                      TPosCarga[SnPosCarga].swarosmag:=false;
                      if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                        swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                        aros_cont:=0;
                        if (not swarosmag) then
                          rsp:='Aro magnético se encuentra desconectado';
                      end;
                      if rsp='OK' then begin
                          if TPosCarga[SnPosCarga].swflujovehiculo then begin
                            if (Licencia3Ok) then begin
                              xpos:=SnPosCarga;
                              // Ver 4.4
                              for xcmb:=1 to TPosCarga[xpos].NoComb do begin
                                  xp:=TPosCarga[xpos].TPos[xcmb];
                                  ss:='Z'+IntToClaveNum(xpos,2);
                                  ss:=ss+InttoClaveNum(TPosCarga[xpos].TAjuPos[xp],4);
                                  xadic:=TPosCarga[xpos].flujovehiculo+TPosCarga[xpos].Tadic[xp]/100;
                                  if xadic>9.5 then
                                    xadic:=9.99;
                                  if xadic>0 then
                                    sval:='+'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)))
                                  else
                                    sval:='-'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)));
                                  ss:=ss+sval;
                                  ComandoConsolaBuff(ss,true);
                              end;
                              // Fin ver4.4
                            end;
                          end;
                          
                        EnviaPreset(rsp,xcomb,sprec,(TPosCarga[SnPosCarga].ContOCC<DMCONS.BennettReintentosPreset));

                      end;
                    end;
                  end;
                end
                else rsp:='Posicion de Carga no Existe';
            end
            else rsp:='Posicion no Existe';
          end
          // ORDENA CARGA DE COMBUSTIBLE
          else if ss='OCL' then begin     // OCC POSCARGA IMPORTE COMBUSTIBLE TIPOVENTA FINVENTA BOUCHER
            SnPosCarga:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            xpos:=SnPosCarga;
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
                rsp:='OK';
                if (SnPosCarga in [1..MaxPosCargaActiva]) then begin
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
                      TPosCarga[SnPosCarga].ContOCC:=DMCONS.BennettReintentosPreset
                    else begin
                      dec(TPosCarga[SnPosCarga].ContOCC);
                      esperamiliseg(500);
                    end;
                    SwAplicaCmnd:=false;
                    try
                      SnLitros:=Trunc(StrToFLoat(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '))+0.01);
                      if (SnLitros<1)or(SnLitros>1000) then
                        rsp:='Valor fuera de rango válido: de 1 a 1000';
                    except
                      rsp:='Error en Liros';
                    end;
                    if rsp='OK' then begin
                      ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,4,' ');
                      xcomb:=StrToIntDef(ExtraeElemStrSep(ss,1,'P'),0);
                      sprec:=ExtraeElemStrSep(ss,2,'P');
                      TPosCarga[SnPosCarga].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,5,' '),0);
                      TPosCarga[SnPosCarga].finventa:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,6,' '),0);
                      TPosCarga[SnPosCarga].boucher:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,7,' ');
                      TPosCarga[SnPosCarga].swflujovehiculo:=false;
                      if DMCONS.FlujoPorVehiculo='Si' then begin
                        ss:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,8,' ');
                        if ss<>'' then begin
                          TPosCarga[SnPosCarga].swflujovehiculo:=true;
                          TPosCarga[SnPosCarga].flujovehiculo:=StrToIntDef(ss,0);
                        end;
                      end;
                      TPosCarga[SnPosCarga].swarosmag:=false;
                      if (TPosCarga[SnPosCarga].tipopago in [4,5]) then with TPosCarga[SnPosCarga] do begin
                        swarosmag:=DMCONS.ControlArosMagneticos(SnPosCarga,aros_mang,aros_cte,aros_vehi);
                        aros_cont:=0;
                        if (not swarosmag) then
                          rsp:='Aro magnético se encuentra desconectado';
                      end;
                      if rsp='OK' then begin
                      
                          if TPosCarga[SnPosCarga].swflujovehiculo then begin
                            if (Licencia3Ok) then begin
                              xpos:=SnPosCarga;
                              // Ver 4.4
                              for xcmb:=1 to TPosCarga[xpos].NoComb do begin
                                  xp:=TPosCarga[xpos].TPos[xcmb];
                                  ss:='Z'+IntToClaveNum(xpos,2);
                                  ss:=ss+InttoClaveNum(TPosCarga[xpos].TAjuPos[xp],4);
                                  xadic:=TPosCarga[xpos].flujovehiculo+TPosCarga[xpos].Tadic[xp]/100;
                                  if xadic>9.5 then
                                    xadic:=9.99;
                                  if xadic>0 then
                                    sval:='+'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)))
                                  else
                                    sval:='-'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)));
                                  ss:=ss+sval;
                                  ComandoConsolaBuff(ss,true);
                                  esperamiliseg(300);
                              end;
                              // Fin ver4.4
                            end;
                          end
                          // Protecciones
                          else begin
                            for i:=1 to CantProtec do
                              if SnLitros=TabProtec[i] then begin
                                TPosCarga[SnPosCarga].swflujovehiculo:=true;
                              end;
                          end;

                        ss:='F'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000',SnLitros));
                        ComandoConsolaBuff(ss,false);
                        EsperaMiliSeg(100);
                        TPosCarga[SnPosCarga].SwCmndF:=true;
                        SnImporte:=9999.99;
                        EnviaPreset(rsp,xcomb,sprec,(TPosCarga[SnPosCarga].ContOCC<DMCONS.BennettReintentosPreset));
                      end;
                    end;
                  end;
                end
                else rsp:='Posicion de Carga no Existe';
            end
            else rsp:='Posicion no Existe';
          end
          // ORDENA FIN DE VENTA
          else if ss='FINV' then begin
            xpos:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              rsp:='OK';
              if (xpos in [1..MaxPosCargaActiva]) then begin
                TPosCarga[xpos].tipopago:=StrToIntDef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,3,' '),0);
                if TPosCarga[xpos].Estatus in [7,8,1] then begin // EOT
                  if (not TPosCarga[xpos].swcargando) then begin
                    ss:='J'+IntToClaveNum(xpos,2); // Fin de Venta
                    if DMCONS.swemular then
                      EmularEstatus[2*xpos]:='1';
                    ComandoConsola(ss);
                    TPosCarga[xpos].SwCargaTotales:=true;
                    DespliegaPosCarga(xpos);
                  end
                  else
                    rsp:='Posicion no esta despachando';
                end
                else begin // EOT
                  rsp:='Posicion aún no esta en fin de venta';
                end;
              end
              else rsp:='Posicion de Carga no Existe';
            end
            else rsp:='Posicion no Existe';
          end
          // CMND: DESHABILITA POSICIOND DE CARGA
          else if ss='DPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if xpos in [1..MaxPosCargaActiva] then
                TPosCarga[xpos].SwDesHabilitado:=true;
            end
            else rsp:='Posicion no Existe';
          end
          // CMND: HABILITA POSICIOND DE CARGA
          else if ss='HPC' then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if xpos in [1..MaxPosCargaActiva] then
                TPosCarga[xpos].SwDesHabilitado:=false;
            end
            else rsp:='Posicion no Existe';
          end
          // CMND: DESAUTORIZA VENTA DE COMBUSTIBLE
          else if (ss='DVC')or(ss='PARAR') then begin
            rsp:='OK';
            xpos:=strtointdef(ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' '),0);
            if (xpos<=DMCONS.MaximoDePosiciones) then begin
              if TPosCarga[xpos].ModoOpera='Normal' then
                ComandoConsolaBuff('P'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',9999.00)),false);
              ComandoConsolaBuff('E'+IntToClaveNum(xpos,2),false);
              if TPosCarga[xpos].estatus=2 then
                TPosCarga[xpos].tipopago:=0;
              TPosCarga[xpos].PresetImpo:=0;
              TPosCarga[xpos].PresetImpoN:=0;
              if DMCONS.swemular then
                if xpos in [1..MaxPosCargaActiva] then
                  if EmularEstatus[2*xpos]='5' then
                    EmularEstatus[2*xpos]:='6'  // Si el flujo ya inició, para el despache momentaneamente y se puede reanudar.
                  else
                    EmularEstatus[2*xpos]:='1'; // Si el flujo no ha iniciado, la ventra se cancela totalmente.
            end
            else rsp:='Posicion no Existe';
          end
          // CMND: ACTIVA FLUJO ESTANDAR
          else if ss='FLUSTD' then begin  // FLUJO ESTANDAR
            if (Licencia3Ok) then begin
              StAdic:=2;
              rsp:='OK';
              Q_Pcar.Active:=false;
              Q_Pcar.Active:=true;
              while not Q_Pcar.Eof do begin
                xpos:=Q_PcarPosCarga.AsInteger;
                if (xpos<=DMCONS.MaximoDePosiciones) then begin
                  TAdic31[xpos]:=Q_PcarSlowFlow.AsFloat;
                  TAdic32[xpos]:=Q_PcarSlowFlow2.AsFloat;
                  TAdic33[xpos]:=Q_PcarSlowFlow3.AsFloat;
                end;
                Q_Pcar.Next;
              end;
              for xpos:=1 to MaxPosCargaActiva do begin
                if xpos in [1..MaxPosCargaActiva] then if TPosCarga[xpos].estatus<>0 then begin
                  // Ver 4.4
                  for xcmb:=1 to TPosCarga[xpos].NoComb do begin
                    xp:=TPosCarga[xpos].TPos[xcmb];
                    ss:='Z'+IntToClaveNum(xpos,2);
                    ss:=ss+InttoClaveNum(TPosCarga[xpos].TAjuPos[xp],4);
                    case xp of
                      1:xadic:=10*TAdic31[xpos]+TPosCarga[xpos].Tadic[xp]/100;
                      2:xadic:=10*TAdic32[xpos]+TPosCarga[xpos].Tadic[xp]/100;
                      else xadic:=10*TAdic33[xpos]+TPosCarga[xpos].Tadic[xp]/100;
                    end;
                    if xadic>9.5 then
                      xadic:=9.99;
                    if xadic>0 then
                      sval:='+'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)))
                    else
                      sval:='-'+FiltraStrNum(FormatFloat('0.00',Abs(xadic)));
                    ss:=ss+sval;
                    //ComandoConsolaBuff(ss,true);
                    TPosCarga[xpos].TCmndZ[xp]:=ss;
                  end;
                  // Fin ver4.4
                  SwFlujoStd:=true;
                end;
              end;
              ActualizaAdic(1);
            end
            else begin // if licencia2ok
              rsp:='Opción no Habilitada';
            end;
          end
          // CMND: ACTIVA FLUJO MINIMO
          else if ss='FLUMIN' then begin // FLUJO MINIMO
            if (Licencia3Ok) then begin
              if not swflumin then begin
                swflumin:=true;
                //SwAplicaCmnd:=false;
                StAdic:=1;
                rsp:='OK';
                for xpos:=1 to MaxPosCargaActiva do begin
                  if (xpos<=DMCONS.MaximoDePosiciones) then if TPosCarga[xpos].estatus<>0 then
                    ProcesaFlujo(xpos,false);
                end;
                ActualizaAdic(0);
              end
              else begin
                SwCerrar:=true;
              end;
            end
            else begin // if licencia2ok
              rsp:='Opción no Habilitada';
            end;
          end
          // CMND: CAMBIA PROTECCIONES
          else if ss='PROT' then begin
            rsp:='OK';
            for j:=1 to 10 do
              TabProtec[j]:=0;
            BennettProtec:=ExtraeElemStrSep(TabCmnd[xcmnd].Comando,2,' ');
            if BennettProtec<>'' then begin
              CantProtec:=NoElemStrSep(BennettProtec,';');
              if CantProtec>10 then
                CantProtec:=10;
              for j:=1 to CantProtec do
                TabProtec[j]:=strtointdef(ExtraeElemStrSep(BennettProtec,j,';'),0);
            end;
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
                  rsp:='Corte no existe';
              finally
                T_Corte.Active:=true;
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
          end;
          if rsp='' then
            rsp:='OK';
          if SwAplicaCmnd then begin
            TabCmnd[xcmnd].SwResp:=true;
            TabCmnd[xcmnd].Respuesta:=rsp;
            DMCONS.AgregaLogCmnd(LlenaStr(TabCmnd[xcmnd].Comando,'I',40,' ')+' Respuesta: '+TabCmnd[xcmnd].Respuesta);
          end;
        end;
      end;

      if not SwEsperaRsp then
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

procedure TFDISBENNETT2.Ap1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
begin
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
      if (C=idACK)or(c=idNAK) then
        FinLinea:=true;
    end;
    if FinLinea then begin
      LineaTimer:=Linea;
      DMCONS.AgregaLog('R '+LineaTimer);
      Linea:='';
      SwBcc:=false;
      FinLinea:=false;
      ProcesaLinea;
      LineaTimer:='';
      SwEspera:=false;
    end
    else SwEspera:=true;
  finally
    Timer1.Enabled:=true;
  end;
end;

procedure TFDISBENNETT2.ComandoConsolaBuff(ss:string;swinicio:boolean);
begin
  if (ListaCmnd.Count=0)and(not SwEsperaRsp) then begin
    ComandoConsola(ss);
    esperamiliseg(100);
  end
  else begin
    if swinicio then begin
      ListaCmnd.Insert(0,ss);
    end
    else
      ListaCmnd.Add(ss);
  end;
end;

procedure TFDISBENNETT2.ComandoConsola(ss:string);
var s1:string;
    cc:char;
begin
  LinCmnd:=ss;
  CharCmnd:=LinCmnd[1];
  SwEsperaRsp:=true;
  ContEsperaRsp:=0;
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
      if ap1.Open then
        Ap1.PutString(S1);
    end
    else begin
      inc(ContBuffLleno);
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;


procedure TFDISBENNETT2.ListBox1Click(Sender: TObject);
begin
  LimpiaConsola;
end;

procedure TFDISBENNETT2.Restaurar1Click(Sender: TObject);
begin
  Visible:=true;
end;

procedure TFDISBENNETT2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFDISBENNETT2.FormCreate(Sender: TObject);
begin
  SwCerrar:=false;
  SwInicio:=true;
  SwFlujoStd:=false;
  ContadorAlarma:=0;
  ListaAux:=TStringList.Create;
  ListaCmnd:=TStringList.Create;
  SwEsperaRsp:=false;
end;

procedure TFDISBENNETT2.BitBtn3Click(Sender: TObject);
begin
  Visible:=false;
  NotificationIcon1.Show;
end;

procedure TFDISBENNETT2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DMCONS.AgregaLog('Cierra Puerto');
    Ap1.Open:=false;
  except
  end;
  DMCONS.AgregaLog('Termino Aplicacion');
  Button1.click;
  Application.Terminate;
end;

procedure TFDISBENNETT2.Timer1Timer(Sender: TObject);
begin
  try
    if SwCerrar then begin
      DMCONS.AgregaLog('CERRAR??');
      if ((ListaCmnd.Count=0)and(not SwEsperaRsp))or(swflumin) then begin
        try
          Esperamiliseg(200);
          DMCONS.AgregaLog('Cierra Puerto');
          Ap1.Open:=false;
        except
        end;
        Esperamiliseg(200);
        DMCONS.AgregaLog('Termino Aplicacion');
        Button1.click;
        Application.Terminate;
        DMCONS.AgregaLog('Termino Aplicacion OK');
      end;
    end;
    if not SwEsperaRsp then begin // NO HAY COMANDOS EN PROCESO
      ComandoConsola('B00');
    end
    else begin // HAY COMANDOS EN PROCESO
      inc(ContEsperaRsp);
      if (ContEsperaRsp>MaxEsperaRsp)or(swflumin) then begin
        ContEsperaRsp:=0;
        case CharCmnd of
         'B':LineaTimer:=idStx+idStx+'B00'+idEtx+'.*';
         'A','N':LineaTimer:=idStx+CharCmnd+'00'+idEtx+'.*';
         else LineaTimer:=idNak;
        end;
        ProcesaLinea;
      end;
    end;
  except
  end;
end;

procedure TFDISBENNETT2.EnviaPreset(var rsp:string;xcomb:integer;xprec:string;swreintento:boolean);
var xpos,xp,xc:integer;
    ss:string;
begin
  rsp:='OK';
  xpos:=SnPosCarga;

  if not (TPosCarga[xpos].estatus in [1..3]) then begin
    rsp:='Posición no Disponible';
    exit;
  end;
  if TPosCarga[xpos].SwDesHabilitado then begin
    rsp:='Posición Deshabilitada';
    exit;
  end;

  if (swflujostd)and(not TPosCarga[xpos].swflujovehiculo) then begin
    ProcesaFlujo(xpos,true);
    esperamiliseg(100);
  end;

  if TPosCarga[xpos].TipoDisp=400 then begin
    if DMCONS.BennettOmitirComandoF='No' then begin
      ss:='F'+IntToClaveNum(xpos,2)+'9999'; // Alocate Limit
      ComandoConsolaBuff(ss,true);
      EsperaMiliseg(100);
    end;
  end;
  if (DMCONS.BennettPresetExtendido='No')or(SnImporte<=9999.99) then begin
    ss:='K'+IntToClaveNum(xpos,2)+'2'; // Modo PrePago
    ComandoConsolaBuff(ss,false);
    if SnImporte>9999.99 then
      SnImporte:=9999.99;
    ss:='P'+IntToClaveNum(xpos,2)+FiltraStrNum(FormatFloat('0000.00',SnImporte));
    ComandoConsolaBuff(ss,false);
    ss:='L'+IntToClaveNum(xpos,2)+NivelPrecioContado; // Nivel de Precios
    ComandoConsolaBuff(ss,false);
    // Autoriza
    ss:='S'+IntToClaveNum(xpos,2);
    TPosCarga[xpos].PosAutorizada:=0;
    if DMCONS.SoportaSeleccionProducto='Si' then
      if xcomb>0 then with TPosCarga[xpos] do begin
        xp:=0;
        for xc:=1 to NoComb do
          if TComb[xc]=xcomb then xp:=TPos[xc];
        case xp of
          1:ss:=ss+char(33);   // 21h
          2:ss:=ss+char(34);   // 22h
          3:ss:=ss+char(40);   // 28h
          4:ss:=ss+char(36);   // 24h
        end;
        PosAutorizada:=xp;
      end;
    ComandoConsolaBuff(ss,false);
  end
  else begin
    TPosCarga[xpos].PosAutorizada:=0;
    ss:='S'+IntToClaveNum(xpos,2);
    ComandoConsolaBuff(ss,false);
  end;
  TPosCarga[xpos].ContPreset:=5;
  TPosCarga[xpos].PresetComb:=xcomb;
  TPosCarga[xpos].PresetImpo:=SnImporte;
  TPosCarga[xpos].presetcont:=0;
  if DMCONS.swemular then begin
    if EmularEstatus[2*xpos]='1' then
      EmularEstatus[2*xpos]:='5';
    TPosCarga[xpos].Hora:=Time;
    TPosCarga[xpos].estatus:=5;
    TPosCarga[xpos].volumen:=SnImporte/5;
    TPosCarga[xpos].importe:=SnImporte+1;
    TPosCarga[xpos].precio:=5;
    TPosCarga[xpos].posactual:=1;
  end;
end;


procedure TFDISBENNETT2.Timer3Timer(Sender: TObject);
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
                        xcomb:=CombustibleEnPosicion(xpos,xp,1);
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
        'Y':begin
              xpos:=StrToIntDef(copy(lin,2,2),1);
              with TPosCarga[xpos] do begin
                Linea:=copy(Lin,1,3)+'2002000';
              end;
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
      ProcesaLinea;
      SwEspera:=false;
    end;
  finally
    Timer1.Enabled:=true;
  end;
end;


procedure TFDISBENNETT2.registro(valor:integer;variable:string);
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

procedure TFDISBENNETT2.NotificationIcon1DblClick(Sender: TObject);
begin
  Restaurar1Click(Sender);
end;

procedure TFDISBENNETT2.lee_registro;
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

procedure TFDISBENNETT2.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

function TFDISBENNETT2.CombustibleEnPosicion(xpos,xposcarga,xdef:integer):integer;
var i:integer;
begin
  with TPosCarga[xpos] do begin
    if xdef>0 then
      result:=TComb[xdef]
    else
      result:=0;
    for i:=1 to NoComb do begin
      if TPos[i]=xposcarga then
        result:=TComb[i];
    end;
  end;
end;

procedure TFDISBENNETT2.ListBoxPC1DblClick(Sender: TObject);
begin
  SwMensaje:=not SwMensaje;
  with DMCONS do if swemular then begin
    if EmularEstatus[2]='0' then
      EmularEstatus[2]:='1'
    else
      EmularEstatus[2]:='0';
  end;
end;

procedure TFDISBENNETT2.Timer2Timer(Sender: TObject);
var i:integer;
begin
  try
    with DMCONS do begin
      inc(ContadorTot);
      if (ContadorTot>=100) then begin
        ContadorTot:=0;
        inc(ContadorTotPos);
        if ContadorTotPos in [1..MaxPosCargaActiva] then begin
          TPosCarga[ContadorTotPos].SwCargaTotales:=true;
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
        end;
        CargaPreciosFH(Now,true); // carga el ultimpo recio aplicado
        Q_CombIb.Active:=false;
        Q_CombIb.Active:=true;
        for i:=1 to MaxPosCargaActiva do
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

procedure TFDISBENNETT2.Button2Click(Sender: TObject);
begin
  DMCONS.ListaLogCmnd.SaveToFile('\ImagenCo\LogCmnd'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

end.


