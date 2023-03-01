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
  UDISBENNETT2, UDISPAM10002, UDISTEAM, UDISHONGJANG, UDISPAMPC, UDISFUSION,
  UDISOPENGAS;

{$R *.dfm}

procedure TFDISMENU.IniciaBaseDeDatos;
var xfecha:tdatetime;
begin
  with DMCONS do begin
    if true (*not swemular *) then begin
      if (lcLicTemporal)and(date>lcLicVence) then begin
        raise Exception.Create('Licencia vencida');
      end;
      try
        if not LicenciaValida2(T_EmprIbRazonSocial.asstring,'CVOL','3.1','Abierta',lcLicencia,1,lcLicTemporal,lcLicVence) then  begin
          MensajeErr('Licencia del sistema no válida: '+lcLicencia);
          Application.Terminate;
        end;
      except
        raise Exception.Create('Licencia del sistema no válida: '+lcLicencia);
      end;
    end;

    Licencia3Ok:=true;
    try
      Licencia3Ok:=LicenciaValida2(T_EmprIbRazonSocial.asstring,'CVL6','3.1','Abierta',lcLicencia2,1,lcLicTemporal2,lcLicVence2);
    except
      Licencia3Ok:=false;
    end;

  end;
end;

procedure TFDISMENU.FormShow(Sender: TObject);
var numerr:integer;
    xfec:string;
begin
  with DMCONS do begin
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
        if xfec>'20200531' then
          raise exception.Create('Licencia Vencida');
      end
      else
        Licencia3Ok:=true;
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
            Application.CreateForm(TFDISPAMPC,FDISPAMPC);
            FDISPAMPC.Show;
          end;
        7:begin
            Application.CreateForm(TFDISFUSION,FDISFUSION);
            FDISFUSION.Show;
          end;
        8:begin
            Application.CreateForm(TFDISOPENGAS,FDISOPENGAS);
            FDISOPENGAS.Show;
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
