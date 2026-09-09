library DllPSerial;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ExceptionLog,
  SysUtils,
  Classes,
  OoMisc,
  AdPort,
  StrUtils,
  Forms,
  ulibgral,
  UFORMPUER in 'UFORMPUER.pas' {FORMPUER};

{$R *.res}

function EnviaComando(Comando:PAnsiChar;nopuer:Integer;baudios:Integer;paridad:Char;bitsdatos:Integer;bitsparo:Integer):PAnsiChar;stdcall;export;
var
  i,j,n,m:Integer;
  cc:char;
  ss:string;
  comandos:TStringList;
begin
  Application.CreateForm(TFORMPUER, FORMPUER);
  try
    with FORMPUER do begin
      try
        puerto.ComNumber:=nopuer;
        puerto.Baud:=baudios;
        case UpCase(paridad) of
          'N':puerto.Parity:=pNone;
          'E':puerto.Parity:=pEven;
          'O':puerto.Parity:=pOdd;
        end;
        puerto.DataBits:=bitsdatos;
        puerto.StopBits:=bitsparo;
        puerto.Open:=True;
        bennett:=string(comando)='bennett';
        if bennett then begin
          try
            Result:=PAnsiChar('error');
            comandos:=TStringList.Create;
            bitacora:=TStringList.Create;
            respuestas:=TStringList.Create;
            comandos.LoadFromFile(ExtractFilePath(ParamStr(0))+'\comandos.txt');
            if FileExists(ExtractFilePath(ParamStr(0))+'\bitacora.txt') then
              bitacora.LoadFromFile(ExtractFilePath(ParamStr(0))+'\bitacora.txt');
            for i:=0 to comandos.Count-1 do begin
              n:=0;
              ss:=comandos[i]+#3;
              for j:=1 to length(ss) do
                n:=n+ord(ss[j]);
              m:=(n)mod(256);
              cc:=char(256-m);
              ss:=#2+ss+cc;
              bitacora.Add(FormatDateTime('dd/mm/yyyy hh:nn:ss.zzz',now)+' ENVIO   '+ss);
              puerto.Output:=ss;
            end;
            Sleep(200*comandos.Count);
            for i:=1 to 10 do begin
              Application.ProcessMessages;
              if (respuestas.Count=comandos.Count) then begin
                for j:=0 to respuestas.Count-1 do begin
                  if respuestas[j]<>#6 then Exit;
                  if j=comandos.Count-1 then begin
                    Result:=PAnsiChar('ok');
                    Break;
                  end;
                end;
              end;
              if Result=PAnsiChar('ok') then
                Break;
              Sleep(200);
            end;
          finally
            bitacora.SaveToFile(ExtractFilePath(ParamStr(0))+'\bitacora.txt');
            bitacora.Free;
            comandos.Free;
            respuestas.Free;
          end;
        end
        else begin
          puerto.Output:=string(Comando);
          for i:=1 to 8 do begin
            Sleep(200);
            Application.ProcessMessages;
            if (respuesta<>'') then
              Break;
          end;
          Result:=PAnsiChar(IfThen(respuesta<>'',respuesta,'Nulo'));
        end;
        puerto.Open:=False;
      except
        on e:exception do
          Result:=PAnsiChar(e.Message);
      end;
    end;
  finally
    FORMPUER.Free;
  end;
end;



exports EnviaComando;

begin
 
end.
