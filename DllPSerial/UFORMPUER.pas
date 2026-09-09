unit UFORMPUER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OoMisc, AdPort, Ulibgral;

type
  TFORMPUER = class(TForm)
    puerto: TApdComPort;
    procedure puertoTriggerAvail(CP: TObject; Count: Word);
  private
    { Private declarations }
    UltimaLinea,
    Linea:string;
    SwEsperaACK,
    SwBcc,
    FinLinea:boolean;
    ContEspera,
    ContEsperaACK,
    NumPaso:integer;
    baudios:integer;
    bitsdatos,bitsparada:integer;
    xcom,paridad:string;
  public
    { Public declarations }
    respuesta:String;
    bennett:boolean;
    respuestas,bitacora:TStringList;
  end;

var
  FORMPUER: TFORMPUER;

implementation

{$R *.dfm}

procedure TFORMPUER.puertoTriggerAvail(CP: TObject; Count: Word);
var
  I : Word;
  C : Char;
begin;
  for I := 1 to Count do begin
    C:=puerto.GetChar;
    Linea:=Linea+C;
    if (c=#3) or (c=#6) then begin
      if bennett then begin
        respuestas.Add(Linea);
        bitacora.Add(FormatDateTime('dd/mm/yyyy hh:nn:ss.zzz',now)+' RESP    '+Linea);
        Linea:='';
      end
      else begin
        respuesta:=Linea;
        Linea:='';
      end;
    end
    else if i=Count then
      respuesta:=Linea;
  end;      
end;

end.
