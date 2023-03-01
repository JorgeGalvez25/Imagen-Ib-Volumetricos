unit UDISMENU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TFDISMENU = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IniciaBaseDeDatos;
  end;

var
  FDISMENU: TFDISMENU;

implementation

uses DDMCONS, ULIBDATABASE, ULIBGRAL, ULIBLICENCIAS, ULIBPRINT, UDisWayne,
  UDISBENNETT2, UDISPAM10002, UDISTEAM, UDISHONGJANG, UDISGILBARCO, UDISGATEWAY;

{$R *.dfm}

procedure TFDISMENU.IniciaBaseDeDatos;
var xfecha:tdatetime;
begin
  with DMCONS do begin
    if not swemular then begin
      if (lcLicTemporal)and(date>lcLicVence) then begin
        raise Exception.Create('Licencia vencida');
      end;
      try
        if not LicenciaValida2(T_EmprIbRazonSocial.asstring,'CVOL','3.1','Abierta',lcLicencia,1,lcLicTemporal,lcLicVence) then  begin
          MensajeErr('Licencia del sistema no válida: '+lcLicencia);
          Application.Terminate;
        end;
        if Inocuidad31FechaVence='' then begin
          if not LicenciaValida2(T_EmprIbRazonSocial.asstring,'CVOL02','3.1','Abierta',Inocuidad31Licencia,1,false,date) then  begin
            MensajeErr('Licencia de Inocuidad 3.1 no válida: '+Inocuidad31Licencia);
            Application.Terminate;
          end;
        end
        else begin
          xfecha:=strtofecha(Inocuidad31FechaVence);
          if xfecha>=date then begin
            if not LicenciaValida2(T_EmprIbRazonSocial.asstring,'CVOL02','3.1','Abierta',Inocuidad31Licencia,1,true,xfecha) then  begin
              MensajeErr('Licencia de Inocuidad 3.1 no válida: '+Inocuidad31Licencia);
              Application.Terminate;
            end;
          end
          else begin
            //MensajeErr('Licencia de Inocuidad 3.1 está vencida');
            //Application.Terminate;
          end;
        end;
      except
        raise Exception.Create('Licencia del sistema no válida: '+lcLicencia);
      end;
    end;
  end;
end;

procedure TFDISMENU.FormShow(Sender: TObject);
var numerr:integer;
    xfec:string;
begin
  with DMCONS do begin
    numerr:=0;
    try
      ModuloActual:='DISP';
      AliasConsolaEsts:=ParamStr(1);
      SwEmular:=StrMayuscIguales(Paramstr(2),'Emular');
      SwMapOff:=StrMayuscIguales(Paramstr(3),'MapOff');

      numerr:=1;
      ConectaBaseDatos;
      IniciaBaseDeDatos;
      numerr:=2;

      (*
      if (not SwEmular) then begin
        xfec:=fechatostr(date);
        if xfec>'20211031' then
          raise exception.Create('Licencia Vencida');
      end;
       (*

      if not AutovalidarMd5 then begin
        ShowMessage('No se pudo autenticar MD5 de Inocuidad. Consulte a su proveedor.');
        Application.Terminate;
      end;
             *)
        
      Case T_EstsIbTipoDispensario.AsInteger of
        1:begin
            Application.CreateForm(TFDISWAYNE,FDISWAYNE);
            FDISWAYNE.Show;
          end;
        2:begin
            Application.CreateForm(TFDISBENNETT2,FDISBENNETT2);
            FDISBENNETT2.Show;
          end;
        3:begin
            Application.CreateForm(TFDISTEAM,FDISTEAM);
            FDISTEAM.Show;
          end;
        4:begin
            Application.CreateForm(TFDISPAM10002,FDISPAM10002);
            FDISPAM10002.Show;
          end;
        5:begin
            Application.CreateForm(TFDISHONGJANG,FDISHONGJANG);
            FDISHONGJANG.Show;
          end;
        6:begin
            Application.CreateForm(TFDISGILBARCO,FDISGILBARCO);
            FDISGILBARCO.Show;
          end;
        8:begin
            Application.CreateForm(TFDISGATEWAY,FDISGATEWAY);
            FDISGATEWAY.Show;
          end;
      end;
    except
      case numerr of
        1   :MensajeErr('Error al inicializar Base de Datos');
        101 :MensajeErr('Licencia del sistema no válida: '+DMCONS.T_ConfIbLicencia.AsString);
        102 :MensajeErr('Licencia del sistema ha vencido, llame a su distribuidor');
        2   :MensajeErr('Llave no instalada');
        else MensajeErr('Error No: '+inttostr(numerr));
      end;
      Application.Terminate;
    end;
  end;
end;

end.
