unit Cvol_Intf;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ Do not modify this unit manually, or your changes will be lost when this   }
{ unit is regenerated the next time you compile the project.                 }
{----------------------------------------------------------------------------}

{$I Remobjects.inc}

interface

uses
  {vcl:} Classes, TypInfo,
  {RemObjects:} uROXMLIntf, uROClasses, uROClient, uROTypes, uROClientIntf;

const
  { Library ID }
  LibraryUID = '{99F0C0B1-2B70-4083-9534-640A0606E47B}';
  TargetNamespace = '';

  { Service Interface ID's }
  ISrvDispensarios_IID : TGUID = '{F04B6AF8-A864-457C-9732-EBA22A8EF131}';

  { Event ID's }

type
  { Forward declarations }
  ISrvDispensarios = interface;

  Dispensarios = class;


  { Dispensarios }
  Dispensarios = class(TROComplexType)
  private
    fCampo: String;
  public
    procedure Assign(iSource: TPersistent); override;
    procedure ReadComplex(ASerializer: TObject); override;
    procedure WriteComplex(ASerializer: TObject); override;
  published
    property Campo:String read fCampo write fCampo;
  end;

  { DispensariosCollection }
  DispensariosCollection = class(TROCollection)
  protected
    constructor Create(aItemClass: TCollectionItemClass); overload;
    function GetItems(aIndex: integer): Dispensarios;
    procedure SetItems(aIndex: integer; const Value: Dispensarios);
  public
    constructor Create; overload;
    function Add: Dispensarios; reintroduce;
    property Items[Index: integer]:Dispensarios read GetItems write SetItems; default;
  end;

  { ISrvDispensarios }
  ISrvDispensarios = interface
    ['{F04B6AF8-A864-457C-9732-EBA22A8EF131}']
    function DameDispensarios: String;
  end;

  { CoSrvDispensarios }
  CoSrvDispensarios = class
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ISrvDispensarios;
  end;

  { TSrvDispensarios_Proxy }
  TSrvDispensarios_Proxy = class(TROProxy, ISrvDispensarios)
  protected
    function __GetInterfaceName:string; override;

    function DameDispensarios: String;
  end;

implementation

uses
  {vcl:} SysUtils,
  {RemObjects:} uROEventRepository, uROSerializer, uRORes;

{ Dispensarios }

procedure Dispensarios.Assign(iSource: TPersistent); 
var lSource: Cvol_Intf.Dispensarios;
begin
  inherited Assign(iSource);
  if (iSource is Cvol_Intf.Dispensarios) then begin
    lSource := Cvol_Intf.Dispensarios(iSource);
    Campo := lSource.Campo;
  end;
end;

procedure Dispensarios.ReadComplex(ASerializer: TObject);
var
  l_Campo: String;
begin
  if TROSerializer(ASerializer).RecordStrictOrder then begin
    l_Campo := Campo;
    TROSerializer(ASerializer).ReadUTF8String('Campo', l_Campo);
    Campo := l_Campo;
  end
  else begin
    l_Campo := Campo;
    TROSerializer(ASerializer).ReadUTF8String('Campo', l_Campo);
    Campo := l_Campo;
  end;
end;

procedure Dispensarios.WriteComplex(ASerializer: TObject);
var
  l_Campo: String;
begin
  if TROSerializer(ASerializer).RecordStrictOrder then begin
    TROSerializer(ASerializer).ChangeClass(Dispensarios);
    l_Campo := Campo;
    TROSerializer(ASerializer).WriteUTF8String('Campo', l_Campo);
  end
  else begin
    l_Campo := Campo;
    TROSerializer(ASerializer).WriteUTF8String('Campo', l_Campo);
  end;
end;

{ DispensariosCollection }
constructor DispensariosCollection.Create;
begin
  inherited Create(Dispensarios);
end;

constructor DispensariosCollection.Create(aItemClass: TCollectionItemClass);
begin
  inherited Create(aItemClass);
end;

function DispensariosCollection.Add: Dispensarios;
begin
  result := Dispensarios(inherited Add);
end;

function DispensariosCollection.GetItems(aIndex: integer): Dispensarios;
begin
  result := Dispensarios(inherited Items[aIndex]);
end;

procedure DispensariosCollection.SetItems(aIndex: integer; const Value: Dispensarios);
begin
  Dispensarios(inherited Items[aIndex]).Assign(Value);
end;

{ CoSrvDispensarios }

class function CoSrvDispensarios.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ISrvDispensarios;
begin
  result := TSrvDispensarios_Proxy.Create(aMessage, aTransportChannel);
end;

{ TSrvDispensarios_Proxy }

function TSrvDispensarios_Proxy.__GetInterfaceName:string;
begin
  result := 'SrvDispensarios';
end;

function TSrvDispensarios_Proxy.DameDispensarios: String;
begin
  try
    __Message.InitializeRequestMessage(__TransportChannel, 'Cvol', __InterfaceName, 'DameDispensarios');
    __Message.Finalize;

    __TransportChannel.Dispatch(__Message);

    __Message.Read('Result', TypeInfo(String), result, []);
  finally
    __Message.UnsetAttributes(__TransportChannel);
    __Message.FreeStream;
  end
end;

initialization
  RegisterROClass(Dispensarios);
  RegisterProxyClass(ISrvDispensarios_IID, TSrvDispensarios_Proxy);


finalization
  UnregisterROClass(Dispensarios);
  UnregisterProxyClass(ISrvDispensarios_IID);

end.