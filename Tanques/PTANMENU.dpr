program PTANMENU;

uses
  Forms,
  Windows,
  UTANMENU in 'UTANMENU.pas' {FTANMENU},
  DDMCONS in '..\Dispensarios\DDMCONS.pas' {DMCONS: TDataModule},
  CRCLibC_TLB in 'CRCLibC_TLB.pas',
  ULIBGRAL in '..\Dispensarios\ULIBGRAL.pas';

var
  Mutex : THandle;


{$R *.RES}

begin
  Mutex := CreateMutex(nil, True, 'Monitor de Tanques');
  if (Mutex = 0) or (GetLastError <> 0) then
    exit;
  Application.Initialize;
  Application.CreateForm(TFTANMENU, FTANMENU);
  Application.CreateForm(TDMCONS, DMCONS);
  Application.Run;
end.
