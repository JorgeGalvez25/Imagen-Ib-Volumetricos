object FORMPUER: TFORMPUER
  Left = 113
  Top = 277
  Width = 387
  Height = 235
  Caption = 'FORMPUER'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object puerto: TApdComPort
    ComNumber = 4
    Parity = pEven
    DataBits = 7
    AutoOpen = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = puertoTriggerAvail
    Left = 24
    Top = 40
  end
end
