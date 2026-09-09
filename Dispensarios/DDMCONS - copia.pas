unit DDMCONS;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ULibGral, ULibPrint;


const MaxComb=9;
      CortesPorDia=6;
      VersionConsola = '3.1';
      ReviGenConsola = '1.0053';
      LitrosXGalon=3.7854;

(*
TIPOS DE PAGO TICKETS
01 - Efectivo
02 - Crédito
03 - Cheque
04 - Tarjeta
*)

type RegComb = record
       Activo :boolean;
       Nombre :string[20];
       Precio :real;
       PrecioAnt :real;
       SwLeePrecioFisico,
       AplicaPrecio:boolean;
       FechaHora:TDateTime;
       Folio:Integer;
       ProductoPrecio:string[6];
       Agruparcon:Integer;
       DigitoPrec:integer;
     end;

type
  TDMCONS = class(TDataModule)
    DBGASCON: TDatabase;
    T_MoviIb: TTable;
    T_FactIb: TTable;
    T_FactIbPOSCARGA: TIntegerField;
    T_FactIbCLAVE: TIntegerField;
    T_FactIbHORA: TDateTimeField; 
    T_FactIbCOMBUSTIBLE: TIntegerField;
    T_FactIbVOLUMEN: TFloatField;
    T_FactIbIMPORTE: TFloatField;
    T_FactIbNombreComb: TStringField;
    Q_Fact1: TQuery;
    Q_Fact2: TQuery;
    DSQ_Fact1: TDataSource;
    DSQ_Fact2: TDataSource;
    Q_Fact1POSCARGA: TIntegerField;
    Q_Fact1CLAVE: TIntegerField;
    Q_Fact1HORA: TDateTimeField;
    Q_Fact1COMBUSTIBLE: TIntegerField;
    Q_Fact1VOLUMEN: TFloatField;
    Q_Fact1IMPORTE: TFloatField;
    Q_Fact2POSCARGA: TIntegerField;
    Q_Fact2CLAVE: TIntegerField;
    Q_Fact2HORA: TDateTimeField;
    Q_Fact2COMBUSTIBLE: TIntegerField;
    Q_Fact2VOLUMEN: TFloatField;
    Q_Fact2IMPORTE: TFloatField;
    Q_Fact1NombreComb: TStringField;
    Q_Fact2NombreComb: TStringField;
    T_FactIbIMPRESO: TStringField;
    Q_Fact1IMPRESO: TStringField;
    Q_Fact2IMPRESO: TStringField;
    T_MoviIbFOLIO: TIntegerField;
    T_MoviIbFECHA: TDateTimeField;
    T_MoviIbHORA: TDateTimeField;
    T_MoviIbPOSCARGA: TIntegerField;
    T_MoviIbCOMBUSTIBLE: TIntegerField;
    T_MoviIbVOLUMEN: TFloatField;
    T_MoviIbIMPORTE: TFloatField;
    T_MoviIbIMPRESO: TStringField;
    T_MoviIbTRANSACCION: TIntegerField;
    T_FactIbFOLIO: TIntegerField;
    T_FactIbTRANSACCION: TIntegerField;
    Q_Fact1FOLIO: TIntegerField;
    Q_Fact1TRANSACCION: TIntegerField;
    Q_Fact2FOLIO: TIntegerField;
    Q_Fact2TRANSACCION: TIntegerField;
    T_MoviIbTARJETA: TStringField;
    T_MoviIbKILOMETRAJE: TIntegerField;
    Q_MoviTarj: TQuery;
    Q_MoviTarjFOLIO: TIntegerField;
    Q_MoviTarjFECHA: TDateTimeField;
    Q_MoviTarjHORA: TDateTimeField;
    Q_MoviTarjPOSCARGA: TIntegerField;
    Q_MoviTarjCOMBUSTIBLE: TIntegerField;
    Q_MoviTarjVOLUMEN: TFloatField;
    Q_MoviTarjIMPORTE: TFloatField;
    Q_MoviTarjIMPRESO: TStringField;
    Q_MoviTarjTRANSACCION: TIntegerField;
    Q_MoviTarjTARJETA: TStringField;
    Q_MoviTarjKILOMETRAJE: TIntegerField;
    Q_MoviTarjAPLICAR: TStringField;
    Q_MoviGasboy: TQuery;
    Q_MoviGasboyTRANSACCION: TIntegerField;
    Q_MoviGasboyHORA: TDateTimeField;
    Q_MoviGasboyFECHAGASBOY: TStringField;
    Q_MoviGasboyHORAGASBOY: TStringField;
    T_Corte: TTable;
    T_CorteFECHA: TDateTimeField;
    T_CorteTURNO: TIntegerField;
    T_CorteISLA: TIntegerField;
    T_CortePOSCARGA: TIntegerField;
    T_CorteCOMBUSTIBLE: TIntegerField;
    T_CorteCONTADORLITROS: TFloatField;
    T_CorteCONTADORIMPORTE: TFloatField;
    Q_Corte: TQuery;
    Q_CorteCANTIDAD: TIntegerField;
    T_ConsIb: TTable;
    T_ConsIbPOSCARGA: TIntegerField;
    T_ConsIbMONVOL: TStringField;
    T_ConsIbVALOR: TFloatField;
    T_ConsIbESTATUS: TStringField;
    T_ConsIbPOSICION: TIntegerField;
    T_ConsIbVOLUMEN: TFloatField;
    T_ConsIbPRECIO: TFloatField;
    T_ConsIbIMPORTE: TFloatField;
    T_ConsIbDescEstatus: TStringField;
    T_ConfIb: TTable;
    T_ConfIbRAZONSOCIAL: TStringField;
    T_ConfIbNOMBRECOMERCIAL: TStringField;
    T_ConfIbESTACIONSERVICIO: TStringField;
    T_ConfIbLECTORSERIAL: TStringField;
    T_ConfIbULTIMOFOLIOCR: TIntegerField;
    T_ConfIbULTIMOFOLIOPP: TIntegerField;
    T_ConfIbIMPRESORATICKETS: TStringField;
    T_ConfIbPOSCLIENTE: TIntegerField;
    T_ConfIbLONGCLIENTE: TIntegerField;
    T_ConfIbPOSVEHICULO: TIntegerField;
    T_ConfIbLONGVEHICULO: TIntegerField;
    T_ConfIbCONFIGPUERTOTARJETA: TStringField;
    T_TarjIb: TTable;
    T_TarjIbNOCLIE: TIntegerField;
    T_TarjIbVEHIC: TIntegerField;
    T_TarjIbCODIGO: TStringField;
    T_TarjIbNOMBRECLIENTE: TStringField;
    T_TarjIbDESCRIPVEHICULO: TStringField;
    T_TarjIbCONDUCTOR: TStringField;
    T_TarjIbCONFIDENCIAL: TStringField;
    T_TarjIbTIPOTARJETA: TStringField;
    Q_ConsIb: TQuery;
    Q_Cons2Ib: TQuery;
    Q_ConsIbPOSCARGA: TIntegerField;
    Q_ConsIbMONVOL: TStringField;
    Q_ConsIbVALOR: TFloatField;
    Q_ConsIbESTATUS: TStringField;
    Q_ConsIbPOSICION: TIntegerField;
    Q_ConsIbVOLUMEN: TFloatField;
    Q_ConsIbPRECIO: TFloatField;
    Q_ConsIbIMPORTE: TFloatField;
    Q_Cons2IbPOSCARGA: TIntegerField;
    Q_Cons2IbMONVOL: TStringField;
    Q_Cons2IbVALOR: TFloatField;
    Q_Cons2IbESTATUS: TStringField;
    Q_Cons2IbPOSICION: TIntegerField;
    Q_Cons2IbVOLUMEN: TFloatField;
    Q_Cons2IbPRECIO: TFloatField;
    Q_Cons2IbIMPORTE: TFloatField;
    T_TranIb: TTable;
    T_TranIbTIPOVENTA: TStringField;
    T_TranIbFOLIO: TIntegerField;
    T_TranIbHORA: TDateTimeField;
    T_TranIbCLIENTE: TIntegerField;
    T_TranIbVEHICULO: TIntegerField;
    T_TranIbPOSCARGA: TIntegerField;
    T_TranIbCOMBUSTIBLE: TIntegerField;
    T_TranIbLITROS: TFloatField;
    T_TranIbTOTAL: TFloatField;
    T_ConsIbCOMBUSTIBLE: TStringField;
    Q_ConsIbCOMBUSTIBLE: TStringField;
    Q_Cons2IbCOMBUSTIBLE: TStringField;
    T_EmprIb: TTable;
    T_EmprIbCLAVE: TIntegerField;
    T_EmprIbRAZONSOCIAL: TStringField;
    T_EmprIbREVISION: TStringField;
    T_EmprIbFECHAREV: TDateTimeField;
    T_EmprIbTIPO: TStringField;
    T_EmprIbSERIEKEY: TIntegerField;
    T_EmprIbNOMCOMERCIAL: TStringField;
    T_EmprIbDIRECCION: TStringField;
    T_EmprIbPOBLACION: TStringField;
    T_EmprIbRFC: TStringField;
    T_EmprIbCLAVESUPER: TStringField;
    T_EmprIbCLAVEDIA: TStringField;
    T_EmprIbFORMATOCTAS: TStringField;
    T_EmprIbTIPOLICENCIA: TStringField;
    T_EmprIbMANTENIMIENTO: TStringField;
    T_EmprIbCONSOLA: TMemoField;
    T_EmprIbCLIENTEPEMEX: TStringField;
    T_EmprIbULTIMA_ACTUALIZACION: TDateTimeField;
    T_EstsIb: TTable;
    T_EstsIbCLAVE: TIntegerField;
    T_EstsIbNOMBRE: TStringField;
    T_EstsIbCONSOLA: TMemoField;
    T_EstsIbTIPODISPENSARIO: TIntegerField;
    T_EstsIbTIPOTANQUES: TIntegerField;
    T_EstsIbNUMEROESTACION: TStringField;
    Q_BombIb: TQuery;
    Q_BombIbISLA: TIntegerField;
    Q_BombIbPOSCARGA: TIntegerField;
    Q_BombIbCOMBUSTIBLE: TIntegerField;
    Q_BombIbCON_PRECIO: TIntegerField;
    Q_BombIbCON_POSICION: TIntegerField;
    Q_BombIbCON_DIGITOAJUSTE: TIntegerField;
    Q_CombIb: TQuery;
    Q_CombIbCLAVE: TIntegerField;
    Q_CombIbNOMBRE: TStringField;
    Q_CombIbCLAVEPEMEX: TStringField;
    Q_BombIbNombreComb: TStringField;
    Q_Prec: TQuery;
    Q_AplicaPrecioF: TQuery;
    T_Tanq: TTable;
    T_TanqTANQUE: TIntegerField;
    T_TanqCOMBUSTIBLE: TIntegerField;
    T_TanqCLAVEPRODUCTOMEDICION: TStringField;
    T_TanqVOLUMENFONDAJE: TFloatField;
    T_TanqCAPACIDAD: TFloatField;
    T_TanqALTURA: TFloatField;
    T_TanqNombreComb: TStringField;
    Q_Cvol: TQuery;
    Q_CvolFECHA: TDateTimeField;
    Q_CvolCORTE: TIntegerField;
    Q_CvolFECHAHORAINICIAL: TDateTimeField;
    Q_CvolFECHAHORAFINAL: TDateTimeField;
    Q_CvolESTATUS: TStringField;
    Q_CvolGENERADO: TStringField;
    T_Cvolt: TTable;
    DSQ_Cvol: TDataSource;
    T_CvoltFECHA: TDateTimeField;
    T_CvoltCORTE: TIntegerField;
    T_CvoltTANQUE: TIntegerField;
    T_CvoltFECHAHORA: TDateTimeField;
    T_CvoltCOMBUSTIBLE: TIntegerField;
    T_CvoltVOLUMEN: TFloatField;
    T_CvoltPORLLENAR: TFloatField;
    T_CvoltNIVEL: TFloatField;
    T_CvoltVOLUMENAGUA: TFloatField;
    T_CvoltTEMPERATURA: TFloatField;
    T_CvoltVOLUMENFONDAJE: TFloatField;
    T_Etan: TTable;
    T_EtanFOLIO: TIntegerField;
    T_EtanFECHA: TDateTimeField;
    T_EtanCORTE: TIntegerField;
    T_EtanTANQUE: TIntegerField;
    T_EtanCOMBUSTIBLE: TIntegerField;
    T_EtanVOLUMENINICIAL: TFloatField;
    T_EtanVOLUMENFINAL: TFloatField;
    T_EtanVOLUMENRECEPCION: TFloatField;
    T_EtanTEMPERATURA: TFloatField;
    T_EtanTERMINALDIST: TStringField;
    T_EtanTIPODOC: TStringField;
    T_EtanFECHADOC: TDateTimeField;
    T_EtanFOLIODOC: TStringField;
    T_EtanVOLUMENDOC: TFloatField;
    T_EtanFECHAHORAINICIAL: TDateTimeField;
    T_EtanFECHAHORAFINAL: TDateTimeField;
    T_EtanDATOSADICIONALES: TStringField;
    T_EtanFECHAHORADISP: TStringField;
    T_CvoltVOLUMENUTIL: TFloatField;
    SP_Corte: TStoredProc;
    Q_CvolDescripCorte: TStringField;
    DST_Cvolt: TDataSource;
    T_CvoltNombreComb: TStringField;
    Q_Etan: TQuery;
    Q_EtanFOLIO: TIntegerField;
    Q_EtanFECHA: TDateTimeField;
    Q_EtanCORTE: TIntegerField;
    Q_EtanTANQUE: TIntegerField;
    Q_EtanCOMBUSTIBLE: TIntegerField;
    Q_EtanVOLUMENINICIAL: TFloatField;
    Q_EtanVOLUMENFINAL: TFloatField;
    Q_EtanVOLUMENRECEPCION: TFloatField;
    Q_EtanTEMPERATURA: TFloatField;
    Q_EtanTERMINALDIST: TStringField;
    Q_EtanTIPODOC: TStringField;
    Q_EtanFECHADOC: TDateTimeField;
    Q_EtanFOLIODOC: TStringField;
    Q_EtanVOLUMENDOC: TFloatField;
    Q_EtanFECHAHORAINICIAL: TDateTimeField;
    Q_EtanFECHAHORAFINAL: TDateTimeField;
    Q_EtanDATOSADICIONALES: TStringField;
    Q_EtanFECHAHORADISP: TStringField;
    Q_EtanFECHAHORA: TDateTimeField;
    DSQ_Etan: TDataSource;
    Q_EtanNombreComb: TStringField;
    Q_Ctan: TQuery;
    Q_CtanFOLIO: TIntegerField;
    Q_CtanFECHA: TDateTimeField;
    Q_CtanCORTE: TIntegerField;
    Q_CtanTANQUE: TIntegerField;
    Q_CtanFECHAHORA: TDateTimeField;
    Q_CtanCOMBUSTIBLE: TIntegerField;
    Q_CtanNUEVOESTADO: TStringField;
    T_Ctan: TTable;
    T_CtanFOLIO: TIntegerField;
    T_CtanFECHA: TDateTimeField;
    T_CtanCORTE: TIntegerField;
    T_CtanTANQUE: TIntegerField;
    T_CtanFECHAHORA: TDateTimeField;
    T_CtanCOMBUSTIBLE: TIntegerField;
    T_CtanNUEVOESTADO: TStringField;
    DST_Ctan: TDataSource;
    T_CtanNombreComb: TStringField;
    T_CtanDescEstado: TStringField;
    Q_Movi: TQuery;
    Q_MoviFOLIO: TIntegerField;
    Q_MoviFECHA: TDateTimeField;
    Q_MoviHORA: TDateTimeField;
    Q_MoviPOSCARGA: TIntegerField;
    Q_MoviCOMBUSTIBLE: TIntegerField;
    Q_MoviVOLUMEN: TFloatField;
    Q_MoviIMPORTE: TFloatField;
    Q_MoviIMPRESO: TStringField;
    Q_MoviTRANSACCION: TIntegerField;
    Q_MoviTARJETA: TStringField;
    Q_MoviKILOMETRAJE: TIntegerField;
    Q_MoviAPLICAR: TStringField;
    Q_MoviHORASTR: TStringField;
    Q_MoviFECHAGASBOY: TStringField;
    Q_MoviHORAGASBOY: TStringField;
    Q_MoviFECHACORTE: TDateTimeField;
    Q_MoviCORTE: TIntegerField;
    Q_MoviNombreComb: TStringField;
    DSQ_Movi: TDataSource;
    T_MoviIbNombreComb: TStringField;
    T_Logs: TTable;
    T_LogsMODULO: TStringField;
    T_LogsFECHAHORAINICIAL: TDateTimeField;
    T_LogsFECHAHORAFINAL: TDateTimeField;
    T_MoviIbHORASTR: TStringField;
    Q_PrecCOMBUSTIBLE: TIntegerField;
    Q_PrecPRECIO: TFloatField;
    Q_PrecAPLICADO: TStringField;
    Q_Auxi: TQuery;
    Q_AuxiReal1: TFloatField;
    Q_AuxiReal2: TFloatField;
    Q_AuxiReal3: TFloatField;
    Q_AuxiReal4: TFloatField;
    Q_AuxiReal5: TFloatField;
    Q_AuxiReal6: TFloatField;
    Q_AuxiEntero1: TIntegerField;
    Q_AuxiEntero2: TIntegerField;
    Q_AuxiChar1: TStringField;
    Q_AuxiStr10: TStringField;
    Q_AuxiStr10_2: TStringField;
    Q_AuxiStr6_1: TStringField;
    Q_AuxiStr6_2: TStringField;
    Q_AuxiDate1: TDateTimeField;
    T_MoviIbAPLICAR: TStringField;
    T_MoviIbFECHAGASBOY: TStringField;
    T_MoviIbHORAGASBOY: TStringField;
    T_MoviIbFECHACORTE: TDateTimeField;
    T_MoviIbCORTE: TIntegerField;
    Q_PrecFECHAHORA: TDateTimeField;
    SP_DamePrec: TStoredProc;
    Q_CombIbCON_PRODUCTOPRECIO: TStringField;
    Q_PrecFOLIO: TIntegerField;
    Q_PrecEN_EDICION: TStringField;
    Q_PrecERROR: TStringField;
    Q_CombIbPRECIOFISICO: TFloatField;
    DSQ_Comb: TDataSource;
    T_Tcmb: TTable;
    T_TcmbCLAVE: TIntegerField;
    T_TcmbNOMBRE: TStringField;
    T_TcmbCLAVEPEMEX: TStringField;
    T_TcmbCON_PRODUCTOPRECIO: TStringField;
    T_TcmbPRECIOFISICO: TFloatField;
    T_ConfIbRUTAVOLUMETRICOS: TStringField;
    T_ConfIbIMPO_BOMBAS: TStringField;
    T_ConfIbIMPO_ESTACIONES: TStringField;
    T_ConfIbIMPO_PRECIOS: TStringField;
    T_ConfIbIMPO_TANQUES: TStringField;
    T_ConfIbIMPO_COMBUSTIBLES: TStringField;
    T_ConfIbIMPO_TARJETAS: TStringField;
    T_ConfIbIMPO_CONFIG: TStringField;
    T_ConfIbMASCARA_FLOAT: TStringField;
    T_ConfIbMASCARA_HORA: TStringField;
    T_ConfIbPERMITIR_CAMBIO_FECHAHORA: TStringField;
    Q_Cmnd: TQuery;
    Q_CmndFOLIO: TIntegerField;
    Q_CmndMODULO: TStringField;
    Q_CmndFECHAHORA: TDateTimeField;
    Q_CmndCOMANDO: TStringField;
    Q_CmndAPLICADO: TStringField;
    T_Cmnd: TTable;
    T_CmndFOLIO: TIntegerField;
    T_CmndMODULO: TStringField;
    T_CmndFECHAHORA: TDateTimeField;
    T_CmndCOMANDO: TStringField;
    T_CmndAPLICADO: TStringField;
    T_ConfIbINT_ACT_PRECIOS: TIntegerField;
    T_ConfIbIMPRESORAVOLUMETRICOS: TStringField;
    T_MoviIbFACTURADO: TStringField;
    T_MoviIbTOTAL01: TFloatField;
    T_MoviIbTOTAL02: TFloatField;
    T_Bita: TTable;
    T_ConfIbCOMANDO1: TStringField;
    T_ConfIbCOMANDO2: TStringField;
    T_ConfIbLEVANTAR_CONSOLAS: TStringField;
    T_ConfIbRUTA_RESPALDOS: TStringField;
    T_ConfIbLICENCIA: TStringField;
    T_ConfIbNUMEROSERIE: TIntegerField;
    T_Puer: TTable;
    T_PuerCLAVE: TStringField;
    T_PuerNUMEROPUERTO: TIntegerField;
    T_PuerVELOCIDAD: TIntegerField;
    T_PuerPARIDAD: TStringField;
    T_PuerBITSDATOS: TIntegerField;
    T_PuerBITSPARO: TIntegerField;
    T_EmprIbESTACION_IGAS: TIntegerField;
    T_MoviIbTAG: TIntegerField;
    T_ConsIbFOLIO: TIntegerField;
    T_ConfIbIMPRESORAGRAFICA: TStringField;
    T_ConsIbVALOR2: TFloatField;
    Q_ConsIbFOLIO: TIntegerField;
    Q_ConsIbVALOR2: TFloatField;
    T_TanqACTIVO: TStringField;
    Q_CombIbAGRUPAR_CON: TIntegerField;
    T_MoviIbPRECIO: TFloatField;
    T_MoviIbclavecombus: TStringField;
    Q_Pcar: TQuery;
    Q_PcarPOSCARGA: TIntegerField;
    Q_PcarSLOWFLOW: TFloatField;
    T_CmndRESULTADO: TStringField;
    Q_CmndRESULTADO: TStringField;
    T_ConsIbESTADO: TIntegerField;
    T_ConsIbOTROS: TStringField;
    T_Cvold: TTable;
    T_CvoldFECHA: TDateTimeField;
    T_CvoldCORTE: TIntegerField;
    T_CvoldPOSCARGA: TIntegerField;
    T_CvoldTOTAL01: TFloatField;
    T_CvoldTOTAL02: TFloatField;
    T_ConfIbDISPENSARIOS: TMemoField;
    T_Turc: TTable;
    T_TurcTURNO: TIntegerField;
    T_TurcHORAINICIAL: TStringField;
    T_TurcHORAFINAL: TStringField;
    Q_Turn: TQuery;
    Q_TurnFECHA: TDateTimeField;
    Q_TurnTURNO: TIntegerField;
    Q_TurnFECHAHORAINICIAL: TDateTimeField;
    Q_TurnFECHAHORAFINAL: TDateTimeField;
    Q_TurnESTATUS: TStringField;
    T_Turn: TTable;
    T_TurnFECHA: TDateTimeField;
    T_TurnTURNO: TIntegerField;
    T_TurnFECHAHORAINICIAL: TDateTimeField;
    T_TurnFECHAHORAFINAL: TDateTimeField;
    T_TurnESTATUS: TStringField;
    QL_Bomb: TQuery;
    QL_BombMANGUERA: TIntegerField;
    QL_BombPOSCARGA: TIntegerField;
    QL_BombCOMBUSTIBLE: TIntegerField;
    QL_BombISLA: TIntegerField;
    QL_BombCON_PRECIO: TIntegerField;
    QL_BombCON_POSICION: TIntegerField;
    QL_BombCON_DIGITOAJUSTE: TIntegerField;
    QL_BombIMPRESORA: TIntegerField;
    QL_BombACTIVO: TStringField;
    QL_BombIMPRIMEAUTOM: TStringField;
    Q_ConsIbESTADO: TIntegerField;
    Q_ConsIbOTROS: TStringField;
    Q_BombIbMANGUERA: TIntegerField;
    T_BitaFOLIO: TIntegerField;
    T_BitaFECHAHORA: TDateTimeField;
    T_BitaUSUARIO: TIntegerField;
    T_BitaOPERACION: TStringField;
    T_BitaOBSERVACIONES: TMemoField;
    T_BitaFECHA: TDateTimeField;
    Q_BombIbDIGITOAJUSTEPRECIO: TIntegerField;
    Q_CombIbDIGITOAJUSTEPRECIO: TIntegerField;
    T_TcmbAGRUPAR_CON: TIntegerField;
    T_TcmbDIGITOAJUSTEPRECIO: TIntegerField;
    T_MoviIbFECHATURNO: TDateTimeField;
    T_MoviIbTURNO: TIntegerField;
    T_MoviIbJARREO: TStringField;
    T_MoviIbMANGUERA: TIntegerField;
    SP_Paq_Volum: TStoredProc;
    T_CvoldTOTAL03: TFloatField;
    T_CvoldTOTAL04: TFloatField;
    T_MoviIbTOTAL03: TFloatField;
    T_MoviIbTOTAL04: TFloatField;
    QL_BombDIGITOAJUSTEPRECIO: TIntegerField;
    QL_BombCAMPOLECTURA: TStringField;
    QL_BombMODOOPERACION: TStringField;
    Q_BombIbMODOOPERACION: TStringField;
    T_ConfIbESTACION_IGAS: TIntegerField;
    T_ConfIbCONFIG_TICKET: TMemoField;
    T_ConfIbLICENCIA2: TStringField;
    T_ConfIbESTEMPORAL: TStringField;
    T_ConfIbFECHAVENCE: TDateTimeField;
    SP_Calcula_Ventas_Etan: TStoredProc;
    T_MoviIbTIPOPAGO: TIntegerField;
    T_TurcHORAMIN: TStringField;
    T_TurcHORAMAX: TStringField;
    Q_BombIbDIGITOAJUSTEVOL: TIntegerField;
    Q_BombIbDIGITOSGILBARCO: TIntegerField;
    Q_BombIbDECIMALESGILBARCO: TIntegerField;
    T_MoviIbBOUCHER: TStringField;
    T_MoviIbCUPONIMPRESO: TStringField;
    T_MoviIbREFERENCIABITACORA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure T_FactIbCalcFields(DataSet: TDataSet);
    procedure Q_Fact1CalcFields(DataSet: TDataSet);
    procedure Q_Fact2CalcFields(DataSet: TDataSet);
    procedure T_ConsIbCalcFields(DataSet: TDataSet);
    procedure T_ConsIbAfterClose(DataSet: TDataSet);
    procedure Q_CvolCalcFields(DataSet: TDataSet);
    procedure Q_CvolAfterOpen(DataSet: TDataSet);
    procedure T_CtanCalcFields(DataSet: TDataSet);
    procedure Q_AuxiAfterClose(DataSet: TDataSet);
    procedure T_EtanTIPODOCValidate(Sender: TField);
    procedure DBGASCONAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TCombuPos:array[1..2,1..32] of integer;
    ConfigPuertoTarjeta2,
    AliasConsolaEsts,
    PasswordGasboy,
    CodigoSeguridadVeederRoot:string;
    TipoClb,
    ValorClb,
    ManejaPrecioCredito,
    SoportaSeleccionProducto,
    PasswordConsola,
    RangoPosiciones,
    RangoPosiciones2,
    AjusteWayne,
    VersionPam1000,
    DigitosPam1000,
    DecimalesPam1000,
    HayConsolaAlterna,
    RedirigirHypercom,
    AutostikEnGalones,
    PasswordNocturno:string;
    DecimalesPrecio,
    MinimoHorasCorte,
    emEstacionServicio,
    ModoAutoriza:Integer;
    NombreEstacion:string;
    LectorSerial,
    SwNocturno:boolean;
    xPosCliente,
    xLongCliente,
    xPosVehiculo,
    xLongVehiculo:integer;
    GasboyPtrPosicionHora,
    TipoGasboy:integer;
    SwTarjetaOk:boolean;
    SwImprimeBarras:boolean;
    TabComb:array[1..MaxComb] of RegComb;
    PrimeraCarga:boolean;
    ListaConsola:TStrings;
    lcPosCarga  :integer;
    lcEstatus,
    lcMonVol    :string[1];
    lcValor     :real;
    lcPosicion  :integer;
    lcVolumen,
    lcPrecio,
    lcImporte   :real;
    lcDescEstatus,
    lcCombustible:string[20];
    lcFolio  :integer;
    ListaSolicitud:TStrings;
    SwCorteOk,
    SwCorteParcial,
    SwCorteTurno:boolean;
    xIslaCorte,
    xTurnoCorte:integer;
    FechaHoraLog,
    FechaHoraRefLog,
    FechaHoraPrecio,
    FechaHoraComando,
    HoraUltimoCorte,
    xFechaCorte:TDateTime;
    SwCliente,
    SwEmular,
    SwSolicitud:boolean;
    SwChecaVentaTarjeta:boolean;
    FechaUltimoCorte,
    FechaSiguienteCorte,
    FechaSiguienteCorte2:TDateTime;
    ModuloActual:String;
    SwCambioPrecio,
    SwPermiteCambioFechaHora,
    SwPrecioFisico:boolean;
    SwFechaHoraTM:boolean;
    UltimaFechaHoraTM,
    UltimaFechaHora:TDateTime;
    LcLicencia:string;
    LcLicTemporal:boolean;
    LcLicVence:TDateTime;
    LcLicencia2:string;
    Licencia2Ok:boolean;
    StLevanta:string;
    LcSerie:integer;
    PtParidad   :string[1];
    PtPuerto,
    PtBaudios,
    PtBitsDatos,
    PtBitsParada:word;
    IniTurnoActual:TDateTime;
    FinTurnoActual:TDateTime;
    FinTurnoActualMin:TDateTime;
    FinTurnoActualMax:TDateTime;
    FechaTurnoActual:TDateTime;
    FinTurnoActualMargenPos,FinTurnoActualMargenAnt:real;
    TurnoActual:integer;
    ContadorTot,
    ContadorTotPos:integer;
    ListaLog:TStrings;
    TAdic   :array[1..32] of string[8];
    TAdic2   :array[1..32] of string[8];
    TAdic3   :array[1..32] of real;
    StAdic   :byte;  // 0-Nada  1-Min  2-Std
    procedure ChecaTablas;
    procedure ConectaBaseDatos;
    procedure CargaPreciosFH(xFechaHora:TDateTime;SwMeteAFisico:boolean);
    function DamePrecioFH(xComb:integer;xFechaHora:TDateTime):real;
    function LeeTxtConsola(xpos:integer):boolean;
    procedure CargaConfiguracionConsola;
    function AplicarPrecios:boolean;
    procedure CalculaFechasCorte;
    function UltimoEstadoTanque(xtan:integer):string;
    procedure ConectaAplicacion;
    procedure RefrescaConexion;
    procedure RegistraBitacora(xUsuario:integer;xOperacion:string;xObserva:TStrings);
    procedure RegistraBitacora2(xUsuario:integer;xOperacion:string);
    procedure RegistraTotales_BD(xposcarga:integer;xtotal01,xtotal02:real);
    procedure RegistraTotales_BD4(xposcarga:integer;xtotal01,xtotal02,xtotal03,xtotal04:real);
    procedure CalculaTurnoActual(xFechaHora:TDateTime);
    procedure AgregaLog(lin:string);
    function DameTotalCombuPos(xpos,xcomb:integer;xtot1,xtot2:real):real;
    procedure CargaAdicional;
    procedure ReviConsola(xrevi:string);
    procedure ActivaModoPrepago(xpos:integer);
    procedure DesActivaModoPrepago(xpos:integer);
    function CalculaVentaPorLectura(xlectini,xlectfin:real):real;
  end;

var
  DMCONS: TDMCONS;

implementation

uses DDMCONS2, ULIBLICENCIAS;

{$R *.DFM}

function TDMCONS.CalculaVentaPorLectura(xlectini,xlectfin:real):real;
var xvol:real;
begin
  xvol:=0;
  if xlectini<=xlectfin+0.001 then begin
    xvol:=xlectfin-xlectini;
  end
  else begin
    if (xlectini>80000)and(xlectini<100000) then
      xvol:=100000-xlectini+xlectfin
    else if (xlectini>980000)and(xlectini<1000000) then
      xvol:=1000000-xlectini+xlectfin
    else if (xlectini>9980000)and(xlectini<10000000) then
      xvol:=10000000-xlectini+xlectfin;
  end;
  result:=xvol;
end;

procedure TDMCONS.ReviConsola(xrevi:string);
begin
  T_EmprIb.Active:=true;
  if xrevi<>'*' then begin
    if xrevi>T_EmprIbREVISION.AsString then
      MensajeWarn('Se requiere actualizar la base de datos CONSOLA a la Rev. '+xrevi);
    if xrevi<T_EmprIbREVISION.AsString then begin
      MensajeWarn('Se requiere actualizar versión del sistema!! (Podría funcionar incorrectamente).');
      MensajeWarn('Revision Base Datos Volumetrico: '+T_EmprIbRevision.AsString+'. Revision Ejscutable: '+xrevi);
    end;
  end;
end;


procedure TDMCONS.RegistraBitacora(xUsuario:integer;xOperacion:string;xObserva:TStrings);
begin
  if LimpiaStr(xOperacion)='' then
    raise Exception.Create('Operacion es Requerida');
  if xObserva.Count=0 then
    raise Exception.Create('Observación es Requerida');
  if LimpiaStr(xObserva[0])='' then
    raise Exception.Create('Observación es Requerida');
  try
    T_Bita.Active:=true;
    T_Bita.Insert;
    T_BitaUsuario.AsInteger:=xUsuario;
    T_BitaOperacion.AsString:=xOperacion;
    T_BitaObservaciones.Assign(xObserva);
    T_Bita.Post
  except
  end;
end;

procedure TDMCONS.RegistraBitacora2(xUsuario:integer;xOperacion:string);
begin
  try
    T_Bita.Active:=true;
    T_Bita.Insert;
    T_BitaUsuario.AsInteger:=xUsuario;
    T_BitaOperacion.AsString:=xOperacion;
    T_BitaFecha.AsDateTime:=date;
    T_Bita.Post;
  except
  end;
end;

procedure TDMCONS.ConectaAplicacion;
begin
  if ModuloActual='' then
    exit;
  T_Logs.Active:=true;
  try
    T_Logs.Insert;
    T_LogsModulo.AsString:=ModuloActual;
    FechaHoraLog:=Now;
    T_LogsFechaHoraInicial.AsDateTime:=FechaHoraLog;
    T_Logs.Post;
    FechaHoraRefLog:=Now;
    FechaHoraPrecio:=Now;
    FechaHoraComando:=Now;
  finally
    T_Logs.Active:=false;
  end;
end;

procedure TDMCONS.RefrescaConexion;
begin
  FechaHoraRefLog:=Now;
  if ModuloActual='' then
    exit;
  T_Logs.Active:=true;
  try
    if T_Logs.Locate('Modulo;FechaHoraInicial',VarArrayOf([ModuloActual,FechaHoraLog]),[]) then begin
      T_Logs.Edit;
      T_LogsFechaHoraFinal.AsDateTime:=Now;
      T_Logs.Post;
    end;
  finally
    T_Logs.Active:=false;
  end;
end;

function TDMCONS.UltimoEstadoTanque(xtan:integer):string;
begin
  Q_Ctan.Active:=false;
  Q_Ctan.ParamByName('ptanque').AsInteger:=xtan;
  Q_Ctan.Active:=true;
  if Q_Ctan.IsEmpty then
    result:='A'
  else
    result:=Q_CtanNuevoEstado.AsString;
end;

procedure TDMCONS.CalculaFechasCorte;
var horascorte,hora,sigcorte:real;
begin
  Q_Cvol.Active:=false;Q_Cvol.Active:=true;
  FechaUltimoCorte:=Q_CvolFechaHoraInicial.AsDateTime;
  horascorte:=1/CortesPorDia;
  hora:=time;
  sigcorte:=0;
  while (sigcorte<=(hora+5*TmSegundo)) do
    sigcorte:=sigcorte+horascorte;
  FechaSiguienteCorte:=date+sigcorte;
  FechaSiguienteCorte2:=date+Q_CvolCorte.AsInteger*horascorte;
  if (FechaSiguienteCorte-FechaUltimoCorte)>(1/CortesPorDia+5*TmSegundo) then
    FechaSiguienteCorte:=FechaSiguienteCorte-1/CortesPorDia;
end;

function TDMCONS.AplicarPrecios:boolean;
var swcon:boolean;
    xcomb:integer;
begin
  try
    result:=false;
    swcon:=DBGasCon.Connected;
    DBGasCon.Connected:=true;
    try
      Q_Prec.active:=false;
      Q_Prec.ParamByName('pfecha').asdatetime:=Now-1;
      Q_Prec.ParamByName('phora').asdatetime:=now;
      Q_Prec.active:=true;
      if Q_PrecPrecio.AsInteger>0 then begin
        while not Q_Prec.Eof do begin
          xcomb:=Q_PrecCombustible.AsInteger;
          if xcomb in [1..MaxComb] then
            if TabComb[xcomb].Activo then begin
              TabComb[xcomb].PrecioAnt:=TabComb[xcomb].Precio;
              TabComb[xcomb].Precio:=Q_PrecPrecio.AsFloat;
              TabComb[xcomb].AplicaPrecio:=true;
              TabComb[xcomb].FechaHora:=Q_PrecFechaHora.AsDateTime;
              TabComb[xcomb].Folio:=Q_PrecFolio.AsInteger;
            end;
          Q_Prec.Next;
        end;
        result:=true;
      end;
    finally
      Q_Prec.Active:=false;
      if not swcon then
        DBGasCon.Connected:=false;
    end;
  except
  end;
end;

procedure TDMCONS.CargaPreciosFH(xFechaHora:TDateTime;SwMeteAFisico:boolean);
var i:integer;
    swcon:boolean;
begin
  try
    swcon:=DBGasCon.Connected;
    DBGasCon.Connected:=true;
    try
      Q_CombIb.Active:=false;
      Q_CombIb.Active:=true;
      for i:=1 to MaxComb do begin
        if TabComb[i].Activo then begin
          SP_DamePrec.ParamByName('PCombust').asinteger:=i;
          SP_DamePrec.ParamByName('PFechaHora').asdatetime:=xFechaHora;
          SP_DamePrec.ExecProc;
          if not PrimeraCarga then
            TabComb[i].Precioant:=TabComb[i].Precio;
          TabComb[i].Precio:=SP_DamePrec.ParamByName('RPrecio').asfloat;
          if SwMeteAFisico then begin
            T_Tcmb.Active:=true;
            try
              if T_Tcmb.Locate('Clave',i,[]) then begin
                T_Tcmb.Edit;
                T_TcmbPrecioFisico.AsFloat:=TabComb[i].Precio;
                T_Tcmb.Post;
              end;
            finally
              T_Tcmb.Active:=false;
            end;
          end;
          if PrimeraCarga then
            TabComb[i].Precioant:=TabComb[i].Precio;
        end;
      end;
    finally
      if not swcon then
        DBGasCon.Connected:=false;
      PrimeraCarga:=false;
    end;
  except
  end;
end;

function TDMCONS.DamePrecioFH(xComb:integer;xFechaHora:TDateTime):real;
var swcon:boolean;
begin
  result:=0;
  try
    swcon:=DBGasCon.Connected;
    DBGasCon.Connected:=true;
    try
      SP_DamePrec.ParamByName('PCombust').asinteger:=xcomb;
      SP_DamePrec.ParamByName('PFechaHora').asdatetime:=xFechaHora;
      SP_DamePrec.ExecProc;
      result:=SP_DamePrec.ParamByName('RPrecio').asfloat;
    finally
      if not swcon then
        DBGasCon.Connected:=false;
    end;
  except
  end;
end;

procedure TDMCONS.CargaConfiguracionConsola;
var lin,ss:string;
    i:integer;
    lista:TStrings;
begin
  T_EstsIb.active:=true;
  T_EstsIb.Locate('Clave',emEstacionServicio,[]);
  NombreEstacion:=T_EstsIbNombre.AsString;
  PasswordNocturno:='';
  PasswordConsola:='';
  TipoClb:='1';
  ValorClb:='';
  ManejaPrecioCredito:='Si';
  SoportaSeleccionProducto:='Si';
  RedirigirHypercom:='No';
  AutostikEnGalones:='No';
  AjusteWayne:='No';
  VersionPam1000:='2';
  DigitosPam1000:='5';
  DecimalesPam1000:='1';
  RangoPosiciones:='';
  RangoPosiciones2:='';
  HayConsolaAlterna:='No';
  PasswordGasBoy:='GASBOY';
  DecimalesPrecio:=-1;
  MinimoHorasCorte:=0;
  CodigoSeguridadVeederRoot:='';
  TipoGasboy:=1;
  GasboyPtrPosicionHora:=0;
  SwImprimeBarras:=true;
  lista:=TStringList.Create;
  try
    lista.Assign(T_EstsIbConsola);
    for i:=0 to lista.Count-1 do begin
      lin:=lista[i];
      ss:=ExtraeElemStrSep(lin,1,'=');
      if Mayusculas(ss)='PASSWORDCONSOLA' then
        PasswordConsola:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='PASSWORDNOCTURNO' then
        PasswordNocturno:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='PASSWORDGASBOY' then
        PasswordGasboy:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='CODIGOSEGURIDADVEEDERROOT' then
        CodigoSeguridadVeederRoot:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='TIPOGASBOY' then
        TipoGasboy:=StrToIntDef(ExtraeElemStrSep(lin,2,'='),1);
      if Mayusculas(ss)='DECIMALESPRECIO' then
        DecimalesPrecio:=StrToIntDef(ExtraeElemStrSep(lin,2,'='),-1);
      if Mayusculas(ss)='MINIMOHORASCORTE' then
        MinimoHorasCorte:=StrToIntDef(ExtraeElemStrSep(lin,2,'='),0);
      if Mayusculas(ss)='GASBOYPTRPOSICIONHORA' then
        GasboyPtrPosicionHora:=StrToIntDef(ExtraeElemStrSep(lin,2,'='),1);
      if Mayusculas(ss)='IMPRIMECODIGOBARRAS' then
        SwImprimeBarras:=(ExtraeElemStrSep(lin,2,'=')<>'No');
      if Mayusculas(ss)='TIPOCLB' then
        TipoClb:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='VALORCLB' then
        ValorClb:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='MANEJAPRECIOCREDITO' then
        ManejaPrecioCredito:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='SOPORTASELECCIONPRODUCTO' then
        SoportaSeleccionProducto:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='REDIRIGIRHYPERCOM' then
        RedirigirHypercom:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='AUTOSTIKENGALONES' then
        AutostikEnGalones:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='AJUSTEWAYNE' then
        AjusteWayne:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='RANGOPOSICIONES' then
        RangoPosiciones:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='RANGOPOSICIONES2' then
        RangoPosiciones2:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='VERSIONPAM1000' then
        VersionPam1000:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='DIGITOSPAM1000' then
        DigitosPam1000:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='DECIMALESPAM1000' then
        DecimalesPam1000:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='HAYCONSOLAALTERNA' then
        HayConsolaAlterna:=ExtraeElemStrSep(lin,2,'=');
      if Mayusculas(ss)='MODOAUTORIZABENNETT' then
        ModoAutoriza:=StrToIntDef(ExtraeElemStrSep(lin,2,'='),0);
    end;
  finally
    lista.Free;
  end;
end;

procedure TDMCONS.ConectaBaseDatos;
begin
  DBGASCON.Connected:=false;
  DBGASCON.AliasName:=AliasConsolaEsts;
  DBGASCON.Connected:=true;
  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 05/ABR/2008
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "BOUCHER" AND RDB$RELATION_NAME STARTING "DPVGMOVI"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TABLE DPVGMOVI ADD BOUCHER VARCHAR(12)');
      Q_Auxi.ExecSQL;
      Q_Auxi.Active:=false;
    end;
  // FIN
  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 15/NOV/2007
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "DIGITOSGILBARCO" AND RDB$RELATION_NAME STARTING "DPVGBOMB"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGBOMB ADD DIGITOSGILBARCO DOM$LONGI');
        Q_Auxi.ExecSQL;

        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGBOMB ADD DECIMALESGILBARCO DOM$LONGI');
        Q_Auxi.ExecSQL;

        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DPVGBOMB SET DIGITOSGILBARCO=0, DECIMALESGILBARCO=0');
        Q_Auxi.ExecSQL;
      except
      end;
    end;
{
  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 20/SEP/2007
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "DIGITOAJUSTEVOL" AND RDB$RELATION_NAME STARTING "DPVGBOMB"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGBOMB ADD DIGITOAJUSTEVOL DOM$LONGI');
        Q_Auxi.ExecSQL;

        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DPVGBOMB SET DIGITOAJUSTEVOL=0');
        Q_Auxi.ExecSQL;
      except
      end;
    end;

  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 31/MAY/2007
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "TIPOPAGO" AND RDB$RELATION_NAME STARTING "DPVGMOVI"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TABLE DPVGMOVI ADD TIPOPAGO DOM$LONGI');
      Q_Auxi.ExecSQL;
      Q_Auxi.Active:=false;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
      Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "HORAMAX" AND RDB$RELATION_NAME STARTING "DPVGTURC"');
      Q_Auxi.Active:=true;
      if Q_AuxiEntero1.AsInteger=0 then begin
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGTURC ADD HORAMAX DOM$CHAR5');
        Q_Auxi.ExecSQL;
      end;
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DPVGMOVI SET TIPOPAGO=1');
      Q_Auxi.ExecSQL;
    end;
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "HORAMIN" AND RDB$RELATION_NAME STARTING "DPVGTURC"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TABLE DPVGTURC ADD HORAMIN DOM$CHAR5');
      Q_Auxi.ExecSQL;
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DPVGTURC SET HORAMIN="", HORAMAX=""');
      Q_Auxi.ExecSQL;
    end;
  // FIN VALIDACION

  // VALIDA EXISTENCIA DE CAMPOS NUEVOS ENE/2007
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "MANGUERA" AND RDB$RELATION_NAME STARTING "DPVGMOVI"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TABLE DPVGMOVI ADD MANGUERA DOM$LONGI');
      Q_Auxi.ExecSQL;
    end;

    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "DIGITOAJUSTEPRECIO" AND RDB$RELATION_NAME STARTING "DPVGBOMB"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TABLE DPVGBOMB ADD DIGITOAJUSTEPRECIO DOM$LONGI');
      Q_Auxi.ExecSQL;
    end;

    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "DIGITOAJUSTEPRECIO" AND RDB$RELATION_NAME STARTING "DPVGTCMB"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      Q_Auxi.Active:=false;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TABLE DPVGTCMB ADD DIGITOAJUSTEPRECIO DOM$LONGI');
      Q_Auxi.ExecSQL;
    end;
  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 22/FEB/2007
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "TANQUE" AND RDB$RELATION_NAME STARTING "DPVGBOMB"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGBOMB ADD TANQUE DOM$LONGI');
        Q_Auxi.ExecSQL;
      except
      end;
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGETAN ADD VENTAS DOM$FLOAT');
        Q_Auxi.ExecSQL;
      except
      end;
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DPVGETAN SET VENTAS=0');
        Q_Auxi.ExecSQL;
      except
      end;
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGTANQ ADD CALC_VENTAS_ENTRADAS DOM$CHAR2R_SINO DEFAULT "Si"');
        Q_Auxi.ExecSQL;
      except
      end;
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGTANQ ADD MAXIMAENTRADA DOM$FLOAT');
        Q_Auxi.ExecSQL;
      except
      end;
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DPVGTANQ SET CALC_VENTAS_ENTRADAS="No", MAXIMAENTRADA=100000');
        Q_Auxi.ExecSQL;
      except
      end;
    end;
  // FIN VALIDACION


  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 14/dic/2006
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "MODOOPERACION" AND RDB$RELATION_NAME STARTING "DPVGBOMB"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGBOMB ADD MODOOPERACION DOM$CHAR8R');
        Q_Auxi.ExecSQL;

        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DPVGBOMB SET ModoOperacion="Normal"');
        Q_Auxi.ExecSQL;

        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGBOMB');
        Q_Auxi.SQL.Add('  ADD CONSTRAINT DPVGBOMBCHECKCONSTRAINT1');
        Q_Auxi.SQL.Add('  CHECK (ModoOperacion="Normal" or ModoOperacion="Prepago")');
        Q_Auxi.ExecSQL;

        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('CREATE TRIGGER DPVGBOMBTRIGGER1 FOR DPVGBOMB BEFORE INSERT POSITION 0 AS');
        Q_Auxi.SQL.Add('BEGIN');
        Q_Auxi.SQL.Add('  IF (NEW.MODOOPERACION IS NULL) THEN');
        Q_Auxi.SQL.Add('    NEW.MODOOPERACION="Normal";');
        Q_Auxi.SQL.Add('END');
        Q_Auxi.ExecSQL;
      except
      end;
    end;

  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 22/dic/2006
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "LICENCIA2" AND RDB$RELATION_NAME STARTING "DPVGCONF"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGCONF ADD LICENCIA2 DOM$CHAR8');
        Q_Auxi.ExecSQL;
      except
      end;
    end;

  // VALIDA EXISTENCIA DE CAMPOS NUEVOS 29/dic/2006
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from RDB$RELATION_FIELDS');
    Q_Auxi.SQL.Add('WHERE RDB$FIELD_NAME STARTING "ESTEMPORAL" AND RDB$RELATION_NAME STARTING "DPVGCONF"');
    Q_Auxi.Active:=true;
    if Q_AuxiEntero1.AsInteger=0 then begin
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGCONF ADD ESTEMPORAL DOM$CHAR2R_SINO');
        Q_Auxi.ExecSQL;
      except
      end;
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('ALTER TABLE DPVGCONF ADD FECHAVENCE DOM$DATE');
        Q_Auxi.ExecSQL;
      except
      end;
      try
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DPVGCONF SET ESTEMPORAL="No"');
        Q_Auxi.ExecSQL;
      except
      end;
    end;

   }

  DBGASCONAfterConnect(Self);

  ConectaAplicacion;
  CargaConfiguracionConsola;
  T_MoviIb.Active:=true;
  T_ConfIb.Active:=true;
  if T_ConfIb.IsEmpty then
    raise Exception.Create('No existe configuración del sistema');
  T_ConfIb.Edit;
  T_ConfIbLevantar_Consolas.AsString:='Si';
  T_ConfIb.Post;
  lcLicencia:=T_ConfIbLicencia.AsString;
  lcLicTemporal:=T_ConfIbEsTemporal.AsString='Si';
  lcLicVence:=T_ConfIbFechaVence.AsDateTime;
  lcLicencia2:=T_ConfIbLicencia2.AsString;
  StLevanta:=T_ConfIbLevantar_Consolas.AsString;
  lcSerie:=T_ConfIbNumeroSerie.AsInteger;
  T_EmprIb.Active:=true;
  T_EstsIb.Active:=true;
  if T_EstsIb.IsEmpty then
    raise Exception.Create('No existe estacion configurada');
  if T_EmprIb.IsEmpty then
    raise Exception.Create('No existe empresa configurada');
  emEstacionServicio:=T_EmprIbEstacion_Igas.AsInteger;
  if not T_EstsIb.Locate('Clave',emEstacionServicio,[]) then begin
    T_EstsIb.First;
    emEstacionServicio:=T_EstsIbClave.asinteger;
  end;
  T_Puer.Active:=true;
  if T_Puer.Locate('Clave',ModuloActual,[]) then begin
    ptPuerto:=T_PuerNumeroPuerto.AsInteger;
    ptBaudios:=T_PuerVelocidad.AsInteger;
    ptParidad:=copy(T_PuerParidad.AsString,1,1);
    case ptParidad[1] of
      'I':ptParidad:='O'; // Odd
      'P':ptParidad:='E'; // Even
      'E':ptParidad:='S'; // Space
    end;
    ptBitsDatos:=T_PuerBitsDatos.AsInteger;
    ptBitsParada:=T_PuerBitsParo.asinteger;
  end
  else begin
    ptPuerto:=1;
    ptBaudios:=9600;
    ptParidad:='N';
    ptBitsDatos:=8;
    ptBitsParada:=1;
  end;
  ChecaTablas;
end;

procedure TDMCONS.ChecaTablas;
begin
  T_ConsIb.Active:=true;
  try
    T_ConfIb.Active:=true;
    LectorSerial:=T_ConfIbLectorSerial.AsBoolean;
    xPosCliente:=T_ConfIbPosCliente.AsInteger;
    xLongCliente:=T_ConfIbLongCliente.AsInteger;
    xPosVehiculo:=T_ConfIbPosVehiculo.AsInteger;
    xLongVehiculo:=T_ConfIbLongVehiculo.AsInteger;
    ConfigPuertoTarjeta2:=T_ConfIbConfigPuertoTarjeta.AsString;
    SwPermiteCambioFechaHora:=(T_ConfIbPermitir_Cambio_FechaHora.AsString='Si');
  finally
    T_ConfIb.Active:=false;
  end;
  T_TarjIb.Active:=false;
end;

procedure TDMCONS.DataModuleCreate(Sender: TObject);
begin
  ThousandSeparator := ',';
  DecimalSeparator := '.';        
  DateSeparator := '/';
  ShortDateFormat := 'dd/mm/yyyy';
  Application.UpDateFormatSettings := False;
  //
  ContadorTot:=0;
  ContadorTotPos:=0;
  ListaSolicitud:=TStringList.Create;
  ListaLog:=TStringList.Create;
  ModuloActual:='';
  PrimeraCarga:=true;
  SwCorteTurno:=false;
  SwCorteParcial:=false;
  SwSolicitud:=false;
  SwPrecioFisico:=true;
  SwCambioPrecio:=false;
  SwChecaVentaTarjeta:=true;
  UltimaFechaHora:=Now;
  SwFechaHoraTM:=true;
  //lcActualiza:=false;
  ListaConsola:=TStringList.Create;
  HoraUltimoCorte:=date-1;
end;


function TDMCONS.LeeTxtConsola(xpos:integer):boolean;
var lin:string;
    i,pc:integer;
begin
  result:=false;
  lcDescEstatus:='';
  for i:=0 to ListaConsola.Count-1 do begin
    lin:=ListaConsola[i];
    pc:=StrToIntDef(ExtraeElemStr(lin,1),0);
    if xpos=pc then begin
      lcPosCarga:=pc;
      lcMonVol:=ExtraeElemStr(lin,2);
      lcValor:=StrToFloat(ExtraeElemStr(lin,3));
      lcEstatus:=ExtraeElemStr(lin,4);
      lcPosicion:=StrToIntDef(ExtraeElemStr(lin,5),1);
      lcVolumen:=StrToFloat(ExtraeElemStr(lin,6));
      lcPrecio:=StrToFloat(ExtraeElemStr(lin,7));
      lcImporte:=StrToFloat(ExtraeElemStr(lin,8));
      lcCombustible:=ExtraeElemStr(lin,9);
      lcDescEstatus:=ExtraeElemStr(lin,10);
      lcFolio:=StrToIntDef(ExtraeElemStr(lin,11),0);
      result:=true;
      exit;
    end;
  end;
end;


procedure TDMCONS.T_FactIbCalcFields(DataSet: TDataSet);
var i:integer;
begin
  i:=T_FactIbCombustible.AsInteger;
  T_FactIbNombreComb.AsString:=TabComb[i].Nombre;
end;

procedure TDMCONS.Q_Fact1CalcFields(DataSet: TDataSet);
var i:integer;
begin
  i:=Q_Fact1Combustible.AsInteger;
  if i in [1..MaxComb] then
    if TabComb[i].Activo then
      Q_Fact1NombreComb.AsString:=TabComb[i].Nombre;
end;

procedure TDMCONS.Q_Fact2CalcFields(DataSet: TDataSet);
var i:integer;
begin
  i:=Q_Fact2Combustible.AsInteger;
  if i in [1..MaxComb] then
    if TabComb[i].Activo then
      Q_Fact2NombreComb.AsString:=TabComb[i].Nombre;
end;

procedure TDMCONS.T_ConsIbCalcFields(DataSet: TDataSet);
begin
  if T_ConsIbEstatus.AsString='P' then
    T_ConsIbDescEstatus.AsString:='Cargando';
  if (T_ConsIbEstatus.AsString='F')or(T_ConsIbEstatus.AsString='f') then
    T_ConsIbDescEstatus.AsString:='Terminó';
end;

procedure TDMCONS.T_ConsIbAfterClose(DataSet: TDataSet);
begin
  (*
  if lcActualiza then begin
    //ConsolaIbToTxt; 22/Jun
    lcActualiza:=false;
  end;*)
end;

procedure TDMCONS.Q_CvolCalcFields(DataSet: TDataSet);
begin
  Q_CvolDescripCorte.AsString:='Corte '+IntToClaveNum(Q_CvolCorte.AsInteger,2)+' - '+FechaPaq(Q_CvolFecha.AsDateTime);
end;

procedure TDMCONS.Q_CvolAfterOpen(DataSet: TDataSet);
begin
  Q_Etan.Active:=true;
  T_Ctan.Active:=true;
  T_Cvolt.Active:=true;
  T_Cvold.Active:=true;
  Q_Movi.Active:=true;
end;

procedure TDMCONS.T_CtanCalcFields(DataSet: TDataSet);
begin
  if T_CtanNuevoEstado.AsString='A' then
    T_CtanDescEstado.AsString:='Activo';
  if T_CtanNuevoEstado.AsString='I' then
    T_CtanDescEstado.AsString:='Inactivo';
end;

procedure TDMCONS.Q_AuxiAfterClose(DataSet: TDataSet);
begin
  Q_AuxiReal1.FieldKind:=fkCalculated;
  Q_AuxiReal2.FieldKind:=fkCalculated;
  Q_AuxiReal3.FieldKind:=fkCalculated;
  Q_AuxiReal4.FieldKind:=fkCalculated;
  Q_AuxiReal5.FieldKind:=fkCalculated;
  Q_AuxiReal6.FieldKind:=fkCalculated;
  Q_AuxiEntero1.FieldKind:=fkCalculated;
  Q_AuxiEntero2.FieldKind:=fkCalculated;
  Q_AuxiChar1.FieldKind:=fkCalculated;
  Q_AuxiStr10.FieldKind:=fkCalculated;
  Q_AuxiStr10_2.FieldKind:=fkCalculated;
  Q_AuxiStr6_1.FieldKind:=fkCalculated;
  Q_AuxiStr6_2.FieldKind:=fkCalculated;
  Q_AuxiDate1.FieldKind:=fkCalculated;
end;

procedure TDMCONS.T_EtanTIPODOCValidate(Sender: TField);
begin
  if (T_EtanTipoDoc.AsString<>'CP')and(T_EtanTipoDoc.AsString<>'RP') then
    raise Exception.Create('Tipo de Documento perimito: CP o RP');
end;

procedure TDMCONS.RegistraTotales_BD(xposcarga:integer;xtotal01,xtotal02:real);
begin
  try
    Q_Cvol.Active:=false; //
    Q_Cvol.Active:=true;
    if not Q_Cvol.IsEmpty then begin
      if not T_Cvold.Locate('PosCarga',xposcarga,[]) then begin
        T_Cvold.Insert;
        T_CvoldFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
        T_CvoldCorte.AsInteger:=Q_CvolCorte.AsInteger;
        T_CvoldPosCarga.AsInteger:=xposcarga;
        T_CvoldTotal01.AsFloat:=xtotal01;
        T_CvoldTotal02.AsFloat:=xtotal02;
        T_Cvold.Post;
      end
      else begin
        T_Cvold.Edit;
        T_CvoldTotal01.AsFloat:=xtotal01;
        T_CvoldTotal02.AsFloat:=xtotal02;
        T_Cvold.Post;
      end;
    end;
  except
    if (T_Cvold.State in [dsInsert,dsEdit]) then
      T_Cvold.Cancel;
  end;
end;

procedure TDMCONS.RegistraTotales_BD4(xposcarga:integer;xtotal01,xtotal02,xtotal03,xtotal04:real);
begin
  try
    Q_Cvol.Active:=false; //
    Q_Cvol.Active:=true;
    if not Q_Cvol.IsEmpty then begin
      if not T_Cvold.Locate('PosCarga',xposcarga,[]) then begin
        T_Cvold.Insert;
        T_CvoldFecha.AsDateTime:=Q_CvolFecha.AsDateTime;
        T_CvoldCorte.AsInteger:=Q_CvolCorte.AsInteger;
        T_CvoldPosCarga.AsInteger:=xposcarga;
        T_CvoldTotal01.AsFloat:=xtotal01;
        T_CvoldTotal02.AsFloat:=xtotal02;
        T_CvoldTotal03.AsFloat:=xtotal03;
        T_CvoldTotal04.AsFloat:=xtotal04;
        T_Cvold.Post;
      end
      else begin
        T_Cvold.Edit;
        T_CvoldTotal01.AsFloat:=xtotal01;
        T_CvoldTotal02.AsFloat:=xtotal02;
        T_CvoldTotal03.AsFloat:=xtotal03;
        T_CvoldTotal04.AsFloat:=xtotal04;
        T_Cvold.Post;
      end;
    end;
  except
    if (T_Cvold.State in [dsInsert,dsEdit]) then
      T_Cvold.Cancel;
  end;
end;

procedure TDMCONS.CalculaTurnoActual(xFechaHora:TDateTime);
var xhor,xhori,xhorf,xhormin,xhormax:string;
    margenant,margenpos:real;
begin
  margenant:=3/24;Margenpos:=3/24;
  xhor:=FiltraStrNum(HoraToStr24(xFechaHora));
  T_Turc.Active:=false;
  T_Turc.Active:=true;
  TurnoActual:=0;FechaTurnoActual:=Trunc(xFechaHora);
  T_Turc.First;
  while not T_Turc.Eof do begin
    xhori:=FiltraStrNum(T_TurcHoraInicial.AsString);
    xhorf:=FiltraStrNum(T_TurcHoraFinal.AsString);
    xhormin:=FiltraStrNum(T_TurcHoraMin.AsString);
    if xhormin='' then begin
      xhormin:='0000';
      margenant:=0.5/24;
    end;
    xhormax:=FiltraStrNum(T_TurcHoraMax.AsString);
    if xhormax='' then begin
      xhormax:='0000';
      margenpos:=0.5/24;
    end;
    if (xhori<=xhorf) then begin
      if (xhor>=xhori)and(xhor<=xhorf) then begin
        TurnoActual:=T_TurcTurno.AsInteger;
        IniTurnoActual:=FechaTurnoActual+StrToHora(xhori);
        FinTurnoActual:=FechaTurnoActual+StrToHora(xhorf);
        FinTurnoActualMin:=FechaTurnoActual+StrToHora(xhormin);
        FinTurnoActualMax:=FechaTurnoActual+StrToHora(xhormax);

        if (FinTurnoActualMax<FinTurnoActual) then
          FinTurnoActualMax:=FinTurnoActualMax+1;

        if (FinTurnoActual-FinTurnoActualMin)>margenant then
          FinTurnoActualMin:=FinTurnoActual-margenant;
        if (FinTurnoActual<FinTurnoActualMin) then
          FinTurnoActualMin:=FinTurnoActual;

        if (FinTurnoActualMax-FinTurnoActual)>margenpos then
          FinTurnoActualMax:=FinTurnoActual+margenpos;
        if (FinTurnoActualMax<FinTurnoActual) then
          FinTurnoActualMax:=FinTurnoActual;

        FinTurnoActualMargenPos:=FinTurnoActualMax-FinTurnoActual;
        FinTurnoActualMargenAnt:=FinTurnoActual-FinTurnoActualMin;
      end;
    end
    else if (xhor<=xhorf)or(xhor>=xhori) then begin
      TurnoActual:=T_TurcTurno.AsInteger;
      if (xhor<=xhorf) then
        FechaTurnoActual:=Trunc(xFechaHora)-1;
      IniTurnoActual:=FechaTurnoActual+StrToHora(xhori);
      FinTurnoActual:=FechaTurnoActual+1+StrToHora(xhorf);
    end;
    T_Turc.Next;
  end;
  Q_Turn.Active:=false;Q_Turn.Active:=true;
end;

procedure TDMCONS.AgregaLog(lin:string);
var lin2:string;
    i:integer;
begin
  lin2:='';
  for i:=1 to length(lin) do
    case lin[i] of
      #2:lin2:=lin2+'<STX>';
      #3:lin2:=lin2+'<ETX>';
      #6:lin2:=lin2+'<ACK>';
      #21:lin2:=lin2+'<NAK>';
      else lin2:=lin2+lin[i];
    end;
  while ListaLog.Count>3000 do
    ListaLog.Delete(0);
  ListaLog.Add(lin2);
end;

function TDMCONS.DameTotalCombuPos(xpos,xcomb:integer;xtot1,xtot2:real):real;
var i,xt:integer;
begin
  xt:=0;
  for i:=1 to 2 do
    if TCombuPos[i,xpos]=xcomb then
      xt:=i;
  case xt of
    1:result:=xtot1;
    2:result:=xtot2;
    else result:=0;
  end;
end;

procedure TDMCONS.DBGASCONAfterConnect(Sender: TObject);
var xt,xp:integer;
begin
  for xt:=1 to 2 do
    for xp:=1 to 32 do
      TCombuPos[xt,xp]:=0;
  QL_Bomb.Active:=true;
  try
    xp:=0;
    while not QL_Bomb.Eof do begin
      if QL_BombPosCarga.AsInteger>xp then begin
        xp:=QL_BombPosCarga.AsInteger;
        xt:=1;
      end
      else inc(xt);
      if xt in [1..2] then
        TCombuPos[xt,xp]:=QL_BombCombustible.AsInteger;
      QL_Bomb.Next;
    end;
  finally
    QL_Bomb.Active:=false;
  end;
end;

procedure TDMCONS.CargaAdicional;
var narch,ss,ss1,ss2,ss3:string;
    lista:TStrings;
    i,xpos:integer;
begin
  for i:=1 to 32 do begin
    TAdic[i]:='';
    TAdic2[i]:='';
    TAdic3[i]:=0;
  end;
  StAdic:=0;
  Lista:=TStringList.Create;
  try
    narch:=DirectorioWindows+'\Adicional.Txt';
    if FileExists(narch) then begin
      Lista.LoadFromFile(narch);
      for i:=0 to Lista.Count-1 do begin
        ss:=Lista[i];
        if NoElemStrSep(ss,'=')>=2 then begin
          ss1:=ExtraeElemStrSep(ss,1,'='); // pos carga
          ss2:=ExtraeElemStrSep(ss,2,'='); // parte fija
          ss3:=ExtraeElemStrSep(ss,3,'='); // tipo
          xpos:=strtointdef(ss1,0);
          if xpos in [1..32] then begin
            TAdic[xpos]:=ss2;
            if ss3<>'' then
              TAdic2[xpos]:=ss3;
          end;
        end;
      end;
    end;
    Lista.Clear;
    try
      Lista.LoadFromFile(DirectorioWindows+'\AdicTmp.Txt');
      for i:=0 to Lista.Count-1 do begin
        if i=0 then
          stadic:=strtointdef(lista[0],0)
        else if i in [1..32] then
          tadic3[i]:=StrToFloat(lista[i]);
      end;
    except
    end;
  finally
    Lista.Free;
  end;
end;

procedure TDMCONS.ActivaModoPrepago(xpos:integer);
begin
  Q_Auxi.Active:=false;
  Q_Auxi.SQL.Clear;
  Q_Auxi.SQL.Add('UPDATE DPVGBOMB SET ModoOperacion="Prepago"');
  if xpos>0 then
    Q_Auxi.SQL.Add('WHERE POSCARGA='+inttostr(xpos));
  Q_Auxi.ExecSQL;
end;

procedure TDMCONS.DesActivaModoPrepago(xpos:integer);
begin
  Q_Auxi.Active:=false;
  Q_Auxi.SQL.Clear;
  Q_Auxi.SQL.Add('UPDATE DPVGBOMB SET ModoOperacion="Normal"');
  if xpos>0 then
    Q_Auxi.SQL.Add('WHERE POSCARGA='+inttostr(xpos));
  Q_Auxi.ExecSQL;
end;


end.
