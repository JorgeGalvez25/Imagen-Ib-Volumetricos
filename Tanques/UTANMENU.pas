unit UTANMENU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, OoMisc, AdPort, ExtCtrls, Menus, RXShell,
  Buttons, Mask, DBCtrls, Grids, DBGrids, VrControls, VrAngularMeter,
  _GClass, AbTank, VrThermoMeter, VrLabel, VrCalendar, VrMatrix, VrEdit,
  CellEditors, Registry, AbGradient, WinSkinData, WinSvc,
  dxNavBarBase, dxNavBarCollns, dxNavBar, vrLedClock, ImgList, DBTables,
  DB, dxmdaset, VrThreads, ULibGral, cxClasses, ComObj, CRCLibC_TLB,
  ScktComp;

const Version='3.1';

      idSOH = #1;
      idSTX = #2;
      idETX = #3;
      idACK = #6;
      idNAK = #21;
      MaxTmpDifCorte=0.5*tmHora;

type
  TFTANMENU = class(TForm)
    ApdComPort1: TApdComPort;
    RxTrayIcon1: TRxTrayIcon;
    PopupMenu1: TPopupMenu;
    Restaurar1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Bevel1: TBevel;
    VrCalendar1: TVrCalendar;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    SkinData1: TSkinData;
    Panel8: TPanel;
    PanelA2: TPanel;
    AbTank2: TAbTank;
    VrLabelNom2: TVrLabel;
    vrThermoMeter2: TvrThermoMeter;
    VrMatrix2: TVrMatrix;
    VrLabel3x: TVrLabel;
    VrLabel10: TVrLabel;
    VrLabel11: TVrLabel;
    VrLabel12: TVrLabel;
    VrLabel13: TVrLabel;
    VrLabel14: TVrLabel;
    VrLabel16: TVrLabel;
    NumericEditor1_2: TNumericEditor;
    NumericEditor2_2: TNumericEditor;
    NumericEditor3_2: TNumericEditor;
    NumericEditor4_2: TNumericEditor;
    NumericEditor5_2: TNumericEditor;
    NumericEditor6_2: TNumericEditor;
    PanelA1: TPanel;
    AbGradient1: TAbGradient;
    AbTank1: TAbTank;
    VrLabelNom1: TVrLabel;
    vrThermoMeter1: TvrThermoMeter;
    VrMatrix1: TVrMatrix;
    VrLabel4x: TVrLabel;
    VrLabel5x: TVrLabel;
    VrLabel6x: TVrLabel;
    VrLabel7x: TVrLabel;
    VrLabel8x: TVrLabel;
    VrLabel9: TVrLabel;
    VrLabel15: TVrLabel;
    NumericEditor1_1: TNumericEditor;
    NumericEditor2_1: TNumericEditor;
    NumericEditor3_1: TNumericEditor;
    NumericEditor4_1: TNumericEditor;
    NumericEditor5_1: TNumericEditor;
    NumericEditor6_1: TNumericEditor;
    Panel16: TPanel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBar1Item4: TdxNavBarItem;
    VrLedClock1: TVrLedClock;
    Panel17: TPanel;
    VrMatrix9: TVrMatrix;
    Panel18: TPanel;
    PanelA3: TPanel;
    AbTank3: TAbTank;
    VrLabelNom3: TVrLabel;
    vrThermoMeter3: TvrThermoMeter;
    VrMatrix3: TVrMatrix;
    VrLabel18: TVrLabel;
    VrLabel19: TVrLabel;
    VrLabel20: TVrLabel;
    VrLabel21: TVrLabel;
    VrLabel22: TVrLabel;
    VrLabel23: TVrLabel;
    VrLabel24: TVrLabel;
    NumericEditor1_3: TNumericEditor;
    NumericEditor2_3: TNumericEditor;
    NumericEditor3_3: TNumericEditor;
    NumericEditor4_3: TNumericEditor;
    NumericEditor5_3: TNumericEditor;
    NumericEditor6_3: TNumericEditor;
    PanelA4: TPanel;
    AbTank4: TAbTank;
    VrLabelNom4: TVrLabel;
    vrThermoMeter4: TvrThermoMeter;
    VrMatrix4: TVrMatrix;
    VrLabel26: TVrLabel;
    VrLabel27: TVrLabel;
    VrLabel28: TVrLabel;
    VrLabel29: TVrLabel;
    VrLabel30: TVrLabel;
    VrLabel31: TVrLabel;
    VrLabel32: TVrLabel;
    NumericEditor1_4: TNumericEditor;
    NumericEditor2_4: TNumericEditor;
    NumericEditor3_4: TNumericEditor;
    NumericEditor4_4: TNumericEditor;
    NumericEditor5_4: TNumericEditor;
    NumericEditor6_4: TNumericEditor;
    Panel19: TPanel;
    PanelA5: TPanel;
    AbTank5: TAbTank;
    VrLabelNom5: TVrLabel;
    vrThermoMeter5: TvrThermoMeter;
    VrMatrix5: TVrMatrix;
    VrLabel34: TVrLabel;
    VrLabel35: TVrLabel;
    VrLabel36: TVrLabel;
    VrLabel37: TVrLabel;
    VrLabel38: TVrLabel;
    VrLabel39: TVrLabel;
    VrLabel40: TVrLabel;
    NumericEditor1_5: TNumericEditor;
    NumericEditor2_5: TNumericEditor;
    NumericEditor3_5: TNumericEditor;
    NumericEditor4_5: TNumericEditor;
    NumericEditor5_5: TNumericEditor;
    NumericEditor6_5: TNumericEditor;
    PanelA6: TPanel;
    AbTank6: TAbTank;
    VrLabelNom6: TVrLabel;
    vrThermoMeter6: TvrThermoMeter;
    VrMatrix6: TVrMatrix;
    VrLabel42: TVrLabel;
    VrLabel43: TVrLabel;
    VrLabel44: TVrLabel;
    VrLabel45: TVrLabel;
    VrLabel46: TVrLabel;
    VrLabel47: TVrLabel;
    VrLabel48: TVrLabel;
    NumericEditor1_6: TNumericEditor;
    NumericEditor2_6: TNumericEditor;
    NumericEditor3_6: TNumericEditor;
    NumericEditor4_6: TNumericEditor;
    NumericEditor5_6: TNumericEditor;
    NumericEditor6_6: TNumericEditor;
    Panel20: TPanel;
    PanelA7: TPanel;
    AbTank7: TAbTank;
    VrLabelNom7: TVrLabel;
    vrThermoMeter7: TvrThermoMeter;
    VrMatrix7: TVrMatrix;
    VrLabel50: TVrLabel;
    VrLabel51: TVrLabel;
    VrLabel52: TVrLabel;
    VrLabel53: TVrLabel;
    VrLabel54: TVrLabel;
    VrLabel55: TVrLabel;
    VrLabel56: TVrLabel;
    NumericEditor1_7: TNumericEditor;
    NumericEditor2_7: TNumericEditor;
    NumericEditor3_7: TNumericEditor;
    NumericEditor4_7: TNumericEditor;
    NumericEditor5_7: TNumericEditor;
    NumericEditor6_7: TNumericEditor;
    PanelA8: TPanel;
    AbTank8: TAbTank;
    VrLabelNom8: TVrLabel;
    vrThermoMeter8: TvrThermoMeter;
    VrMatrix8: TVrMatrix;
    VrLabel58: TVrLabel;
    VrLabel59: TVrLabel;
    VrLabel60: TVrLabel;
    VrLabel61: TVrLabel;
    VrLabel62: TVrLabel;
    VrLabel63: TVrLabel;
    VrLabel64: TVrLabel;
    NumericEditor1_8: TNumericEditor;
    NumericEditor2_8: TNumericEditor;
    NumericEditor3_8: TNumericEditor;
    NumericEditor4_8: TNumericEditor;
    NumericEditor5_8: TNumericEditor;
    NumericEditor6_8: TNumericEditor;
    Panel21: TPanel;
    BitBtn3: TBitBtn;
    ImageList1: TImageList;
    AbGradient2: TAbGradient;
    AbGradient3: TAbGradient;
    StaticText3: TStaticText;
    Mem_CortesFijos: TdxMemData;
    Mem_CortesFijosClave: TSmallintField;
    Mem_CortesFijosHoraCorte: TTimeField;
    Mem_CortesFijosActivo: TBooleanField;
    Ql_UltimoCorte: TQuery;
    Ql_UltimoCorteCORTE: TIntegerField;
    Ql_UltimoCorteFECHAHORAFINAL: TDateTimeField;
    Mem_CorteManual: TdxMemData;
    Mem_CorteManualCorte: TBooleanField;
    Timer1: TVrTimer;
    Timer3: TVrTimer;
    VrTimer1: TVrTimer;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label8: TLabel;
    StaticText7: TStaticText;
    Label4x: TLabel;
    StaticText6: TStaticText;
    Timer2: TTimer;
    CheckBox3: TCheckBox;
    Socket1: TClientSocket;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ApdComPort1TriggerAvail(CP: TObject; Count: Word);
    procedure Timer1Timer(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer3Timer(Sender: TObject);
    procedure VerTrfico1Click(Sender: TObject);
    procedure OcultarTrfico1Click(Sender: TObject);
    procedure dxNavBar1Item1Click(Sender: TObject);
    procedure dxNavBar1Item2Click(Sender: TObject);
    procedure dxNavBar1Item3Click(Sender: TObject);
    procedure dxNavBar1Item4Click(Sender: TObject);
    procedure RxTrayIcon1DblClick(Sender: TObject);
    procedure VrTimer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AbTank1DblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Socket1Read(Sender: TObject; Socket: TCustomWinSocket);
    function ServicioCorriendo(sService: PChar): Boolean;
  private
    { Private declarations }
    SwPetrovend,
    swpv2,
    SwAux:boolean;
    ContValCorte,
    TanqueActual,
    NumTanques,
    CicloEnt,
    ContRec,
    NumPasoPv,
    ContPv,
    NumPaso:integer;
    SwInicio,
    SwCerrar,
    SwCorte,
    SwEeco,
    ErrorInic:boolean;
    LineaBuff,
    LineaProc,
    LineaEmular:string;
    contemular:integer;
    LineaPetroVend:array[1..40] of string;
    ApPv:integer;
    xFechaHoraIni :string[10];
    xFechaHoraFin :string[10];
    xValores:array[1..10] of real;
    CorteInicial,
    ContadorAlarma,
    ContadorAlarma3,
    ContadorAlarma2:integer;
    HoraParoEntradas,
    FechaTimer1,
    FechaHoraExec,
    X_CvolFecha,
    SiguienteFechaHoraTurno:TDateTime;
    SiguienteFechaHoraCmnd:TDateTime;
    X_CvolCorte,
    ContErroresCom:integer;
    TiempoCorteAntes:real;
    TiempoPv:TDateTime;
    SwEsperaPv:boolean;
    SwTimer1:boolean;
    ContTimer1:integer;
    function CalculaAgua(VolTotal,Diametro,AlturaAgua:real):real;
  public
    { Public declarations }
    procedure IniciaBaseDeDatos;
    procedure IniciaEstacion;
    procedure DespliegaTanque(xtan:integer);
    procedure ComandoConsola(ss:string);
    procedure ComandoConsolaPetroVend(ss:string);
    procedure ComandoConsolaSocket(ss:string);
    procedure ProcesaLineaPetroVend;
    procedure ProcesaLineaVeederRoot;
    procedure ProcesaLinea2;
    procedure ProcesaLinea3;
    procedure ProcesaLinea4;
    procedure ProcesaLinea6;
    procedure ReiniciaTanques;
    procedure CicloPetroVend;
    function AnalisisTxtPetroVend(xstr:string):boolean;
    function CalculoCrc(xstr:string):string;
    procedure ReConectaBaseDatos;
  end;

const MaxTanques=8;
type TipoTanque = record
       Combustible   :integer;
       NombreComb    :string[20];
       Altura,
       Capacidad,
       VolumenFondaje,
       VolumenAnterior,
       VolumenUtil,       // VolumenDisponible-VolumenFondaje
       Volumen,           // Volumen Total (Incluye Agua)
       VolumenDisponible, // Volumen-VolumenAgua
       PorLlenar,
       PorLlenar90,
       VolumenAgua   :real;
       Porciento     :real;
       Temperatura   :real;
       Estado        :string[1];      // A-Activo I-Inactivo
       Estatus       :String[15];
       SwAlarma,
       SwTiempo,
       SwActivo,
       SwLevantado   :boolean;
       fechahorastr  :string[20];

       volmin_pv,
       volmax_pv     :real;
       fechormin_pv,
       fechormax_pv     :TDateTime;

       EstadoActivo     :boolean;
       FechaHoraActivo :TDateTime;
     end;

var
  FTANMENU: TFTANMENU;
  TTanques:array[1..MaxTanques] of TipoTanque;
  TipoTanques,
  TanquePv:integer;
  ruta_db:string;

implementation

uses DDMCONS, UAutoriza2;

{$R *.dfm}

procedure TFTANMENU.ReConectaBaseDatos;
begin
  DMCONS.DBGASCON.Connected:=true;
end;

function CalcularCRC(Cmd: string): string;
var
  Buffer: array[0..4096] of Char;
  si: STARTUPINFO;
  sa: SECURITY_ATTRIBUTES;
  sd: SECURITY_DESCRIPTOR;
  pi: PROCESS_INFORMATION;
  newstdin, newstdout, read_stdout, write_stdin: THandle;
  exitcod, bread, avail: Cardinal;

  function IsWinNT: boolean;
  var
    OSV: OSVERSIONINFO;
  begin
    OSV.dwOSVersionInfoSize := sizeof(osv);
    GetVersionEx(OSV);
    result := OSV.dwPlatformId = VER_PLATFORM_WIN32_NT;
  end;

begin
  Result:= '';
  if IsWinNT then
  begin
    InitializeSecurityDescriptor(@sd, SECURITY_DESCRIPTOR_REVISION);
    SetSecurityDescriptorDacl(@sd, true, nil, false);
    sa.lpSecurityDescriptor := @sd;
  end
  else sa.lpSecurityDescriptor := nil;
  sa.nLength := sizeof(SECURITY_ATTRIBUTES);
  sa.bInheritHandle := TRUE;
  if CreatePipe(newstdin, write_stdin, @sa, 0) then
  begin
    if CreatePipe(read_stdout, newstdout, @sa, 0) then
    begin
      GetStartupInfo(si);
      with si do
      begin
        dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
        wShowWindow := SW_HIDE;
        hStdOutput := newstdout;
        hStdError := newstdout;
        hStdInput := newstdin;
      end;
      Fillchar(Buffer, SizeOf(Buffer), 0);
      GetEnvironmentVariable('COMSPEC', @Buffer, SizeOf(Buffer) - 1);
      StrCat(@Buffer,PChar(' /c ' + Cmd));
      if CreateProcess(nil, @Buffer, nil, nil, TRUE, CREATE_NEW_CONSOLE, nil, nil, si, pi) then
      begin
        repeat
          PeekNamedPipe(read_stdout, @Buffer, SizeOf(Buffer) - 1, @bread, @avail, nil);
          if bread > 0 then
          begin
            Fillchar(Buffer, SizeOf(Buffer), 0);
            ReadFile(read_stdout, Buffer, bread, bread, nil);
            Result:= Result + String(PChar(@Buffer));
          end;
          Application.ProcessMessages;
          GetExitCodeProcess(pi.hProcess, exitcod);
        until (exitcod <> STILL_ACTIVE) and (bread = 0);
      end;
      CloseHandle(read_stdout);
      CloseHandle(newstdout);
    end;
    CloseHandle(newstdin);
    CloseHandle(write_stdin);
  end;
end;


function TFTANMENU.CalculaAgua(VolTotal,Diametro,AlturaAgua:real):real;
var Radio,Base,Altura,Angulo,AreaTot,AreaArco,AreaAgua:real;
begin
  try
    Radio:=Diametro/2;
    Altura:=Radio-AlturaAgua;
    Base:=Sqrt(Radio*Radio-Altura*Altura);
    if Abs(Altura)>0.0001 then
      Angulo:=ArcTan(dividefloat(Base,Altura))*360/Pi
    else
      Angulo:=180;
    AreaTot:=Pi*Radio*Radio;
    AreaArco:=AreaTot*Angulo/360;
    AreaAgua:=AreaArco-Base*Altura;
    result:=dividefloat(VolTotal*AreaAgua,AreaTot);
  except
  end;
end;

procedure TFTANMENU.ProcesaLineaVeederRoot;
var lin,line,xfechor,ss:string;
    xtan,xcant,xent,xval,xnum,hh:integer;
    xFechaHora,
    xFechaHoraI,
    xFechaHoraEnt:TDateTime;
    nfec1,nfec2:longword;
begin
  with DMCONS do begin
    try
      if LineaProc='' then
        exit;
      lin:=LineaProc;
      if (copy(Lin,1,4)='i201') then begin // INVANTARIO TANQUES
        xtan:=StrToIntDef(copy(lin,5,2),0);
        if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
          FechaHoraActivo:=now;
          if not EstadoActivo then begin
            RegistraBitacora3(1,'Reconexión de Tanque','Tanque '+inttostr(xtan),'U');
            EstadoActivo:=true;
          end;
          if TTanques[xtan].Estado='I' then begin
            DMCONS.DBGASCON.Connected:=true;
            try
              T_Ctan.Active:=true;
              // Cambia Estado  a activo
              Estado:='A';
              T_Ctan.Insert;
              T_CtanFecha.AsDateTime:=X_CvolFecha;
              T_CtanCorte.AsInteger:=X_CvolCorte;
              T_CtanTanque.AsInteger:=xtan;
              T_CtanCombustible.AsInteger:=Combustible;
              T_CtanNuevoEstado.AsString:=Estado;
              T_Ctan.Post;
              T_Ctan.Active:=false;
            finally
              DMCONS.DBGASCON.Connected:=false;
            end;
          end;
          Estatus:=copy(lin,20,4);
          VolumenAnterior:=Volumen;
          Volumen:=IeeeToFloat(copy(lin,26,8));
          VolumenAgua:=IeeeToFloat(copy(lin,74,8));
          PorLlenar:=IeeeToFloat(copy(lin,42,8));
          Temperatura:=IeeeToFloat(copy(lin,66,8));
          VolumenDisponible:=Volumen-VolumenAgua;
          VolumenUtil:=Volumen-VolumenFondaje;
          Capacidad:=Volumen+PorLlenar;
          PorLlenar90:=PorLlenar-Capacidad*0.1;
          SwLevantado:=true;
          DespliegaTanque(xtan);
          if (not SwEmular) then begin
            xfechor:='20'+copy(lin,7,10);
            xFechaHora:=StrToFechaHora(xfechor);
            if SwFechaHoraTM then begin
              SwFechaHoraTM:=false;
              UltimaFechaHoraTM:=xFechaHora;
            end
            else if abs(xfechahora-UltimaFechaHoraTM)<=1 then begin
              UltimaFechaHoraTM:=xFechaHora;
            end;
          end;
        end;
      end
      else if copy(Lin,1,4)='i202' then begin // ENTRADAS AL TANQUES
          xtan:=StrToIntDef(copy(lin,5,2),0);
          if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
            xCant:=StrToInt(copy(lin,20,2));
            delete(lin,1,21);
            for xent:=1 to xCant do begin
              line:=copy(lin,1,102);
              xfechahoraini:=copy(line,1,10);
              xfechahorafin:=copy(line,11,10);
              xnum:=hextoint(copy(line,21,2));
              xFechaHoraI:=StrToFechaHora('20'+xfechahoraini);
              xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
              if abs(xfechahoraent-xfechahorai)<2 then begin
                if (xfechaHoraEnt>=Trunc(X_CvolFecha))or(CheckBox1.Checked) then begin
                  DMCONS.DBGASCON.Connected:=true;
                  try
                    T_Etan.Active:=true;
                    try
                      if not T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                        delete(line,1,22);
                        for xval:=1 to 8 do begin
                          if (length(line)>=8) then begin
                            xvalores[xval]:=IeeeToFloat(copy(line,1,8));
                            delete(line,1,8);
                          end
                          else xvalores[xval]:=0;
                        end;
                        Q_Cvol.Active:=false;
                        Q_Cvol.Active:=true;
                        if not Q_Cvol.IsEmpty then with TTanques[xtan] do begin
                          X_CvolFecha:=Q_CvolFecha.AsDateTime;
                          X_CvolCorte:=Q_CvolCorte.AsInteger;
                          T_Etan.Insert;
                          if (xfechaHoraEnt>=Trunc(Q_CvolFecha.AsDateTime)) then begin
                            T_EtanFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                            T_EtanCorte.AsInteger:=Q_CvolCorte.AsInteger;
                          end
                          else begin
                            T_EtanFecha.AsDateTime:=trunc(xfechaHoraEnt);
                            if copy(xfechahorafin,7,4)<='0400' then
                              T_EtanCorte.AsInteger:=1
                            else if copy(xfechahorafin,7,4)<='0800' then
                              T_EtanCorte.AsInteger:=2
                            else if copy(xfechahorafin,7,4)<='1200' then
                              T_EtanCorte.AsInteger:=3
                            else if copy(xfechahorafin,7,4)<='1600' then
                              T_EtanCorte.AsInteger:=4
                            else if copy(xfechahorafin,7,4)<='2000' then
                              T_EtanCorte.AsInteger:=5
                            else
                              T_EtanCorte.AsInteger:=6;
                          end;
                          T_EtanTanque.AsInteger:=xtan;
                          T_EtanCombustible.AsInteger:=Combustible;
                          if Mayusculas(DMCONS.TipoVolumenEntradaTanques)='NETO' then begin
                            T_EtanVolumenInicial.AsFloat:=AjustaFloat(xValores[2],3);
                            T_EtanVolumenFinal.AsFloat:=AjustaFloat(xValores[6],3);
                            T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                          end
                          else begin      // BRUTO
                            T_EtanVolumenInicial.AsFloat:=AjustaFloat(xValores[1],3);
                            T_EtanVolumenFinal.AsFloat:=AjustaFloat(xValores[5],3);
                            T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                          end;
                          T_EtanTemperatura.AsFloat:=AjustaFloat(xValores[8],3);
                          T_EtanFechaHoraDisp.AsString:=xFechaHoraFin;
                          T_EtanFechaHoraInicial.AsDateTime:=StrToFechaHora('20'+xFechaHoraIni);
                          T_EtanFechaHoraFinal.AsDateTime:=StrToFechaHora('20'+xFechaHoraFin);
                          if (T_EtanVolumenRecepcion.AsFloat>=1)and(T_EtanVolumenRecepcion.AsFloat<100000) then begin
                            T_Etan.Post;
                            T_Etan.Refresh;
                            if T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                              DMCONS.SP_Calcula_Ventas_Etan.ParamByName('P_FOLIO').AsInteger:=T_EtanFolio.AsInteger;
                              DMCONS.SP_Calcula_Ventas_Etan.ExecProc;
                            end;
                            if DMCONS.GuardaLogEntradaTanques='Si' then
                              Button1.Click;
                            CheckBox3.Checked:=false;
                          end
                          else begin
                            T_Etan.Cancel;
                          end;
                        end;
                      end;
                    except
                      T_Etan.Active:=false;
                    end;
                  finally
                    DMCONS.DBGASCON.Connected:=false;
                  end;
                end;
              end;
              delete(lin,1,22+xnum*8);
            end;
          end;
      end
      else if copy(Lin,1,4)='i501' then begin // FECHA HORA
        xfechor:=datetimetostr(now)+'       ';   // xfec: '04/09/2012 03:13:37 p.m.'
        if xfechor[21]<>'p' then begin
          ss:=copy(xfechor,9,2)+copy(xfechor,4,2)+copy(xfechor,1,2)+copy(xfechor,12,2)+copy(xfechor,15,2);
        end
        else begin
          hh:=strtointdef(copy(xfechor,12,2),0);
          hh:=hh+12;
          ss:=copy(xfechor,9,2)+copy(xfechor,4,2)+copy(xfechor,1,2)+inttoclavenum(hh,2)+copy(xfechor,15,2);
        end;
        xfechor:=ss;
        nfec1:=strtointdef(xfechor,0);
        xfechor:=copy(lin,7,10);
        Label8.visible:=true;
        Label8.Caption:=' Hora VeederRoot: '+copy(xfechor,7,2)+':'+copy(xfechor,9,2)+' '
                        +copy(xfechor,5,2)+'/'
                        +copy(xfechor,3,2)+'/'
                        +'20'+copy(xfechor,1,2);
        nfec2:=strtointdef(xfechor,0);
        if (nfec1>0)and(nfec2>0)and(abs(nfec1-nfec2)>1) then
          ComandoConsola(DMCONS.CodigoSeguridadVeederRoot+'s50100'+ss);
      end
      else if (copy(lin,1,8)='9999FF1B')and(NumPaso=1) then with TTanques[TanqueActual] do begin
        if Estado='A' then begin
          // Cambia Estado a inactivo
          Estado:='I';
          DMCONS.DBGASCON.Connected:=true;
          try
            T_Ctan.Active:=true;
            T_Ctan.Insert;
            T_CtanFecha.AsDateTime:=X_CvolFecha;
            T_CtanCorte.AsInteger:=X_CvolCorte;
            T_CtanTanque.AsInteger:=TanqueActual;
            T_CtanCombustible.AsInteger:=Combustible;
            T_CtanNuevoEstado.AsString:=Estado;
            T_Ctan.Post;
            T_Ctan.Active:=false;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
        end;
      end;
    except
    end;
  end;
end;

procedure TFTANMENU.ProcesaLinea2;  // EecoSystems
var lin,line,xfechor:string;
    xtan,xcant,xent:integer;
    xFechaHora,
    xFechaHoraEnt:TDateTime;
    SwEntrada:boolean;
begin
  with DMCONS do begin
    try
      if LineaProc='' then
        exit;
      lin:=LineaProc;
      if (copy(Lin,1,3)='E97') then begin // INVANTARIO TANQUES
        xtan:=StrToIntDef(copy(lin,4,1),0);
        if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
          FechaHoraActivo:=now;
          if not EstadoActivo then begin
            RegistraBitacora3(1,'Reconexión de Tanque','Tanque '+inttostr(xtan),'U');
            EstadoActivo:=true;
          end;
          if TTanques[xtan].Estado='I' then begin
            // Cambia Estado  a activo
            Estado:='A';
            DMCONS.DBGASCON.Connected:=true;
            try
              T_Ctan.Active:=true;
              T_Ctan.Insert;
              T_CtanFecha.AsDateTime:=X_CvolFecha;
              T_CtanCorte.AsInteger:=X_CvolCorte;
              T_CtanTanque.AsInteger:=xtan;
              T_CtanCombustible.AsInteger:=Combustible;
              T_CtanNuevoEstado.AsString:=Estado;
              T_Ctan.Post;
              T_Ctan.Active:=false;
            finally
              DMCONS.DBGASCON.Connected:=false;
            end;
          end;
          VolumenAnterior:=Volumen;
          Volumen:=StrToFloat(limpiastr(copy(lin,17,12)));
          VolumenAgua:=StrToFloat(limpiastr(copy(lin,65,12)));
          PorLlenar:=StrToFloat(limpiastr(copy(lin,53,12)));
          Temperatura:=StrToFloat(limpiastr(copy(lin,41,12)));
          VolumenDisponible:=Volumen-VolumenAgua;
          VolumenUtil:=Volumen-VolumenFondaje;
          Capacidad:=Volumen+PorLlenar;
          PorLlenar90:=PorLlenar-Capacidad*0.1;
          SwLevantado:=true;
          DespliegaTanque(xtan);
        end;
      end
      else if copy(Lin,1,2)='10' then begin // fecha y hora
        if (not SwEmular) then begin
          xfechor:='20'+IntToClaveNum(GetAnoFromFecha(date),2)+copy(lin,4,8);
          xFechaHora:=StrToFechaHora(xfechor);
          if xFechaHora>(date+1) then begin
            xfechor:='20'+IntToClaveNum(GetAnoFromFecha(date)-1,2)+copy(lin,4,8);
            xFechaHora:=StrToFechaHora(xfechor);
          end;
          if SwFechaHoraTM then begin
            SwFechaHoraTM:=false;
            UltimaFechaHoraTM:=xFechaHora;
          end
          else if abs(xfechahora-UltimaFechaHoraTM)<=1 then begin
            UltimaFechaHoraTM:=xFechaHora;
          end;
        end;
      end
      else if copy(Lin,1,2)='15' then begin // ENTRADAS AL TANQUES
          xtan:=StrToIntDef(copy(lin,3,1),0);
          if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
            xCant:=StrToInt(copy(lin,6,2));
            delete(lin,1,7);
            SwEntrada:=true;
            for xent:=1 to xCant do begin
              if (swentrada) then begin
                swentrada:=false;
                line:=copy(lin,1,38);
                xfechahoraini:=IntToClaveNum(GetAnoFromFecha(date),2)+copy(line,1,8);
                xfechahorafin:=IntToClaveNum(GetAnoFromFecha(date),2)+copy(line,20,8);
                xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
                if xFechaHoraEnt>(date+1) then begin
                  xfechahoraini:=IntToClaveNum(GetAnoFromFecha(date)-1,2)+copy(line,1,8);
                  xfechahorafin:=IntToClaveNum(GetAnoFromFecha(date)-1,2)+copy(line,20,8);
                  xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
                end;
                if (xfechaHoraEnt>=Trunc(X_CvolFecha)) then begin
                  DMCONS.DBGASCON.Connected:=true;
                  try
                    T_Etan.Active:=true;
                    try
                      if not T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                        swentrada:=true;
                        Q_Cvol.Active:=false;
                        Q_Cvol.Active:=true;
                        if not Q_Cvol.IsEmpty then with TTanques[xtan] do begin
                          X_CvolFecha:=Q_CvolFecha.AsDateTime;
                          X_CvolCorte:=Q_CvolCorte.AsInteger;
                          T_Etan.Insert;
                          T_EtanFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                          T_EtanCorte.AsInteger:=Q_CvolCorte.AsInteger;
                          T_EtanTanque.AsInteger:=xtan;
                          T_EtanCombustible.AsInteger:=Combustible;
                          T_EtanVolumenInicial.AsFloat:=StrToFloat(copy(lin,9,6));
                          T_EtanVolumenFinal.AsFloat:=StrToFloat(copy(lin,28,6));
                          T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                          T_EtanTemperatura.AsFloat:=StrToFloat(copy(lin,34,5))/10;
                          T_EtanFechaHoraDisp.AsString:=xFechaHoraFin;
                          T_EtanFechaHoraInicial.AsDateTime:=StrToFechaHora('20'+xFechaHoraIni);
                          T_EtanFechaHoraFinal.AsDateTime:=StrToFechaHora('20'+xFechaHoraFin);
                          if (T_EtanVolumenRecepcion.AsFloat>=1)and(T_EtanVolumenRecepcion.AsFloat<100000) then begin
                            T_Etan.Post;
                            T_Etan.Refresh;
                            if T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                              DMCONS.SP_Calcula_Ventas_Etan.ParamByName('P_FOLIO').AsInteger:=T_EtanFolio.AsInteger;
                              DMCONS.SP_Calcula_Ventas_Etan.ExecProc;
                            end;
                            if DMCONS.GuardaLogEntradaTanques='Si' then
                              Button1.Click;
                            CheckBox3.Checked:=false;
                          end
                          else
                            T_Etan.Cancel;
                        end;
                      end;
                    except
                      T_Etan.Active:=false;
                    end;
                  finally
                    DMCONS.DBGASCON.Connected:=false;
                  end;
                end;
              end;
              delete(lin,1,38);
            end;
          end;
      end
      else if (pos('?',lin)>0)and(NumPaso=1) then with TTanques[TanqueActual] do begin
        if Estado='A' then begin
          // Cambia Estado a inactivo
          Estado:='I';
          DMCONS.DBGASCON.Connected:=true;
          try
            T_Ctan.Active:=true;
            T_Ctan.Insert;
            T_CtanFecha.AsDateTime:=X_CvolFecha;
            T_CtanCorte.AsInteger:=X_CvolCorte;
            T_CtanTanque.AsInteger:=TanqueActual;
            T_CtanCombustible.AsInteger:=Combustible;
            T_CtanNuevoEstado.AsString:=Estado;
            T_Ctan.Post;
            T_Ctan.Active:=false;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
        end;
      end;
    except
    end;
  end;
end;

procedure TFTANMENU.ProcesaLinea3;  // AutoStik
var lin,line,xfechor:string;
    xtan,xcant,xent,i,xala:integer;
    xFechaHora,
    xFechaHoraEnt:TDateTime;
    AlturaAgua:Real;
begin
  with DMCONS do begin
    try
      if LineaProc='' then
        exit;
      lin:=LineaProc;
      if (copy(Lin,1,2)='10') then begin // INVANTARIO TANQUES
        xtan:=StrToIntDef(copy(lin,3,1),0);
        if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
          FechaHoraActivo:=now;
          if not EstadoActivo then begin
            RegistraBitacora3(1,'Reconexión de Tanque','Tanque '+inttostr(xtan),'U');
            EstadoActivo:=true;
          end;
          if TTanques[xtan].Estado='I' then begin
            // Cambia Estado  a activo
            Estado:='A';
            DMCONS.DBGASCON.Connected:=true;
            try
              T_Ctan.Active:=true;
              T_Ctan.Insert;
              T_CtanFecha.AsDateTime:=X_CvolFecha;
              T_CtanCorte.AsInteger:=X_CvolCorte;
              T_CtanTanque.AsInteger:=xtan;
              T_CtanCombustible.AsInteger:=Combustible;
              T_CtanNuevoEstado.AsString:=Estado;
              T_Ctan.Post;
              T_Ctan.Active:=false;
            finally
              DMCONS.DBGASCON.Connected:=false;
            end;
          end;
          VolumenAnterior:=Volumen;
          Volumen:=StrToFloat(limpiastr(copy(lin,26,6)));
          PorLlenar:=StrToFloat(limpiastr(copy(lin,37,6)));
          Temperatura:=StrToFloat(limpiastr(copy(lin,33,4)))/100;
          AlturaAgua:=0; //StrToFloat(limpiastr(copy(lin,43,3)))/100;
          if AutostikEnGalones='Si' then begin
            Volumen:=Volumen*LitrosXGalon;
            PorLlenar:=PorLlenar*LitrosXGalon;
          end;
          if Altura>1 then
            VolumenAgua:=CalculaAgua(Volumen+PorLlenar,Altura,AlturaAgua)
          else
            VolumenAgua:=0;
          VolumenDisponible:=Volumen-VolumenAgua;
          VolumenUtil:=Volumen-VolumenFondaje;
          Capacidad:=Volumen+PorLlenar;
          PorLlenar90:=PorLlenar-Capacidad*0.1;
          SwLevantado:=true;
          DespliegaTanque(xtan);
          if (not SwEmular) then begin
            xfechor:='20'+IntToClaveNum(GetAnoFromFecha(date),2)+copy(lin,4,8);
            xFechaHora:=StrToFechaHora(xfechor);
            if xFechaHora>(date+1) then begin
              xfechor:='20'+IntToClaveNum(GetAnoFromFecha(date)-1,2)+copy(lin,4,8);
              xFechaHora:=StrToFechaHora(xfechor);
            end;
          end;
        end;
      end
      else if copy(Lin,1,2)='15' then begin // ENTRADAS AL TANQUES
          xtan:=StrToIntDef(copy(lin,3,1),0);
          if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
            xCant:=StrToInt(copy(lin,6,2));
            delete(lin,1,7);
            for xent:=1 to xCant do begin
              line:=copy(lin,1,38);
              for i:=1 to 8 do if not(line[i] in ['0'..'9']) then
                line[i]:='0';
              for i:=20 to 27 do if not(line[i] in ['0'..'9']) then
                line[i]:='0';
              xfechahoraini:=IntToClaveNum(GetAnoFromFecha(date),2)+copy(line,1,8);
              xfechahorafin:=IntToClaveNum(GetAnoFromFecha(date),2)+copy(line,20,8);
              xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
              if xFechaHoraEnt>(date+1) then begin
                xfechahoraini:=IntToClaveNum(GetAnoFromFecha(date)-1,2)+copy(line,1,8);
                xfechahorafin:=IntToClaveNum(GetAnoFromFecha(date)-1,2)+copy(line,20,8);
                xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
              end;
              if (xfechaHoraEnt>=Trunc(X_CvolFecha))or(CheckBox1.Checked) then begin
                DMCONS.DBGASCON.Connected:=true;
                try
                  T_Etan.Active:=true;
                  try
                    if not T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                      Q_Cvol.Active:=false;
                      Q_Cvol.Active:=true;
                      if not Q_Cvol.IsEmpty then with TTanques[xtan] do begin
                        X_CvolFecha:=Q_CvolFecha.AsDateTime;
                        X_CvolCorte:=Q_CvolCorte.AsInteger;
                        T_Etan.Insert;
                        T_EtanFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                        T_EtanCorte.AsInteger:=Q_CvolCorte.AsInteger;
                        T_EtanTanque.AsInteger:=xtan;
                        T_EtanCombustible.AsInteger:=Combustible;
                        T_EtanVolumenInicial.AsFloat:=StrToFloat(copy(lin,9,6));
                        T_EtanVolumenFinal.AsFloat:=StrToFloat(copy(lin,28,6));
                        if AutostikEnGalones='Si' then begin
                          T_EtanVolumenInicial.AsFloat:=T_EtanVolumenInicial.AsFloat*LitrosXGalon;
                          T_EtanVolumenFinal.AsFloat:=T_EtanVolumenFinal.AsFloat*LitrosXGalon;
                        end;
                        T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                        T_EtanTemperatura.AsFloat:=StrToFloat(copy(lin,35,4))/100;
                        T_EtanFechaHoraDisp.AsString:=xFechaHoraFin;
                        T_EtanFechaHoraInicial.AsDateTime:=StrToFechaHora('20'+xFechaHoraIni);
                        T_EtanFechaHoraFinal.AsDateTime:=StrToFechaHora('20'+xFechaHoraFin);
                        if (T_EtanVolumenRecepcion.AsFloat>=1)and(T_EtanVolumenRecepcion.AsFloat<100000) then begin
                          T_Etan.Post;
                          T_Etan.Refresh;
                          if T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                            DMCONS.SP_Calcula_Ventas_Etan.ParamByName('P_FOLIO').AsInteger:=T_EtanFolio.AsInteger;
                            DMCONS.SP_Calcula_Ventas_Etan.ExecProc;
                          end;
                          if DMCONS.GuardaLogEntradaTanques='Si' then
                            Button1.Click;
                          CheckBox3.Checked:=false;
                        end
                        else
                          T_Etan.Cancel;
                      end;
                    end;
                  except
                    T_Etan.Active:=false;
                  end;
                finally
                  DMCONS.DBGASCON.Connected:=false;
                end;
              end;
              delete(lin,1,38);
            end;
          end;
      end
      else if copy(Lin,1,2)='14' then begin // ALARMAS DE TANQUES
        xtan:=StrToIntDef(copy(lin,3,1),0);
        delete(lin,1,27);
        if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
          DMCONS.DBGASCON.Connected:=true;
          try
            T_Alar.Active:=true;
            try
              for xala:=1 to 5 do begin
                xCant:=StrToInt(copy(lin,1,1));
                delete(lin,1,1);
                for xent:=1 to xCant do begin
                  xfechor:='20'+copy(lin,1,10);
                  delete(lin,1,10);
                  xFechaHora:=StrToFechaHora(xfechor);
                  if (xfechaHora>=date)or(CheckBox1.Checked) then begin
                    if not T_Alar.Locate('Tanque;FechaHora',VarArrayOf([xtan,xFechaHora]),[]) then begin
                      with TTanques[xtan] do begin
                        T_Alar.Insert;
                        T_AlarFolio.AsInteger:=1;
                        T_AlarFechaHora.AsDateTime:=xFechaHora;
                        T_AlarTanque.AsInteger:=xtan;
                        case xala of
                          1: T_AlarTipoAlarma.AsString:='Error en Sensor';
                          2: T_AlarTipoAlarma.AsString:='Nivel Agua Alto';
                          3: T_AlarTipoAlarma.AsString:='Nivel Producto Alto';
                          4: T_AlarTipoAlarma.AsString:='Nivel Producto Bajo';
                          5: T_AlarTipoAlarma.AsString:='Alarma de Robo';
                        end;
                        T_Alar.Post;
                      end;
                    end;
                  end;
                end;
              end; // xala
            except
              T_Alar.Active:=false;
            end;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
        end;
      end
      else if (pos('?',lin)>0)and(NumPaso=1) then with TTanques[TanqueActual] do begin
        if Estado='A' then begin
          // Cambia Estado a inactivo
          Estado:='I';
          DMCONS.DBGASCON.Connected:=true;
          try
            T_Ctan.Active:=true;
            T_Ctan.Insert;
            T_CtanFecha.AsDateTime:=X_CvolFecha;
            T_CtanCorte.AsInteger:=X_CvolCorte;
            T_CtanTanque.AsInteger:=TanqueActual;
            T_CtanCombustible.AsInteger:=Combustible;
            T_CtanNuevoEstado.AsString:=Estado;
            T_Ctan.Post;
            T_Ctan.Active:=false;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
        end;
      end;
    except
    end;
  end;
end;

procedure TFTANMENU.ProcesaLinea4;  // Red Jacket
var lin,line,xfechor:string;
    xtan,xcant,xent,xval,xnum:integer;
    xFechaHora,
    xFechaHoraEnt:TDateTime;
begin
  with DMCONS do begin
    try
      if LineaProc='' then
        exit;
      lin:=LineaProc;
      if (copy(Lin,1,4)='i201') then begin // INVANTARIO TANQUES
        xtan:=StrToIntDef(copy(lin,5,2),0);
        if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
          FechaHoraActivo:=now;
          if not EstadoActivo then begin
            RegistraBitacora3(1,'Reconexión de Tanque','Tanque '+inttostr(xtan),'U');
            EstadoActivo:=true;
          end;
          if TTanques[xtan].Estado='I' then begin
            // Cambia Estado  a activo
            Estado:='A';
            DMCONS.DBGASCON.Connected:=true;
            try
              T_Ctan.Active:=true;
              T_Ctan.Insert;
              T_CtanFecha.AsDateTime:=X_CvolFecha;
              T_CtanCorte.AsInteger:=X_CvolCorte;
              T_CtanTanque.AsInteger:=xtan;
              T_CtanCombustible.AsInteger:=Combustible;
              T_CtanNuevoEstado.AsString:=Estado;
              T_Ctan.Post;
              T_Ctan.Active:=false;
            finally
              DMCONS.DBGASCON.Connected:=false;
            end;
          end;
          Estatus:=copy(lin,20,4);
          VolumenAnterior:=Volumen;
          Volumen:=IeeeToFloat(copy(lin,26,8));
          VolumenAgua:=IeeeToFloat(copy(lin,74,8));
          PorLlenar:=IeeeToFloat(copy(lin,42,8));
          Temperatura:=IeeeToFloat(copy(lin,66,8));
          VolumenDisponible:=Volumen-VolumenAgua;
          VolumenUtil:=Volumen-VolumenFondaje;
          Capacidad:=Volumen+PorLlenar;
          PorLlenar90:=PorLlenar-Capacidad*0.1;
          SwLevantado:=true;
          DespliegaTanque(xtan);
          if (not SwEmular) then begin
            xfechor:='20'+copy(lin,7,10);
            xFechaHora:=StrToFechaHora(xfechor);
            if SwFechaHoraTM then begin
              SwFechaHoraTM:=false;
              UltimaFechaHoraTM:=xFechaHora;
            end
            else if abs(xfechahora-UltimaFechaHoraTM)<=1 then begin
              UltimaFechaHoraTM:=xFechaHora;
              (*
              if abs(xfechahora-UltimaFechaHoraTM)>2*tmMinuto then begin

              end;
              *)
            end;
          end;
        end;
      end
      else if copy(Lin,1,4)='i202' then begin // ENTRADAS AL TANQUES
          xtan:=StrToIntDef(copy(lin,5,2),0);
          if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
            xCant:=StrToInt(copy(lin,20,2));
            delete(lin,1,21);
            for xent:=1 to xCant do begin
              line:=copy(lin,1,102);
              xfechahoraini:=copy(line,1,10);
              xfechahorafin:=copy(line,11,10);
              xnum:=hextoint(copy(line,21,2));
              xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
              if (xfechaHoraEnt>=Trunc(X_CvolFecha)) then begin
                DMCONS.DBGASCON.Connected:=true;
                try
                  T_Etan.Active:=true;
                  try
                    if not T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                      delete(line,1,22);
                      for xval:=1 to 8 do begin
                        if (length(line)>=8) then begin
                          xvalores[xval]:=IeeeToFloat(copy(line,1,8));
                          delete(line,1,8);
                        end
                        else xvalores[xval]:=0;
                      end;
                      Q_Cvol.Active:=false;
                      Q_Cvol.Active:=true;
                      if not Q_Cvol.IsEmpty then with TTanques[xtan] do begin
                        X_CvolFecha:=Q_CvolFecha.AsDateTime;
                        X_CvolCorte:=Q_CvolCorte.AsInteger;
                        T_Etan.Insert;
                        T_EtanFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                        T_EtanCorte.AsInteger:=Q_CvolCorte.AsInteger;
                        T_EtanTanque.AsInteger:=xtan;
                        T_EtanCombustible.AsInteger:=Combustible;
                        T_EtanVolumenInicial.AsFloat:=AjustaFloat(xValores[1],3);
                        T_EtanVolumenFinal.AsFloat:=AjustaFloat(xValores[5],3);
                        T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                        T_EtanTemperatura.AsFloat:=AjustaFloat(xValores[8],3);
                        T_EtanFechaHoraDisp.AsString:=xFechaHoraFin;
                        T_EtanFechaHoraInicial.AsDateTime:=StrToFechaHora('20'+xFechaHoraIni);
                        T_EtanFechaHoraFinal.AsDateTime:=StrToFechaHora('20'+xFechaHoraFin);
                        if (T_EtanVolumenRecepcion.AsFloat>=1)and(T_EtanVolumenRecepcion.AsFloat<100000) then begin
                          T_Etan.Post;
                          T_Etan.Refresh;
                          if T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                            DMCONS.SP_Calcula_Ventas_Etan.ParamByName('P_FOLIO').AsInteger:=T_EtanFolio.AsInteger;
                            DMCONS.SP_Calcula_Ventas_Etan.ExecProc;
                          end;
                          if DMCONS.GuardaLogEntradaTanques='Si' then
                            Button1.Click;
                          CheckBox3.Checked:=false;
                        end
                        else begin
                          T_Etan.Cancel;
                        end;
                      end;
                    end;
                  except
                    T_Etan.Active:=false;
                  end;
                finally
                  DMCONS.DBGASCON.Connected:=false;
                end;
              end;
              delete(lin,1,22+xnum*8);
            end;
          end;
      end
      else if (copy(lin,1,8)='9999FF1B')and(NumPaso=1) then with TTanques[TanqueActual] do begin
        if Estado='A' then begin
          // Cambia Estado a inactivo
          Estado:='I';
          DMCONS.DBGASCON.Connected:=true;
          try
            T_Ctan.Active:=true;
            T_Ctan.Insert;
            T_CtanFecha.AsDateTime:=X_CvolFecha;
            T_CtanCorte.AsInteger:=X_CvolCorte;
            T_CtanTanque.AsInteger:=TanqueActual;
            T_CtanCombustible.AsInteger:=Combustible;
            T_CtanNuevoEstado.AsString:=Estado;
            T_Ctan.Post;
            T_Ctan.Active:=false;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
        end;
      end;
    except
    end;
  end;
end;

procedure TFTANMENU.ProcesaLinea6;  // INCON
var lin,line,xfechor:string;
    xtan,xcant,xent,xval,xnum:integer;
    xFechaHora,
    xFechaHoraI,
    xFechaHoraEnt:TDateTime;
  function StrToFloatIncon(xstr:string):double;
  begin
    if xstr[2]='.' then
      insert('0',xstr,2);
    try
      result:=StrToFloat(xstr);
    except
      result:=0;
    end;
  end;
begin
  with DMCONS do begin
    try
      if LineaProc='' then
        exit;
      lin:=LineaProc;
      if (copy(Lin,1,2)='18') then begin // INVANTARIO TANQUES
        xtan:=StrToIntDef(copy(lin,3,1),0);
        if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
          FechaHoraActivo:=now;
          if not EstadoActivo then begin
            RegistraBitacora3(1,'Reconexión de Tanque','Tanque '+inttostr(xtan),'U');
            EstadoActivo:=true;
          end;
          if TTanques[xtan].Estado='I' then begin
            // Cambia Estado  a activo
            Estado:='A';
            DMCONS.DBGASCON.Connected:=true;
            try
              T_Ctan.Active:=true;
              T_Ctan.Insert;
              T_CtanFecha.AsDateTime:=X_CvolFecha;
              T_CtanCorte.AsInteger:=X_CvolCorte;
              T_CtanTanque.AsInteger:=xtan;
              T_CtanCombustible.AsInteger:=Combustible;
              T_CtanNuevoEstado.AsString:=Estado;
              T_Ctan.Post;
              T_Ctan.Active:=false;
            finally
              DMCONS.DBGASCON.Connected:=false;
            end;
          end;
          VolumenAnterior:=Volumen;
          line:=copy(lin,21,8);
          Volumen:=StrToFloatIncon(copy(lin,21,8));
          VolumenAgua:=StrToFloatIncon(copy(lin,29,8));
          PorLlenar:=StrToFloatIncon(copy(lin,37,8));
          Temperatura:=StrToFloatIncon(copy(lin,53,8));
          VolumenDisponible:=Volumen-VolumenAgua;
          VolumenUtil:=Volumen-VolumenFondaje;
          Capacidad:=Volumen+PorLlenar;
          PorLlenar90:=PorLlenar-Capacidad*0.1;
          SwLevantado:=true;
          DespliegaTanque(xtan);
        end;
      end
      else if copy(Lin,1,2)='1a' then begin // ENTRADAS AL TANQUES
          xtan:=StrToIntDef(copy(lin,3,1),0);
          if (xtan in [1..NumTanques]) then with TTanques[xtan] do begin
            xCant:=1;
            for xent:=1 to xCant do begin
              xfechahoraini:=copy(lin,13,6)+copy(lin,9,2)+copy(lin,7,2);
              xfechahorafin:=copy(lin,76,6)+copy(lin,72,2)+copy(lin,70,2);
              xFechaHoraI:=StrToFechaHora('20'+xfechahoraini);
              xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
              if abs(xfechahoraent-xfechahorai)<2 then begin
                if (xfechaHoraEnt>=Trunc(X_CvolFecha))or(CheckBox1.Checked) then begin
                  DMCONS.DBGASCON.Connected:=true;
                  try
                    T_Etan.Active:=true;
                    try
                      //if not LocalizaTabla(T_Etan,'Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin])) then begin
                      if not T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                        Q_Cvol.Active:=false;
                        Q_Cvol.Active:=true;
                        if not Q_Cvol.IsEmpty then with TTanques[xtan] do begin
                          X_CvolFecha:=Q_CvolFecha.AsDateTime;
                          X_CvolCorte:=Q_CvolCorte.AsInteger;
                          T_Etan.Insert;
                          if (xfechaHoraEnt>=Trunc(Q_CvolFecha.AsDateTime)) then begin
                            T_EtanFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                            T_EtanCorte.AsInteger:=Q_CvolCorte.AsInteger;
                          end
                          else begin
                            T_EtanFecha.AsDateTime:=trunc(xfechaHoraEnt);
                            if copy(xfechahorafin,7,4)<='0400' then
                              T_EtanCorte.AsInteger:=1
                            else if copy(xfechahorafin,7,4)<='0800' then
                              T_EtanCorte.AsInteger:=2
                            else if copy(xfechahorafin,7,4)<='1200' then
                              T_EtanCorte.AsInteger:=3
                            else if copy(xfechahorafin,7,4)<='1600' then
                              T_EtanCorte.AsInteger:=4
                            else if copy(xfechahorafin,7,4)<='2000' then
                              T_EtanCorte.AsInteger:=5
                            else
                              T_EtanCorte.AsInteger:=6;
                          end;
                          T_EtanTanque.AsInteger:=xtan;
                          T_EtanCombustible.AsInteger:=Combustible;
                          T_EtanVolumenInicial.AsFloat:=StrToFloatIncon(copy(lin,20,8));
                          T_EtanVolumenFinal.AsFloat:=StrToFloatIncon(copy(lin,83,8));
                          T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                          T_EtanTemperatura.AsFloat:=StrToFloatIncon(copy(lin,83,8));
                          T_EtanFechaHoraDisp.AsString:=xFechaHoraFin;
                          T_EtanFechaHoraInicial.AsDateTime:=StrToFechaHora('20'+xFechaHoraIni);
                          T_EtanFechaHoraFinal.AsDateTime:=StrToFechaHora('20'+xFechaHoraFin);
                          if (T_EtanVolumenRecepcion.AsFloat>=1)and(T_EtanVolumenRecepcion.AsFloat<100000) then begin
                            T_Etan.Post;
                            T_Etan.Refresh;
                            if T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([xtan,xFechaHoraFin]),[]) then begin
                              DMCONS.SP_Calcula_Ventas_Etan.ParamByName('P_FOLIO').AsInteger:=T_EtanFolio.AsInteger;
                              DMCONS.SP_Calcula_Ventas_Etan.ExecProc;
                            end;
                            if DMCONS.GuardaLogEntradaTanques='Si' then
                              Button1.Click;
                            CheckBox3.Checked:=false;
                          end
                          else begin
                            T_Etan.Cancel;
                          end;
                        end;
                      end;
                    except
                      T_Etan.Active:=false;
                    end;
                  finally
                    DMCONS.DBGASCON.Connected:=false;
                  end;
                end;
              end;
            end;
          end;
      end;
    except
    end;
  end;
end;


procedure TFTANMENU.ComandoConsola(ss:string);
var s1:string;
begin
  try
    if TipoTanques=7 then
      exit;
    StaticText1.Caption:='Paso: '+inttostr(NumPaso)+'   Tanque: '+inttostr(TanqueActual)+'    '+inttostr(contrec);
    if DMCONS.SwEmular then begin
      LineaEmular:=ss;
      DMCONS.AgregaLog('E '+ss);
      inc(ContRec);
      exit;
    end;
    inc(ContadorAlarma);
    inc(ContadorAlarma2);
    SwTimer1:=false;
    try
      if TipoTanques<>6 then
        s1:=idSOH+ss
      else s1:=ss;
      if ApdComPort1.OutBuffFree >= Length(S1) then begin
        DMCONS.AgregaLog('E '+s1);
        inc(ContRec);
        ApdComPort1.PutString(s1);
      end;
    finally
      SwTimer1:=true;
      if NumPaso=2 then
        Timer1.Interval:=3000
      else
        Timer1.Interval:=1000;
    end;
  except
    SwTimer1:=true;
  end;
end;

procedure TFTANMENU.DespliegaTanque(xtan:integer);
begin
  try
    with TTanques[xtan] do begin
      if CheckBox3.Checked then begin
        if Volumen>VolumenAnterior then
          Volumen:=VolumenAnterior;
      end;
      Porciento:=dividefloat(VolumenDisponible,Capacidad)*100;
      TvrMatrix(FindComponent('vrMatrix'+IntToStr(xtan))).Text:=' TANQUE '+IntToStr(xtan)+ ' CAP. '+FormatoNumero(Capacidad,7,0)+' Lts';
      TAbTank(FindComponent('AbTank'+IntToStr(xtan))).Value:=porciento;
      if NombreComb[1]='M' then
        TAbTank(FindComponent('AbTank'+IntToStr(xtan))).TankSettings.Color:=clLime
      else if NombreComb[1]='P' then
        TAbTank(FindComponent('AbTank'+IntToStr(xtan))).TankSettings.Color:=clRed
      else if NombreComb[1]='D' then
        TAbTank(FindComponent('AbTank'+IntToStr(xtan))).TankSettings.Color:=clBlack;
      TvrThermoMeter(FindComponent('vrThermoMeter'+IntToStr(xtan))).Scale.Min:=0;
      TvrThermoMeter(FindComponent('vrThermoMeter'+IntToStr(xtan))).Scale.Max:=50;
      TvrThermoMeter(FindComponent('vrThermoMeter'+IntToStr(xtan))).Caption:=FormatoNumero(Temperatura,6,2)+' °C';
      TvrThermoMeter(FindComponent('vrThermoMeter'+IntToStr(xtan))).Value.Value:=Temperatura;
      TvrThermoMeter(FindComponent('vrThermoMeter'+IntToStr(xtan))).Refresh;
      TvrLabel(FindComponent('VrLabelNom'+IntToStr(xtan))).Caption:=NombreComb;
      if not swactivo then
        TvrLabel(FindComponent('VrLabelNom'+IntToStr(xtan))).Caption:='Inactivo';
      TvrLabel(FindComponent('vrLabelNom'+IntToStr(xtan))).Refresh;
      TAbTank(FindComponent('AbTank'+IntToStr(xtan))).Value:=porciento;
      TNumericEditor(FindComponent('NumericEditor1_'+IntToStr(xtan))).Text:=FormatFloat('#,##0.00',VolumenFondaje);
      TNumericEditor(FindComponent('NumericEditor2_'+IntToStr(xtan))).Text:=FormatFloat('#,##0.00',Volumen);
      if CheckBox2.Checked then begin
        VrLabel6x.Caption:='Por llenar(90%):';
        VrLabel11.Caption:='Por llenar(90%):';
        TNumericEditor(FindComponent('NumericEditor3_'+IntToStr(xtan))).Text:=FormatFloat('#,##0.00',PorLlenar90);
      end
      else begin
        VrLabel6x.Caption:='Por llenar:';
        VrLabel11.Caption:='Por llenar:';
        TNumericEditor(FindComponent('NumericEditor3_'+IntToStr(xtan))).Text:=FormatFloat('#,##0.00',PorLlenar);
      end;
      TNumericEditor(FindComponent('NumericEditor4_'+IntToStr(xtan))).Text:=FormatFloat('#,##0.00',VolumenAgua);
      TNumericEditor(FindComponent('NumericEditor5_'+IntToStr(xtan))).Text:=FormatFloat('#,##0.00',VolumenDisponible);
      TNumericEditor(FindComponent('NumericEditor6_'+IntToStr(xtan))).Text:=FormatFloat('#,##0.00',VolumenUtil);
      if (SwActivo) then begin
        if SwLevantado then begin
          if (abs(Volumen-VolumenAnterior)>=0.01)or(SwCorte)or(SwTiempo) then with DMCONS do begin
            SwTiempo:=false;
            DMCONS.DBGASCON.Connected:=true;
            try
              Q_Cvol.Active:=false;
              Q_Cvol.Active:=true;
              if not Q_Cvol.IsEmpty then begin
                X_CvolFecha:=Q_CvolFecha.AsDateTime;
                X_CvolCorte:=Q_CvolCorte.AsInteger;
                try
                  if not T_Cvolt.Locate('Tanque',xTan,[]) then begin
                    T_Cvolt.Insert;
                    T_CvoltFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                    T_CvoltCorte.AsInteger:=Q_CvolCorte.AsInteger;
                    T_CvoltTanque.AsInteger:=xtan;
                  end
                  else T_Cvolt.Edit;
                  T_CvoltFechaHora.AsDateTime:=Now;
                  T_CvoltCombustible.AsInteger:=Combustible;
                  T_CvoltVolumen.AsFloat:=AjustaFloat(Volumen,2);
                  T_CvoltPorLlenar.AsFloat:=AjustaFloat(PorLlenar,2);
                  T_CvoltNivel.AsFloat:=AjustaFloat(Altura,3);
                  T_CvoltVolumenAgua.AsFloat:=AjustaFloat(VolumenAgua,3);
                  T_CvoltTemperatura.AsFloat:=AjustaFloat(Temperatura,2);
                  T_CvoltVolumenFondaje.AsFloat:=AjustaFloat(VolumenFondaje,3);
                  T_Cvolt.Post;
                except
                end;
              end;
              Q_Cvol.Active:=false;
            finally
              DMCONS.DBGASCON.Connected:=false;
            end;
          end;
        end;
      end;
    end;
  except
  end;
end;

procedure TFTANMENU.IniciaBaseDeDatos;
begin
  with DMCONS do begin
    Screen.Cursor:=crHourGlass;
    try
      ConectaBaseDatos;
      TipoTanques:=T_EstsIbTIPOTANQUES.AsInteger;
      CheckBox3.Checked:=(PosVehiculo=1);
      if TipoTanques=7 then begin // team
        AdoConnectionTeam.Connected:=true;
        AdoTableInv.Active:=true;
      end;
      if (not swemular) and (TipoTanques<>8) then begin
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
      CalculaFechasCorte;
      DMCONS.DBGASCON.Connected:=true;
      try
        Q_Cvol.Active:=false;
        Q_Cvol.Active:=true;
        if (not Q_Cvol.IsEmpty) then begin
          CorteInicial:=Q_CvolCorte.AsInteger;
          X_CvolFecha:=Q_CvolFecha.AsDateTime;
          X_CvolCorte:=Q_CvolCorte.AsInteger;
        end;
      finally
        DMCONS.DBGASCON.Connected:=false;
      end;
      StaticText2.Caption:='Próximo Corte: '+FechaHoraToStr(FechaSiguienteCorte);
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFTANMENU.IniciaEstacion;
var i,xtan:integer;
begin
  with DMCONS do begin
    NumTanques:=0;
    for i:=1 to MaxTanques do with TTanques[i] do begin
      Combustible:=0;
      Altura:=0;
      Capacidad:=0;
      VolumenFondaje:=0;
      VolumenAnterior:=0;
      Volumen:=0;
      VolumenAgua:=0;
      Temperatura:=0;
      SwLevantado:=false;
      SwAlarma:=true;
      SwTiempo:=false;
      EstadoActivo:=true;
      FechaHoraActivo:=now;
    end;
    T_Tanq.Active:=true;
    Q_CombIb.Active:=true;
    while not T_Tanq.Eof do begin
      try
        xtan:=T_TanqTanque.AsInteger;
        if xtan in [1..MaxTanques] then with TTanques[xtan] do begin
          NumTanques:=xtan;
          Combustible:=T_TanqCombustible.asinteger;
          NombreComb:=T_TanqNombreComb.AsString;
          Capacidad:=T_TanqCapacidad.AsFloat;
          VolumenFondaje:=T_TanqVolumenFondaje.AsFloat;
          Altura:=T_TanqAltura.AsFloat;
          Estado:=UltimoEstadoTanque(xtan);
          Estatus:='';
          SwActivo:=T_TanqActivo.AsString='Si';
          DespliegaTanque(xtan);
          volmin_pv:=0;
          volmax_pv:=0;
        end;
      except
        //DMCONS.AgregaLog('Exception 016');
      end;
      T_Tanq.Next;
    end;
  end;
  xtan:=NumTanques+1;
  if (NumTanques>=7) then
    dxNavBar1Item4.Visible:=true;
  if (NumTanques>=5) then
    dxNavBar1Item3.Visible:=true;
  if (NumTanques>=3) then
    dxNavBar1Item2.Visible:=true;
  if (NumTanques>=1) then
    dxNavBar1Item1.Visible:=true;
  while xtan<=MaxTanques do begin
    TPanel(FindComponent('PanelA'+IntToStr(xtan))).Visible:=false;
    inc(xtan);
  end;
end;

procedure TFTANMENU.FormShow(Sender: TObject);
begin
  if SwInicio then with DMCONS do begin
    SwEmular:=false;
    SiguienteFechaHoraTurno:=now;
    SiguienteFechaHoraCmnd:=now;
    AliasConsolaEsts:=ParamStr(1);
    SwEmular:=StrMayuscIguales(Paramstr(2),'Emular');
    CicloEnt:=0;
    DMCONS.ModuloActual:='TANQ';  // Logs
    SwInicio:=false;
    SwCorte:=false;
    ErrorInic:=true;
    IniciaBaseDeDatos;
    try
      IniciaEstacion;
      (*
      if (not SwEmular) then
        PlanMDog_Ver31_INTERBASE(DMCONS.lcSerie);
        *)
      TanqueActual:=1;
      NumPaso:=0;
      Timer1.Enabled:=true;
      SwTimer1:=true;
      Timer3.Enabled:=SwEmular;
      VrTimer1.Enabled:=true;
      if DMCONS.SwEmular then
        Label4x.Visible:=true;
      ErrorInic:=false;
    finally
      DMCONS.DBGASCON.Connected:=false;
    end;
  end;
end;

procedure TFTANMENU.FormCreate(Sender: TObject);
begin
  Visible:=false;
  SwCerrar:=false;
  SwTimer1:=true;
  ContTimer1:=0;
  SwAux:=false;
  ContadorAlarma:=0;
  ContadorAlarma2:=0;
  ContadorAlarma3:=0;
  TiempoCorteAntes:=0;
  SwInicio:=true;
  ContEmular:=0;
  ContErroresCom:=0;
  FechaHoraExec:=now;
  FechaTimer1:=now;
  ContRec:=0;
  StaticText5.Caption:='Ejecutando desde: '+FechaHoraToStr(FechaHoraExec);
  ContValCorte:=0;
  NumPasoPv:=0;
  SwPetroVend:=false;
  swpv2:=true;
  SwEsperaPv:=false;
end;

procedure TFTANMENU.FormActivate(Sender: TObject);
begin
  if ErrorInic then begin
    DMCONS.DBGasCon.Connected:=false;
    Application.Terminate;
  end;
end;

function CheckSumVeederRoot(Cadena:string):boolean;
var i,bin1,bin2:integer;
    ss1,ss2:string;
begin
  ss1:=copy(Cadena,1,length(Cadena)-4);
  ss2:=copy(Cadena,length(Cadena)-3,4);

  // Calcula cadena
  bin1:=1;
  for i:=1 to length(ss1) do
    bin1:=bin1+ord(ss1[i]);

  // Cacula checksum
  bin2:=BinaryToInt(HexLongToBinary(ss2));

  // calcula sumatoria
  result:=IntToBinary(bin1+bin2,16)='0000000000000000';
end;

function TFTANMENU.AnalisisTxtPetroVend(xstr:string):boolean;
var xcadena,xss:string;
    i:integer;
begin
  try
    xcadena:='';
    if ApPv<=40 then
      for i:=1 to ApPv do
        xcadena:=xcadena+FiltraStrAlfaNum(LineaPetroVend[i]);
    xss:=FiltraStrAlfaNum(xstr);
    result:=pos(xss,xcadena)>0;
  except
    //DMCONS.AgregaLog('Exception 017');
  end;
end;

procedure TFTANMENU.ProcesaLineaPetroVend;  // Petro Vend
var xlin,ss:string;
    swnada:boolean;

  function ConvierteStrPv(xstr:string):string;
  var i:integer;
  begin
    try
      i:=Pos(',',xstr);
      if i>0 then
        xstr[i]:='.';
      result:=xstr;
    except
    end;
  end;

  procedure ProcesaPetroVend_M01;
  var i:integer;
    // M01/T/  1/ 1/ 1/  2/FFFFFFFF/04012011/152551/30
  begin
    try
      xlin:='';
      if ApPv<=40 then
        for i:=1 to ApPv do
          xlin:=xlin+LineaPetroVend[i];
      ss:=ExtraeElemStrSep(xlin,3,'/');
      TanquePv:=StrToIntDef(ss,0);
      if (TanquePv in [1..NumTanques]) then
        with TTanques[TanquePv] do begin
          ss:=ExtraeElemStrSep(xlin,8,'/');
          fechahorastr:=copy(ss,5,4)+copy(ss,3,2)+copy(ss,1,2);
          ss:=ExtraeElemStrSep(xlin,9,'/');
          fechahorastr:=fechahorastr+copy(ss,1,4);
        end;
    except
    end;
  end;

  procedure ProcesaPetroVend_M02;
  var i:integer;
    // M02/ 13089,313/ 13226,418/ 47703,582/    88,503/    23,956/    -0,010/58
    // 2) Net Corrected Tank Volume   13089,313
    // 3) Gross Measured Tank Volume  13226,418
    // 4) Volume Left in Tank         47703,582
    // 5) Producto Lavel               88,503
    // 6) Temperature                 23,956
    // 7) Water Lavel                 -0,010
  begin
    try
      xlin:='';
      if ApPv<=40 then
        for i:=1 to ApPv do
          xlin:=xlin+LineaPetroVend[i];
      if (TanquePv in [1..NumTanques]) then with TTanques[TanquePv] do begin

        ss:=ConvierteStrPv(ExtraeElemStrSep(xlin,3,'/')); // Gross Measured Tank Volume
        VolumenAnterior:=Volumen;
        volumen:=StrToFloat(ss);

        ss:=ConvierteStrPv(ExtraeElemStrSep(xlin,4,'/')); // Volume Left in Tank
        porllenar:=StrToFloat(ss);

        ss:=ConvierteStrPv(ExtraeElemStrSep(xlin,6,'/'));  //  Temperature
        Temperatura:=StrToFloat(ss);

      end;
    except
    end;
  end;

  procedure ProcesaPetroVend_M05;
  var xfechor:string;
      xFechaHora:TDateTime;
      i:integer;
      volent_pv:real;
      xFechaHoraFin:string;
    // M05/ 13089,313/     0,000/03
  begin
    try
      xlin:='';
      if ApPv<=40 then
        for i:=1 to ApPv do
          xlin:=xlin+LineaPetroVend[i];
      if (TanquePv in [1..NumTanques]) then with TTanques[TanquePv] do with DMCONS do begin

        ss:=ExtraeElemStrSep(xlin,3,'/');  // Gross Water Volume
        ss:=ConvierteStrPv(ss);
        volumenagua:=StrToFloat(ss);

        VolumenDisponible:=Volumen-VolumenAgua;
        VolumenUtil:=Volumen-VolumenFondaje;
        Capacidad:=Volumen+PorLlenar;
        PorLlenar90:=PorLlenar-Capacidad*0.1;
        SwLevantado:=true;
        DespliegaTanque(TanquePv);
        // DETECTA ENTREDAS
          if volmin_pv=0 then begin // inicalizo volmin
            volmin_pv:=volumen;
            volmax_pv:=0;
          end;
          if volumen<volmin_pv then begin // registro volmin
            volmin_pv:=volumen;
            fechormin_pv:=now;
            volmax_pv:=0;
          end;
          if volumen>volmin_pv then begin     // SE ESTA REGISTRANDO UNA ENTRADA
            if volmax_pv=0 then begin // inicializo volmax
              volmax_pv:=volumen;
              fechormax_pv:=now;
            end;
            if volumen>volmax_pv then begin //registro volmax
              volmax_pv:=volumen;
              fechormax_pv:=now;
            end
            else if (now-fechormax_pv)>5*tmminuto then begin
              volent_pv:=volmax_pv-volmin_pv;
              if volent_pv>2000 then begin
                  T_Etan.Active:=true;
                  try
                    xFechaHoraFin:=filtrastrnum(fechatostr(date)+horatostr24(time));
                    delete(xFechaHoraFin,1,2);
                    if not T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([TanquePv,xFechaHoraFin]),[]) then begin
                      DMCONS.DBGASCON.Connected:=true;
                      try
                        Q_Cvol.Active:=false;
                        Q_Cvol.Active:=true;
                        if not Q_Cvol.IsEmpty then with TTanques[TanquePv] do begin
                          X_CvolFecha:=Q_CvolFecha.AsDateTime;
                          X_CvolCorte:=Q_CvolCorte.AsInteger;
                          T_Etan.Insert;
                          T_EtanFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                          T_EtanCorte.AsInteger:=Q_CvolCorte.AsInteger;
                          T_EtanTanque.AsInteger:=TanquePv;
                          T_EtanCombustible.AsInteger:=Combustible;
                          T_EtanVolumenInicial.AsFloat:=volmin_pv;
                          T_EtanVolumenFinal.AsFloat:=volmax_pv;
                          T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                          T_EtanTemperatura.AsFloat:=Temperatura;
                          T_EtanFechaHoraDisp.AsString:=xFechaHoraFin;

                          T_EtanFechaHoraInicial.AsDateTime:=fechormin_pv;
                          T_EtanFechaHoraFinal.AsDateTime:=fechormax_pv;
                          if (T_EtanVolumenRecepcion.AsFloat>=1)and(T_EtanVolumenRecepcion.AsFloat<100000) then begin
                            T_Etan.Post;
                            T_Etan.Refresh;
                            if T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([TanquePv,xFechaHoraFin]),[]) then begin
                              DMCONS.SP_Calcula_Ventas_Etan.ParamByName('P_FOLIO').AsInteger:=T_EtanFolio.AsInteger;
                              DMCONS.SP_Calcula_Ventas_Etan.ExecProc;
                            end;
                            if DMCONS.GuardaLogEntradaTanques='Si' then
                              Button1.Click;
                            CheckBox3.Checked:=false;
                          end
                          else
                            T_Etan.Cancel;
                        end;
                        T_Etan.Active:=false;
                      finally
                        DMCONS.DBGASCON.Connected:=false;
                      end;
                    end;
                  finally
                    volmin_pv:=0;
                    volmax_pv:=0;
                  end;
              end;
            end;
          end;
        // FIN
        if (not SwEmular) then begin
          xfechor:=fechahorastr;
          xFechaHora:=StrToFechaHora(xfechor);
          if SwFechaHoraTM then begin
            SwFechaHoraTM:=false;
            UltimaFechaHoraTM:=xFechaHora;
          end
          else if abs(xfechahora-UltimaFechaHoraTM)<=1 then begin
            UltimaFechaHoraTM:=xFechaHora;
            (*
            if abs(xfechahora-UltimaFechaHoraTM)>2*tmMinuto then begin
              //** UltimaFechaHora:=xfechahora;
              //** FechaHoraToSystem(UltimaFechaHora);
            end;
            *)
          end;
        end;
      end;
    except
    end;
  end;

begin
  try
    NumPasoPv:=0;
    swnada:=true;
    if AnalisisTxtPetroVend('4.Comandos de sistema') then begin
      NumPasoPv:=1;
      swnada:=false;
    end
    else if AnalisisTxtPetroVend('9.Informes de ordenadores') then  begin
      NumPasoPv:=2;
      swnada:=false;
    end
    else if AnalisisTxtPetroVend('4.Inventario de tanque') then begin
      NumPasoPv:=3;
      swnada:=false;
    end;
    if AnalisisTxtPetroVend('INV/') then begin
      NumPasoPv:=4;
      swnada:=false;
    end;
    if AnalisisTxtPetroVend('M01/') then begin
      ProcesaPetroVend_M01;
      NumPasoPv:=4;
      swnada:=false;
    end;
    if AnalisisTxtPetroVend('M02/') then begin
      ProcesaPetroVend_M02;
      NumPasoPv:=4;
      swnada:=false;
    end;
    if AnalisisTxtPetroVend('M05/') then begin
      ProcesaPetroVend_M05;
      NumPasoPv:=4;
      swnada:=false;
    end;
    if swnada then begin
      if AnalisisTxtPetroVend('VT100') then begin
        NumPasoPv:=11;
      end
      else if AnalisisTxtPetroVend('ESTA SEGURO') then begin
        NumPasoPv:=12;
      end
      else if AnalisisTxtPetroVend('ADIOS') then begin
        NumPasoPv:=13;
      end
      else if AnalisisTxtPetroVend('C/CANCELAR') then begin
        NumPasoPv:=14;
      end;
    end;
    if DMCONS.SwEmular then begin
      if (contpv>10)and(NumPasoPv=4) then begin
        contpv:=0;
        NumPasoPv:=2;
      end;
    end;
  except
  end;
end;

procedure TFTANMENU.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
var I:Word;
    C:Char;
begin
  SwTimer1:=false;
  try
    ContadorAlarma:=0;
    try
      case TipoTanques of
        1:begin // VeederRoot
            for I := 1 to Count do begin
              C:=ApdComPort1.GetChar;
              case c of
                idSOH:begin
                        LineaBuff:='';
                      end;
                idETX:begin
                        LineaProc:=LineaBuff; // 815 7562 Y 566833
                        if CheckSumVeederRoot(LineaProc) then begin
                          ContadorAlarma2:=0;
                          DMCONS.AgregaLog('R '+LineaProc);
                          ContRec:=0;
                          ProcesaLineaVeederRoot;
                        end
                        else begin
                          inc(conterrorescom);
                          StaticText4.Caption:='Errores de Comunicación: '+inttostr(conterrorescom);
                        end;
                      end;
                else LineaBuff:=LineaBuff+C;
              end;
            end;
          end;
        2:begin // EecoSystems
            for I := 1 to Count do begin
              C:=ApdComPort1.GetChar;
              case c of
                idSOH:begin
                        LineaBuff:='';
                      end;
                idETX:begin
                        LineaProc:=LineaBuff;
                        ContadorAlarma2:=0;
                        DMCONS.AgregaLog('R '+LineaProc);
                        ContRec:=0;
                        ProcesaLinea2;
                      end;
                else LineaBuff:=LineaBuff+C;
              end;
            end;
          end;
        3:begin // AutoStik
            for I := 1 to Count do begin
              C:=ApdComPort1.GetChar;
              case c of
                idSOH:begin
                        LineaBuff:='';
                      end;
                idETX:begin
                        LineaProc:=LineaBuff;
                        ContadorAlarma2:=0;
                        DMCONS.AgregaLog('R '+LineaProc);
                        if (copy(Lineaproc,1,2)='10') then begin
                          if (copy(lineaproc,46,1)='9')or(DMCONS.ValidaCheckSumAutoStik='No') then begin
                            ContRec:=0;
                            ContadorAlarma3:=0;
                            ProcesaLinea3;
                          end
                          else inc(ContadorAlarma3);
                        end
                        else begin
                          ContRec:=0;
                          ProcesaLinea3;
                        end;
                      end;
                else LineaBuff:=LineaBuff+C;
              end;
            end;
          end;
        4:begin // Red Jacket
            for I := 1 to Count do begin
              C:=ApdComPort1.GetChar;
              case c of
                idSOH:begin
                        LineaBuff:='';
                      end;
                idETX:begin
                        LineaProc:=LineaBuff; // 815 7562 Y 566833
                        if CheckSumVeederRoot(LineaProc) then begin
                          ContadorAlarma2:=0;
                          DMCONS.AgregaLog('R '+LineaProc);
                          ContRec:=0;
                          ProcesaLineaVeederRoot;
                        end
                        else begin
                          inc(conterrorescom);
                          StaticText4.Caption:='Errores de Comunicación: '+inttostr(conterrorescom);
                        end;
                      end;
                else LineaBuff:=LineaBuff+C;
              end;
            end;
          end;
        5:begin // Petro Vend
            LineaBuff:='';
            SwEsperaPv:=false;
            for I := 1 to Count do begin
              C:=ApdComPort1.GetChar;
              if c in [#32..#200] then
                LineaBuff:=LineaBuff+C;
              if c=#13 then begin
                if Appv<40 then begin
                  inc(ApPv);
                  LineaPetroVend[ApPv]:=LineaBuff;
                end;
                DMCONS.AgregaLog('R '+LineaBuff);
                LineaBuff:='';
                ContRec:=0;
                ContadorAlarma2:=0;
              end;
            end;
            if Appv<40 then begin
              inc(ApPv);
              LineaPetroVend[ApPv]:=LineaBuff;
            end;
            DMCONS.AgregaLog('R '+LineaBuff);
            LineaBuff:='';
            ContadorAlarma2:=0;
          end;
        6:begin // INCON
            for I := 1 to Count do begin
              C:=ApdComPort1.GetChar;
              case c of
                idSOH:begin
                        LineaBuff:='';
                      end;
                idETX:begin
                        LineaProc:=LineaBuff; // 815 7562 Y 566833
                        if true then begin //CheckSumVeederRoot(LineaProc) then begin
                          ContadorAlarma2:=0;
                          DMCONS.AgregaLog('R '+LineaProc);
                          ContRec:=0;
                          ProcesaLinea6;
                        end
                        else begin
                          inc(conterrorescom);
                          StaticText4.Caption:='Errores de Comunicación: '+inttostr(conterrorescom);
                        end;
                      end;
                else LineaBuff:=LineaBuff+C;
              end;
            end;
          end;
      end;
    except
      //DMCONS.AgregaLog('Exception 018');
      SwTimer1:=true;
    end;
  finally
    if TipoTanques=5 then begin
      if not Timer2.Enabled then
        Timer2.Enabled:=true;
    end
    else
      SwTimer1:=true;
  end;
end;

procedure TFTANMENU.ComandoConsolaPetroVend(ss:string);
var s1:string;
    i,n,m:integer;
begin
  try
    inc(ContadorAlarma);
    inc(ContadorAlarma2);
    //Timer1.Enabled:=false;
    SwTimer1:=false;
    //SwTimer1:=true;
    if DMCONS.SwEmular then begin
      LineaEmular:=ss;
      DMCONS.AgregaLog('E '+ss);
      inc(ContRec);
      exit;
    end;
    try
      n:=0;
      for i:=1 to length(ss) do
        n:=n+ord(ss[i]);
      n:=n+47;
      m:=(n)mod(100);
      s1:=ss+'/'+inttoclavenum(m,2)+char(13)+char(12);
      if ApdComPort1.OutBuffFree >= Length(S1) then begin
        DMCONS.AgregaLog('E '+s1);
        tiempopv:=now;
        SwEsperaPv:=true;
        inc(ContRec);
        ApPv:=0;
        ApdComPort1.PutString(s1);
      end;
    finally
      //Timer1.Enabled:=true;
      //SwTimer1:=false;
      SwTimer1:=true;
    end;
  except
    //DMCONS.AgregaLog('Exception 019');
    //DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraExtToStr(Now))+'.Txt');
    //Timer1.Enabled:=true;
    //SwTimer1:=false;
    SwTimer1:=true;
  end;
end;


procedure TFTANMENU.CicloPetroVend;
begin
  try
      Case NumPasoPv of
        0:ComandoConsolaPetroVend('1');
        1:ComandoConsolaPetroVend('4');
        2:ComandoConsolaPetroVend('9');
        3:ComandoConsolaPetroVend('4');
        4:ComandoConsolaPetroVend('1');

        11:ComandoConsolaPetroVend('2');
        12,13:ComandoConsolaPetroVend('');
        14:ComandoConsolaPetroVend('');
      end;
  except
    //DMCONS.AgregaLog('Exception 020');
    //DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraExtToStr(Now))+'.Txt');
  end;
end;

function TFTANMENU.CalculoCrc(xstr:string):string;
var
   xCrc,xcomando:string;
   nCrc,nInt:word;
begin
  nInt:=15*16*16*16 + 15*16*16 + 15*16 + 15;  // 0xFFFF
  xcomando:='crc '+xstr+' '+inttostr(length(xstr))+' '+inttostr(nint);
  nCrc:=StrToInt(CalcularCRC(xcomando));
  xCrc:=IntToHex(nCrc,4);
  result:=xCrc;
end;

procedure TFTANMENU.Timer1Timer(Sender: TObject);
var i,hh,cont:integer;
    ss,ss2,xfec,xhor:string;
    xFechaHoraEnt:Tdatetime;
begin
  // CICLO PRINCIPAL, RECORRE TODOS LOS TENQUES EN 3 PASOS(INVENTARIO, ENTRADAS Y ALERTAS
  try
    if (TipoTanques=8) and (not Socket1.Active) and (not DMCONS.swemular) then begin // Gateway
      for i:=60 downto 0 do begin
        if ServicioCorriendo('ogcvgateway') then begin
          StaticText3.Visible:=False;
          Socket1.Host:=DMCONS.ServidorGateway;
          Socket1.Port:=DMCONS.PuertoGatewayTanq;
          Socket1.Open;
          Break;
        end
        else begin
          StaticText3.Caption:='Esperando servicio Gateway: '+IntToStr(i);
          Sleep(1000);
        end;
        SwCerrar:=i=0;
      end;
    end;
    if CheckBox3.Checked then begin
      if (now-HoraParoEntradas)>60*TmMinuto then
        CheckBox3.Checked:=false;
    end;
    if not SwTimer1 then begin
      inc(ContTimer1);
      if ContTimer1<=60 then
        exit;
    end
    else begin
      ContTimer1:=0;
      SwTimer1:=true;
    end;
    if (SwCerrar) and (not Socket1.Active) then
      Close;    
    with DMCONS do if MinutosReinicioTanques>30 then begin
      StaticText6.Caption:=inttostr(MinutosReinicioTanques)+' - '+FechaHoraToStr(FechaHoraExec+MinutosReinicioTanques*TmMinuto);
      if (Now-FechaHoraExec)>MinutosReinicioTanques*TmMinuto then begin
        DBGASCON.Connected:=true;
        try
          T_Cmnd.Active:=true;
          T_Cmnd.Insert;
          T_CmndModulo.AsString:='TANQ';
          T_CmndComando.AsString:='CERRAR';
          T_Cmnd.Post;
        finally
          DBGASCON.Connected:=false;
          FechaHoraExec:=now;
        end;
      end;
    end;
    FechaTimer1:=Now;
    // ValidaCorte;
    if not DMCONS.SwEmular then
      if (ContadorAlarma>=10)or(ContadorAlarma2>=10)or(ContadorAlarma3>=10)or(SwAux) then begin
        if ContadorAlarma3>=10 then BEGIN
          DMCONS.DBGASCON.Connected:=true;
          DMCONS.RegistraBitacora3(1,'Desconexion de Dispositivo','Error de Comunicación','U');
          ReiniciaTanques;
        end;
        StaticText3.Caption:='Error de Comunicación';
        if not StaticText3.Visible then
          Beep;
        StaticText3.Visible:=not StaticText3.Visible;
      end
      else StaticText3.Visible:=false
    else StaticText3.Visible:=false;
    //lee_registro;
    if (Now-DMCONS.FechaHoraRefLog)>tmMinuto then begin
      DMCONS.DBGASCON.Connected:=true;
      try
        DMCONS.RefrescaConexion;
        DMCONS.CalculaFechasCorte;
      finally
        DMCONS.DBGASCON.Connected:=false;
      end;
    end;
    if TipoTanques=5 then begin // Petro vend
      SwPetroVend:=true;
      if ((not swesperapv)or((now-tiempopv)>5*tmsegundo)) then begin
        swesperapv:=false;
        CicloPetroVend;
      end;
    end
    else begin // RESTO
      if NumPaso=0 then begin   // Solo en el 1er ciclo de reloj
        TanqueActual:=0;
        NumPaso:=1;
      end;
      if NumPaso=1 then begin // LEE INVENTARIO DE TANQUES
        if TanqueActual<NumTanques then with DMCONS do begin
          inc(TanqueActual);
          DMCONS.DBGASCON.Connected:=true;
          try
            T_Tanq.Active:=true;
            if T_Tanq.Locate('Tanque',TanqueActual,[]) then begin
              if T_TanqActivo.AsString='Si' then begin
                case TipoTanques of
                  1:ComandoConsola(DMCONS.CodigoSeguridadVeederRoot+'i201'+inttoclavenum(TanqueActual,2)); // VeederRoot
                  2:ComandoConsola('E97'+inttostr(TanqueActual));  // EecoSystems
                  3:ComandoConsola('10'+inttostr(TanqueActual));  // AutoStik
                  4:ComandoConsola(DMCONS.CodigoSeguridadVeederRoot+'i201'+inttoclavenum(TanqueActual,2)); // Red Jacket
                  6:begin      // Incon
                      ss:='18'+inttoclavenum(TanqueActual,1)+'0';
                      ss2:=CalculoCrc(ss);
                      ss:=idSoh+ss+ss2+idEtx;
                      ComandoConsola(ss);
                    end;
                  7:with DMCONS do begin // TEAM
                      if TanqueActual=1 then
                        AdoTableInv.Refresh;
                      if AdoTableInv.Locate('Tanque',TanqueActual,[]) then with TTanques[TanqueActual] do begin
                        FechaHoraActivo:=now;
                        if not EstadoActivo then begin
                          RegistraBitacora3(1,'Reconexión de Tanque','Tanque '+inttostr(TanqueActual),'U');
                          EstadoActivo:=true;
                        end;
                        VolumenAnterior:=Volumen;
                        Volumen:=AdoTableInvVolBruto.AsFloat;
                        VolumenAgua:=AdoTableInvAgua.AsFloat;
                        PorLlenar:=AdoTableInvCapDisponible.AsFloat;
                        Temperatura:=AdoTableInvTemperatura.AsFloat;
                        VolumenDisponible:=Volumen-VolumenAgua;
                        VolumenUtil:=Volumen-VolumenFondaje;
                        Capacidad:=Volumen+PorLlenar;
                        PorLlenar90:=PorLlenar-Capacidad*0.1;
                        SwLevantado:=true;
                        DespliegaTanque(TanqueActual);
                      end;
                    end;
                    8:ComandoConsolaSocket(DMCONS.CodigoSeguridadVeederRoot+'i201'+inttoclavenum(TanqueActual,2)); // Gateway
                end;
                with TTanques[TanqueActual] do begin
                  if (EstadoActivo)and(FechaHoraActivo<Now-3*tmminuto) then begin
                    EstadoActivo:=false;
                    RegistraBitacora3(1,'Desconexión de Tanque','Tanque '+inttostr(TanqueActual),'U');
                  end;
                end;
              end;
            end;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
        end
        else begin
          if CicloEnt=0 then begin
            inc(CicloEnt);
            NumPaso:=2;
            TanqueActual:=0;
          end
          else begin
            TanqueActual:=0;
            inc(CicloEnt);
            if CicloEnt>=10 then
              CicloEnt:=0;
          end;
        end;
      end;
      //ContAux:=6;
      if NumPaso=2 then begin
        for i:=1 to NumTanques do
          TTanques[i].SwTiempo:=true;
        SwCorte:=false;
        if TanqueActual<NumTanques then with DMCONS do begin
          inc(TanqueActual);
          DMCONS.DBGASCON.Connected:=true;
          try
            T_Tanq.Active:=true;
            with TTanques[TanqueActual] do if T_Tanq.Locate('Tanque',TanqueActual,[]) then begin
              if T_TanqActivo.AsString='Si' then
                case TipoTanques of
                  1:begin
                      ComandoConsola(DMCONS.CodigoSeguridadVeederRoot+'i202'+inttoclavenum(TanqueActual,2)); // VeederRoot
                    end;
                  2:begin   // EecoSystems
                      if sweeco then
                        ComandoConsola('15'+inttostr(TanqueActual))
                      else
                        ComandoConsola('10'+inttostr(TanqueActual));
                    end;
                  3:begin   // AutoStik
                      if not swalarma then
                        ComandoConsola('15'+inttostr(TanqueActual))
                      else if DMCONS.AutostikAlarmas='Si' then
                        ComandoConsola('14'+inttostr(TanqueActual));
                      swalarma:=not swalarma;
                    end;
                  4:ComandoConsola(DMCONS.CodigoSeguridadVeederRoot+'i202'+inttoclavenum(TanqueActual,2)); // Red Jacket
                  6:begin      // Incon
                      ss:='1a'+inttoclavenum(TanqueActual,1)+'0';
                      ss2:=CalculoCrc(ss);
                      ss:=idSoh+ss+ss2+idEtx;
                      ComandoConsola(ss);
                    end;
                  7:with DMCONS do begin // TEAM
                      AdoQueryEnt.Active:=false;
                      AdoQueryEnt.Active:=true;
                      cont:=0;
                      while (not AdoQueryEnt.Eof)and(cont<10) do begin
                        if AdoQueryEntTanque.AsInteger=TanqueActual then with TTanques[TanqueActual] do begin
                          xfec:=AdoQueryEntFecha_Fin.AsString;
                          xhor:=AdoQueryEntHoraF.AsString;
                          if xhor[10]='p' then begin
                            hh:=strtointdef(copy(xhor,1,2),0);
                            if hh<12 then
                              hh:=hh+12;
                            xhor:=inttoclavenum(hh,2)+copy(xhor,3,10);
                          end;
                          xFechaHoraFin:=copy(xfec,7,2)+copy(xfec,4,2)+copy(xfec,1,2)+copy(xhor,1,2)+copy(xhor,4,2);
                          xfec:=AdoQueryEntFecha_Ini.AsString;
                          xhor:=AdoQueryEntHoraI.AsString;
                          if xhor[10]='p' then begin
                            hh:=strtointdef(copy(xhor,1,2),0);
                            if hh<12 then
                              hh:=hh+12;
                            xhor:=inttoclavenum(hh,2)+copy(xhor,3,10);
                          end;
                          xFechaHoraIni:=copy(xfec,7,2)+copy(xfec,4,2)+copy(xfec,1,2)+copy(xhor,1,2)+copy(xhor,4,2);
                          xFechaHoraEnt:=StrToFechaHora('20'+xfechahorafin);
                          if (xfechaHoraEnt>=Trunc(X_CvolFecha))or(CheckBox1.Checked) then begin
                              T_Etan.Active:=true;
                              if not T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([TanqueActual,xFechaHoraFin]),[]) then begin
                                Q_Cvol.Active:=false;
                                Q_Cvol.Active:=true;
                                if not Q_Cvol.IsEmpty then with TTanques[TanqueActual] do begin
                                  X_CvolFecha:=Q_CvolFecha.AsDateTime;
                                  X_CvolCorte:=Q_CvolCorte.AsInteger;
                                  T_Etan.Insert;
                                  T_EtanFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
                                  T_EtanCorte.AsInteger:=Q_CvolCorte.AsInteger;
                                  T_EtanTanque.AsInteger:=TanqueActual;
                                  T_EtanCombustible.AsInteger:=Combustible;
                                  T_EtanVolumenInicial.AsFloat:=AdoQueryEntVol_Bruto_Ini.AsFloat;
                                  T_EtanVolumenFinal.AsFloat:=AdoQueryEntVol_Bruto_Fin.AsFloat;
                                  T_EtanVolumenRecepcion.AsFloat:=AjustaFloat(T_EtanVolumenFinal.AsFloat-T_EtanVolumenInicial.AsFloat,3);
                                  T_EtanTemperatura.AsFloat:=AdoQueryEntTemperatura_Fin.AsFloat;
                                  T_EtanFechaHoraDisp.AsString:=xFechaHoraFin;
                                  T_EtanFechaHoraInicial.AsDateTime:=StrToFechaHora('20'+xFechaHoraIni);
                                  T_EtanFechaHoraFinal.AsDateTime:=StrToFechaHora('20'+xFechaHoraFin);
                                  if (T_EtanVolumenRecepcion.AsFloat>=1)and(T_EtanVolumenRecepcion.AsFloat<100000) then begin
                                    T_Etan.Post;
                                    T_Etan.Refresh;
                                    if T_Etan.Locate('Tanque;FechaHoraDisp',VarArrayOf([TanqueActual,xFechaHoraFin]),[]) then begin
                                      DMCONS.SP_Calcula_Ventas_Etan.ParamByName('P_FOLIO').AsInteger:=T_EtanFolio.AsInteger;
                                      DMCONS.SP_Calcula_Ventas_Etan.ExecProc;
                                    end;
                                    if DMCONS.GuardaLogEntradaTanques='Si' then
                                      Button1.Click;
                                    CheckBox3.Checked:=false;
                                  end
                                  else
                                    T_Etan.Cancel;
                                end;
                              end;
                          end;
                        end;
                        inc(cont);
                        AdoQueryEnt.Next;
                      end;
                    end;
                  8:begin
                      ComandoConsolaSocket(DMCONS.CodigoSeguridadVeederRoot+'i202'+inttoclavenum(TanqueActual,2)); // Gateway
                    end;
                end;
            end;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
        end
        else begin
          NumPaso:=3;
          TanqueActual:=0;
          SwEeco:=not SwEeco;
        end;
      end;
    end;
    if numpaso=3 then begin
      if (DMCONS.SincHoraVeederRoot='Si') then begin
        case TipoTanques of
          1:ComandoConsola(DMCONS.CodigoSeguridadVeederRoot+'i50100');
          8:ComandoConsolaSocket(DMCONS.CodigoSeguridadVeederRoot+'i50100');
        end;
      end;
      NumPaso:=1;
      TanqueActual:=0;


      // FIN DE CICLO


    end;
    if RxTrayIcon1.Tag=0 then begin   // Solo en el 1er ciclo de reloj
      RxTrayIcon1.Tag:=1;
      FTanMenu.Visible:=false;
      RxTrayIcon1.Show;
    end;
  except
    //DMCONS.AgregaLog('Exception 021');
  end;
end;

procedure TFTANMENU.Restaurar1Click(Sender: TObject);
begin
  FTanMenu.Visible:=true;
end;

procedure TFTANMENU.BitBtn3Click(Sender: TObject);
begin
  FTanMenu.Visible:=false;
  RxTrayIcon1.Show;
end;

procedure TFTANMENU.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if SwCerrar then begin
    CanClose:=true;
  end
  else if (not DMCONS.SwEmular) then begin
    canClose:=False;
  end
  else canClose:=True
end;

procedure TFTANMENU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdComPort1.Open:=false;
end;

procedure TFTANMENU.Timer3Timer(Sender: TObject);
var lin,ss:string;
    i:integer;
begin
  // EMULACION
  SwTimer1:=false;
  try
    if LineaEmular<>'' then begin
      Lin:=LineaEmular;
      LineaEmular:='';
      case TipoTanques of
        1:begin // VeederRoot
            if copy(lin,1,6)='i20101' then begin
              lineaproc:='i2010105060408450110000074722B9B6471FD3DA4765B44B44B004530000000041ECCD1800000000&&EEB8';
            end
            else if copy(lin,1,6)='i20102' then begin
              lineaproc:='i201020506040845022000007463BE3C8463893F147402E0E444C70210000000041EA16E400000000&&EEE1';
            end
            else if copy(lin,1,6)='i20103' then begin
              lineaproc:='i201030506040846033000007461D5F8B461A79AE46ECB63B4459371C0000000041F0FF3C00000000&&EE80';
            end
            else if copy(lin,1,6)='i20201' then begin
              lineaproc:= 'i20201'+'121211173501110'+
                          '121210112212121011320A45D7822945D4140B0000000041E23B6B4683C3EC4681D7DF0000000041D785514428967644A12C61'+
                          '121206093612120609540A4628C99046262F670000000041DC71B946EFFE1F46ECEAD70000000041CD78F24468082B4503335A'+
                          '121204100112120410200A452C37AE452924670000000041E4C9E146B0BDE446AE8DB60000000041CB117A43B290B044CA877A'+
                          '121201095012120110080A44E9402944E4FE150000000041E8757D46A9154346A6E5150000000041CE7A864388EB1344C37E8B'+
                          '121127100712112710250A458AA029458824480000000041EDF51146BDDEF946BB63170000000041CE7BA543F7D91A44D69C97'+
                          '121123123212112312500A45B4BBD745B18A480000000041EA609546C8C84D46C58F2C0000000041E14624441504EE44E0C1AB'+
                          '121120114812112012080A452E9548452B82000000000041E6F9A946B0D49A46AE23BB0000000041DC41B043B43EED44CA99AA'+
                          '121116094312111610010A45D6535D45D2C6F60000000041E3E1D446D12E2E46CEC9030000000041C423354427E51044E8A0F9'+
                          '121113094312111310010A45299D8545264DAE0000000041F5495146B0630D46AE604B0000000041C49AF243B0CAD844CA34FC'+
                          '121109095712110910150A458CFDC3458A270A0000000041F7D73D46BE765F46BB4C620000000041E4F27F43FAB60B44D72AAC&&22FE';

            end
            else if copy(lin,1,6)='i50100' then begin
              lineaproc:='i501001409121550';
            end
            else
              lineaproc:=lin;
            if CheckSumVeederRoot(LineaProc) then begin
              ContadorAlarma2:=0;
              DMCONS.AgregaLog('R '+LineaProc);
              ContRec:=0;
              ProcesaLineaVeederRoot;
            end
            else begin
              //inc(ContadorAlarma2);
              inc(conterrorescom);
              StaticText4.Caption:='Errores de Comunicación: '+inttostr(conterrorescom);
            end;
          end;
        2:begin // EecoSystem
            if copy(lin,1,3)='E97' then begin
              if TanqueActual=1 then
                lineaproc:='E971239.45      47558.52    47208.52    24.56       12473.62    0.00        0.00        F176'
                //lineaproc:='101020216201101D110017738033340002300266920009F6E9'
              else
                lineaproc:='E972187.12      27217.98    26987.84    23.21       13603.45    0.00        0.00        F175';
                //lineaproc:='102020216281102M110009908011885002550289360009F6C2';
            end
            else if copy(lin,1,2)='15' then begin
              lineaproc:='1511D10'+
                         '02030936022606002570203095404284200223'+
                         '01261918031320002570126193405172600251'+
                         '01201239041754002550120125806142100252'+
                         '01191413025477002530119143104576400255'+
                         '011514380290600025001151500049430002480112154503174300247'+
                         '011216050521690024501080913040920002470108093106179300236'+
                         '010609220381780025501060939056889002420105160702139800260'+
                         '010516260413960025312311303026534002621231132304691600251'+
                         '9B305';
            end
            else
              lineaproc:=lin;
            ContadorAlarma2:=0;
            DMCONS.AgregaLog('R '+LineaProc);
            ContRec:=0;
            ProcesaLinea2;
          end;
        3:begin //AutoStik
            if copy(lin,1,2)='10' then begin
              if TanqueActual=1 then
                lineaproc:='101020216201101D110017738033340002300266920009F6E9'
              else
                lineaproc:='102020216281102M110009908011885002550289360009F6C2';
            end
            else if copy(lin,1,2)='15' then begin
              lineaproc:='1511006'+
                         '01020949006888007650102101002699200598'+
                         '12311037009944007441231104101126000735'+
                         '12260937006400007111226095502644900531'+
                         '12191048012599007121219110503255200639'+
                         '12121133015051007171212115603502100638'+
                         '120509540181350071912051014038100006449D124';
            end
            else if copy(lin,1,2)='14' then begin
              lineaproc:='14311405302143114060309303003120912150111092423131007'+
                         '17134531001090742100109073310010907243140527191314052'+
                         '61928140526182709E79F';
            end
            else
              lineaproc:=lin;

            ContadorAlarma2:=0;
            DMCONS.AgregaLog('R '+LineaProc);
            ContRec:=0;
            if (copy(Lineaproc,1,2)='10') then begin
              if (copy(lineaproc,46,1)='9') then begin
                ContRec:=0;
                ContadorAlarma3:=0;
                ProcesaLinea3;
              end
              else inc(ContadorAlarma3);
            end
            else
              ProcesaLinea3;
          end;
        4:begin // Red Jacket
            if copy(lin,1,6)='i20101' then begin
              lineaproc:='i2010105060408450110000074722B9B6471FD3DA4765B44B44B004530000000041ECCD1800000000&&EEB8';
            end
            else if copy(lin,1,6)='i20102' then begin
              lineaproc:='i201020506040845022000007463BE3C8463893F147402E0E444C70210000000041EA16E400000000&&EEE1';
            end
            else if copy(lin,1,6)='i20103' then begin
              lineaproc:='i201030506040846033000007461D5F8B461A79AE46ECB63B4459371C0000000041F0FF3C00000000&&EE80';
            end
            else if copy(lin,1,6)='i20201' then begin
              lineaproc:='i20201080510130401110'+
                         '080722231708072223430A453079C3452D667B000000004204421F46B265D046AFD3390000000041FBB14C43611FB744746619'+
                         '080422063808042207210A46C8387946C5F9270000000041C36E3A4733949C4731D9C40000000041B9611E44CDD642452DED0E'+
                         '080411113008041111550A46B5BD3946B3D8BE0000000041BEB8704729CAF1472817AB0000000041BBE91244BED6A44523645B'+
                         '080329132808032913580A46C211E946C069FE0000000041B2694C4730630D472EBEEB0000000041B7389C44C8DD61452A564F'+
                         '080324124108032413050A46525CFB465096C80000000041B079AC47032C8547023E110000000041A901BF447E115A45005D2B'+
                         '080310080608031008290A467C96F1467A75E70000000041B1E8CF470E4AD7470E24FE000000004182A168449121CE4509CF53'+
                         '080228080108022808230A4680DE10467F6DA90000000041B5A16A470F5002470EBC64000000004195D8D544934FDE450AB19E'+
                         '080216121708021612450A467E4E00467C1DD20000000041B36F21470EE9D0470DF7920000000041A5ECE44491DC30450A577E'+
                         '080131151508013115390A46B9BB2C46B84FD00000000041AC7FC4472C7075472B85C900000000419DEA9044C213B345261D72'+
                         '080124080608012408330A467DC5BE467B77480000000041B66890470E3BB3470DC65E00000000419068F54491A2D04509C0C6&&2341';
            end
            else
              lineaproc:=lin;
            if CheckSumVeederRoot(LineaProc) then begin
              ContadorAlarma2:=0;
              DMCONS.AgregaLog('R '+LineaProc);
              ContRec:=0;
              ProcesaLinea4;
            end
            else begin
              inc(conterrorescom);
              StaticText4.Caption:='Errores de Comunicación: '+inttostr(conterrorescom);
            end;
          end;
        5:begin // PetroVend
            if copy(lin,1,1)='1' then begin
              if NumPasoPv=0 then begin
                lineapetrovend[1]:='G0G4             MENU PRINCIPAL              ';
                lineapetrovend[2]:='1.Entre clave:';
                lineapetrovend[3]:='2.Informe inventario de tanque';
                lineapetrovend[4]:='3.Informes';
                lineapetrovend[5]:='4.Coma';
                lineapetrovend[6]:='ndos de sistema5.Comandos de programaci¢n e informes';
                lineapetrovend[7]:='6.Instalaci¢n del sistema';
                lineapetrovend[8]:='7.Datos de los m¢dulos';
                lineapetrovend[9]:='8.Inf. r pido venta (por impresora)';
                lineapetrovend[10]:='9.Inf. r pido despacho (por impresora)';
                lineapetrovend[11]:='INSTRUCCIONES:--';
                lineapetrovend[12]:='------------En cada men£, puede entrar lo siguiente:';
                lineapetrovend[13]:='Opci¢n #        Selecciona la opci¢n';
                lineapetrovend[14]:='[C] o [CANCELAR]Volver al men£ anterior';
                lineapetrovend[15]:='[H] o [AYUDA]   Visualiz. texto de ayuda';
                lineapetrovend[16]:='[P] or [0]      Imprime la pantalla=8 G0TG0G4No.';
                lineapetrovend[17]:='C/CANCELAR, ./AYUDA, 0/imPrimir:G0G0G4  4/=8G0T*=';
                ApPv:=17;
              end
              else if NumPasoPv=4 then begin
                ApPv:=1;
                case ContPv of
                  1:lineapetrovend[1]:='INV/04012011/152553/80';
                  2:begin
                      // lineapetrovend[1]:='M01/T/  1/ 1/ 1/  2/FFFFFFFF/04012011/152551/30       ';
                      lineapetrovend[1]:='M01/T/  ';
                      lineapetrovend[2]:='1/ 1/ 1/';
                      lineapetrovend[3]:='  2/FFFF';
                      lineapetrovend[4]:='FFFF/041';
                      lineapetrovend[5]:='42011/16';
                      lineapetrovend[6]:='0147/34';
                      lineapetrovend[7]:='';
                      ApPv:=7;
                    end;
                  3:begin
                      // lineapetrovend[1]:='M02/ 13089,313/ 13226,418/ 47703,582/    88,503/    23,956/    -0,010/58 ';
                      lineapetrovend[1]:='M02/ 146';
                      lineapetrovend[2]:='41,782/ ';
                      lineapetrovend[3]:='14826,17';
                      lineapetrovend[4]:='8/ 46103';
                      lineapetrovend[5]:=',822/   ';
                      lineapetrovend[6]:=' 96,043/';
                      lineapetrovend[7]:='    25,6';
                      lineapetrovend[8]:='29/    -';
                      lineapetrovend[9]:='0,017/67';
                      lineapetrovend[10]:='';
                      ApPv:=10;
                    end;
                  4:begin
                      //lineapetrovend[1]:='M05/ 13089,313/     0,000/03                                             ';
                      lineapetrovend[1]:='M05/ 146';
                      lineapetrovend[2]:='41,782/ ';
                      lineapetrovend[3]:='    0,00';
                      lineapetrovend[4]:='0/08';
                      lineapetrovend[5]:='';
                      ApPv:=5;
                    end;
                  5:lineapetrovend[1]:='M01/T/  2/ 1/ 5/  2/FFFFFFFF/04012011/152625/37                          ';
                  6:begin
                      Inc(contEmular);
                      case contemular of
                        1:ss:='41201';
                        2:ss:='41101';
                        3:ss:='41000';
                        4:ss:='41200';
                        5:ss:='41300';
                        6:ss:='42600';
                        7:ss:='44800';
                        8:ss:='48300';
                        9:ss:='51000';
                        else ss:='50000';
                      end;
                      lineapetrovend[1]:='M02/ 40912,906/ '+ss+',139/ 19825,861/   210,168/    21,231/    -0,023/57 ';
                    end;
                  7:lineapetrovend[1]:='M05/ 40912,906/     0,000/06                                             ';
                  8:lineapetrovend[1]:='M01/T/  3/ 1/ 9/  2/FFFFFFFF/04012011/152628/45                          ';
                  9:lineapetrovend[1]:='M02/ 18994,954/ 19176,556/ 60911,444/   103,606/    23,232/    -0,016/86 ';
                  10:lineapetrovend[1]:='M05/ 18994,954/     0,000/24                end;                        ';
                end;
                inc(contpv);
              end;
            end
            else if copy(lin,1,1)='4' then begin
              if NumPasoPv=1 then begin
                lineapetrovend[1]:='G0G4      MENU DE COMANDOS DEL SISTEMA';
                lineapetrovend[2]:='1.Estado del sistema: ABIERTO          ';
                lineapetrovend[3]:='2.Borrar memoria intermedia            ';
                lineapetrovend[4]:=' 3.Prueba fuga cronometrada            ';
                lineapetrovend[5]:='4.Almac. invent. tanque   (de    a    ) ';
                lineapetrovend[6]:='5.Puerta passthrough (­s¢lo termin.!) ';
                lineapetrovend[7]:=' 6.Abort. impresi¢n informe programada.  ';
                lineapetrovend[8]:='7.Conmut.luz roja:   APAGADO            ';
                lineapetrovend[9]:=' 8.Conmut.se¤al son.: APAGADO           ';
                lineapetrovend[10]:='9.Informes de ordenadores (­s¢lo term!) ';
                lineapetrovend[11]:='10.Copia del sistema (­s¢lo terminales!)';
                lineapetrovend[12]:='11.Restaurar sistema (­s¢lo terminales!)';
                lineapetrovend[13]:='12.Cambia estado de relevador=8 G0TG0G4No., ';
                lineapetrovend[14]:='C/CANCELAR, ./AYUDA, 0/imPrimir:G0G0G4  4=8 G0T=8 G0TG0G4ACCESO ';
                lineapetrovend[15]:='inel      ABR 6, 2011   10:29 AM';
                ApPv:=15;
              end
              else if NumPasoPv=3 then begin
                lineapetrovend[1]:='INV/04012011/152553/80';
                ApPv:=1;
                ContPv:=2;
              end;
            end
            else if copy(lin,1,1)='9' then begin
              lineapetrovend[1]:='G0G4      MENU INFORMES DE COMPUTADORA ';
              lineapetrovend[2]:='1.ACTUAL                               ';
              lineapetrovend[3]:='2.                                     ';
              lineapetrovend[4]:='3.                                     ';
              lineapetrovend[5]:='4.Inventario de tanque                 ';
              lineapetrovend[6]:='5.Niveles de sensor                    ';
              lineapetrovend[7]:='6.Avisos en curso EVENTOS ALMACENADOS  ';
              lineapetrovend[8]:='7.Fallo sensor,sonda,entrada y hardware';
              lineapetrovend[9]:=' 8.Sensor, sonda y entrada             ';
              lineapetrovend[10]:='9.Fallo de hardware                    ';
              lineapetrovend[11]:='10.Evento particular                   ';
              lineapetrovend[12]:='11.Inventarios del los tanques=8 G0TG0G4No., ';
              lineapetrovend[13]:='C/CANCELAR, ./AYUDA, 0/imPrimir:G0G0G4  4=8 G0T=3 G0T=4 G0T=5 G0T=6 G0T=7 G0T=8 G0T=4 G0G4 ';
              lineapetrovend[14]:='  Prepara para A recibir:         =5 G0G4 ';
              lineapetrovend[15]:='              INVENTARIO DEL TANQUE Informe      =6 G0G4      Usando R';
              lineapetrovend[16]:='EPORT.TXT using: PV';
              ApPv:=16;
            end
            else begin
              lineapetrovend[1]:=lin;
              appv:=1;
            end;
            ContadorAlarma2:=0;
            for i:=1 to appv do
              DMCONS.AgregaLog('R '+lineapetrovend[i]);
            ContRec:=0;
            ProcesaLineaPetroVend;
          end;
        6:begin // INCON
            delete(lin,1,1);
            if copy(lin,1,3)='181' then begin
              lineaproc:='1810+89.8745+2.04902+16847.8+63.6788+54411.4+16484.6+31.9451+.000000+.000000B20E';
            end
            (*
            else if copy(lin,1,3)='182' then begin
              lineaproc:='1820+89.8745+2.04902+16847.8+63.6788+54411.4+16484.6+31.9451+.000000+.000000B20E';
            end
            else if copy(lin,1,3)='183' then begin
              lineaproc:='1830+89.8745+2.04902+16847.8+63.6788+54411.4+16484.6+31.9451+.000000+.000000B20E';
            end
            *)
            else if copy(lin,1,3)='1a1' then begin
              lineaproc:='1a10214503201208023+8854.65+8675.27+57.2944+2.04635+63.5484+30.9311571104201208023+35944.2+35205.2+157.297+2.05899+64.1445+31.1648+26530.0+27089.5F2E9';
            end
            else
              lineaproc:=lin;
            lineaproc:=lineaproc;
            ProcesaLinea6;
          end;
      end;
    end;
  finally
    //Timer1.Enabled:=true;
    //SwTimer1:=false;
    SwTimer1:=true;
  end;
end;

procedure TFTANMENU.VerTrfico1Click(Sender: TObject);
begin
  SpeedButton1.Visible:=true;
end;

procedure TFTANMENU.OcultarTrfico1Click(Sender: TObject);
begin
  SpeedButton1.Visible:=false;
end;

(*
procedure TFTANMENU.lee_registro;
var
  Registry: TRegistry;
  estado:integer;
begin
  try
    Registry := TRegistry.Create(KEY_READ);
    try
      Registry.RootKey := HKEY_LOCAL_MACHINE;
      if Registry.OpenKey('\SOFTWARE\IMAGEN\VOL\TANQ', True) then
         Estado:=Registry.ReadInteger('Estado');
      if Estado=1 then begin
        //Self.Visible:=true;
        Self.WindowState:=wsMaximized;
        Self.BringToFront;
        registro(0,'Estado');
      end;
    finally
      Registry.CloseKey;
      Registry.Free;
      registro(0,'Estado');
    end;
  except
    //DMCONS.AgregaLog('Exception 022');
    //DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraExtToStr(Now))+'.Txt');
  end;
end;


procedure TFTANMENU.registro(valor:integer;variable:string);
var
  Registry: TRegistry;
begin
  try
    Registry := TRegistry.Create(KEY_WRITE);
    try
      Registry.RootKey := HKEY_LOCAL_MACHINE;
      if Registry.OpenKey('\SOFTWARE\IMAGEN\VOL\TANQ', True) then
         Registry.WriteInteger(variable,Valor)
    finally
      Registry.CloseKey;
      Registry.Free;
    end;
  except
    //DMCONS.AgregaLog('Exception 023');
    //DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraExtToStr(Now))+'.Txt');
  end;
end;
*)

procedure TFTANMENU.dxNavBar1Item1Click(Sender: TObject);
begin
   PageControl2.ActivePageIndex:=0;
end;

procedure TFTANMENU.dxNavBar1Item2Click(Sender: TObject);
begin
    PageControl2.ActivePageIndex:=1;
end;

procedure TFTANMENU.dxNavBar1Item3Click(Sender: TObject);
begin
  PageControl2.ActivePageIndex:=2;
end;

procedure TFTANMENU.dxNavBar1Item4Click(Sender: TObject);
begin
    PageControl2.ActivePageIndex:=3;
end;


(*
procedure TFTANMENU.nombre_db;
var sMaybeAlias : string;
    DBPath      : string;
    ParamList   : TStringList;
begin
  sMaybeAlias := ParamStr(1);
  if Session.isAlias(sMaybeAlias) then
  begin
    ParamList := TStringList.Create;
    try
      Session.GetAliasParams(sMaybeAlias, ParamList);
      DBPath := ParamList.Values['SERVER NAME'];
    finally
      ParamList.Free;
    end;
    ruta_db:=DBPath;
  end
  else ShowMessage(sMaybeAlias+' is not an alias!');
end;
  *)

procedure TFTANMENU.RxTrayIcon1DblClick(Sender: TObject);
begin
  FTanMenu.Visible:=true;
end;

procedure TFTANMENU.ReiniciaTanques;
begin
  try
    if (DMCONS.StLevanta='Si') then begin
      try
        DMCONS.DBGasCon.Connected:=false;
        esperamiliseg(1000);
        Button1.Click;
        Application.Terminate;
      finally
        FechaTimer1:=now;
      end;
    end
    else begin
      ContRec:=0;
      FechaTimer1:=now;
      Self.Visible:=true;
      Self.WindowState:=wsMaximized;
      Self.BringToFront;
      StaticText3.Caption:='Error en Monitor de Tanques';
      StaticText3.Visible:=true;
      Beep;
    end;
  except
  end;
end;


procedure TFTANMENU.VrTimer1Timer(Sender: TObject);
var xFecha:TDateTime;
    ss,rsp,xfec:string;
    CualCorte:String;
    swcierraturno:boolean;
    CorteAnt:integer;
    FechaCorteAnt:TDateTime;
begin
  // CICLO DE CORTES Y COMANDOS
  try
    with DMCONS do begin
      xFecha:=Now;
      StaticText7.Caption:=fechahoratostr(xFecha)+' / '+fechahoratostr(FechaTimer1)+' - '+inttostr(ContRec);
      if (abs(xFecha-FechaTimer1)>5*tmMinuto)or(ContRec>80) then begin
        CalculaFechasCorte;
        if not Timer1.Enabled then begin
          Timer1.Enabled:=true;
          SwTimer1:=true;
        end
        else begin
          ReiniciaTanques;
        end;
      end;
      if abs(xFecha-UltimaFechaHora)>tmMinuto then begin
        SiguienteFechaHoraTurno:=now;
        SiguienteFechaHoraCmnd:=now;
        CalculaFechasCorte;
      end;
      UltimaFechaHora:=Now;
      // Corte cada 4 horas (PEMEX)
      if (xFecha>=FechaSiguienteCorte) then begin //or(xFecha>=FechaSiguienteCorte2)or(xFecha-FechaUltimoCorte>(1/CortesPorDia)) then begin // checa si hay que hacer un corte
        if (now-FechaHoraLog)>20*tmSegundo then begin
          FechaCorteAnt:=X_CvolFecha;
          CorteAnt:=X_CvolCorte;
          DMCONS.DBGASCON.Connected:=true;
          try
            SP_Corte.ParamByName('P_Fecha').AsDateTime:=Date;
            SP_Corte.ExecProc;
            CalculaFechasCorte; // dentro abre q_cvol
            X_CvolFecha:=Q_CvolFecha.AsDateTime;
            X_CvolCorte:=Q_CvolCorte.AsInteger;
            BorraComandos;
            if (FechaCorteAnt=Q_CvolFecha.AsDateTime)and(CorteAnt=Q_CvolCorte.AsInteger) then begin
              if (DMCONS.StLevanta='Si')and(CorteInicial<6) then begin
                try
                finally
                  FechaTimer1:=now;
                end;
              end;
            end;
          finally
            DMCONS.DBGASCON.Connected:=false;
          end;
          StaticText2.Caption:='Próximo Corte: '+FechaHoraToStr(FechaSiguienteCorte);
          SwCorte:=true;
        end;
      end;
      // Corte de Turno  (ADMINISTRATIVO)
      xfecha:=now;
      if xFecha>=SiguienteFechaHoraTurno then with DMCONS do begin
        SiguienteFechaHoraTurno:=now+tmMinuto;
        swcierraturno:=false;
        DMCONS.DBGASCON.Connected:=true;
        try
          CalculaTurnoActual(Now); // Turno Administrativo
          if Q_Turn.IsEmpty then begin
            swcierraturno:=true;
          end
          else begin
            if (FechaToStr(FechaTurnoActual)+inttostr(TurnoActual)>FechaToStr(Q_TurnFecha.AsDateTime)+inttostr(Q_TurnTurno.AsInteger)) then
              swcierraturno:=true
            else if TurnoActual=0 then
              swcierraturno:=true;
          end;
          if SwCierraTurno then begin
            if not Q_Turn.IsEmpty then begin
              Q_Auxi.Active:=false;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('EXECUTE PROCEDURE TURN_REALIZA_CORTE');
              Q_Auxi.ExecSQL;
            end;
            if TurnoActual>0 then begin
              T_Turn.Active:=true;
              try
                T_Turn.Insert;
                T_TurnFecha.AsDateTime:=FechaTurnoActual;
                T_TurnTurno.AsInteger:=TurnoActual;
                T_Turn.Post;
              finally
                T_Turn.Active:=false;
              end;
            end;
          end;
        finally
          DMCONS.DBGASCON.Connected:=false;
        end;
      end;

      // CHECA COMANDOS
      xfecha:=now;
      if xFecha>=SiguienteFechaHoraCmnd then with DMCONS do begin
        SiguienteFechaHoraCmnd:=now+3*tmSegundo;
        DMCONS.DBGASCON.Connected:=true;
        try
          Q_Cmnd.Active:=false;
          Q_Cmnd.ParamByName('pmodulo').AsString:='TANQ';
          Q_Cmnd.Active:=true;
          while not Q_Cmnd.Eof do begin
            rsp:='OK';
            try
              ss:=ExtraeElemStrSep(Q_CmndComando.AsString,1,' ');
              if ss='DRE' then begin
                rsp:='OK';
                CheckBox3.Checked:=true;
              end
              else if ss='ARE' then begin
                rsp:='OK';
                CheckBox3.Checked:=false;
              end
              else if ss='CERRAR' then begin
                rsp:='OK';
                SwCerrar:=true;
                T_Cmnd.Active:=true;
                if T_Cmnd.Locate('Folio',Q_CmndFolio.AsInteger,[]) then begin
                  T_Cmnd.Edit;
                  T_CmndAplicado.AsString:='Si';
                  T_CmndResultado.AsString:=rsp;
                  T_Cmnd.Post;
                end;
              end
              else if ss='CORTETURNO' then begin
                if true (*(xfecha-HoraUltimoCorte)>=MinimoHorasCorte*TmHora*) then begin
                  CalculaTurnoActual(Now); // FechaTurnoActual y TurnoActual
                  if not Q_Turn.IsEmpty then begin
                    if (xFecha>=IniTurnoActual)and((xFecha-IniTurnoActual)<FinTurnoActualMargenPos) then begin
                      CualCorte:='Anterior';
                    end
                    else if (xFecha<IniTurnoActual)and((IniTurnoActual-xFecha)<FinTurnoActualMargenAnt) then begin
                      CualCorte:='Anterior';
                    end
                    else if (xFecha<=FinTurnoActual)and((FinTurnoActual-xFecha)<FinTurnoActualMargenAnt) then begin
                      CualCorte:='Actual';
                      // Si se adelantó la apertura del siguiente turno:
                      if (FechaToStr(FechaTurnoActual)+inttostr(TurnoActual)<FechaToStr(Q_TurnFecha.AsDateTime)+inttostr(Q_TurnTurno.AsInteger)) then begin
                        CualCorte:='Anterior';
                        //DespliegaMemo1('    4) '+CualCorte);
                        FechaTurnoActual:=Q_TurnFecha.AsDateTime;
                        TurnoActual:=Q_TurnTurno.AsInteger;
                      end;
                    end
                    else if (xFecha>FinTurnoActual)and((xFecha-FinTurnoActual)<FinTurnoActualMargenPos) then begin
                      CualCorte:='Actual';
                      //DespliegaMemo1('    5) '+CualCorte);
                      // Si se adelantó la apertura del siguiente turno:
                      if (FechaToStr(FechaTurnoActual)+inttostr(TurnoActual)<FechaToStr(Q_TurnFecha.AsDateTime)+inttostr(Q_TurnTurno.AsInteger)) then begin
                        CualCorte:='Anterior';
                        FechaTurnoActual:=Q_TurnFecha.AsDateTime;
                        TurnoActual:=Q_TurnTurno.AsInteger;
                      end;
                    end
                    else begin
                      CualCorte:='Ninguno';
                      //DespliegaMemo1('    6) '+CualCorte);
                    end;
                  end
                  else begin
                    CualCorte:='Anterior';
                    //DespliegaMemo1('    7) '+CualCorte);
                  end;

                  if (CualCorte='Anterior')and(not Q_Turn.IsEmpty) then begin
                     if abs(now-Q_TurnFECHAHORAINICIAL.AsFloat)>tmHora then begin
                       CualCorte:='Actual';
                       //DespliegaMemo1('    8) '+CualCorte);
                       FechaTurnoActual:=Q_TurnFecha.AsDateTime;
                       TurnoActual:=Q_TurnTurno.AsInteger;
                       FinTurnoActual:=now;
                     end;
                  end;
                  if CualCorte='Anterior' then begin
                    // REABRE ANERIOR Y LO CIERRA
                    Q_Auxi.Active:=false;
                    Q_Auxi.SQL.Clear;
                    Q_Auxi.SQL.Add('EXECUTE PROCEDURE TURN_REABRE_ANTERIOR');
                    Q_Auxi.ExecSQL;

                    Q_Auxi.Active:=false;
                    Q_Auxi.SQL.Clear;
                    Q_Auxi.SQL.Add('EXECUTE PROCEDURE TURN_REALIZA_CORTE');
                    Q_Auxi.ExecSQL;
                    HoraUltimoCorte:=now;
                    if TurnoActual>0 then begin
                      T_Turn.Active:=false;
                      T_Turn.Active:=true;
                      try
                        T_Turn.Insert;
                        T_TurnFecha.AsDateTime:=FechaTurnoActual;
                        T_TurnTurno.AsInteger:=TurnoActual;
                        T_Turn.Post;
                      finally
                        T_Turn.Active:=false;
                      end;
                    end;
                  end
                  else if CualCorte='Actual' then begin
                    //CortaTurnoActual;
                    Q_Auxi.Active:=false;
                    Q_Auxi.SQL.Clear;
                    Q_Auxi.SQL.Add('EXECUTE PROCEDURE TURN_REALIZA_CORTE');
                    Q_Auxi.ExecSQL;
                    HoraUltimoCorte:=now;
                    if xFecha<FinTurnoActual then begin
                      CalculaTurnoActual(FinTurnoActual+tmMinuto);
                      if TurnoActual>0 then begin
                        T_Turn.Active:=true;
                        try
                          T_Turn.Insert;
                          T_TurnFecha.AsDateTime:=FechaTurnoActual;
                          T_TurnTurno.AsInteger:=TurnoActual;
                          T_Turn.Post;
                        finally
                          T_Turn.Active:=false;
                        end;
                      end;
                    end;
                  end
                  else begin
                    rsp:='ERROR: Corte fuera de horario';
                  end;
                end
                else rsp:='No se puede realizar otro corte antes de '+inttostr(MinimoHorasCorte)+' horas';
              end;
            except
              rsp:='ERROR: Problema Interno';
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
        finally
          DMCONS.DBGASCON.Connected:=false;
        end;
      end;
    end;
  except
  end;
end;

procedure TFTANMENU.Button1Click(Sender: TObject);
begin
  DMCONS.ListaLog.SaveToFile('\ImagenCo\Log'+FiltraStrNum(FechaHoraToStr(Now))+'.Txt');
end;

procedure TFTANMENU.AbTank1DblClick(Sender: TObject);
begin
  swaux:=not swaux;
end;

procedure TFTANMENU.Timer2Timer(Sender: TObject);
begin
  // SOLO PARA PETROVEND
  try
    try
      Timer2.Enabled:=false;
      ProcesaLineaPetroVend;
    finally
      SwTimer1:=true;
    end;
  except
  end;
end;

procedure TFTANMENU.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then begin
    HoraParoEntradas:=Now;
    CheckBox3.Color:=clYellow;
    CheckBox3.Caption:='Registro de Entrada DETENIDO';
  end
  else begin
    CheckBox3.Color:=clSkyBlue;
    CheckBox3.Caption:='Registro de Entrada ACTIVO';
  end;
  try
    with DMCONS do begin
      T_ConfIb.Active:=true;
      try
        if not T_ConfIb.IsEmpty then begin
          T_ConfIb.Edit;
          if CheckBox3.Checked then
            T_ConfIbPosVehiculo.AsInteger:=1
          else
            T_ConfIbPosVehiculo.AsInteger:=0;
          T_ConfIb.Post;
        end;
      finally
        T_ConfIb.Active:=false;
      end;
    end;
  except
  end;
end;

procedure TFTANMENU.ComandoConsolaSocket(ss: string);
var s1:string;
begin
  try
    StaticText1.Caption:='Paso: '+inttostr(NumPaso)+'   Tanque: '+inttostr(TanqueActual)+'    '+inttostr(contrec);
    if DMCONS.SwEmular then begin
      LineaEmular:=ss;
      DMCONS.AgregaLog('E '+ss);
      inc(ContRec);
      exit;
    end;
    inc(ContadorAlarma);
    SwTimer1:=false;
    try
      s1:=idSOH+ss;
      DMCONS.AgregaLog('E '+s1);
      inc(ContRec);
      Socket1.Socket.SendText(s1);
    finally
      SwTimer1:=true;
      if NumPaso=2 then
        Timer1.Interval:=3000
      else
        Timer1.Interval:=1000;
    end;
  except
    DMCONS.AgregaLog('ERROR SOCKET');
    Button1Click(nil);
    Application.Terminate;
  end;
end;

procedure TFTANMENU.Socket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
  LineaProc:=Socket.ReceiveText;
  ContadorAlarma:=0;
  DMCONS.AgregaLog('R '+LineaProc);
  ContRec:=0;
  LineaProc:=StringReplace(LineaProc,#1,'',[rfReplaceAll, rfIgnoreCase]);
  LineaProc:=StringReplace(LineaProc,#2,'',[rfReplaceAll, rfIgnoreCase]);
  LineaProc:=StringReplace(LineaProc,#3,'',[rfReplaceAll, rfIgnoreCase]);
  ProcesaLineaVeederRoot;
end;

function TFTANMENU.ServicioCorriendo(sService: PChar): Boolean;
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

end.


(* Control de Versiones

29/ago/2013   Se cambió el calculo del CRC INCON de DLL a un EXE. (Se tenía problemas con la DLL)


*)
