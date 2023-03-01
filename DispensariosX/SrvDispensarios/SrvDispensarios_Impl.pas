unit SrvDispensarios_Impl;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ This is where you are supposed to code the implementation of your objects. }
{----------------------------------------------------------------------------}

{$I Remobjects.inc}

interface

uses
  {vcl:} Classes, SysUtils, 
  {RemObjects:} uROXMLIntf, uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Required:} uRORemoteDataModule,
  {Generated:} Cvol_Intf;

type
  { TSrvDispensarios }
  TSrvDispensarios = class(TRORemoteDataModule, ISrvDispensarios)
  private
  protected
    { ISrvDispensarios methods }
    function DameDispensarios: String;
  end;

implementation

{$R *.dfm}
uses
  {Generated:} DDMCONS;

procedure Create_SrvDispensarios(out anInstance : IUnknown);
begin
  anInstance := TSrvDispensarios.Create(nil);
end;

{ SrvDispensarios }
function TSrvDispensarios.DameDispensarios: String;
begin
  result:=DMCONS.SrvDispensarios;
end;

initialization
  TROClassFactory.Create('SrvDispensarios', Create_SrvDispensarios, TSrvDispensarios_Invoker);

finalization

end.
