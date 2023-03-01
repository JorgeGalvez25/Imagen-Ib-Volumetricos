unit CRCLibC_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 27/07/2012 16:32:31 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Imagen ib Varios\Gas Consola\Add.tlb (1)
// LIBID: {E1FD620B-786A-44E9-BEA6-357D85EB1062}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\STDOLE2.TLB)
//   (2) v2.0 mscorlib, (c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TCRC) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CRCLibCMajorVersion = 1;
  CRCLibCMinorVersion = 0;

  LIBID_CRCLibC: TGUID = '{E1FD620B-786A-44E9-BEA6-357D85EB1062}';

  IID_IAddInterface: TGUID = '{F327CB2A-7B3F-3DC0-A55E-D19E38C68E5F}';
  CLASS_CRC: TGUID = '{015F54B3-5096-3234-B00A-8974A4025BFB}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAddInterface = interface;
  IAddInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CRC = IAddInterface;


// *********************************************************************//
// Interface: IAddInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F327CB2A-7B3F-3DC0-A55E-D19E38C68E5F}
// *********************************************************************//
  IAddInterface = interface(IDispatch)
    ['{F327CB2A-7B3F-3DC0-A55E-D19E38C68E5F}']
    function CalcularCRC(const buf: WideString; buf_size: Integer; CRC: LongWord): LongWord; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAddInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F327CB2A-7B3F-3DC0-A55E-D19E38C68E5F}
// *********************************************************************//
  IAddInterfaceDisp = dispinterface
    ['{F327CB2A-7B3F-3DC0-A55E-D19E38C68E5F}']
    function CalcularCRC(const buf: WideString; buf_size: Integer; CRC: LongWord): LongWord; dispid 1610743808;
  end;

// *********************************************************************//
// The Class CoCRC provides a Create and CreateRemote method to          
// create instances of the default interface IAddInterface exposed by              
// the CoClass CRC. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCRC = class
    class function Create: IAddInterface;
    class function CreateRemote(const MachineName: string): IAddInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCRC
// Help String      : 
// Default Interface: IAddInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCRCProperties= class;
{$ENDIF}
  TCRC = class(TOleServer)
  private
    FIntf:        IAddInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCRCProperties;
    function      GetServerProperties: TCRCProperties;
{$ENDIF}
    function      GetDefaultInterface: IAddInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAddInterface);
    procedure Disconnect; override;
    function CalcularCRC(const buf: WideString; buf_size: Integer; CRC: LongWord): LongWord;
    property DefaultInterface: IAddInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCRCProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCRC
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCRCProperties = class(TPersistent)
  private
    FServer:    TCRC;
    function    GetDefaultInterface: IAddInterface;
    constructor Create(AServer: TCRC);
  protected
  public
    property DefaultInterface: IAddInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoCRC.Create: IAddInterface;
begin
  Result := CreateComObject(CLASS_CRC) as IAddInterface;
end;

class function CoCRC.CreateRemote(const MachineName: string): IAddInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CRC) as IAddInterface;
end;

procedure TCRC.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{015F54B3-5096-3234-B00A-8974A4025BFB}';
    IntfIID:   '{F327CB2A-7B3F-3DC0-A55E-D19E38C68E5F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCRC.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAddInterface;
  end;
end;

procedure TCRC.ConnectTo(svrIntf: IAddInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCRC.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCRC.GetDefaultInterface: IAddInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCRC.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCRCProperties.Create(Self);
{$ENDIF}
end;

destructor TCRC.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCRC.GetServerProperties: TCRCProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TCRC.CalcularCRC(const buf: WideString; buf_size: Integer; CRC: LongWord): LongWord;
begin
  Result := DefaultInterface.CalcularCRC(buf, buf_size, CRC);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCRCProperties.Create(AServer: TCRC);
begin
  inherited Create;
  FServer := AServer;
end;

function TCRCProperties.GetDefaultInterface: IAddInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TCRC]);
end;

end.
