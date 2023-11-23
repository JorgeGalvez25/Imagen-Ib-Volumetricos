program PDISMENU;

uses
  uROCOMInit,
  ExceptionLog,
  Forms,
  Windows,
  UDISMENU in 'UDISMENU.pas' {FDISMENU},
  DDMCONS in 'DDMCONS.pas' {DMCONS: TDataModule},
  UDisWayne in 'UDisWayne.pas' {FDISWAYNE},
  UDISBENNETT2 in 'UDISBENNETT2.pas' {FDISBENNETT2},
  UDISTEAM in 'UDISTEAM.pas' {FDISTEAM},
  UDISHONGJANG in 'UDISHONGJANG.pas' {FDISHONGJANG},
  ULIBGRAL in 'ULIBGRAL.pas',
  DmSrv_Intf in 'DmSrv_Intf.pas',
  DmSrv_Invk in 'DmSrv_Invk.pas',
  SrvDispensarios_Impl in 'SrvDispensarios_Impl.pas' {SrvDispensarios: TRORemoteDataModule},
  UDISPAM10002 in 'UDISPAM10002.pas' {FDISPAM10002},
  Hashes in 'Hashes.pas',
  UDISGILBARCOKiros in 'UDISGILBARCOKiros.pas' {FDISGILBARCOKiros},
  UDISGILBARCO in 'UDISGILBARCO.pas' {FDISGILBARCO},
  ULIBLICENCIAS in 'ULIBLICENCIAS.pas';

{#ROGEN:PDISMENU.rodl} // RemObjects: Careful, do not remove!
{$R RODLFile.res}


var
  Mutex : THandle;


{$R *.RES}

begin
  if not StrMayuscIguales(Paramstr(2),'Cliente') then begin
    Mutex := CreateMutex(nil, True, 'Consola de Dispensarios');
    if (Mutex = 0) or (GetLastError <> 0) then
      exit;
  end;
  Application.Initialize;
  Application.Title := 'Consola de Dispensarios';
  Application.CreateForm(TFDISMENU, FDISMENU);
  Application.CreateForm(TDMCONS, DMCONS);
  Application.CreateForm(TFDISPAM10002, FDISPAM10002);
  Application.CreateForm(TFDISGILBARCOKiros, FDISGILBARCOKiros);
  Application.CreateForm(TFDISGILBARCO, FDISGILBARCO);
  Application.Run;
end.


