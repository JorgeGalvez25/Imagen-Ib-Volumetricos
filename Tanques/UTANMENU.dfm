object FTANMENU: TFTANMENU
  Left = 202
  Top = 126
  Width = 931
  Height = 579
  HorzScrollBar.Color = clGreen
  HorzScrollBar.ParentColor = False
  HorzScrollBar.Range = 100
  HorzScrollBar.Size = 10
  VertScrollBar.ButtonSize = 10
  VertScrollBar.Color = clGreen
  VertScrollBar.Margin = 10
  VertScrollBar.ParentColor = False
  VertScrollBar.Range = 478
  AutoScroll = False
  Caption = 'I-Gas Monitor de Tanques Versi'#243'n 4.2   -   I-Gas Volum'#233'trico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object VrCalendar1: TVrCalendar
    Left = 280
    Top = 240
    Width = 225
    Height = 145
    Palette.Low = clGreen
    Palette.High = clLime
    Grid.Style = gsLowered
    Grid.Color = clLime
    Grid.Highlight3D = clBtnHighlight
    Grid.Shadow3D = clBtnShadow
    Grid.Width = 1
    Bevel.InnerShadow = clBtnShadow
    Bevel.InnerHighlight = clBtnHighlight
    Bevel.InnerWidth = 2
    Bevel.InnerStyle = bsLowered
    Bevel.InnerSpace = 0
    Bevel.InnerColor = clBlack
    Bevel.OuterShadow = clBtnShadow
    Bevel.OuterHighlight = clBtnHighlight
    Bevel.OuterStyle = bsRaised
    Bevel.OuterOutline = osOuter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 499
    Width = 915
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Bevel1: TBevel
      Left = 22
      Top = 11
      Width = 230
      Height = 21
    end
    object AbGradient2: TAbGradient
      Left = 1
      Top = 1
      Width = 610
      Height = 39
      Align = alClient
      GradSettings.ColorFrom = 12704249
      GradSettings.ColorTo = 8569087
      GradSettings.Visible = False
      GradSettings.Style = gsHorizontal1
    end
    object StaticText2: TStaticText
      Left = 7
      Top = 13
      Width = 226
      Height = 17
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object Panel21: TPanel
      Left = 611
      Top = 1
      Width = 303
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object AbGradient3: TAbGradient
        Left = 0
        Top = 0
        Width = 303
        Height = 39
        Align = alClient
        GradSettings.ColorFrom = 12704249
        GradSettings.ColorTo = 8569087
        GradSettings.Visible = False
        GradSettings.Style = gsHorizontal1
      end
      object Label4x: TLabel
        Left = 110
        Top = 13
        Width = 73
        Height = 16
        Caption = 'Emulaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object BitBtn3: TBitBtn
        Left = 201
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Minimizar'
        TabOrder = 0
        OnClick = BitBtn3Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88880000000000000008088CCCCC88888808088CCCCC88888808000000000000
          0008888884888888888888884448888888888884444488888888888884888888
          8888888884888888888888888888888CCCCC88888848888C888C88888884888C
          888C88888888844C888C88888888888CCCCC8888888888888888}
      end
    end
    object StaticText3: TStaticText
      Left = 520
      Top = 11
      Width = 201
      Height = 24
      Caption = 'Error de Comunicacion !!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 256
      Top = 15
      Width = 257
      Height = 17
      Caption = 'Registo de Entrada ACTIVO'
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      OnClick = CheckBox3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 499
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 915
      Height = 499
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Tanques'
        object PageControl2: TPageControl
          Left = 185
          Top = 0
          Width = 722
          Height = 471
          ActivePage = TabSheet4
          Align = alClient
          Style = tsButtons
          TabOrder = 2
          object TabSheet4: TTabSheet
            Caption = 'Del 1 al 2'
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 714
              Height = 440
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object PanelA2: TPanel
                Left = 0
                Top = 212
                Width = 714
                Height = 233
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 2
                object AbTank2: TAbTank
                  Left = 15
                  Top = 40
                  Width = 177
                  Height = 169
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clYellow
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom2: TVrLabel
                  Left = 53
                  Top = 64
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter2: TvrThermoMeter
                  Left = 192
                  Top = 31
                  Width = 82
                  Height = 182
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentShowHint = False
                  ParentFont = False
                  ShowHint = False
                end
                object VrMatrix2: TVrMatrix
                  Left = 24
                  Top = 2
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel3x: TVrLabel
                  Left = 316
                  Top = 185
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel10: TVrLabel
                  Left = 312
                  Top = 78
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel11: TVrLabel
                  Left = 263
                  Top = 106
                  Width = 128
                  Height = 25
                  Alignment = taRightJustify
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel12: TVrLabel
                  Left = 311
                  Top = 130
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel13: TVrLabel
                  Left = 310
                  Top = 157
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel14: TVrLabel
                  Left = 314
                  Top = 50
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel16: TVrLabel
                  Left = 402
                  Top = 33
                  Width = 81
                  Height = 20
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_2: TNumericEditor
                  Left = 390
                  Top = 55
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_2: TNumericEditor
                  Left = 390
                  Top = 81
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_2: TNumericEditor
                  Left = 390
                  Top = 107
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_2: TNumericEditor
                  Left = 390
                  Top = 133
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_2: TNumericEditor
                  Left = 390
                  Top = 159
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_2: TNumericEditor
                  Left = 390
                  Top = 185
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
              object PanelA1: TPanel
                Left = 0
                Top = 0
                Width = 714
                Height = 212
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 0
                object AbGradient1: TAbGradient
                  Left = 208
                  Top = 112
                  Width = 50
                  Height = 50
                  GradSettings.Visible = False
                  GradSettings.Style = gsHorizontal1
                end
                object AbTank1: TAbTank
                  Left = 15
                  Top = 40
                  Width = 177
                  Height = 169
                  OnDblClick = AbTank1DblClick
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clYellow
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom1: TVrLabel
                  Left = 53
                  Top = 64
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabelNom1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter1: TvrThermoMeter
                  Left = 192
                  Top = 31
                  Width = 81
                  Height = 182
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrMatrix1: TVrMatrix
                  Left = 25
                  Top = 3
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel4x: TVrLabel
                  Left = 316
                  Top = 185
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel5x: TVrLabel
                  Left = 312
                  Top = 78
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel6x: TVrLabel
                  Left = 263
                  Top = 106
                  Width = 128
                  Height = 25
                  Alignment = taRightJustify
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel7x: TVrLabel
                  Left = 311
                  Top = 130
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel8x: TVrLabel
                  Left = 310
                  Top = 157
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel9: TVrLabel
                  Left = 314
                  Top = 50
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel15: TVrLabel
                  Left = 402
                  Top = 33
                  Width = 81
                  Height = 21
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_1: TNumericEditor
                  Left = 390
                  Top = 55
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_1: TNumericEditor
                  Left = 390
                  Top = 81
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_1: TNumericEditor
                  Left = 390
                  Top = 107
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_1: TNumericEditor
                  Left = 390
                  Top = 133
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_1: TNumericEditor
                  Left = 390
                  Top = 159
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_1: TNumericEditor
                  Left = 390
                  Top = 185
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
              object CheckBox2: TCheckBox
                Left = 472
                Top = 8
                Width = 97
                Height = 17
                Caption = 'Por llenar 90%'
                TabOrder = 1
              end
            end
          end
          object TabSheet5: TTabSheet
            Caption = 'Del 3 al 4'
            ImageIndex = 1
            object Panel18: TPanel
              Left = 0
              Top = 0
              Width = 714
              Height = 440
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object PanelA3: TPanel
                Left = 0
                Top = 0
                Width = 714
                Height = 214
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 0
                object AbTank3: TAbTank
                  Left = 16
                  Top = 43
                  Width = 177
                  Height = 169
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clOlive
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom3: TVrLabel
                  Left = 53
                  Top = 64
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter3: TvrThermoMeter
                  Left = 192
                  Top = 43
                  Width = 82
                  Height = 173
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrMatrix3: TVrMatrix
                  Left = 24
                  Top = 8
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel18: TVrLabel
                  Left = 301
                  Top = 194
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel19: TVrLabel
                  Left = 297
                  Top = 87
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel20: TVrLabel
                  Left = 295
                  Top = 115
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel21: TVrLabel
                  Left = 296
                  Top = 139
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel22: TVrLabel
                  Left = 295
                  Top = 166
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel23: TVrLabel
                  Left = 299
                  Top = 59
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel24: TVrLabel
                  Left = 387
                  Top = 39
                  Width = 81
                  Height = 22
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_3: TNumericEditor
                  Left = 375
                  Top = 62
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_3: TNumericEditor
                  Left = 375
                  Top = 88
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_3: TNumericEditor
                  Left = 375
                  Top = 114
                  Width = 95
                  Height = 21
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_3: TNumericEditor
                  Left = 375
                  Top = 140
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_3: TNumericEditor
                  Left = 375
                  Top = 166
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_3: TNumericEditor
                  Left = 375
                  Top = 192
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
              object PanelA4: TPanel
                Left = 0
                Top = 214
                Width = 714
                Height = 219
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 1
                object AbTank4: TAbTank
                  Left = 16
                  Top = 47
                  Width = 177
                  Height = 169
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clOlive
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom4: TVrLabel
                  Left = 53
                  Top = 65
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter4: TvrThermoMeter
                  Left = 192
                  Top = 43
                  Width = 82
                  Height = 182
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrMatrix4: TVrMatrix
                  Left = 24
                  Top = 11
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel26: TVrLabel
                  Left = 301
                  Top = 194
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel27: TVrLabel
                  Left = 297
                  Top = 87
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel28: TVrLabel
                  Left = 295
                  Top = 115
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel29: TVrLabel
                  Left = 296
                  Top = 139
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel30: TVrLabel
                  Left = 295
                  Top = 166
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel31: TVrLabel
                  Left = 299
                  Top = 59
                  Width = 81
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel32: TVrLabel
                  Left = 387
                  Top = 39
                  Width = 81
                  Height = 22
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_4: TNumericEditor
                  Left = 375
                  Top = 62
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_4: TNumericEditor
                  Left = 375
                  Top = 88
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_4: TNumericEditor
                  Left = 375
                  Top = 114
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_4: TNumericEditor
                  Left = 375
                  Top = 140
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_4: TNumericEditor
                  Left = 375
                  Top = 166
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_4: TNumericEditor
                  Left = 375
                  Top = 192
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
            end
          end
          object TabSheet6: TTabSheet
            Caption = 'Del 5 al 6'
            ImageIndex = 2
            object Panel19: TPanel
              Left = 0
              Top = 0
              Width = 714
              Height = 440
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object PanelA5: TPanel
                Left = 0
                Top = 0
                Width = 714
                Height = 212
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 0
                object AbTank5: TAbTank
                  Left = 16
                  Top = 43
                  Width = 177
                  Height = 169
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clOlive
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom5: TVrLabel
                  Left = 53
                  Top = 64
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter5: TvrThermoMeter
                  Left = 192
                  Top = 43
                  Width = 82
                  Height = 171
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrMatrix5: TVrMatrix
                  Left = 24
                  Top = 4
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel34: TVrLabel
                  Left = 301
                  Top = 194
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel35: TVrLabel
                  Left = 297
                  Top = 87
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel36: TVrLabel
                  Left = 295
                  Top = 115
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel37: TVrLabel
                  Left = 296
                  Top = 139
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel38: TVrLabel
                  Left = 295
                  Top = 166
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel39: TVrLabel
                  Left = 299
                  Top = 59
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel40: TVrLabel
                  Left = 387
                  Top = 39
                  Width = 81
                  Height = 22
                  Color = clWhite
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_5: TNumericEditor
                  Left = 375
                  Top = 63
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_5: TNumericEditor
                  Left = 375
                  Top = 89
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_5: TNumericEditor
                  Left = 375
                  Top = 115
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_5: TNumericEditor
                  Left = 375
                  Top = 141
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_5: TNumericEditor
                  Left = 375
                  Top = 167
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_5: TNumericEditor
                  Left = 375
                  Top = 193
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
              object PanelA6: TPanel
                Left = 0
                Top = 212
                Width = 714
                Height = 227
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 1
                object AbTank6: TAbTank
                  Left = 16
                  Top = 56
                  Width = 177
                  Height = 169
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clOlive
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom6: TVrLabel
                  Left = 53
                  Top = 64
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter6: TvrThermoMeter
                  Left = 192
                  Top = 43
                  Width = 82
                  Height = 182
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrMatrix6: TVrMatrix
                  Left = 24
                  Top = 8
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel42: TVrLabel
                  Left = 301
                  Top = 190
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel43: TVrLabel
                  Left = 297
                  Top = 87
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel44: TVrLabel
                  Left = 295
                  Top = 115
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel45: TVrLabel
                  Left = 296
                  Top = 139
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel46: TVrLabel
                  Left = 295
                  Top = 166
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel47: TVrLabel
                  Left = 299
                  Top = 59
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel48: TVrLabel
                  Left = 387
                  Top = 39
                  Width = 81
                  Height = 22
                  Color = clWhite
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_6: TNumericEditor
                  Left = 375
                  Top = 62
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_6: TNumericEditor
                  Left = 375
                  Top = 88
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_6: TNumericEditor
                  Left = 375
                  Top = 114
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_6: TNumericEditor
                  Left = 375
                  Top = 140
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_6: TNumericEditor
                  Left = 375
                  Top = 166
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_6: TNumericEditor
                  Left = 375
                  Top = 192
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Del 7 al 8'
            ImageIndex = 3
            object Panel20: TPanel
              Left = 0
              Top = 0
              Width = 714
              Height = 440
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object PanelA7: TPanel
                Left = 0
                Top = 0
                Width = 714
                Height = 216
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 0
                object AbTank7: TAbTank
                  Left = 16
                  Top = 45
                  Width = 177
                  Height = 169
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clOlive
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom7: TVrLabel
                  Left = 53
                  Top = 64
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter7: TvrThermoMeter
                  Left = 192
                  Top = 43
                  Width = 82
                  Height = 171
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrMatrix7: TVrMatrix
                  Left = 24
                  Top = 8
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel50: TVrLabel
                  Left = 301
                  Top = 194
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel51: TVrLabel
                  Left = 297
                  Top = 87
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel52: TVrLabel
                  Left = 295
                  Top = 115
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel53: TVrLabel
                  Left = 296
                  Top = 139
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel54: TVrLabel
                  Left = 295
                  Top = 166
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel55: TVrLabel
                  Left = 299
                  Top = 59
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel56: TVrLabel
                  Left = 387
                  Top = 39
                  Width = 81
                  Height = 22
                  Color = clWhite
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_7: TNumericEditor
                  Left = 375
                  Top = 63
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_7: TNumericEditor
                  Left = 375
                  Top = 89
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_7: TNumericEditor
                  Left = 375
                  Top = 115
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_7: TNumericEditor
                  Left = 375
                  Top = 141
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_7: TNumericEditor
                  Left = 375
                  Top = 167
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_7: TNumericEditor
                  Left = 375
                  Top = 193
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
              object PanelA8: TPanel
                Left = 0
                Top = 216
                Width = 714
                Height = 218
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 1
                object AbTank8: TAbTank
                  Left = 16
                  Top = 44
                  Width = 177
                  Height = 169
                  Digit = 300
                  LimitUpper = 90.000000000000000000
                  LimitLower = 10.000000000000000000
                  SectorSettings.Offset = 0
                  SectorSettings.WidthOffset = 0
                  SignalSettings.Name1 = 'SignalName1'
                  SignalSettings.Name2 = 'SignalName2'
                  SignalSettings.ValueFormat = '##0.0'
                  SignalSettings.ValueTo = 100.000000000000000000
                  SignalSettings.ValueUnit = '%'
                  Value = 30.000000000000000000
                  PPHColor = clAqua
                  BevelValue.Style = bsLowered
                  BevelValue.Spacing = 0
                  BevelValue.BevelLine = blNone
                  BevelValue.Width = 2
                  BevelValue.Color = clBtnShadow
                  BevelValue.ColorShadowFrom = clBlack
                  BevelValue.ColorShadowTo = clBlack
                  BevelValue.ColorHighLightFrom = clBtnFace
                  BevelValue.ColorHighLightTo = clBtnFace
                  BevelValue.SurfaceGrad.Visible = False
                  BevelValue.SurfaceGrad.Style = gsHorizontal1
                  TankSettings.Style = tsHorizontal
                  TankSettings.CraterWidth = 20
                  TankSettings.BkColor = clBtnShadow
                  TankSettings.Color = clOlive
                  TankSettings.PenWidth = 2
                  TankSettings.PenColor = clBlack
                  Options = [opValue, opUnit]
                  FontUnitCol = clWhite
                  VIndOffsX = 0
                  VIndOffsY = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBtnHighlight
                  Font.Height = -13
                  Font.Name = 'System'
                  Font.Style = []
                end
                object VrLabelNom8: TVrLabel
                  Left = 53
                  Top = 64
                  Width = 100
                  Height = 25
                  Transparent = True
                  Color = clBtnFace
                  Caption = 'VrLabel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object vrThermoMeter8: TvrThermoMeter
                  Left = 192
                  Top = 43
                  Width = 82
                  Height = 171
                  ColorBefore = 33023
                  ShowCaption = True
                  Scale.Color = clBlack
                  Scale.FormatText = '%s'
                  Scale.Max = 50.000000000000000000
                  Scale.Min = 50.000000000000000000
                  Scale.Offset = 20
                  Scale.Step = 10.000000000000000000
                  Scale.SmallStep = 5.000000000000000000
                  Scale.HeightMax = 14
                  Scale.HeightMin = 8
                  SetPoint.Value = 33.333333333333340000
                  SetPoint.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  SetPoint.Shape = voBitmap
                  SetPoint.Color = clBlue
                  SetPoint.Visible = False
                  PeakMin.Value = 20.000000000000000000
                  PeakMin.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMin.Shape = voTriangle
                  PeakMin.Color = clYellow
                  PeakMin.Visible = False
                  PeakMax.Value = 140.000000000000000000
                  PeakMax.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  PeakMax.Shape = voTriangle
                  PeakMax.Color = clAqua
                  PeakMax.Visible = False
                  Value.Value = 20.000000000000000000
                  Value.Bitmap.Data = {
                    9A000000424D9A00000000000000760000002800000006000000090000000100
                    0400000000002400000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
                    3C00333CCC003CCCCC00CCCCCC003CCCCC00333CCC0033333C0033333300}
                  Value.Shape = voLine
                  Value.Color = clAqua
                  Value.Visible = False
                  Caption = 'Temperatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrMatrix8: TVrMatrix
                  Left = 24
                  Top = 8
                  Width = 424
                  Height = 30
                  Threaded = True
                  Leds = 26
                  Palette.Low = clBlack
                  Palette.High = clLime
                  Bevel.InnerShadow = clBtnShadow
                  Bevel.InnerHighlight = clBtnHighlight
                  Bevel.InnerWidth = 2
                  Bevel.InnerStyle = bsLowered
                  Bevel.InnerSpace = 1
                  Bevel.InnerColor = clBlack
                  Bevel.OuterShadow = clBtnShadow
                  Bevel.OuterHighlight = clBtnHighlight
                  Bevel.OuterStyle = bsRaised
                  Bevel.OuterOutline = osOuter
                  Color = clBlack
                  ParentColor = False
                  Text = ' Tanque 1'
                end
                object VrLabel58: TVrLabel
                  Left = 301
                  Top = 194
                  Width = 81
                  Height = 22
                  Color = clWhite
                  Caption = 'Vol. Util:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel59: TVrLabel
                  Left = 297
                  Top = 87
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Volumen:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel60: TVrLabel
                  Left = 295
                  Top = 115
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Por llenar:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel61: TVrLabel
                  Left = 296
                  Top = 139
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol Agua:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel62: TVrLabel
                  Left = 295
                  Top = 166
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Vol. Disp.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel63: TVrLabel
                  Left = 299
                  Top = 59
                  Width = 81
                  Height = 25
                  Color = clWhite
                  Caption = 'Fondaje:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object VrLabel64: TVrLabel
                  Left = 387
                  Top = 39
                  Width = 81
                  Height = 22
                  Color = clWhite
                  Caption = 'Lts.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
                object NumericEditor1_8: TNumericEditor
                  Left = 375
                  Top = 63
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor2_8: TNumericEditor
                  Left = 375
                  Top = 89
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor3_8: TNumericEditor
                  Left = 375
                  Top = 115
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor4_8: TNumericEditor
                  Left = 375
                  Top = 141
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor5_8: TNumericEditor
                  Left = 375
                  Top = 167
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
                object NumericEditor6_8: TNumericEditor
                  Left = 375
                  Top = 193
                  Width = 95
                  Height = 20
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clLime
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Margin = 0
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                  TabStop = True
                  VerticalAlignment = vaMiddle
                  AutoSelect = False
                  ReadOnly = True
                  ShowPreview = False
                  Text = '0.00'
                  Options = [eoAllowFloat, eoAllowSigns]
                end
              end
            end
          end
        end
        object Panel16: TPanel
          Left = 0
          Top = 0
          Width = 185
          Height = 471
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object VrLedClock1: TVrLedClock
            Left = 0
            Top = 0
            Width = 185
            Height = 200
            Threaded = True
            Active = True
            Hours = 10
            HourFormat = hfmt24h
            Minutes = 47
            Seconds = 42
            LedSize = 3
            Spacing = 8
            Align = alTop
          end
          object dxNavBar1: TdxNavBar
            Left = 0
            Top = 200
            Width = 185
            Height = 271
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ActiveGroupIndex = 0
            DefaultStyles.GroupBackground.BackColor = 8569087
            DefaultStyles.GroupBackground.BackColor2 = clWindow
            DefaultStyles.GroupBackground.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.GroupBackground.Font.Color = clWindowText
            DefaultStyles.GroupBackground.Font.Height = -11
            DefaultStyles.GroupBackground.Font.Name = 'MS Sans Serif'
            DefaultStyles.GroupBackground.Font.Style = []
            DefaultStyles.GroupBackground.HAlignment = haLeft
            DefaultStyles.GroupHeader.BackColor = 12704249
            DefaultStyles.GroupHeader.BackColor2 = clInfoBk
            DefaultStyles.GroupHeader.GradientMode = gmVertical
            DefaultStyles.GroupHeader.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.GroupHeader.Font.Color = clWindowText
            DefaultStyles.GroupHeader.Font.Height = -11
            DefaultStyles.GroupHeader.Font.Name = 'MS Sans Serif'
            DefaultStyles.GroupHeader.Font.Style = [fsBold]
            DefaultStyles.GroupHeader.HAlignment = haLeft
            DefaultStyles.GroupHeaderActive.BackColor = 12704249
            DefaultStyles.GroupHeaderActive.BackColor2 = 33023
            DefaultStyles.GroupHeaderActive.GradientMode = gmVertical
            DefaultStyles.GroupHeaderActive.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.GroupHeaderActive.Font.Color = clWindowText
            DefaultStyles.GroupHeaderActive.Font.Height = -11
            DefaultStyles.GroupHeaderActive.Font.Name = 'MS Sans Serif'
            DefaultStyles.GroupHeaderActive.Font.Style = [fsBold]
            DefaultStyles.GroupHeaderActive.HAlignment = haLeft
            DefaultStyles.GroupHeaderActiveHotTracked.BackColor = clMenuBar
            DefaultStyles.GroupHeaderActiveHotTracked.BackColor2 = clNone
            DefaultStyles.GroupHeaderActiveHotTracked.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.GroupHeaderActiveHotTracked.Font.Color = clWindowText
            DefaultStyles.GroupHeaderActiveHotTracked.Font.Height = -11
            DefaultStyles.GroupHeaderActiveHotTracked.Font.Name = 'MS Sans Serif'
            DefaultStyles.GroupHeaderActiveHotTracked.Font.Style = [fsBold]
            DefaultStyles.GroupHeaderActiveHotTracked.HAlignment = haLeft
            DefaultStyles.GroupHeaderActivePressed.BackColor = clHotLight
            DefaultStyles.GroupHeaderActivePressed.BackColor2 = clMenuBar
            DefaultStyles.GroupHeaderActivePressed.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.GroupHeaderActivePressed.Font.Color = clWindowText
            DefaultStyles.GroupHeaderActivePressed.Font.Height = -11
            DefaultStyles.GroupHeaderActivePressed.Font.Name = 'MS Sans Serif'
            DefaultStyles.GroupHeaderActivePressed.Font.Style = [fsBold]
            DefaultStyles.GroupHeaderActivePressed.HAlignment = haLeft
            DefaultStyles.GroupHeaderHotTracked.BackColor = clMenu
            DefaultStyles.GroupHeaderHotTracked.BackColor2 = clMenu
            DefaultStyles.GroupHeaderHotTracked.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.GroupHeaderHotTracked.Font.Color = clWindowText
            DefaultStyles.GroupHeaderHotTracked.Font.Height = -11
            DefaultStyles.GroupHeaderHotTracked.Font.Name = 'MS Sans Serif'
            DefaultStyles.GroupHeaderHotTracked.Font.Style = [fsBold]
            DefaultStyles.GroupHeaderHotTracked.HAlignment = haLeft
            DefaultStyles.GroupHeaderPressed.BackColor = clTeal
            DefaultStyles.GroupHeaderPressed.BackColor2 = clGreen
            DefaultStyles.GroupHeaderPressed.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.GroupHeaderPressed.Font.Color = clWindowText
            DefaultStyles.GroupHeaderPressed.Font.Height = -11
            DefaultStyles.GroupHeaderPressed.Font.Name = 'MS Sans Serif'
            DefaultStyles.GroupHeaderPressed.Font.Style = [fsBold]
            DefaultStyles.GroupHeaderPressed.HAlignment = haLeft
            DefaultStyles.DropTargetGroup.AlphaBlending = 60
            DefaultStyles.DropTargetGroup.AlphaBlending2 = 60
            DefaultStyles.DropTargetGroup.BackColor = clHighlight
            DefaultStyles.DropTargetGroup.BackColor2 = clMaroon
            DefaultStyles.DropTargetGroup.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.DropTargetGroup.Font.Color = clWindowText
            DefaultStyles.DropTargetGroup.Font.Height = -11
            DefaultStyles.DropTargetGroup.Font.Name = 'MS Sans Serif'
            DefaultStyles.DropTargetGroup.Font.Style = []
            DefaultStyles.DropTargetGroup.HAlignment = haLeft
            DefaultStyles.NavigationPaneHeader.BackColor = 8569087
            DefaultStyles.NavigationPaneHeader.BackColor2 = 4227327
            DefaultStyles.NavigationPaneHeader.GradientMode = gmVertical
            DefaultStyles.NavigationPaneHeader.Font.Charset = DEFAULT_CHARSET
            DefaultStyles.NavigationPaneHeader.Font.Color = clNone
            DefaultStyles.NavigationPaneHeader.Font.Height = -15
            DefaultStyles.NavigationPaneHeader.Font.Name = 'Arial'
            DefaultStyles.NavigationPaneHeader.Font.Style = [fsBold]
            DefaultStyles.NavigationPaneHeader.HAlignment = haLeft
            DragCopyCursor = -1119
            DragCursor = -1120
            DragDropFlags = [fAllowDragLink, fAllowDropLink, fAllowDragGroup, fAllowDropGroup]
            HotTrackedGroupCursor = crDefault
            HotTrackedLinkCursor = -1118
            LargeImages = ImageList1
            SmallImages = ImageList1
            View = 13
            object dxNavBar1Group1: TdxNavBarGroup
              Caption = 'Tanques'
              LinksUseSmallImages = False
              SelectedLinkIndex = -1
              ShowAsIconView = True
              ShowControl = False
              TopVisibleLinkIndex = 0
              UseControl = False
              UseSmallImages = True
              Visible = True
              Links = <
                item
                  Item = dxNavBar1Item1
                end
                item
                  Item = dxNavBar1Item2
                end
                item
                  Item = dxNavBar1Item3
                end
                item
                  Item = dxNavBar1Item4
                end>
            end
            object dxNavBar1Item1: TdxNavBarItem
              Caption = 'Del 1 al 2'
              Enabled = True
              LargeImageIndex = 0
              SmallImageIndex = 0
              Visible = False
              OnClick = dxNavBar1Item1Click
            end
            object dxNavBar1Item2: TdxNavBarItem
              Caption = 'Del 3 al 4'
              Enabled = True
              LargeImageIndex = 0
              SmallImageIndex = 0
              Visible = False
              OnClick = dxNavBar1Item2Click
            end
            object dxNavBar1Item3: TdxNavBarItem
              Caption = 'Del 5 al 6'
              Enabled = True
              LargeImageIndex = 0
              SmallImageIndex = 0
              Visible = False
              OnClick = dxNavBar1Item3Click
            end
            object dxNavBar1Item4: TdxNavBarItem
              Caption = 'Del 7 al 8'
              Enabled = True
              LargeImageIndex = 0
              SmallImageIndex = 0
              Visible = False
              OnClick = dxNavBar1Item4Click
            end
          end
        end
        object Panel17: TPanel
          Left = 0
          Top = -2
          Width = 1019
          Height = 30
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          object VrMatrix9: TVrMatrix
            Left = -1
            Top = 1
            Width = 1016
            Height = 30
            Threaded = True
            Leds = 63
            Palette.Low = clGreen
            Palette.High = clLime
            AutoScroll = True
            Bevel.InnerShadow = clBtnShadow
            Bevel.InnerHighlight = clBtnHighlight
            Bevel.InnerWidth = 2
            Bevel.InnerStyle = bsLowered
            Bevel.InnerSpace = 1
            Bevel.InnerColor = clBlack
            Bevel.OuterShadow = clBtnShadow
            Bevel.OuterHighlight = clBtnHighlight
            Bevel.OuterStyle = bsRaised
            Bevel.OuterOutline = osOuter
            Color = clBlack
            ParentColor = False
            Text = 'controles volum'#233'tricos, imagensoft'
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Trafico'
        ImageIndex = 1
        object SpeedButton1: TSpeedButton
          Left = 784
          Top = 72
          Width = 23
          Height = 22
          Visible = False
        end
        object Label8: TLabel
          Left = 176
          Top = 48
          Width = 92
          Height = 13
          Caption = 'Hora Veeder Root: '
          Visible = False
        end
        object StaticText1: TStaticText
          Left = 6
          Top = 4
          Width = 58
          Height = 17
          Caption = 'StaticText1'
          TabOrder = 0
        end
        object StaticText4: TStaticText
          Left = 7
          Top = 46
          Width = 110
          Height = 17
          Caption = 'Errores Comunicaci'#243'n:'
          TabOrder = 2
        end
        object StaticText5: TStaticText
          Left = 7
          Top = 25
          Width = 93
          Height = 17
          Caption = 'Ejecutando desde:'
          TabOrder = 1
        end
        object Button1: TButton
          Left = 8
          Top = 88
          Width = 119
          Height = 25
          Caption = 'Guardar Log'
          TabOrder = 3
          OnClick = Button1Click
        end
        object CheckBox1: TCheckBox
          Left = 168
          Top = 96
          Width = 153
          Height = 17
          Caption = 'Captar Entradas Previas'
          TabOrder = 4
        end
        object StaticText7: TStaticText
          Left = 8
          Top = 128
          Width = 58
          Height = 17
          Caption = 'StaticText7'
          TabOrder = 5
        end
        object StaticText6: TStaticText
          Left = 8
          Top = 152
          Width = 58
          Height = 17
          Caption = 'StaticText6'
          TabOrder = 6
        end
      end
    end
  end
  object ApdComPort1: TApdComPort
    ComNumber = 1
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = ApdComPort1TriggerAvail
    Left = 720
    Top = 24
  end
  object RxTrayIcon1: TRxTrayIcon
    Active = False
    Icon.Data = {
      0000010008001010000001000800680500008600000010100000010020006804
      0000EE0500001818000001000800C8060000560A000018180000010020008809
      00001E1100002020000001000800A8080000A61A00002020000001002000A810
      00004E2300003030000001000800A80E0000F63300003030000001002000A825
      00009E4200002800000010000000200000000100080000000000400100000000
      000000000000000000000000000000000000FFFFFF002755FF009F9B9B004F4F
      4F00B9C9FE00678AFD00D6C5C300777776002F2E2C00E4DEEE00B3B3B300FFEC
      E1006464640089898700393D4800D7D6D6003B61FF00C0C1C100C6CBED00EDEC
      F9002A4CEE00FFF3F200B2A7A700F1E3E2005858580094949400CDCDCB004747
      4700A3A4A4006F6F6F00D2D5E100BBBAB900FCE9ED00BBADAB007D7D7D002C5E
      FF00D8D5CC008E8E8E00838383005F5F5F00AEAEAE00D6CDCD00DDDADA00B1AF
      A600FFFAF900FBEFE900434343004B4B4B005353530068686800ACA9A9009999
      99002A50F300FAFCFF00FFEEED005B5B5B00D5D2C900C5C0C000FFF4ED00F9ED
      ED00CFCFCF008B8B8B00B1B1AF00A2A1A100AFADA9006987FE00555555006161
      6100C2C3C300B5B5B50096969600FDF4F400B9B8B800ADACAC00FFFDFD007878
      780097989800FFF9F700FFF5F400FFEFEF00B0B1B1005C5C5C00FEEFEC006060
      600067676700D6D5D5008C8C8C0095959500AFAFAD00BAB9B90097979700A3A3
      A300FFFFFE00FFF4F400FFF3F300CDCCCB00AEACAC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000001E320D54285238193104301C1C2F00004D
      5A2B1056603F4A493D1B25204300005B03015E4E0A0F093A0101023943000026
      40485F3B11152E015D05062C4400005845170121350C164F14241F0E23000000
      345107425337502D3613415500000000005C4622184B4B3C2A59081A00000000
      000034120B3361291D4C4700000000000000005B1A4757273E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008001
      000080010000800100008001000080010000C0030000E0030000F0070000F81F
      0000FFFF0000FFFF0000FFFF0000280000001000000020000000010020000000
      0000400400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B6B6BEC6666
      66F2626262F25E5E5EF25D5D5DF2595959F2585858F2555555F2505050F24C4C
      4CF2474747F2434343F2434343F23A3A3AE90000000000000000989999F8BCBB
      BBFEDDDADAFFD7D6D6FFD6D5D5FFCDCCCBFFB1B1AFFFADACACFFB9B8B8FFCFCF
      CFFFCDCDCBFFD8D5CCFFBDBCBBFE535353F50000000000000000979797EDA19D
      9DFEFFFFFFFFFFF4F4FFFFF9F7FFE4DEEEFF393D48FF2F2E2CFFC5C0C0FFFFFF
      FFFFFFFFFFFF2755FFFFD8D5CBFB4F4F4FEB0000000000000000858585C0A4A3
      A3FEFFF6F6FEFFF3F3FFFFF4EDFF3B61FFFF2A4CEEFFFBEFE9FFFFFFFFFFFFFF
      FEFFB9C9FEFF688BFFFDB2B0A7F64C4C4CC500000000000000007474746DC2C3
      C3FFB3A8A8FCFFFFFFFFFCE9EDFF2A50F3FFFFECE1FFFFF3F2FFFFF5F4FFEDEC
      F9FF2C5EFFFFD6D9E5F48B8B89FE4949497C00000000000000008686860A9797
      97E0B2B3B3FED8C7C5FD6987FEFFFEEFECFFFFEEEDFFFFEFEFFFFFFAF9FFFAFC
      FFFFC8CEF0FBB1AFAAFA646464F05A5A5A150000000000000000000000008E8E
      8E3BA4A4A4F6B7B7B7FEBDAFADFDF3E5E4FDFFFDFDFFFFFDFDFFFBEFEFFED8CF
      CFFDB1B1AFFD787877FE6666665A000000000000000000000000000000000000
      00008E8E8E3D989898E4C0C1C1FFB5B5B5FEAEABABFDB0AEAEFDB0B0B0FEA3A4
      A4FF777777F46F6F6F5E00000000000000000000000000000000000000000000
      0000000000009292920D7D7D7D758E8E8EC7969696F08C8C8CF37B7B7BD16F6F
      6F887474741C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00008001000080010000800100008001000080010000C0030000E003
      0000F0070000F81F0000FFFF0000FFFF0000FFFF000028000000180000003000
      00000100080000000000A0020000000000000000000000000000000000000000
      0000FFFFFF001D52FF00A19494004D4D4D007F9DFE00C9CBCB00262626007772
      72004B74FE00D3D9FC008889D100404C7D00F2DDDD00B1B1B1000033FF006060
      600096A5E900858585003C3C3B00A092C3003462FF00FFF1E900D9D9D900E5EA
      FC00E1CACA000D3FF100A4A4A400C0CEFD005D7FFF00BDBDBD00E6E6E6008F8F
      8F0057575700696969007C7C7C0044444400D6D3CB00F8EEF5009AA7F600436A
      FF00CAC2C2009C9C9C00958DC200D9E3FF00EFEBEB00ACAAAA00EDF1FF00FFF6
      F600DFDFDF0095959500144DFF00FFE7E70088A1FF00F6F2E600EDEAE1008599
      F800D0D1D100525252006E6E6E008A8A8A00C2C3C300003BFF00615D59007778
      78003B64FF00FFEDE300FFF6EE00E1CBD1008C85850048484800646464008181
      8100B9B9B900A0A0A000FCECEC00B4B5B500FFF0F000C2C0BB00FFFCF700C7C7
      C7005C5A5800D4D4D400B1AFAC0045453F00DCDCDC0071717100A49797009999
      9900A7A7A700B1AAAA00CDCDCD00A29D9D00A9A4A400BEBBB9005C5C5C00E2E2
      E000827E7E00FFFCFC00FFF3F3003E3E3E00EFDBDB00FFEBEA00EAE8E100C2BE
      BE0042424200464646004A4A4A0050505000545454005E5E5E00666666006C6C
      6C007E7E7E008C8C8C009191910093939300979797009E9E9E00A2A2A200FFED
      ED0059595900E9E5E500C7C1C100AEAEAD00A9A9A900FFFFFB00FDF2EF00FDE9
      E800C1C1C100ABACAC00FFFAF900FFEFEB00FDF2F200E7E4E400D2D2D2007E7B
      7B00C5C6C600B2B2AF00FFF8F800FFE9E900FFF2F000D4D4D200A5A7A7004343
      4300494949004E4E4E00585858005A5A5A0063636300E8E6E60067676700E1E1
      E1006D6D6D0070707000D3D3D3007B7B7B00CECECE007D7D7D007F7F7F008282
      820084848400898989008B8B8B008D8D8D009494940096969600AAAAAA009F9F
      9F00A8A8A800A1A1A100A6A6A600A5A5A500FFFEFE00FFFDFD00FFFBFB00FFFB
      F800FFFBF600FFF5F500FFF2F200FDF1F100FFEFEF00FFEEEE00ECEAE000E7E5
      E500A3A3A200ABABAB00FFFFFE00FFFBF700FFEDEC00E7E6E600C3C3C300BCBD
      BD00A6A7A700A8A9A90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000704795106E5F949321
      6D3A6C92046B6A249069646424000071BFC11B77AA4A4AA8AAAA76765832A573
      20A420A44600009E872E2D7A96B886BEACA9AB4A681F986067378EA69100009E
      1745AE8BB363B201515413077B0101013541B7749200009C3161ADAEB6B58D26
      1A0C3F5A01010101281D2520790000A39D404B01B67843383E14B0ADAF62012F
      0F1C53A0990000007DC00301AF6684332B1663B230837E091536B96F72000000
      A155230D014F270B42BDB54D63B10502188A7594000000001BAC9B0880011116
      8C348C78B2BB2C0A4EBA3B1200000000007481068844BC010101AD0101AD7F5E
      7C1222000000000000003C8139A65719B4B230856529824CA397000000000000
      000000745952508F325C5D2AC2490E489A0000000000000000000000AC72BABF
      5B893D1EA7A4567200000000000000000000000000004A2012A2A09F12320000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000010080000100800001008000
      01008000010080000100C0000100C0000300C0000300E0000700F0000F00F800
      1F00FC003F00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002800
      0000180000003000000001002000000000006009000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000656565E15F5F5FEA5D5D5DEA5A5A5AEA585858EA5656
      56EA545454EA525252EA505050EA4D4D4DEA4B4B4BEA494949EA474747EA4545
      45EA424242EA3E3E3EEA3C3C3CEA3A3A3AEA393939EA353535EA353535EA3535
      35DD00000000000000007D7D7DF4C3C3C3FFA6A7A7FFA4A4A4FFA2A2A2FFA1A1
      A1FFA0A0A0FFA0A0A0FF9F9F9FFFA1A1A1FFA1A1A1FF9E9E9EFF9E9E9EFF9999
      99FF959595FF949494FF919191FF8F8F8FFF8D8D8DFF8F8F8FFF8D8D8DFF4242
      42EF00000000000000007C7C7CF4D2D2D2FFAEACACFEEFEBEBFFE9E5E5FFE8E6
      E6FFE7E5E5FFE7E4E4FFE7E6E6FFA5A5A5FFA8A8A8FFA6A6A6FFA0A0A0FFC2BE
      BEFFE6E6E6FFE1E1E1FFE2E2E0FFEAE8E1FFEDEAE1FFD6D6D4FE969696FF4343
      43EF00000000000000007A7A7AEAD9D9D9FF8E8787FEFFFDFDFFFFF8F8FFFFF2
      F2FFFFF3F3FFFFF5F5FFFFFFFFFF5C5A58FF45453FFF3C3C3BFF262626FFC7C1
      C1FFFFFFFFFFFFFFFFFFFFFFFFFF88A1FFFF3B64FFFFEFEDE3FA939393FF4545
      45E600000000000000006F6F6FCADFDFDFFF837F7FFDFFFEFEFFFFFDFDFFFFEE
      EEFFFFEFEFFFFFF2F0FFF8EEF5FF0D3FF1FF404C7DFF615D59FFB1AAAAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF436AFFFF5D7FFFFFDAD7CEF48F8F8FFF4444
      44CC000000000000000072727293CECECEFF787979FEFEEEEEFDFFFFFFFFFFEE
      EEFFFFEDEDFFFFF6EEFF8599F8FF003BFFFFA092C3FFFFFBF8FFFFFEFEFFFFFB
      FBFFFFFCFCFFFFFFFFFFEDF1FFFF0033FFFFC2D0FFFEB3B1AEEE828282FF4646
      469D000000000000000076767645ABABABFEBCBDBDFFA29595FCFFFFFFFFFFFB
      FBFFFFEBEAFFFFEFEBFF144DFFFF958DC2FFFFF1E9FFFFF3F3FFFFF5F5FFFFF6
      F6FFFFFAF9FFFFFFFBFF4B74FEFF3462FFFFFDF9ECEEA5A5A4FE666666FF4B4B
      4B570000000000000000888888027D7D7DD5DCDCDCFF7D7D7DFDF4DFDFFCFFFF
      FFFFFFFCF7FF9AA7F6FF8889D1FFFFEDE3FFFFEDECFFFFEFEFFFFFF0F0FFFFF3
      F3FFFFFBF6FF7F9DFEFF1D52FFFFE8EDFFFBB4B4B1F2979797FF555555ED5151
      510A0000000000000000000000008D8D8D50A7A7A7FED3D3D3FF777272FCFFEB
      EAFDFFFFFFFF96A5E9FFFFF1E9FFFFE9E9FFFFE7E7FFFFE9E9FFFFEDEDFFFFF5
      F5FFFFFFFEFFD9E3FFFFD5DBFEFEC5C3BEF2ABABABFF6E6E6EFF5959597C0000
      000000000000000000000000000000000000848484A1C1C1C1FFC9CBCBFF7E7B
      7BFCE3CDD3FCFFFBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFEFEFFFFF4F1FDC0BDBBF7B0B0AFFE858585FF5C5C5CD2505050070000
      000000000000000000000000000000000000909090087F7F7FBFC1C1C1FFD0D1
      D1FF979797FDA59898FCE3CCCCFCFFF3F3FEFFF5F5FFFFF6F6FFFFF4F4FEF1DD
      DDFECCC4C4FDADAEAEFDB4B5B5FF8B8B8BFF616161E767676724000000000000
      00000000000000000000000000000000000000000000A3A3A309878787A8A9A9
      A9FED4D4D4FFC7C7C7FFA7A9A9FE969696FCA49F9FFBAAA5A5FC9D9D9DFDAAAB
      ABFEB9B9B9FFB1B1B1FF818181FF676767D87171712600000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      945A898989E0ABABABFFC3C3C3FFCDCDCDFFC5C6C6FFC2C3C3FFBDBDBDFFAAAA
      AAFF8D8D8DFF707070F57171718B7979790C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000068686805848484517D7D7DA07E7E7ED3888888EE808080F0787878DC7373
      73B07272726C7474741500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800001008000
      010080000100800001008000010080000100C0000100C0000300C0000300E000
      0700F0000F00F8001F00FC003F00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002800000020000000400000000100080000000000800400000000
      000000000000000000000000000000000000FFFFFF002256FF009C9C9C00504E
      4E0080A1FF003249A600DCC6C6006C6FCA0075757500BCCDFD000025FF002F2F
      2F00587AFB00B6B6B600E6E6E600FBD9CF0088888800616161004169FF00D6D2
      F3000C45FF003F3F3F006B8CFF00FFECEC006178E300E2E9FF00B3A0A000D6D6
      D600C5C5C500AAA8AF006B6B6B0092929200B1C2FF00FDE1E100003BFF00E5DB
      DB007E7E7E00BCACAC0059585800F9F9EF00194BFF00E2D8EF00C2BBBB003737
      3700CECECE004B76FD0047474700A8989800E4CFC900A3A3A300F3D5C900DDE3
      F800888080006677DA00FFF8F7007293FF006585FD00DED0D000DCDCDC00002E
      FF00B1A6A600E9EEFE008D8D8D00B1B1B100979797006B6565004D4B4300ABA2
      A200083EFF00FFFEF100F7F7F700FCF2F20053535300CACACA00CAC1C100C1C1
      C1006B73D000DCE4FF00BCBCBC00A49E9E00ADADAB005D5D5D00E9DFDF00E2E2
      E2006F6F6F00FFF2E900E2E1DB0082828200FFF8ED00F9F1EC00D1D2D200A7A7
      A6001247FF00D8D6D0004B4B4900FBFBF900948E8E00DBCACA00B6A8A8001745
      FF00343434003A3A3A0042424200D9D9D90072727200787878007B7B7B008585
      85009F9F9F000033FF00FFF2EF00FDF9F30067676700BAB9B900FFFDFB005A7B
      FF00678AFF00E3CCCC00AAAAAA00FFF4F400FFE9E900B5B2B2000D49FF005656
      5600A59A9A00AEA0A000999A9A00AEAFAF00454644004D4C4C00515250003C3C
      3C00FDFDFD005B5B5B00E8E8E8005F5F5F0063636300E0E0E000DEDEDE006969
      6900CCCCCC00C8C8C80080808000C3C3C300BDBEBE008A8A8A008F8F8F009494
      9400A1A1A100406CFE00F8D8CE00FFFAF900FFEFED00B5B5B300FDFCF700D0D0
      D000A5A5A500FFF2F200AEA2A200ABADAD00FDF6F6007677770086848300BFBF
      BF00BCBBBA00B3B3B30044444400FFFCFC00FDF4F300FFF0F000FDECEC00F3D6
      CB001047FF00FFF7F500FDF2F2005D5B5B00FFECEA00ADADAD00353535003636
      3600383838003D3D3D004040400041414100464646004A4A4A00FCFCFC004F4F
      4F00FBF3F30054545400575757005C5C5C005E5E5E00E7E7E70060606000DDDD
      DD006A6A6A00DBDBDB006E6E6E0079777700CDCDCD00CBCBCB007C7C7C006D70
      C900C8C9C9007D7D7D00C7C7C7007F7F7F0081818100C2C2C200868686008787
      8700BDBDBD0089898900BBBAB9008B8B8B008C8C8C00B8B8B8008E8E8E00B4B4
      B4009191910093939300959595009696960098989800ACACAC00ABABAB00AAAC
      AC009B9B9B00A9A9A9009D9D9D009E9E9E00A2A2A20045454500FFFEFE00FFFD
      FD00FFFEFB00FFFBFB00FFF8F800FFF6F600FFF5F500F8F8F70051515100FFF3
      F300FFF1F100FFEFEF00FFEEEE00FFEDED0059595900FFEBEB00FFEAEA00D1D1
      D100C6C6C600BBBBBB00B7B7B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000C588C1C0C0F9BF7CBEBEF3BCBC82BABA2F
      EAA767B716B68466B52CB365B40000C5FC03E70303E57FE57FE141E0DF94DE20
      DDDDDB3FD9D9D61111D3D48FB80000C5C2405B8DCA4ACDCF8EFDFD8D2DC92D2D
      8D1DA4D5D54FFEA5D77295936700005587CE2BF148AF4848BDBD98A389125227
      8244854747F29B3434855C3FA70000690F933D98ECF4F5F59E78731E435FB916
      0C2401010101010B64BBE5D8BA0000CE688035EE01F1F6F6AAF5461306838104
      4B01EB0101014E3C7428E76C4900003F4CCAB0A101EEF8F8F76F144523083101
      01A8EBEB0101386E215EE90971000000E1C66962A801F71818590D15CCAC98F0
      F0EF98A8013EAD29855132C358000000D0544F42A101ECFBB12A7B4D33F4AA9E
      78F03798ED965D215795DD7C000000007FE21C8F263701A85639369799F8F7F6
      F5F4F1372E0217605CE369C700000000008F3B4A887637011A1910187979FAF8
      F7F537010575859A77DD8600000000000000DB8AFD8907AE0A5A01F0AAF7F7F5
      37EB01017370FF779DC56B000000000000006DE78B8EA230AB98010101010101
      0101EEA953E4E2B2098C000000000000000000E8E7C48EE2C81B22F6783737F0
      9EAB3A7AE6A6E26A8C000000000000000000000095DBFCC9CFA6D3617D7E639F
      507FA00EDA9569690000000000000000000000000000D4E69CC9FD904C91D5D5
      D5D5D5B26C1F920000000000000000000000000000000095D97FDCD2CA4A4C72
      E27FD06911000000000000000000000000000000000000000000E1D9588F25CB
      D1D87F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF80000001800000018000000180000001800000018000
      000180000001C0000001C0000003C0000003E0000007F0000007F000000FF800
      001FFC00003FFF00007FFF8001FFFFF007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF280000002000000040000000010020000000
      0000801000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000656565EC5F5F
      5FFA5E5E5EFA5C5C5CFA5C5C5CFA595959FA575757FA565656FA535353FA5353
      53FA505050FA4E4E4EFA4E4E4EFA4B4B4BFA494949FA494949FA464646FA4444
      44FA434343FA414141FA3F3F3FFA3E3E3EFA3C3C3CFA3B3B3BFA393939FA3737
      37FA363636FA343434FA333333FA343434F90000000000000000676767F0D1D1
      D1FF9C9C9CFF9D9D9DFF9C9C9CFF9C9C9CFF9B9B9BFF9A9A9AFF9B9B9BFF9999
      99FF989898FF979797FF969696FF959595FF949494FF939393FF929292FF9191
      91FF919191FF8E8E8EFF8D8D8DFF8C8C8CFF8C8C8CFF898989FF888888FF8888
      88FF868686FF878787FF808080FF414141FD0000000000000000676767F0E7E7
      E7FFB1B1B1FFD1D2D2FFCCCCCCFFCACBCBFFC9CACAFFC8C9C9FFC7C7C7FFC7C8
      C8FFC6C6C6FFC6C6C6FFCBCCCCFFCECECEFFCDCDCDFFCECECEFFCECECEFFCCCC
      CCFFC5C5C5FFBFBFBFFFBDBDBDFFBDBDBDFFBCBCBCFFBBBBBBFFBCBBBAFFBBBA
      B9FFBAB9B9FFA1A1A1FF8F8F8FFF424242FD00000000000000006B6B6BEDE8E8
      E8FF7D7D7DFFC4BDBDFEFFF5F5FFFCF2F2FFFDF2F2FFFBF2F2FFFCF2F2FFFAF3
      F3FFFBF3F3FFFFF9F9FF868483FF636363FF616161FF5D5D5DFF595858FF4D4C
      4CFFABA2A2FFFDFDFDFFF7F7F7FFF7F7F7FFF8F8F7FFFDFCF7FFDDE3F8FFDDE3
      F8FFFFFFFFFEA7A7A7FD8D8D8DFF444444FC00000000000000006A6A6ADDE6E6
      E6FF8F8F8FFFB3A8A8FEFFFAFAFFFFFDFDFFFFF3F3FFFFF1F1FFFFF1F1FFFFF2
      F2FFFFF4F4FFFFFDFAFFAAA8AFFF4D4B43FF4B4B49FF464646FF3E3F3FFF2F2F
      2FFFE5DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0025FFFF1745
      FFFFFFFFFFFB9D9D9DFB8B8B8BFF464646F100000000000000006C6C6CBCD9D9
      D9FFAEAFAFFF898181FDFFFBFBFFFFFFFFFFFFF5F5FFFFEFEFFFFFEFEFFFFFF0
      F0FFFFF1F1FFFFFEF1FF4169FFFF3249A6FF515250FF454644FF504E4EFFCAC1
      C1FFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFDCE4FFFF002EFFFF5A7B
      FFFFFFFFF5F19D9D9DFF858585FF434343D5000000000000000070707087C1C1
      C1FFCBCBCBFF5D5B5BFCFFF8F8FEFFFFFFFFFFFBFBFFFFEDEDFFFFEDEDFFFFEE
      EEFFFFF2EFFFD6D2F3FF083EFFFF003BFFFF6C6FCAFFE4CFC9FFFFFFFFFFFFFF
      FFFFFFFCFCFFFFFEFEFFFFFEFEFFFFFFFFFFFFFFFFFF7293FFFF0033FFFFB1C1
      FFFFDDDBD5E9A2A2A2FF757575FF444444A80000000000000000777777409A9A
      9AFEDBDBDBFF727373FEDECDCDFBFFFCFCFFFFFFFFFFFFEEEEFFFFECECFFFFEC
      ECFFFFF8EDFF587AFBFF0C45FFFF6D70C9FFF3D6CBFFFFFAF9FFFFF6F6FFFFF6
      F6FFFFF8F8FFFFFAFAFFFFFCFCFFFFFFFFFFE9EEFEFF1047FFFF194BFFFFFFFF
      FFFCAEAEACE9A3A3A3FF606060FF4646466B0000000000000000555555037A7A
      7ADEE2E2E2FFBBBCBCFF6B6565FAFFF8F8FEFFFFFFFFFFFDFDFFFFEAEAFFFFEC
      EAFFE2D8EFFF0D49FFFF6B73D0FFF3D5C9FFFFF3F3FFFFF0F0FFFFF2F2FFFFF4
      F4FFFFF6F6FFFFF7F7FFFFFBF9FFFFFEFBFF406CFEFF1247FFFFB1C2FFFFE9E8
      E1E7A3A3A3FE919191FF565656FB4949491D0000000000000000000000008282
      8270ACACACFFD6D6D6FF808282FEBEAEAEFAFFF7F7FFFFFFFFFFFFFCFBFFFFF2
      E9FF6585FDFF6677DAFFF8D8CEFFFFEFEDFFFFEDEDFFFFEEEEFFFFEFEFFFFFF1
      F1FFFFF3F3FFFFF5F5FFFFF8F7FF4B76FDFF2256FFFF6B8CFFFFFFFFFDF7A8A8
      A7F0ABABABFF727272FF545454B2000000000000000000000000000000009191
      91087A7A7ADCDCDCDCFFCACACAFF606060FDE6CFCFFBFFF7F7FFFFFFFFFFE2E9
      FFFF6178E3FFFBD9CFFFFFECEBFFFFE9E9FFFFE9E9FFFFEBEBFFFFEDEDFFFFEE
      EEFFFFF1F1FFFFF7F7FFFFFFFFFF80A1FFFF678AFFFFFFFFFEFCB7B7B5ECAAAA
      AAFF919191FF5C5C5CFD5B5B5B36000000000000000000000000000000000000
      0000919191418F8F8FFBE0E0E0FFC5C6C6FF636363FCDFC8C8FBFFF7F5FFBCCD
      FDFFF9F1ECFFFFFFFFFFFFF6F6FFFFF0F0FFFFEEEEFFFFEEEEFFFFF1F1FFFFF7
      F7FFFFFEFEFFFFFFFFFFFFFFFFFFFFFDFBFFFFFBF5FDB9B9B8F0ACACACFEA5A5
      A5FF6A6A6AFF5B5B5B9B00000000000000000000000000000000000000000000
      0000000000008F8F8F769F9F9FFEDEDEDEFFC7C8C8FF777878FDA99999FAFFEE
      EDFEFFF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFBFBFFFFF6F5FEEBE1E1FCACAEAEF8AEAEAEFEADADADFF7575
      75FF5D5D5DD56060600C00000000000000000000000000000000000000000000
      000000000000000000009191918A9F9F9FFEDDDDDDFFC8C8C8FFABACACFF7A78
      78FBB5A2A2FBFFE3E3FDFFEFEFFFFFF4F4FFFFF7F7FFFFF7F7FFFFF6F6FFFFF2
      F2FFFFEEEEFEE0D2D2FDB7B4B4FDAAABABFDB3B3B3FFACACACFF787878FF6161
      61E1686868210000000000000000000000000000000000000000000000000000
      0000000000000000000000000000929292708F8F8FFAD1D1D1FFCDCDCDFFC6C7
      C7FFB3B3B3FF868787FD958F8FFBA79C9CFBB0A1A1FAB8AAAAFBAFA3A3FCA59F
      9FFD9B9C9CFEADAFAFFEB6B6B6FFB8B8B8FFA1A1A1FF727272FF656565CF6C6C
      6C1D000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949438808080D3A9A9A9FFD0D0
      D0FFCDCDCDFFC6C6C6FFC3C3C3FFC0C1C1FFBDBEBEFFBDBDBDFFBCBDBDFFBDBD
      BDFFBDBDBDFFBDBDBDFFADADADFF858585FF6C6C6CFB6E6E6E8E838383090000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000919191048B8B8B5F8787
      87D29B9B9BFEB4B4B4FFC2C2C2FFCBCBCBFFCACACAFFC1C1C1FFB9B9B9FFACAC
      ACFF999999FF7F7F7FFF717171F7747474A17777772900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000089898931808080797E7E7EB17B7B7BD57D7D7DE97C7C7CEE767676E07575
      75C474747497757575596B6B6B0F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000180000001800000018000
      0001800000018000000180000001C0000001C0000003C0000003E0000007F000
      0007F000000FF800001FFC00003FFF00007FFF8001FFFFF007FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF28000000300000006000
      00000100080000000000800A0000000000000000000000000000000000000000
      0000FFFFFF00285AFF009C9C9C00504E4E0091ADFF004256A400D8C3C3006C6F
      CA0075757500C0CAFB000022FF002A2B2B005478FB00B5B6B600E5E5E500F7DC
      D90088888800626262003960F600CFD5F9000E42FF003E3F3F006B88F900FFEC
      EC006178E300E2E9FF00C4A09C00D6D6D600C4C5C500AAA8AF006C6C6C009292
      92009EB2FF00F8E1DF00023AFF00E9D5D5007E7E7E00C1ABAF0058585800F9F9
      EF001A4DFF00E6DAEF00C9B6B60037373700CFCFCF005179FF0048484800A496
      9600E4CFC900A3A4A400F3D5C900DDE3F8008A7D7C006677DA00FFF9F7007792
      FB006483FF00DCD0D000DCDCDB00002FFF00B1A6A600EBF0FF008D8D8D00B1B1
      B100979797006B6565004D4B4300ABA2A2000A3EFE00FFFCF000F4F4F400FCF2
      F20053535300CACACA00CAC1C100C1C1C1006B73D000D7E0FF00BCBCBC00A49E
      9E00ADADAB005D5D5D00F1DDDC00E2E2E20070707000FFF3EA00E2E1DB008383
      8300FFF8ED00F2F0EF00D3D3D300A7A7A7001246FF00D8D6D0004B4B4900FBFA
      FA00948C8C00DBCACA00B6A8A8001745FF00323333003A3A3A0043434300D9D9
      D90072727200797979007B7B7B0084858500A0A0A0000032FF00FFF4EE00FDF9
      F30066676700BABABA00FFFDFB005781FF00678AFF00E1CBCB00AAAAAA00FFF4
      F400FFE9E800B8B1B1000D49FF0056555500A3999900AEA1A1009A9A9A00AFAF
      AF00454644004D4D4C0055544C003C3C3C00FDFDFD005B5B5B00EBEAEA00615E
      5E0064646400DFDFDF00DEDEDE0069696900CCCCCC00C8C8C80080808000C3C3
      C300BEBEBE008A8A8A008F90900094949400A1A1A1004670FF00F4DBD900FEFA
      F900FFEFEC00B5B5B300FFFCF700D0D0D000A6A5A500FFF2F200AEA2A200ABAD
      AD00FDF6F6007777770086848300BFBFBF00BEB9B900B3B3B30044444400FFFC
      FC00FEF5F200FEF0F000FBEBEB00F3D6CB001047FF00FFF7F500FDF2F2005D5B
      5B00FFECEA00ADADAD003535350036373700383838003D3D3D00414040004141
      4100464646004A4A4A00FBFBFC004F4F4F00FBF4F20058565000575757005C5C
      5C005E5E5E00E8E7E70060606000DDDDDD006A6A6A00DCDADA006E6D6D007977
      7700CDCDCD00CBCBCB007C7C7C005D639F00C9C9C9007D7D7D00C7C7C7007F7F
      7F0081818100C2C2C2008686860087878700BDBDBD00898A8A00BBBAB9008B8B
      8B008C8C8C00B7B8B8008E8E8E00B4B4B4009091910093949400959595009696
      960098989800ACACAC00ABABAB00AAACAC009B9B9B00A9A9A9009D9D9D009E9E
      9E00A2A2A20045454500FFFFFE00FFFDFD00FFFFFA00FFFBFB00FFF8F800FFF6
      F600FFF5F500F8F8FA0052515100FFF3F300FFF1F100FEEFEF00FFEEEE00FFED
      ED005A595900FFEBEB00FFEAEA00D1D1D100C4C3CC00BBBBBB00B7B7B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A2
      C7C7C71FC58C717171717189891212C388C152C0868686F927BF7C7CBE4949F3
      BCBCBCBC8282BABABA2F2FB9BE0000C59455556955695555C755C7C7C71F1F1F
      1FC5C58C717171718989891212C388C152C08686F927BF7C7C49494967000071
      C41D40804080B280E2B2E3E277E6E6E65C5C5C9D329D32E995E9956DE86DE8E7
      037FE57F7FE17F41E0DF41C7A7000071684AFE72FFDCA640404040808080B2E2
      E3E2E377E677E65C5C5C9D3232E9956D6D6DE803E7E57F7FE5E76D1FEA00008C
      68CADFE6475A5A475A5A5A5A5A875A8787878787878787878787C28787878787
      87C2C2878787C287C67FE8C52F0000C71C8D7F82EEF6F6AAAAAAAAAFAFBD4848
      EFA566B7B6B5B3650C0C0C2601BBBBBBBBBBBBEDF260600154E595C582000069
      2D2DE616BBF578F0F4F5F5F49EF4F178F05A82BC82BAB967166666AB01010101
      010101010B0B13015BE59571BC0000CBD21C4F0CAF780101F1AAAAF5F59E9EF4
      78ED0683F3BCBA2FEAB43001010101010101014E6E3C3901FDE7E77152000011
      E28B1D163AF50101EFF6F6F6AAAAF5F5A90A2306BE8382EAB77D0101EB010101
      01010121233C2185406DE012C5000094DD87D2717D9EEC01ECF7F7F7F6F6F6AA
      46135D4545CC357A5A01A8A8ECEB010101010113453C3EF203E9D886CE000000
      0947D27F7CA1370101F5F8F8F8F7F76F14152915131B22EB98EF9898A8ECEBEB
      01014E151502013BE79DD0BE000000006A5B9C1D6553F601019818181818F859
      0D295D131B533778F1F0EF9898EEA8EC01019629452185A6E95C55F300000000
      DE320F1D0935F49801019EFAFAFA992A2929131B5378F59E78F1F037EF98EE73
      EB2129290201876D9D41717100000000006A87CFA40C53F801010118FBFB5617
      02131B97AAF7AAF59EF478F137EF98ED1402025D0A850E9DE6D0869200000000
      00D80E8A1DD488AF9E0101EBFA792A02132610F8F8F8F7F6AAF59E78F1F0370A
      0202023885C66DE695C7BF00000000000000CB878ECD827EABF10101016F3802
      2622F879FBFA18F8F6AAF59EF478ED7413022EEB4732E6E258128F0000000000
      0000209D87904CB407FAF00101BB022610FB79797979FA18F8F7F6AAF4A8013E
      02747360E37777E8C786000000000000000000252D681DDCB476FAF50105FD5A
      98F77979797979FBFB189E9801010101149B9880E6E3E26A8892000000000000
      00000032D00F8DFD0E662BF6AB14BD0101010198F07878F0EE01010101010137
      AE5AE677E240D48C1F0000000000000000000000E59287CD1DA48235AB79AAA8
      010101010101010101010101EBEFAAA9C632B2804020C7890000000000000000
      0000000000209387CA1D4A6C822BAB79FA7898010101010101A8EFF5F8F68740
      324040A6E069C3000000000000000000000000000000DDD6549C90CF4C09F91B
      2218FB79FBFA18FAFBFA18AB3A9DE54040400EDE698900000000000000000000
      00000000000000E5588DC490D2CFFDDE71C7612607762407267D61D6950E0E0E
      0E409255C5000000000000000000000000000000000000005C5832542D90D21D
      FD1DDA95936CD4DDE9DCFEFEDAFFFF7232CB1FA2000000000000000000000000
      00000000000000000000E0580E8A2DD24C4C4C4C4C4CA4A44FFE7272FEFEE6D4
      55C7DD00000000000000000000000000000000000000000000000000DE8F5C4A
      682DD24C4CA491A4A4A4914003586969DB000000000000000000000000000000
      0000000000000000000000000000E56CD0E5B20E724F0E32E59325A2696CE100
      0000000000000000000000000000000000000000000000000000000000000000
      00E5DDD658D0CE8F5811DD030000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000800000000001000080000000000100008000
      0000000100008000000000010000800000000001000080000000000100008000
      000000010000800000000001000080000000000100008000000000010000C000
      000000030000C000000000030000C000000000030000E000000000030000E000
      000000070000F000000000070000F0000000000F0000F8000000000F0000F800
      0000001F0000FC000000003F0000FE000000007F0000FF00000000FF0000FF80
      000001FF0000FFC0000003FF0000FFF0000007FF0000FFFC00001FFF0000FFFF
      00007FFF0000FFFFE003FFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF00002800
      0000300000006000000001002000000000008025000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000656565C1636363D5626262D5626262D55F5F5FD55E5E
      5ED55D5D5DD55C5C5CD55B5B5BD55C5C5CD5595959D5585858D5575757D55656
      56D5555555D5545454D5525252D5515151D5505050D54F4F4FD54E4E4ED54C4C
      4CD54C4C4CD54B4B4BD54A4A4AD5494949D5484848D5464646D5454545D54444
      44D5434343D5424242D5404040D53F3F3FD53E3E3ED53D3D3DD53D3D3DD53C3C
      3CD53A3A3AD5393939D5383838D5373737D5363636D5343434D5333333D53434
      34BA0000000000000000656565E8949494FF707070FF707070FF717171FF7070
      70FF717171FF6F6F6FFF707070FF6E6E6EFF6F6F6FFF6D6D6DFF6D6D6DFF6E6E
      6EFF6C6C6CFF6B6B6BFF6C6C6CFF6B6B6BFF6A6A6AFF6A6A6AFF696969FF6868
      68FF676767FF666666FF656565FF646464FF636363FF636363FF626262FF6161
      61FF606060FF5F5F5FFF5E5E5EFF5D5D5DFF5C5C5CFF5B5B5BFF5A5A5AFF5959
      59FF585858FF575757FF565656FF555555FF535353FF525252FF535353FF3434
      34DE0000000000000000616161E8DDDDDDFFC4C4C4FFB0B0B0FFAFAFAFFFB0B0
      B0FFAEAEAEFFADADADFFAEAEAEFFACACACFFADADADFFABABABFFACACACFFAAAA
      AAFFA9A9A9FFA8A8A8FFA9A9A9FFA7A7A7FFA6A6A6FFA7A7A7FFA5A5A5FFA4A4
      A4FFA5A5A5FFA3A3A3FFA2A2A2FFA1A1A1FFA2A2A2FFA1A1A1FF9F9F9FFF9E9E
      9EFF9F9F9FFF9E9E9EFF9D9D9DFF9C9C9CFF9A9A9AFF9B9B9BFF9A9A9AFF9999
      99FF989898FF999999FF979797FF969696FF959595FF979797FF6D6D6DFF3636
      36DE0000000000000000636363E8D8D8D8FFCACACAFFBBBBBBFFB9B9B9FFB7B7
      B7FFB4B4B4FFB3B3B3FFB2B2B2FFB1B1B1FFB2B2B2FFB0B0B0FFAFAFAFFFAEAE
      AEFFAEAFAFFFADADADFFACACACFFABABABFFACACACFFABABABFFAAAAAAFFA9A9
      A9FFAAAAAAFFA8A8A8FFA7A7A7FFA6A6A6FFA7A7A7FFA5A5A5FFA3A3A3FFA3A3
      A3FFA2A2A2FFA1A1A1FFA0A0A0FFA0A0A0FF9F9F9FFF9E9E9EFF9C9C9CFF9D9D
      9DFF9B9B9BFF9A9A9AFF9A9A9AFF9B9B9BFF9D9D9DFFA0A0A0FF6C6C6CFF3737
      37DE0000000000000000646464E8D8D8D8FFCBCBCBFF959595FFABABABFEF7F8
      F8FFF2F1F1FFF0F1F1FFF1F2F2FFEFF0F0FFEFF1F1FFF0EFEFFFEEF0F0FFEFEE
      EEFFEDEEEEFFEEEFEFFFECEDEDFFECEDEDFFECECECFFE9E9E9FFEBE9E9FFEAEA
      EAFFEAE9E9FFE9E9E9FFEAE8E8FFE9E9E9FFEAE8E8FFE8E7E7FFEAEAEAFFEAEA
      EAFFE8E8E8FFE8E8E8FFE8E8E8FFE9E9E9FFE7E7E7FFE7E7E7FFE8E8E7FFE9E9
      E7FFE9E9E8FFE8E8E6FFEAEAE9FFDDDDDDFE9A9A9AFF9E9E9EFF6A6A6AFF3939
      39DE0000000000000000676767E5D6D6D6FFCCCCCCFF9A9A9AFF4C4C4CFDFFFB
      FBFFFDEFEFFFFDEFEFFFFDF0F0FFFDF0F0FFFDF0F0FFFDF0F0FFFDF2F2FFFDF1
      F1FFFCF3F3FFFCF2F2FFFCF2F2FFFFF8F8FFBEB9B9FF393939FF404040FF3D3D
      3DFF383838FF353535FF323232FF2D2D2DFF2A2A2AFF1B1D1DFFC2B2B2FFFFFF
      FFFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFCFCFBFFFFFFFBFFF8F8
      FBFFF9F9FBFFF9F9FBFFFFFFFEFFE3E3E3FC9B9B9BFFA1A1A1FF6A6A6AFF3C3C
      3CD90000000000000000686868D7CFCFCFFFCFCFCFFFA8A8A8FF3F3F3FFEFFFD
      FDFEFFF1F1FFFFF4F4FFFFF6F6FFFFF3F3FFFFF1F1FFFFF1F1FFFFF3F3FFFFF2
      F2FFFFF3F3FFFFF5F5FFFFF4F4FFFFF6F6FFF9F0EFFF4E4D49FF4F4F4FFF4C4C
      4CFF494949FF464646FF434343FF3F3F3FFF3B3B3BFF3C3838FFF4E8E8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF0022
      FFFF0022FFFF3861FFFFFFFFFFFFD6D6D6F69B9B9BFFA1A1A1FF686868FF3B3B
      3BCF00000000000000006C6C6CBDC2C2C2FFD5D5D5FFBCBCBCFF303131FEFFF3
      F3FDFFF4F4FFFFFFFFFFFFFFFFFFFFF5F5FFFFF0F0FFFFF0F0FFFFF1F1FFFFF1
      F1FFFFF2F2FFFFF2F2FFFFF3F3FFFFF4F3FFFFFFFBFF4C5FA4FF57544AFF5251
      51FF4E4E4EFF4B4B4BFF484848FF454545FF353737FFA49696FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE2FFFF0032
      FFFF0030FFFF6483FFFFFFFFFFFFC9C9C9F29D9D9DFF9D9D9DFF656565FF3F3F
      3FB900000000000000007171719CACACACFFDEDEDEFFC4C4C4FF3E4040FEE0D2
      D2FCFFF1F1FFFFFFFFFFFFFFFFFFFFF8F8FFFFEFEFFFFFEFEFFFFFEFEFFFFFF0
      F0FFFFF0F0FFFFF1F1FFFFF1F1FFFFF6F1FFBDC1F7FF013AFFFF374DA4FF5B58
      4BFF53534EFF4B4C4CFF454545FF414040FFA49999FFFFFFFFFFFFFFFFFFFFFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AB0FFFF0339
      FFFF0030FFFF9CAFFFFFFFFFFFFEB1B1B1E9A0A0A0FF969696FF616161FF4040
      409B00000000000000007272726B919191FFEAEAEAFFC2C2C2FF666767FFA69D
      9DFBFFF2F2FFFFFDFDFFFFFFFFFFFFFDFDFFFFEEEEFFFFEEEEFFFFEEEEFFFFEF
      EFFFFFEFEFFFFFEFEFFFFFF1F0FFFFFCF0FF3D65FCFF1143FFFF0C40FFFF073B
      F9FF5D639FFF8B7673FFB8B1B1FFF4EAEAFFFFFFFFFFFFFCFCFFFFFCFCFFFFFD
      FDFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D68FFFF0C3F
      FFFF002EFFFFE9EEFFFFFFFFFFEE9D9D9DF2A2A2A2FF8B8B8BFF5A5A5AFF4242
      4272000000000000000078787833767676FEF2F2F2FFC2C2C2FF9A9A9AFF5753
      53FAFFF8F8FEFFF7F7FFFFFFFFFFFFFFFFFFFFF1F1FFFFEDEDFFFFEDEDFFFFED
      EDFFFFEEEEFFFFEEEEFFFFF3EFFFCFCDF3FF0F44FFFF1749FFFF0B41FFFF3D59
      E6FFCBA29BFFF6E5E3FFFFFEFEFFFFFAFAFFFFF8F8FFFFF9F9FFFFFAFAFFFFFC
      FCFFFFFDFDFFFFFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFD4DDFFFF0B41FFFF1042
      FFFF2955FFFFFFFFFFFFE5E5E4DA9F9F9FFEA5A5A5FF7F7F7FFF555555FE4444
      443F000000000000000089898902737373E2D2D2D2FFD0D0D0FFC4C4C4FF3334
      34FEF0DEDEFAFFEFEFFFFFFFFFFFFFFFFFFFFFFAFAFFFFECECFFFFECECFFFFEC
      ECFFFFECECFFFFEDEDFFFFF8EDFF5478FBFF1A4DFFFF1348FFFF3959EAFFCAA1
      98FFF3DFDDFFFFF7F7FFFFF4F4FFFFF5F5FFFFF6F6FFFFF8F8FFFFF9F9FFFFFA
      FAFFFFFBFBFFFFFCFCFFFFFDFDFFFFFFFEFFFFFFFFFF4670FFFF184BFFFF083F
      FFFFA3B7FFFFFFFFFFFEB5B5B5DAA2A2A2FFA6A6A6FF707070FF4E4E4EF43939
      39090000000000000000000000007F7F7F90A4A4A4FFE5E5E5FFC4C4C4FF7575
      75FF867F7FF9FFF3F3FFFFF9F9FFFFFFFFFFFFFFFFFFFFF2F2FFFFEBEBFFFFEB
      EBFFFFEBEBFFFFEFECFFDFD7F0FF194EFFFF1C50FFFF375BEEFFC89F9AFFF3DD
      DBFFFFF4F4FFFFF1F1FFFFF2F2FFFFF4F4FFFFF5F5FFFFF6F6FFFFF7F7FFFFF8
      F8FFFFF9F9FFFFFBFBFFFFFDFCFFFFFFFDFF9EB2FEFF1A4EFFFF1C4FFFFF2454
      FFFFFFFFFFFFF6F6F5E3A0A0A0F6A5A5A5FF979797FF676767FF4D4D4DB80000
      00000000000000000000000000008B8B8B30797979FDEDEDEDFFC7C7C7FFBFBF
      BFFF303232FDF2E0E0FAFFEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFECECFFFFEA
      EAFFFFEAEAFFFFF3EAFF6B88F9FF1E54FFFF365DF5FFC69E9EFFF4DBD9FFFFF0
      F0FFFFEEEEFFFFF0F0FFFFF1F1FFFFF2F2FFFFF3F3FFFFF4F4FFFFF5F5FFFFF7
      F7FFFFF8F8FFFFF9F9FFFFFFFAFFCCD5FCFF2257FEFF2759FFFF1248FFFFBFCD
      FFFFFFFFFFFEB8B8B8D9A5A5A5FFA9A9A9FF7F7F7FFF5B5B5BFF515151610000
      000000000000000000000000000000000000808080BBB5B5B5FFDFDFDFFFC5C5
      C5FF878787FF625C5CF8FFF4F4FEFFF2F2FFFFFFFFFFFFFFFFFFFFFEFEFFFFEB
      EBFFFFEAE9FFEDDDEDFF1F56FFFF3460F9FFC7A5A9FFF5DCD9FFFFEDEDFFFFED
      EDFFFFEDEDFFFFEEEEFFFFEFEFFFFFF0F0FFFFF1F1FFFFF2F2FFFFF4F4FFFFF5
      F5FFFFF6F6FFFFFAF7FFC5CFFAFF2E60FFFF3060FFFF2254FFFF708FFEFFFFFF
      FFFEE3E3E2E2A2A2A2F8A8A8A8FFA1A1A1FF6D6D6DFF525252ED5151510E0000
      0000000000000000000000000000000000008E8E8E3F7D7D7DFDEBEBEBFFC8C8
      C8FFC9C9C9FF4C4D4DFEB0A2A2F7FFEFEFFEFFF5F5FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF4EDFF7D95F7FF3060FDFFC4A7B0FFF8DDD9FFFFEDEDFFFFE9E9FFFFEA
      EAFFFFEBEBFFFFECECFFFFEDEDFFFFEFEFFFFFF0F0FFFFF1F1FFFFF2F2FFFFF3
      F3FFFFF4F4FFFFFFF9FF5681FFFF3566FFFF2D5FFFFF5179FFFFFFFFFDFFFBFA
      F9F4A4A4A4E8A8A8A8FFACACACFF828282FF616161FF57575785000000000000
      00000000000000000000000000000000000000000000858585AAA5A5A5FFE8E8
      E8FFC3C3C3FFC0C0C0FF353535FCD9C7C7F8FFEBEBFFFFF6F6FFFFFFFFFFFFFF
      FFFFF6F9FFFF2F62FFFFC0A8B7FFF9DCD8FFFFEAEAFFFFE9E9FFFFE9E9FFFFE9
      E9FFFFE9E9FFFFEBEBFFFFECECFFFFEDEDFFFFEEEEFFFFEFEFFFFFF0F0FFFFF3
      F3FFFFFCFCFFFFFFFFFFEDF2FFFF2F62FFFF5881FEFFFFFDFAFFFFFEFCFBADAD
      ADE2AAAAAAFFAAAAAAFF9E9E9EFF6D6D6DFF555555EE62626215000000000000
      000000000000000000000000000000000000000000009191911C7C7C7CEBCECE
      CEFFD8D8D8FFC4C4C4FFB3B4B4FF353535FCE3CDCDF9FFEBEBFFFFF1F1FFFFFF
      FFFF91ADFFFFC0BDD6FFFAF3EDFFFFF9F9FFFFEEEEFFFFE8E8FFFFE7E7FFFFE8
      E8FFFFE8E8FFFFE9E9FFFFEAEAFFFFEAEAFFFFECECFFFFF2F2FFFFFAFAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFCED8FDFFFFFCF7FFFFFCFAFDB0B1B1E6AAAA
      AAFEABABABFFACACACFF797979FF606060FE5D5D5D7000000000000000000000
      0000000000000000000000000000000000000000000000000000919191558080
      80FDE4E4E4FFCCCCCCFFC6C6C6FFB4B6B6FF393A3AFBCEB9B9F7FFEFEFFFFAE8
      EDFFD3DAF8FFFAF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFFFFF6
      F6FFFFF4F4FFFFF4F4FFFFF6F6FFFFFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF7F7FFFFF7F5FFFBF4F3FBA9A9A9EBACACACFEACAC
      ACFFB1B1B1FF878787FF696969FF5A5A5AC44545450400000000000000000000
      0000000000000000000000000000000000000000000000000000000000008A8A
      8A868A8A8AFFEAEAEAFFC9C9C9FFC5C5C5FFBFBFBFFF4C4E4EFD8F8383F7FFEE
      EDFDFFEAE8FFFFF0F0FFFFFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FEFFFFF8F8FFFFF0F0FFFFF5F5FEE1DCDCFAA4A5A5F4AFAFAFFEAEAEAEFFB1B1
      B1FF929292FF6E6E6EFF5D5D5DE8606060210000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009191
      9102838383A3909090FFE9E9E9FFCBCBCBFFC4C4C4FFCACACAFF868888FE4D4A
      4AFAC8B6B6F9FFEEEEFEFFE8E8FFFFEBEBFFFFF4F4FFFFFAFAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFFFF8F8FFFFF1F1FFFFED
      EDFFFFF1F1FEF4E8E8FDB4B4B4FAA5A6A6FBB0B0B0FFB1B1B1FFB3B3B3FF9696
      96FF717171FF5F5F5FF56969693F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F8F8F04838383A58B8B8BFEE3E3E3FFD0D0D0FFC3C3C3FFC7C7C7FFC0C0
      C0FF767676FE595858F9B2A0A0F9FCE2E2FCFFECECFFFFEAEAFFFFE9E9FFFFEA
      EAFFFFEBEBFFFFECECFFFFEBEBFFFFEAEAFFFFEBEBFFFFECECFFFFEDEDFEDCD1
      D1FDA8A5A5FD9B9C9CFCB2B2B2FEB2B2B2FFB2B2B2FFB5B5B5FF939393FF7171
      71FF636363F56E6E6E4C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000919191028C8C8C89838383FDCCCCCCFFDDDDDDFFC3C3C3FFC2C2
      C2FFC7C7C7FFC5C7C7FF929494FF656666FC706B6BFA948888F9BDABABF9D8C1
      C1F9E6CECEF7ECD8D8FADFC9C9FAC2B2B2FAA49999FB959191FC8A8C8CFEA2A3
      A3FEB6B7B7FFB5B5B5FFB5B5B5FFB5B5B5FFB2B2B2FF8A8A8AFF6F6F6FFF6666
      66EB6F6F6F3E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000096969654808080EBA3A3A3FFE2E2E2FFCFCF
      CFFFC3C3C3FFC2C2C2FFC4C4C4FFC6C6C6FFC4C5C5FFB6B8B8FFA0A1A1FF8E90
      90FF848585FF868787FF8F9191FFA1A2A2FFB4B4B4FFBBBBBBFFBBBBBBFFB8B8
      B8FFB7B7B7FFB7B7B7FFB9B9B9FFA3A3A3FF7C7C7CFF6D6D6DFE696969C96C6C
      6C25000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009191911C8B8B8BA9838383FCB6B6
      B6FFDFDFDFFFCFCFCFFFC2C2C2FFC1C1C1FFC0C0C0FFC1C1C1FFC1C1C1FFC1C1
      C1FFC0C0C0FFBFBFBFFFBFBFBFFFBCBCBCFFBBBBBBFFB9B9B9FFBABABAFFBBBB
      BBFFBBBBBBFFA8A8A8FF878787FF707070FF6C6C6CF2737373785E5E5E060000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009595953A8989
      89B9818181FDA6A6A6FFCACACAFFDADADAFFCECECEFFC2C2C2FFC1C1C1FFC0C0
      C0FFBFBFBFFFBEBEBEFFBFBFBFFFBFBFBFFFBFBFBFFFBEBEBEFFB2B2B2FF9C9C
      9CFF828282FF727272FF707070F5777777937575751B00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009494942F8B8B8B8C808080E1808080FE9B9B9BFFADADADFFB6B6B6FFBABA
      BAFFBCBCBCFFB5B5B5FFA4A4A4FF9B9B9BFF8F8F8FFF7E7E7EFF777777FF7474
      74FB7A7A7AC77C7C7C6F76767616000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000888888028282822F7F7F7F697F7F7F9A7D7D7DBB7C7C
      7CD67B7B7BE57A7A7AE87A7A7ADC7A7A7ACB787878B078787885777777538282
      8217000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF000080000000000100008000
      0000000100008000000000010000800000000001000080000000000100008000
      0000000100008000000000010000800000000001000080000000000100008000
      000000010000C000000000030000C000000000030000C000000000030000E000
      000000030000E000000000070000F000000000070000F0000000000F0000F800
      0000000F0000F8000000001F0000FC000000003F0000FE000000007F0000FF00
      000000FF0000FF80000001FF0000FFC0000003FF0000FFF0000007FF0000FFFC
      00001FFF0000FFFF00007FFF0000FFFFE003FFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
      FFFFFFFF0000}
    PopupMenu = PopupMenu1
    OnDblClick = RxTrayIcon1DblClick
    Left = 764
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 808
    Top = 32
    object Restaurar1: TMenuItem
      Caption = 'Abrir Monitor'
      OnClick = Restaurar1Click
    end
  end
  object SkinData1: TSkinData
    Active = True
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcScrollbar, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcGroupBox, xcStatusBar, xcTab, xcSystemMenu]
    Skin3rd.Strings = (
      'TAdvPanelGroup=embedscrollbar'
      'TComboboxex=combobox'
      'TRxSpeedButton=speedbutton'
      'TControlBar=Panel'
      'TTBDock=Panel'
      'TTBToolbar=Panel'
      'TAdvPageControl=nil'
      'TImageEnMView=scrollbar'
      'TImageEnView=scrollbar'
      'TAdvMemo=scrollbar'
      'TDBAdvMemo=scrollbar'
      'TRzButton=button'
      'TRzBitbtn=bitbtn'
      'TRzMenuButton=bitbtn'
      'TRzCheckGroup=CheckGroup'
      'TRzRadioGroup=Radiogroup'
      'TRzRadioButton=Radiobutton'
      'TRzCheckBox=Checkbox'
      'TRzButtonEdit=Edit'
      'TRzDBRadioGroup=Radiogroup'
      'TRzDBRadioButton=Radiobutton'
      'TRzDateTimeEdit=combobox'
      'TRzColorEdit=combobox'
      'TRzDateTimePicker=combobox'
      'TRzDBDateTimeEdit=combobox'
      'TRzDbColorEdit=combobox'
      'TRzDBDateTimePicker=combobox'
      'TLMDGroupBox=Groupbox'
      'TDBCheckboxEh=Checkbox'
      'TDBCheckboxEh=Checkbox'
      'TLMDCHECKBOX=Checkbox'
      'TLMDDBCHECKBOX=Checkbox'
      'TLMDRadiobutton=Radiobutton'
      'TLMDCalculator=panel'
      'TLMDGROUPBOX=Panel'
      'TLMDSIMPLEPANEL=Panel'
      'TLMDDBCalendar=Panel'
      'TLMDButtonPanel=Panel'
      'TLMDLMDCalculator=Panel'
      'TLMDHeaderPanel=Panel'
      'TLMDTechnicalLine=Panel'
      'TLMDLMDClock=Panel'
      'TLMDTrackbar=panel'
      'TLMDListCombobox=combobox'
      'TLMDCheckListCombobox=combobox'
      'TLMDHeaderListCombobox=combobox'
      'TLMDImageCombobox=combobox'
      'TLMDColorCombobox=combobox'
      'TLMDFontCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDPrinterCombobox=combobox'
      'TLMDDriveCombobox=combobox'
      'TLMDCalculatorComboBox=combobox'
      'TLMDTrackBarComboBox=combobox'
      'TLMDCalendarComboBox=combobox'
      'TLMDTreeComboBox=combobox'
      'TLMDRADIOGROUP=radiogroup'
      'TLMDCheckGroup=CheckGroup'
      'TLMDDBRADIOGROUP=radiogroup'
      'TLMDDBCheckGroup=CheckGroup'
      'TLMDCalculatorEdit=edit'
      'TLMDEDIT=Edit'
      'TLMDMASKEDIT=Edit'
      'TLMDBROWSEEDIT=Edit'
      'TLMDEXTSPINEDIT=Edit'
      'TLMDCALENDAREDIT=Edit'
      'TLMDFILEOPENEDIT=Edit'
      'TLMDFILESAVEEDIT=Edit'
      'TLMDCOLOREDIT=Edit'
      'TLMDDBEDIT=Edit'
      'TLMDDBMASKEDIT=Edit'
      'TLMDDBEXTSPINEDIT=Edit'
      'TLMDDBSPINEDIT=Edit'
      'TLMDDBEDITDBLookup=Edit'
      'TLMDEDITDBLookup=Edit'
      'TDBLookupCombobox=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWDBLookupCombo=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWKeyCombo=Combobox'
      'TWWTempKeyCombo=combobox'
      'TWWDBDateTimePicker=Combobox'
      'TWWRADIOGROUP=radiogroup'
      'TWWDBEDIT=Edit'
      'TcxButton=bitbtn'
      'TcxDBCheckBox=checkbox'
      'TcxDBRadioGroup=radiogroup'
      'TcxRadioGroup=radiogroup'
      'TcxCheckBox=checkbox'
      'TOVCPICTUREFIELD=Edit'
      'TOVCDBPICTUREFIELD=Edit'
      'TOVCSLIDEREDIT=Edit'
      'TOVCDBSLIDEREDIT=Edit'
      'TOVCSIMPLEFIELD=Edit'
      'TOVCDBSIMPLEFIELD=Edit'
      'TO32DBFLEXEDIT=Edit'
      'TOVCNUMERICFIELD=Edit'
      'TOVCDBNUMERICFIELD=Edit')
    SkinStore = '(Good)'
    SkinFormtype = sfMainform
    Version = '2.76.01.20'
    MenuUpdate = True
    MenuMerge = False
    Left = 704
    Top = 67
    SkinStream = {
      94CF000001BE0800D676B1986B190C183DBF5EADD7B1803EC5CFCFC7D7E3B9FA
      F87EC0FA5FEBEB7B6F058FF3C33FFF7DBAF74DACCCE5AE017E74B009EA14F061
      A9E0D2EA47CA3CE86AC619EF47F3FA51069F9B66036B4B1ABA7628B28E47E1A9
      48B05BB92BB27DED534067BE4D661FBC46C1202C8A4D8BE8DFC21E3151D1DDFB
      85563D7559ABA4925259BA6556E202B14203698B1A412CC35AE80DBD148B0E23
      5AAA1B1854D02DF46C79E65AD09420A09161E02347C3FE55D5F7F7351107DF22
      0BD85897DEA9FBA83F5800B7DF795B324B16CE93427624648F55060183D380A7
      C0BD510D20F9121DED07C741F02068854ED081572137910F735A50C62F27E596
      D7529C06E5F3FD49173F64EA2ABBFFEEE617DF1FF53419C5498D46ED3BB4088B
      CBC9508592FFDF80AC0C605FC06EEE202EDF99DC64C2FBF31E994B237E1F5F88
      5E75861B297AA10DAAE7C7DDE43933A0701316D010BEFAAD6D82D3109F316F93
      F6A61331D2B025A54D5AA53BD997DEA09BFB75AEAF090ACD71876227BE50EA05
      309A7DC15EF5962B0FBA10133014EDD438C3D6D19E19E2CF6063019D890B007D
      CFF679D42B2E8819EBAFEF67F04EFAF374C8CC80D7C3FD06807801AF8EB435AC
      A4E82C035D0152FE513D8BB7EF296901FF5F4CD40FAFAEBEB9518E23A9DA406C
      7B2CF4457BF785EF0F813A252C01B2ADFF224DF1D29212966710B85B2B1FCD04
      2B51366B6B7C1EAA006568407E55EFE42406562BDEFB21B521FEBD24BA00DA47
      CFAAF400F5AC32E700F0CD25FC00C7DF5C600EEC713744078284077CFC6E35DC
      4FC100CF8AD94B450049042EC2403B1480703305EB89BF785FFA903E380347AC
      07D98C51D0B59000648037D0050D2EA15A83D4CD180B90C600A4006820023F3E
      E414025C02CCC047DD4B6080A800A880263EE16531208083015140293C86752E
      D5004A80A720221201E96F009E0128008EEF00CFC0000555A74202ED05C60298
      0501AAEE4069886015EAFD5B02F802F80501AB1A406D890014BA43E02120BF80
      4101446AFAD9D31EF630114051C02DCC7DBE763D6002A0B477FE804841670165
      6022A6730F97E21FC014EB54F7CA814E027A808AC332E6F4353002A2DEC3B901
      3505AC0436022BF4DFDC821EB012C04FF008B15381322E155009DD2E30E40553
      0996027D0BD421AA44A067A7DF61F9C809C4FAB72005600AF501500897A601C4
      536CEAAA5A2D8E02927F75F6026A88D602C100441DD65835333A1E8DA55BEFA2
      563F72AFE58096022001532581551E1BF6E2FAE2AABE944D3EA75446EFFC9B69
      51B00AE028005B29BB8C6B1991B264DEB6E4FFEC76AE9098CD0E614F121F88FC
      7F11515237015C05A0023A427653494A52A58DB1A8F60358E5C38155A97F2BD6
      A80AC02F8024A27AE859BA734AA6DF637F7017072E0019003A000D3575F2FEC0
      1BF97F600D8039F2FF005C017FE5FF8083E5F00100083E5F0011008BE5F20117
      CBE5F2F9008FE5F301180A3E5F8014FCBF2029014FCBF3F2FC80A7E5F9014FCB
      F5F2FD00AFE5FB01600B3E5FC0167CBF9F2FE00B3E5FDF97F7E5FDF97F405BF2
      FE80B405BF2FE80B7E5FEF97F805FF2FF803C012FF2FF2F41AC330074A603875
      006BED406B8B81F5010A185EFEA1988037FD5F1773A0034017024EBB24F514BF
      0A1317F14A66441FCA297300608A4F00A8F0B7DE0176439418077805FAECEC8A
      EE46029D25A3C05D9528F02922EC0A3D9605A1B40551E002AAB7015A200146A6
      A6601503745FE01561F405617F0158898B0053066EF01573A7880BE46FF302A1
      A02E60BCC0BD02946056611CC0B98173026EC0A44A1348C09E60B8C27103051D
      59828FC460A6D583E2C5A8007E182A53C00E00700380136005F76AA361B56DA8
      84474A35F801C00E006C4C74C5534E56B4F3E3B3E75A9925836542D518FE8A15
      865C00E00700248006A65E987B63D010AB595196FA4652FE007003800378000D
      66E5CA17B0C3216B842512AF1F7801C00E0014800A399576E897E1C00CFC00E0
      07000910077CF1D51ADAFA6D7B93347C01E00F00712005C97E01D38018B99200
      200200440025A4180066E4270028D894FFCC8008008026400CA653523BCDEBD8
      70DDD2B200200200DB0032D4F0C8766A8EF8000FE412F2D2002002003600674F
      1B123F606003FC64DCD1E4004008012A00E55C01978A47AC50E00077B9250FFF
      9001002003D002DAEB689483400D74AB30034994A6D6D1E02002002000C0024F
      9221D4D812906D23E4ADA0009C5EF518AE76310010020046802677E0B1DA0BA4
      74520F0D5C001E2A8D87C56D24DBBA0020020006F40DB115F14595021AA6EB11
      A1474AC4DA002002007FA005F94A002003003003003003007B7E0A35A7E4225B
      F130030030001C223AED5F80E20866FFBC4B078C23FB108C9801801800F00768
      394CB8634A6B3D7FFC0125EC00C00C010D007547167A602BD40D70B113D13003
      0030048000F86950979F53B9E600600600B40027DFF3C6BE64B942AFA74C00C0
      0C0198002C4BD01DA8009F8D3003003004BC00AA40800574F731496B2E600600
      600CA002264B6E3E66F454A3449D39600600600CB0023539E4392A8FE8038640
      A9C2600600600FD00278713A47C0800026529C9330030040003006BC50DE848D
      3143F401AEF8A83898018020029C01F3FA72B4810009D2AFE0044C9BDE2F9B30
      010010004C006E73C049B0B520448F4AA60034E2E93CE79A3400400400588012
      DC6D9B682AD1D64833BA500371562C3D6652F035801801800E9773FBC4673C26
      3154C428D423B7626D80180180158007F94C0040040056B7C39D0216A08031CC
      0350300F68240643521042E7960FF01C9DA03B000859C0040040040040040040
      040040040040040040040040040040040040053AE70CDB7D2B9FA335AD79722B
      9F8526B4F65B65756FFCAE74F00DB98751B7D5A47112AFFA71B3EDC6EE1F1BCB
      7803803803803CC80E9A97DEA7FA2A7F2ABFF2B77359742B6FBBC4871BAA3C6E
      C8F34A51026E3EA6600E00E00E00F8A03154B8EA7C854E52AFC8ACB244957722
      6F71910BEF4C27DCE90C1E00E00E00E00F6C00D453EA2A75557AAADFD8B4E4FD
      C01C01C01C9FB1E67EE2D3A03A03A03AB4C86B4DA59F49F80E24B1EAD153CBB1
      F542E57A8547ECFB19859DDD8DF6B4ED01D01D01E01A0406F28F794BBCA7ED54
      F6BF7D55BC7D0AF87D0474DD15D7AFD75383BD1E70AECA03A03A03A037BA0385
      F3053E5282E7F4B3A33E8ADB3DC53ED89F311FF6C8CFBBB34207F77440E2456F
      E2336134074074074064C03DD4BEEA7F854FCD93FAADD2314F67EE80E80E80EC
      FD8DE7EF2D3C03C03C03CB4CEEB4FDCF78165A6ADD77E39ABDC1F446DACC03C0
      3C03C0374806453ED4FF192D5863E96CF54D77FC18A706CBDCB13F074E6C8DAB
      7F8769BDAD5BFBB00A717A03A03A03A030E00C0A7C0A9C2ABCE9D63F8A27178D
      3B09CBE9FC23DC600FE468FA7C7EC2C3B517E80E80E80E80F8C037BF5936FDDD
      9EF2FF3363B7FC3F41A4F8A72FA9F933F601F849EFC7D31B49BB47A03A03A038
      69B472C63F38CB85F29FBB69F407407407407ECB4F2EEBFC3C497D83AB5353C5
      32DADE01E01E01E019380CAA7CAA9CAABD58A715936D13CFFDBE28DD3E996DF8
      D2A5238C225C3BCC03C03C03C037E80352AFAF76484570EE1694D3F6AF4FD5C8
      F79D839E27A7F2E30D3155807807807806CA01A94FA953A957AF14F1F53FB27E
      E30FF6D1F00F00F00F6D1D66D1FE21EA0F89FBD69F807807807806AD69F71CBD
      82D688294C41417AC601E01E01E019EE038AAF8FA9FF30E4E10FE4B4B49628E3
      B77763D461717CB8E4C601E01E01E01F54038D1BBE721A4864A779AC67EC9D2A
      0E68871F52F00F00F00F00D6900E2ABE5EA79223C30AC207D0E1847F824291B6
      8F8078078078077B68EDD7300BAD4FDEB4FC03C03C03C038DB4F9F3EE8AEA81C
      A8E23E01E01E01E01A440394FDD9382071F75E5F4FF6E28E5B6FE611916C03C0
      3C03C03C0398072E53F071FFF3CFDCADADCFB9853AECF00F00F00F00E7F4FEB5
      C4FD871FE09AAE4FEDA3E01E01E01E01ADB4792B7E3CFDEB4FC03C03C03C03A1
      B4F95BCE10627D8EC03C03C03C03C03B007356F39BAFD427E9F83978A35B912E
      FCC03C03C03C03C03B006218A3AE83DBA80FE3C03C03C03C03C03B4075B4B202
      D77A7C51EDA3E01E01E01E01C16D1D0A7EF5A7E01F01F01F01DB5A7D569D575F
      01F01F01F01F01D40765A739ACEF34B146C95E076E03E03E03E03E03B8079762
      8ED6CFC07C07C07C07C07601DFB628FE93F80F80F80F80DDDA3BF4FDFB4FE03E
      03E03E03BDB4FB2D35BE31DD780F80F80F80F80EE01B9F146CAD2C72E03E03E0
      3E03E03B8067DC51B657AF5E701F01F01F01F01DC033E3147F49FC07C07C07C0
      6EED1FDA7F01F01F01F01FB4F72B4E96BB4F80F80F80F80F80EE01C3B146C071
      D6B80F80C01803007980E198A3EAFF1C80180300600C01E803897146693C0180
      300600DDDA3969E00C018030065A7BC5A786E76FA00600C01803007A00ED78A3
      C3BF46F80300600C01803D00769C51DC666C80300600C01803D407FB628CD278
      0300600C01BBB472D3C0180300600CB4F7EB4FB5F37000600C01803007A80F69
      8A3FEDB76600600C01803007A80F838A3C5E5FEC00C0180300600F501C331466
      93C0180300600DEDA3969E00C018030065A7C25A648180300600C01CF19FE314
      77EE9AFC00600C01803007D80FEF8A3E7F9DA40180300600C01FA03B2E28CD27
      A0340680D019DB476D3D01A0340680DB4FA6B4F4AD8D01A0340680C80032DC51
      8A4FA14920340680D01A03F406598A3597A0340680D019D9DB33C51BA4F40680
      D01A033F68EDA7A0340680D01B69F6169FFD1B3A7101A0340680D01FA0380C51
      E319393D01A0340680D01FA03A3C51C9A95B040680D01A03407E80F678A3749E
      80D01A0340736D1DB4F40680D01A036D3EC2D3DB7C0A101A0340680D01FA03A4
      C51FC070A8A0340680D01A03F4075D8A393D5B3C80D01A0340680C603F8E28DD
      27A0340680D01CDB476D3D01A0340680DB4FC6B4E0B2BC4A0340680D01A03200
      EB314779CE73D01A0340680D0190078B8A3178DEA880D01A0340680C8031FC51
      BA4F40680D01A039F68EDA7A0340680D01B69F8D69830C93540680D01A034064
      01E1E28FF67C80E680D01A0340680C803CDC51BBA740680D01A03CA3333C51BA
      4F40680D01A039F68EDA7A0340680D01B69F9569D57D716901A0340680D01900
      7938A31A34AA0340680D01A03200FBB14622325C80D01A0340680C80399C51BA
      4F40680D01A039F68EDA7A0340680D01B69FD569DBFA08C501A0340680D01900
      7D98A3A7D7E80D01C0380700D803F1C51830B677900E01C0380700C80368C51D
      A4F80700E01C035F68F5A7C0380700E01D69FD569B99FFD380700E01C0380640
      1F8628FEE2C6100E01C0380700C803158A3F3088FC0380700E01C03280F03147
      693E01C0380700D7DA3D69F00E01C038075A7CB4E01C0380700FC131467154E3
      201C0380700E019407628E01C0380700EC51DB4780700E01C03DADA3D69F00E0
      1C038075A7DF4DC0380700E01F47D36081E45878A3191D5280700E01C0380650
      1AE7FDB1FB11EB14662613E601C0380700E01A0078F8A3B49F00E01C03806CED
      1CF67EEB4F80700E01C03C1B4F5AD3F32C24A140380700E01C03400D6ADC1440
      933E90D1BE0E28CC8FD8201C0380700E01A006BB37322B9EAFB8A35256798070
      0E01C03806801AD5B8147899E9E28ED27C0380700E01BBB47519FBAD3E01C038
      0700F0ED3DAB4D4151E201C0380700E01A006D56E32327B93A291AF838A3C8F5
      02D1F5FD75F00E01C0380668EA14AB70106503C38A3CCF042601C0380700E01A
      406E56E6E728FA2F3E50B68F00E01C03806FFDA3AACFDD69F00E01C03807C769
      E85327D7C0344B6FF6856F8C0380700E01FAE03E0E605BEFC706FDE5F3E0DD3C
      9F6AD730261EDB1E9E58FB162CD40380700E018E406D55F84E400ECA8CD29DF9
      3FF7024E3B2A313FDFCC224840380700E01A5806D9D7522FF568E4D970DAEEB6
      8F00E01C03807D0DA3BA4FDD69F00E01C03807CF69E425E7A888FF2FD8940380
      700E01BC006D9F7EE000780CFDB6D4D34BBE26CAC7C756FF04CAFFBDF474318B
      AEEE01C03807CFC1ED53ED54ED55E8E6C697F1679215A26FCA0E1877EB7D6828
      0700E01C03DA80DAABD6165C8F696DB3723B4FDEA5D6C16D1E01C0380700CAED
      1DAACDBA7EEB4F80700E01C03FBB4F482F71FC0C2099D6BE3636AFED0FC03807
      00E01E800DCA7DCB3DEABDF3F6C6D38A7EEDEB0BC7A84687908AFCCFBA0EEC97
      E129B97300E01C038063C01E14FE153E557F7AFBCFAB7CEC29664F6EFCBEB3C0
      380700E01830FE555E713F955FC5EC829FD43C3C3D27283ECDC1FBADA3C03807
      00EDA396DA3A498E018527EEB4F80700E01C03E45B4F66607CBD2248CA3D6F63
      657780700E01C033880F2A7C4484C53F49E67DC0E27E01C0380700E01B26B7BC
      FA9FB0FB268EA2D8D8A80700E01C036400F2A7C507CBFA7151E313E9FF8E27F1
      6D1F3F5B9F988FBB68F00E01C03DA3B47FE81107786F3477ED9FBAD3E01C0380
      75A7D69F00E01C0380700E01C0380700E01C0380700E01C0380700E01C038070
      0E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380
      700E01C0380700E01C0380700E01C038079FA2FFA648971DD48036EE0183380E
      68781F212667505485F868E0FA80050B1141B30EEB17938D5D6839F9BD64E0BC
      5DCD860400F7CDF919E830C17131B39EC66D0C072FCF2F2FFED7FE8717BC683C
      5F7240FB07EC2F0CE36F62F31AF9F9ED1244DCECB4079E7F02D86650679FE2FD
      7C634ABEBEC07B28F6B4E1993E6DED6FEDA5BD00DB5B9EE19A17F9E8DB7060A0
      3C072BF10CDEC90F18253F28CA3C46FB69E9AB6D1998D6CD9F090987B2A036E6
      FD67919EC6FB5060011AD05007AA158A0CF6A6F9DF2103A03DAA324199E1B7B7
      AEA1B7C1C5F1A66DD503BA855A3B34BE2D3958F600EF2E379F4EE888803EC1E4
      86EA712FC22B4A5667426F98D1FC3DF687554903EC1FCBEC86B30CDCDCF43DAD
      ADD7E6432F54903EC1E6670A8FC89F8D0F843ED00F31E9881D38CF8B7F89FF0A
      3C63511D24ABE287E2F3EE82E6D3E3379677ADED9E8ECC680F82F4466F7CDEFF
      CECD2749217E35BE06F80FE05D119AC9B7C4FC8A4677AF39733D4481F8A1F86D
      A887868D99986033844691F8CFCA0FEDFFE9FFE58FEA1FEE3FE173B41684233F
      A8F27807F5CEA0CDF71BC035C343F5B44FBFE3BFE45FE0F00BB9BA28E128CDAC
      DB063609FE4BEEDFCE428706460A6C1E5E743FD1F419EEA77DF1D300C27AD619
      F2387064F9C67BF8B8BE8937DE01843758664D1EB97F9CFDD060A8F613860D9C
      01E0176066DA6DEB387650FD9ED7BBE301E13FBB019C9DB02046792C9B327F6D
      07914D26F0D419821EDEBEF06B6C8CF57B3F729438927C2F381A8BB14FF43EBD
      63364DB1A93D6A0F195764DB177FC5020E9DD5EDBD84A033D32330A99BCA1986
      659EE19AC0B878E497D51988DC579E400D10C6C9773BA7F56D8CC5FFBFA7FCE3
      74A03E2BC329F88CF2CDB1646D1B6FE000387D0DB1BDB15962B8DF0064ACF560
      3C3A19EBBE68D5437C50194EFC33618DB2C999E16389EBE39BAD83E40325E658
      93C3156F58CCB12E544FA20328C64A9E19E326DEA5E7F5FF0BAA99FE5F91854E
      FFCFF82BD0C45BD09574FA3983D8466EEFF8BD4023DFABBD72CF3EEBC5FA5A9B
      D705E19FEC6DDEB4DEB4DEB4DEB4DEB4DEB4C33BD69BD69BD69BD69BD69BD69B
      D6962FD692EF4EC3CD8A7BC6F07D7BB87E064520333DC7958584DBD307FE65EB
      4AA1996975BF916691EBC586F3BDDE7EC306D4064132DDCE77AD25C79181F441
      C01ACACE05EB4F26ED5A5399736ABAC2F80CAAB49438D8EA544FFC4A725065D1
      57C0658652C0E96A075467F0FA06AB9539EB8CEA9E7BABCADBD697C665BE52FB
      25F28DABC17DE53237C677AD24372F984FD557F00A6BBCFB8BA9EB49E8953CF5
      CCABC61DE0364334E55DD11BD69E2F5A4C7FF3F217AD53E004EE4FCF9AA30349
      2EEAAE033BD69DE3B33ECF8A27D2D38D67A1DE3EB2EFFAD266D94922F377D4A6
      9F9FAAA1428C5DEB2DEB4F60CD22F6CE7142CABA177725969343C7728FF619DE
      B4F5019F517E917D9639B19F4A509BF7F67419B68C4FE2161E38DA7B9ADBF8AA
      DCF2ED7E8336EF5A7101890997715FC8BD8EB79E198E219DEB4E2D5D363A8BCD
      3A43C3ECEF89B63E5A75DFE0208F69AACF6FF436DF5A7119C7B8309FC7187D46
      6FAD227D6D8FB66281C07B3BB86DF3FCA016F17409B6FAD224674A7CC18CFAD3
      C5F5A630EFA1FAD345ABD86AFAD2FAD2FA6A8CDF5A5F5A5F5A6F5A636F87D695
      AC97B3F5A5FC5F5A7ED77AD3F8BBD56F3050F87594AE01F3F5A7070728DE4220
      04010020068600C9DC900A01402804F90119EB9A0A40080100200297004F5E01
      40280500B17AE2C80100200400F2803D1EBAF60040080100333007C2F5D8F600
      40080100141401FF7AE6586422F32DBAC63C437B5EDD7FED9E300200400801A2
      00327C85088514852183DA66F5D3080100200400F1500069EBE6BAD8490F514C
      CDC466BE07E7EEC00801002006B80169F2D422DED3148175EBA5500200400801
      89401F8F5D3971CD8F5D8C53D880100200400D90031ED31EBB1457E3D7164008
      010020003E0074557FDF269C9F33F7DEE661053580100200400ED003321AC514
      D520FE7AF93801002004007F801B0DAFE5BD3040BAE27E374B41B80100200400
      EF0037208E514E521DC7AFAB00200400801D3803ED907C46ABB4EAAC76D72C22
      4008010000C52EDB13AAC9CA4091EBE4C00801002007D6002B7AE99BD59F8C20
      45155DA07200400801003E400E508E514E520B4F5C5600400801000A8005F7AE
      AB3A20EDB1EC7C46E4E55B5600400801003E400F508F514F520E0F5C02004008
      010017A00C07AEA0375A8A1974E4CB77EFEB0A80100200400FF003D423D453D4
      8683D7F5C008010020039801A4F5C3A5056B55D5A21A60017E004008010037C0
      0B540BD4561486F3D7C05E00400801000A80074BD77DE5F77DCF580254008010
      020026800614561487B3D7C14008010020068C01ECF5CBAA97476B7801FF0020
      0400801D40052A130A43F7E0FC3DAF3C00801002007CC00B54FB8F5D8FC25002
      00400801ED0038A7D4BD780100200400F240018F5E0140280500BD1016720F00
      200400800FE004B9E0140280500B9CF8B70E174E2C00A9C80F51901A49903F7C
      C80D3DC0E2C2EED643E91F20D007BC019C9CA4876E00CCFF6BF6FE6D4FE400C8
      EF9CC90DAD7BF68A9001ADB36877E2F9231C6D5CE8C2597FD1F0FCFBDD8068C2
      8BF8BF8BF8BF8BF8BF8BF8BF8BF39B9398BF8BF93F8BF8BF8BF8BF8BF8BF8BF8
      BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8BF8B
      F597F9DC3C5A308DA00D0D62FF9A7F75FF43B8BF617F78E7AF1E62FE2FE2FE2F
      E2FE2FE2FE2FE2FE2FE2FE2FD540BD7D87A30B8B0033EFF2FEDF9D58E47FB73C
      AE101F6FEDC1361F4C3FDBB4102EFF5B6BFA022D6FEDAD9211C2384708C6C46D
      5C0FBFC022D30B26CE2E4D83C1B3F336D73B1B1B3A2AC0BE4B843EE000874494
      EAE74FA7DE7F5C5F563E806D4C06ED623DCB0BBCFBDE206939516F596CF74D86
      7C038062407C64466837CBF6A3A807C7019977D54BF56479B9A21B4793368C03
      1DC06AC5F3BFBAC8E75F00FDDD7BC6597148C3806CF00C744BDF3F7C3BD6D939
      85CC7527DFD5019093CCC597EF3AF38765932E6FF807EC01E543BC36581900F3
      201E637BDE9D7C03FE3AFEC659712B88E66F1E31300FD601FE43650D0EE01D0E
      E01D0EF81A389BC450C854B00C7603372F3AF806AAEBFC196EBBAE5BE7AC1521
      201A7006584C34687700FFB0EF5DB18061C03F88779191F3F31B8FFB601B1806
      6E5E75F00D55D7F932C202E45F33CDF41700DDA0324D4EC6A87700C261DFBA2A
      44C031B0183876E67F0DF058B15403C800FE70497E75F00C31D7F932C74B9E13
      38DEF0FD00F72033D75888768C90A3403430194902BCF08763C2C58940345018
      387796DBF7F8BABAE300FC403372F3AF806C4EBFC9963D462E15D7F806D701E5
      375DEF88765A2DA779EC001280797407F7FE86F843B1D50D7A601A780C3C3BE8
      F73FDC0B0BCE80604033F6BE75F00DD9D7FE32F7FDBFAEB587E84030C01F43B5
      F3FA877EB838ABC26A213700FBA80FA1D9FC7CC3B7E6337100D6C06221DBABC2
      6ABDAF806F601B1DDC173AF80628EBFE99668DA056B6E01E2C079ADB75FF61DE
      3DD67D2AE79C03F74069C9ED7F70EFDFEF1EE01B700CD43BEFFBBFFC1A18D330
      0CEC06333D27275F00CE1D7FC32CB5B799E7FEDC03400183CEC95050EC407CF3
      9D60107B00D6401E4769D5010EFAFEBDC40375019A876BC732E386C6FBC80696
      034023F7E75F00CF9D7FC32C7CE9153AC3807B70196BAFFE1DF5FEA9AB86A44B
      3E01E24031B1D38010EC5E39FBC03C0019A877896B62779F6BF5601AA00DF1FB
      C53AF8068CEBFF197F3FB0CE75B78A806D803D2EA7A00A1DF8FE79A39E3FE435
      807D100C9439B877DA7E0F680786033F0EF40DEBF4F3ED7B2100DC4065ED7CEB
      E01BCBAFFA658F991F27AFF00FA4032ED3A08765A378060E01AA59780190EF05
      A573403D301A287781BE62A39816B2FB00DF007A5AA2243B9D7CEBDF4CB2ECBC
      03F200CF07B66D6EF00C42DDDF3A3EEA01EB80D143B6F3CF51B7FD058806FC03
      E5E5359D7C035075F19700DF61D973BD68DC7B403FC406A35FBC687700E87700
      E8773AF9D78CD5F9606C05305B58078E0352B15E82A1D9C508D8DF8BC5F48066
      101BB3B3CA4BFEB7BF21EFABE0F7D0EE01F9E1DE479D5D07BCDCFE1807A203F4
      FB50CF6AE75F3AF5FF1BF0F1F76D735DF88807C0037777CA4CE9FB75E2EEF279
      3D7EDFBCD7B9DF67B3EB806B280C84B8E77CF7A852497FE6F4866FE6164FAB0E
      F9B00F800636EEC4A38C3BCD35CEBF6F5C8EAE01F080CD9B37DC6473AF806C9D
      7FB32DC8ECCC2A2D8F43E01A1403F1F9C254A5D875E2EFD34AD74D687D40BD46
      A7A64A1BF1BDABE7403E0018C3B654B830EFEB231AD79AF806D680C1877FE65C
      EBE75E05D782678E9EDB0EA7EC030301A9D4EE7226383E99C033180C671C218E
      1C3F331A58D00FAC06421BB2C8C102CCF602044500CA00636EEFCC8E75F3AF68
      EBC333E01FD80792EBE01C03D3018F1EE018080D894BCBBE64719700D88CBE06
      77D4D8DAC009DC00DF5803A170072F3C00D0BBFDD41763E03E5FF1CBC0618030
      E260040080100200400801001B60028C00800D680239E00473C43C00768E7F5D
      B90FFFF59400F9AF030500083FD013FF080701564020C3AFC116E211067BC8DD
      115288124007A84FA80B7F2A029D51CF1CF1CF1CF1CEE4339C082116ACC7EEED
      C01804B80160138009418C020404584DA00A10FAC12B1614322E116061E11B36
      F0002881FD89748ACE529239E39E39E39E39C84E764B79EECDC80CD818B06688
      5042AB0C6420E002C04F9046F04E6057FA147A37E723CE82D3939D009EF11344
      4473C73C73C73C73941CFC5F80AA065567C80C40AB03F882042E4BFC0EAC2868
      6960758401C2AB0CAC4668B7F482348052007C140052441B920F9440CC669CE9
      CE9CE9CE9CE7073FCE9002B130177037BC0D40FD0242258C280811A405004246
      3A941DBC4CD09DA00C984C9CE9CE9CE9CE9CF1273DD200401A700139D00273A4
      3A009239E5104002EACA0D40160800625EA73A004E74E7401507396633201A00
      0881BEC00218E30F62078303B418C5244858C478C832428C81AA903544142027
      05D0449CE9CE9CE9CE9CF5873FC661713C8101E40B523208A03B21AA04443354
      158C1990FD0485C6460470C27C02FF61AE0477120F89294165A0DC41FC52F632
      1FA913932139D39D39D39D39ED4E7FB5001258C05100EA0304082099A8806A02
      FF100840846F516FF82A40BA5892289DB653DB005B26AA5B465AA73A73A73A73
      A73DC1CF27F3503200FA8816A09A803FB507D4318427189AA039C05B02045984
      1B2092FA46F6227B006411C88DA7451301F255273A73A73A73A73E09CFFCBF7F
      0405D8013C1181D7E109650D6E0AD8462340E1A2D06082FE0A2C30989F987D3C
      6930E2A057799C9CE9CE9CE9CE9CF987399E001F7FD864360025C20AB006A808
      433602C388FE082510FC067008F017CA42FD207A056A494FA557E1D5819606FE
      286A9929CE9CE9CE9CE9CFB873FFE80100772004E74009CE90E8036D39FF1D48
      010043803A1C89CE80139D00200F0439D0020040080100200400801002004008
      0100200400803CAA00D6B85835AA13AB00237801DE700707640FDF9C80E33A36
      EC17FF6A87E60008E901A0340680D01A0340680D01A0340680D01A039301CED4
      54F400D21E4887D86DF9DD4034CF9345C483F17EC296B79CDF70500C45E448B4
      8726A6E4FA8775D63DD07D054031179454699E7C870892A03AA3D36EF0203117
      A43D390E2A7E0329A66B1CDC7D9850188BE3A9F4CF98878B4A297AD86CF971A0
      3117A43D390E2A7F1EE53E6D1A6111D8F0188BE329F4CFA0870101CF7AFE8311
      D200C45E90F72438A9FF985106D8E677DE14803217C853E99FC334E38BA018C9
      4FE90F453FF8F76038B29FD33C0AC798CFABFBBC38EF93400642F487BD21CAE7
      FBD7CFEE8EF96FC53CF480642F9173E99F0269F1380F8D4FE90F3D3FECB2BFB1
      4FE99F1DF3F1B99CEEB12E0A99C403217A43F090E58BFF8B155C9ABAE7BC3CA0
      3217D0C5FA67CFB43A2512D7B854526FE003217A43F210E524FA6D7F8B7ACE27
      77C80662FA0A7D33E721C872F66DE9E7BCC5E90FDE439A9FA65B739BB3DBB2FE
      C03317D053E99F390E6CAE4B35B3FB00CD99A43F810E6A7C7CA6037A2E077BFC
      0662FA0A7D33E721F95DBF3EE6F6CCA820198BD21FD087353FE6F300EC845588
      870198BEC29F4CF9D73CC66765DCCED5931003317A43FA10E6EFE8957CB6C000
      034980CC5F65DFA67BF73BFDFBFDFBFDFA67A0340680D01A0340680D01A03406
      80D01A034065E67FAD91AAE69BA00347801DFB007EEE00FC04C00E41BF8E8171
      DE03E3011BF80E20060B140080100200C0008DCD6004768ED1DFF5458ED012ED
      7007F1F23B4768ED1DA3B4768ED1DA3B4768ED1DA3B4768ED1DA3B4768ED1DA3
      B4768ED1DA3B4768ED1DA3B4768ED1DA3B4768ED1DA3B4768ED1DA3B4768ED1D
      A3B4768ED1DA3B4768ED1DA3B8770EE1DC3B8770EE1DC3B8770EE1DC3B8770EE
      1DC3B8770EC21F6900021C43B8770EE004008019200DEFB991AC55DB6803AF80
      1E57007F2E00E9AF003596C38106301F2C962180D20012D9480500A014028050
      0A0140280500A0140280500A016880B594D003D20B805E2162FD96FEF8BEF32C
      40C0243B4003A5EF60B7FC9F7FD59A9758390324715F8F6C933C745FC205AD4B
      D56B4000E26406103A1922CCE2213F9C68024CA017A2599E992AF4B24CB4A75F
      F14B070048D1852C67132EA9D780500A013DE97C40C0280500A01402805665E8
      9F00A01513E4BE0140292F88180500A0140280500A01302FF26405D06EBFCD7A
      158FCD42A6FE6AAB37F3456D907D80069AF026AED99C1EA01C03807A00648192
      0FBE00A559C0380700F400D341E51700E01CC3E01C03987C03807B730F203BFF
      39D480700E01EF019283262E9C55AFA01C03807D006481CC3E01C03987C03807
      30F80700E61E483A3AC93DB00E01C03E80351EB8B86A8580700E01F401A8F5E5
      1700E01CC3E01C03987C03807DF30F241F91EE81900E01C03EC0351EBB91E397
      80700E01F601A8F5E51700E01CC3E01C03987C038060D61E683E8F97DC80700E
      01F601A8F5FEE063100E01C03EC0351EBCA2E01C03987C0380730F80700C66C3
      CD07F3FD01201C03807EC06ABD72820D4300E01C03F60355EBCA2E01C03987C0
      380730F80700D10C3CD07E3B99F5E01C03807F006B3D7F27B80601C03807F006
      B3D7945C0380730F80700E61F00E01A81879A0FF8021580700E01FF01AEF5F49
      C9EBC0380700FF80DA7AF28B80700E61F00E01CC3E01C0359B0F341D353D3E01
      C03807FC06D3D745A757D00E01C030006D3D7945C0380730F80700E61F00E01B
      D1879A0E9EAED900E01C031006D3D752AB5E500E01C031006D3D7945C0380730
      F80700E61F00E01E69879A0E0A284100E01C031006E3D7D3F1FAD00E01C03100
      6E3D7945C0380730F80700E61F00E01F29879A0E081E3700E01C031C06EBD7EE
      BF60EC0380700C701BAF5E51700E01CC3E01C03987C03807D561E683F2FA9EA8
      0700E018E0375EBF57E58D201C03806380DD7AF28B80700E61F00E01CC3E01C0
      3F5B0F341C3C64B601C03806500DD7AFD1E9FA201C03806500DE7AF28B80700E
      61F00E01CC3E01C03FDB0F341C80B10601C03806500E7AF00E01F9BD7945C038
      0730F80700E61F00E0186B0F90780700DCDEBB79C79880700E019C039EBC0380
      730F80700E61F00E01C037FB6FEAFB8640380700CF01E3F07A8D74E680700E01
      9E03CB84F28B80700E61F00E01CC3E01C031861E483FBFF01700E01C033C0793
      D7361E13900E01C03400793D7945C0380730F80700E61F00E019BB0F241C3854
      DA01C03806900F27AEEDC771601C03806900F27AF28B80700E61F00E01CC3E01
      C033B61EDF625D1253DF00E01C03C903241C9EDC0380700F501EE83CA2E01C03
      987C0380730F80700D318799E2FC1DDA6003C6F01E4DE0718CA26B59B8F05B5F
      79D302E7F561F54003E00C0180300600C0180300600C0180300600C018030060
      0C0180300600C0180300600C0180300600C0180300600C0180300600C0180300
      600C0180300600C0180300600C0180300600C0180300600C0180300600C01803
      00600C018028600737F920AE01C0380700E01C030E039A7C0180300600C01803
      00600C0180300600C0180300600C0180300600C0180300600C0180300600C018
      0300600C013B0DE79741A2F80700E01C0380700F880735780300600C01803006
      00C0180300600C0180300600C010681FF2099CAF88E01C0380700E01C039B1C0
      180300600C0180300600F003FF6081180700E01C0380700F9C0735F80300600C
      0180300600C0180300600C0180300600C01146EBE01C0380700E01C038073638
      0300600C0180300600C017411A7562DF80700E01C0380700E01CD8E00C018038
      0700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C0
      380700E01C0380700D80AEF80E2580F01E03C0780F01E03600F6CF80700E01C0
      380700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01
      C0380700E01C03805517DF0183F01E03C0780F01E03C06C01ED9F00E01C03807
      00E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C038
      0700E01C0380700AA2F707181C0780F01E03C0780F01B007B67C0380700E01C0
      380700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01
      C0380700E01C02B0BD7EE083603C0780F01E03C0780D803DB3E01C0380700E01
      C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E
      01C0380700E01585F54AFDD301E03C0780F01E03C06C01ED9F00E01C0380700E
      01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C038070
      0E01C0380700AE2F905029B80F01E03C0780F01E03600F6CF80700E01C038070
      0E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380
      700E01C03805A1789CE091C0780F01E03C0780F01B007B67C0380700E01C0380
      700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C03
      80700E01C02D8BED37104C0780F01E03C0780F01ED8F00E01C0380700E01C038
      0700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C0
      380700D789EF20D0F701E03C0780F01E03A701ED7F00E01C0380700E01C03807
      00E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C038
      0700C108EF2039BB01E03C0780F01E03A201ED5F00E01C0380700E01C0380700
      E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C03807
      00A406E934CAEE03C0780F01E03C061C07B4FC0380700E01C0380700E01C0380
      700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C03
      7809DE6181BE03C0780F01E03C074201ED0F00E01C0380700E01C035B83CD619
      C2BB9B00165780E8CF03B8AB01B9261B605E8CF0F9B9A9080728023AC6D0045B
      600C018030039000C54E060E320614355056E0387B4015EB6802E18CEB0C0BD0
      D79040C49799752180F6E062788EAF5CB5A8300600C01801A007A70A9539E518
      A68C679ACE21538E18224F0C01803006006801EAAA00A9EA55AB62E992EEA234
      017ABE03596D37BD53E00C01802E02A7A4B401164D003C10E374C7754F803006
      00BD6A9D2EA3653D50DB91F148AD59EF2F554E5754E354F8030060052553C2C8
      DF7F5EA9D414145209F773D53C2D09A6B1754F8030060064D53C075E3394351F
      53A04BBBC105F0FDDA0D53E00C0180282A9F7E85E12D6FCB426C68CAA799A70D
      3578EFC01803005C2A9D45B3FD53E00C0180354F80300600C01AA7C018030060
      0D53E00C0180354FAA7C01803006A9F54F80300600D53EA9F00600C01AA7D53E
      00C0180354FAA7C01803006A9F54F80300600D53EA9F00600C01AA7D53E00C01
      80354FAA7C01803006A9F54F80300600D53EA9F00600C01AA7D53E00C0180354
      F80300600C01AA7C0180300600D53E00C0180354FAA7C01803006A9F54F80300
      600D53EA9F00600C01AA7D53E00C0180354FAA7C01803006A9F54F80300600D5
      3EA9F00600C01AA7D53E00C0180354FAA7C01803006A9F54F80300600D53EA9F
      00600C01AA7D53E00C0180354F80300600C01AA7C0180300600D53E00C018035
      4FAA7C01803006A9F54F80300600D53EA9F00600C01AA7D53E00C0180354FAA7
      C01803006A9F54F80300600D53EA9F00600C01AA7D53E00C0180354FAA7C0180
      3006A9F54F80300600D53EA9F00600C01AA7D53E00C0180354F80300600C01AA
      7C0180300600D53E00C0180354FAA7C01803006A9F54F80300600D53EA9F0060
      0C01AA7D53E00C0180354FAA7C01803006A9F54F80300600D53EA9F00600C01A
      A7D53E00C0180354FAA7C01803006A9F54F80300600D53EA9F00600C01AA7D53
      E00C0180354F80300600C01AA7C0180300600D53E00C0180354FAA7C01803006
      A9F54F80300600D53EA9F00600C01AA7D53E00C0180354FAA7C01803006A9F54
      F80300600D53EA9F00600C01AA7D53E00C0180354FAA7C01803006A9F54F8030
      0600D53EA9F00600C01AA7D53E00C0180354F80300600C01AA7C01803006007A
      54EDC744541C473DEA9F00600C0177AA7BE80924EA8156A330004E56800A4255
      AA7C018030059F2EF596000BAB401004516A964D53E00C0180000A9DD9329EC1
      50BAD3E54A081E53055544A7D8754F8030060022AA75058989E0A9D8185C190E
      49B4153BA5A84506A9F00600C008254F686F6A64D771446FCBBC8105C202B7EA
      9F00600C001742F296BB3841268509C6D0CAF87C77E00C01803D9FEA9F00600C
      00DDAA74123354F80300600A3D53D8AFA720A9E57BF255580300600C01273B2C
      6C49E7801D5275752004A68F00600C018017004EA82840D9FCD6A58300171900
      E99203D41E5083C8902E3109E302EF1920FA55E2BE038001C4BC0180300600C0
      180300600C0180300378003C43E02C0580B014EA02A45B6FAA380317E2FC5F8B
      F17E2FC5F8BF17E2FC5F8BFA4FC0580B01749E0B6FCC0017C177D7E4C68E00A2
      332C5F8BF17E2FC5F8BF17E2FC5F8BF17D842FE5AF01602C05D27959800068DD
      F816732C02864D6EC173004834BB32A50BEC31307ACBFB697F55202C816462F7
      027F17919FF027E64FE2FC5F8BF17E2FC5F8BEB8E3F96BC0580B01749E15279F
      41675E65AD7902ECA9540130D44CC7842FBE831259ADD786436DEF5FB6DDD696
      9B12EB36D2505EF64FE2FB01FF23C247B4CFC9A05342268764FE2FC5F8BF17E2
      F39DFCD814D7CCC013046BFEF317F2D780B01354414EACDAE4C6A40191555E77
      DB00035FFDD2E8233CD19C003AA4572783A61A916BF317D33AD498F89C8A6B6A
      DAA25A6C168084243496C8BD627ED369B99A13EB19F427DD345EB1F8B217D0F0
      A1FF43F288150FFA587D36D06E4FAE7E5D4CF5CFCAF2A7D18FFA4E116189B50F
      F6B6B79A5895001404501D50A5C3C022313F8BC6C178EEFD42B06A4C8C005410
      8E2FFCCFB8ACFE5AF012B614AE7DDCBD18004293D70074FF4AD27D7CECBEF9DE
      509AB5EFF928E02984CEF1501200EA86A4B8FF517BE640632497953A1F11C1C8
      D6B9DF9455D5CE8FB17A048563CD63E2413E819E393E4285F219FF5272A7854F
      628FFAA11643AC8A67FE7FA04F8C80A817FCE280888847240D2691F58FF3AB00
      1604581D60A583593F8BD593BF75D1952BB7372C7FA0EFECBFEC7FDB54560D6B
      FEE15FF4337F300B559950CA94B02F14A149EB803A9A35D3F906A4149B710A4F
      92A7A2668454C9EC02A56BE9E1402281D601583530D7EC14B527D1EA72195535
      671F294E5515A264745E6121118BAD98025527CC33D127E8217CEA052A27ED32
      563D9128AC875A93D889F2D40988CF2F40A7467A6BF1940AA17F9113D5D5585F
      945F8A20560A5834FC4FA8BF1840AA467CF13EECCBCF0FC893FD2CA871ACBF27
      8DF2A218276C0EB587DC3450EFEB55FE807E26ACFE93FA4F17527E02C0448D27
      A7F9DE41259DE4EB000F9E00180EB802E1AA7FBFEE2FA2D36B28B2731628FAAA
      B58B51E9F25D6C5E6921477800EC4F9C67A92525817D3A056727EE785CF65227
      DD0E0452209F5740A28CF64409AA97A8BFDD47FC22252303F241269AB131E00E
      060401A2D5FE7A3FD898F9259EE1F8A302A83FE6536A558368926AEC3C02801A
      8C27DC3F156042A67D5D87BA19FD27F49FD27FE5FF49E99001CD7CA8AA2B0674
      00485801507006AC9C780BC1BD4A349A625733A41D49F1C9158A3A11686118BD
      5242835002489F5CCF3B2F33F85EB63FC09A03C00F638FF042010E14533FF3FC
      2ABFC000C866C8207820D2CC3AEBFC4FF10708504359FF9FF5200A93FD38B244
      0D68F82D89E02BFD3CB181080841020E10A086B27C9C67F49FD27823E77899EB
      803F2FD054FEE7A4F3A00B6D7CFD5821C27D0800143C95707086AEDC788BC739
      B0ECC95041A13203E2453E331E208A96FE24140BDB27E291B984B13ED99E3A3C
      3705EE1F9131789E027F8CC60A0427F8A1C28A4B93EF1F86467BC7E43D4F9A9F
      E72FF1DAFB71400104464FF9593F8BE84FFAD2BF0ED7404230AFF9ED42C3789A
      800208107085043593E6F33C04DF8D230005A3CE28505E2980CF6801E9A5294F
      E9EF9DEF149E8C472706842E00041A0CE3D017C4A2F2C2070BC7A7F8FCA6807E
      4626AA0B84491E17BF13F8BD20FF23C08F623F090220B921D93F8BE357F92044
      4090008119FF8BF17E2FC5F73A9FC0580B01602FCEF7FA4F85F3BCB3532E9820
      02D3A886BF00BEF57E0A5B33DF6405A18BDF89FC5F447FC51F993F8BF17E2FC5
      F8BF17E2F8B71FCB5E02C0580BA4F6D40087208C000D677317E2FC5F8BF17E2F
      C5F8BF17E2FC5F8BF96BC0580B01749F094A46400C5F8BF17E2FC5F8BF17E2FC
      5F8BF17E2F6A49B96BC0580B01749F80300600C0180300600C0180300600C018
      022801CB5E02C0580BA4F4CF3A5CE0C7C13CB37280140201D6080ED9203CD820
      1C35D22505EFE883E8D875001BC00DA1E00C0180300600C0180300600C018030
      0600C01801F17D66B779BCA312DF65FDF008D7730045800D54559D98149472BB
      5DC1F2DF2DF2DF2DF2DF2DEF0B4151B30A8F000C800D53BE0849A519B96F96F9
      6F96F96F96F265A09C7C8837300568025C9DEF0CB7CB7CB7CB7CB7CB76A8B8DE
      7950CC3800160086A489E6BB7505CB7CB7CB7CB7CB7CB740B75532E041580018
      006B04196F96F96F96F96F96EBCC01360032DF0065BE00CB7C005F9BDC6EC086
      7C01470032DF0065BE00CB7C0086F4590D179C63000480045765BE5BE5BE5BE5
      BE5BA05BCBA734859600198003C607B2DF2DF2DF2DF2DF2DD07AE363A6E32C00
      77003346F96F96F96F96F96F96E4F6A9F57BA19B00568029BAB40AFFEF596F96
      F96F96F96F96E251B1C693AF81D74E0082800AB63C02B57200CB7CB7CB7CB7CB
      7CB77CB7437C13CA2D56C364B822F001A005F6FC0B044893A96218B887265A65
      BE5BE5BE5BE5BE5BBE6013F25EC011E009515D96F96F96F96F96E3A16EE7073C
      98EF9B9200A6100ECA407601B03C49D29485D4D107D4F2820036C017A7953919
      C5F8BE297496BE0B9B65E2796A49A4F184C3E33336A3D2158BF179FC5E57DE59
      D22DA6974BCBD42409F0A131AA52DCBDD46C16BE2FC5F61179564962B0B45B7C
      4FA88F242272768B8BF17AA0BCAE18B21A724FDE20612800108E2FC5F442F2C2
      1D113F7A45C45317E2F9C8BCAC74B1654E4FA98D545D8BF17D085E5790BE4FC9
      698E82D8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8B
      F17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F
      8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC
      5F8BF17E2FC5F8BF17E2FC5F8BF17E2FC5F8BF17D385E10202C2A2A3F604FC95
      31D958BF17DB05E4A8ADD0107ECC9F5297B8D317E2FB517999B225E49F92669A
      6424385317E2FBB179332864565E744FC0E0D1860598BF179F8BCA128306898D
      C7A7D0A4FDD77F09010191BCB8B317E2F43179ECE089626770E89CB4F27C9918
      30488C58B317E2F5D17E00C01801CE0E7B39A987240162201DBC80F6C901ED51
      00E3EE9C242F1AC83ECCA31001B400B3759CC00B3165100052DF32700664E006
      432763F80352B803327006C7EC4132D6796CC96D717576DE80DAF7187AC18024
      0007678832B297044FC824456177D69CA22A00149118E8CB4B8FA3FF27AE9970
      257743CE9505CC0034011AE74DCBA3D269E58E0CC9C00D864BED8F96C7CB0512
      F9BD201818349640785E76B2F004A0011AB66D5FC0B3228AB1BEF4CA6DC28F47
      A71737A2D4911936CDBA189ACE2ACAFCD1674220C12AD3579E07F50B802CB802
      D16BBCA8AB2C348C31CF9E64E00BB3264D8F96CFCB5110F0F213AD576C9FC267
      B3F218C148014F802540023311CDE6F7859382227CBC8408A488C98E4826277C
      15C8EE257E2028606B392ADE385268B860002C0044B40A131E3BE3EAEA709FA6
      64E00073264D8F9738A07088D931C28B2C1723D6B15AB496E0CF8867B86C0172
      003264D9438B8BC9EE9C229533254E5760C40AA586E7BC72B3FE0B1942AB1D12
      7C011300193974BB00DB6E2007F67E64E0060326598F9F769EF048BD7AD57402
      0284E4626A9CFC7CC01700040AA99C769074B613318FB81C60B75EA0434AEB7B
      7AFD3B9886600830006511CA2C1B89F67F32700321932EC7CE4D8F032868A78F
      D3B600128013DCE4710AE653C842954AFD27EA5EB01B28AA3EA01144765802B4
      00793FE235C6E08EB99380198C9A863E6E53380844B50A5B759765DF702600AB
      004764D3F0C0E098214AA6402F37C0382C4A4244249BD1A0600B4001FCFE87A6
      193327003B19350C7E19108F9877750DE793CAA4C53BDB8EEF000EC00FEC893A
      CE273529CCFEC2354A978A2BF49B269DD42C4B55ABA7EE74C400313E504D00E6
      4E00783267D8F8443647474B0985C74983519029A2B4EF8E00B90024D2A70887
      53F5D91B4AB65B55E82F281724566867A298C00E400486B178DCDD3BE5993801
      F4C97931F028C88A553E348A27757DF4003122E6000A00213F0884C7920BA75A
      082954752998C0A0548C9BE04BCB487D8002C0097E69E2927589A838EA2D9938
      01F4C9A793F489A9D5F3A3A3C45669D3B91696AED161600B4002684D4993E361
      D0381F9CCBC3B5EC5F594829553257F1A5E34AF3E5766AB99E5C536008500293
      207161124FA26CE55F79938005CC9AFFA7D67397E962E9D13CAF3E97D7B09E07
      088E5BB788A97D08C011A003E271CCBE7B4020B1753158A26FC1617FB56325B8
      98DFA9378F75AADD9AC565BB32C8C011A00008447CDE37DC17C0A1BA7CD23799
      3802E8C97C31F2778AD5C4F9C0F4A36AC5AC237264000CDE5AF2DEC8C25FA52C
      6B9D8A88A524B192D724DB416F211B5AB8028000CBBE972F64E5DE6F40D7C090
      79993801C0C98A63EDECA37D7F802DE001C5259939939938022CC95300071C64
      6FDA60752AF0C03BD300C11601BE6C0B86AA5C50BD54C10A52A69524068801C9
      15C0580B01602C058088E026C6F3702950E07A37AA0D3615FB15C4304469BB61
      224AF61408BDB992DE3637C1EDA9D8BCB28F2A2F6B9E9517A8FE4E5C03AC680B
      DB5E8DC976E9037BBADFC036131B1FAC140A1019140C4D6409F6D0836829BAAC
      DE7CB5685E80F5347AD39128CB01FFB9A017BA3A3A2FA133DEC9DF3BCFB817E9
      23F98EFF353926E965CEEC06E9C3E7D824345E8E5BE1716B5773B5F53AFC407E
      F1BEF8DFF297D24C7A53417C863D9B0785A633C5EF36ED22F3CCF717BDDA3968
      EB01FB62FEAA3FDEEFE7A01860ABEF0DD9AB9A550AB57DC9F716202F7CC3BECA
      9F24E4F8E0F9048BCA28429151B28CAA6EA7F6DA8751AF3FA72C42F7CAABEBE1
      F936FE1F3B807FC924E93EBAA32A5BA174BE67BEAF1F4101414289296BA80BDF
      0E2FA147DDBBEB389FA81FD2A7DF53EF264726978E171AB5AA015C5F292D02F7
      475F70AFD287F2A9FE4A44CF040913B35AEE6FD4F1E0F2671F69890BDDBEC6A8
      6388897E60619EE87849635D89C5CB36975AA129B4DD77B40BE34DF1C128ECE9
      633C74A8D1C8EE99C40A8EBB2467C662E365D1A572C4FC392A36A1B922189455
      D4DCDB45F0298E46DA19ED16CBB62806BBB3EFF8211333E200C6EA6789FB15A2
      E2694629CA03A9966D17B899F1E78667E67CF19F1D89CCFCCFCCFCCFCCFCCFCC
      FCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCF
      CCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFCCFC
      CFCCFCCFCCFCCFCCFCCFCCF833DB5CDD5AAD872BA19EC06535CC4C4E5527DE19
      869731A21714099EA62F3F435685083E321C698CF5C321ACF14ED4CAA7FD25B7
      80EAE98ED52A27CA3421657117D7766DF7379D526CD0608AC9979BCDEB1751FB
      AC1B8E17F2A4F8488080F47E82384047B233C201F2D5E6F80B52ABD8DC45E100
      F0F60ED63B4DC0121A1D44679B1F29359BEFCB058AD8208B9CDC545E6935A8DE
      27BEAC8725035A333E15BBD9F5368640EF7ACD43C2FA24512E188D2591866E92
      AA261445208864AD565A57AC19E20239A562C168432C14222CBC5E410FB5459F
      8149202817AE2FB05BA060AC3F885F2A19F0A4EE77802154BE1B6B873350EA0B
      E12F6017922C24CF81AD6B5FDDEE1BCF53435F06044870CD69554AF43CEB0D96
      ED043CFA85513DA5D7AA198B0BE0C082EA8341A943FE76BDA64E778CC6129000
      007898CA417C25E622F5858B19F06941930C69B79827DAA56ACD0FEE10884988
      0809AD9BF8294E662E2F0001A30A1A543AD8A014A16864C5417D3B851B642F84
      BE905E9126919F80B01602C0580B01602892C420DD66CEDB1030004400C2E00F
      438038AA801BB513A185E557A1F4C015218000C10284AE5B3C6EA45A49517A00
      80BC0760478B31662CC598B31662CC5844590268D190784F8000942BABC1B1C8
      93950BA9AC598B31662CC598B31662C222C8C831DA626341B0ED8D629600405E
      43B0DC6F58AC2C9CF0CE7F2BF7A0090BC875216118999CABC92D3C7B2C0090BC
      E695DC99CF3CF3CF3CF3CF348F397AF3C3670BBA177618017863E146D9D78CE4
      0A483A42F3BC1911AC2CA6EAFBCA769F021802775874AACD748149074ECDE4F6
      485891335000364CB6EECD1D3B499EB148026BDE6C326CA8A07485E7657484C9
      479AC0093F2BCF3580127E6799B3CD7BC9AD576E55E79EB9F3CE9A5CF25EB0FC
      84B214F7A4A4A9902B114A7AB8A1E73E339470C8D64F09164815808CBF8A5266
      7D2D9EE4280EA9265B683A31990E2801393A926640AC044964F3F161E6C0024F
      CAF3CD81649F97079B2005F3CD92664FCB83CF5CFAE7AE573D6EB76E98B66002
      718B26319871300007070A6A627B4AADA3CDA5813553504CC9153F71A80EAC26
      6914FAC355D0722A4CE4A8D902B574525BD91E6B55EB364ED680069F9507986E
      4D1F6A51A1CBC0C4F3AD3F2ACF38F51A9D276B40038FCB53CDC3C105CF27A484
      6AD73B87820B9E4F4908EB9DC3CDC3C115CF27A484502E794D554A0033906515
      2634815C08AE176CC505958DE009742C013F7648B240AF0464D5B326648A8322
      FAA140759932D06F41672C288027F4095BD3FBB3C118BE99B9ACCF30884F5124
      E778F0441C89F880F3B35D80E4E77CF04C1C99F8DC79AA78260B40798B8B92C9
      CEF9E0983933F109E6FAE156AED35DB6CB9D339161628BB6D4F39391600372E7
      54E458C75576DC1E6C76536E5D9CF3B89A180255EAA089F45A42F2E0D61626EB
      4B6B38DD9D70CE4AE725D22C54113B6590B9A4DA934A4CC000269B930B03AE89
      90202040F8A84885E4935CB659004ADE541121190BC8EC01E6B1D4001090F358
      EA0208B73CE03A8082121E6B9D4201094F36173C0005C5CF00017D738C001B2E
      7800172B9E77B2EFBA148F8B46A1D08A8234C5EB5F2C0B2C1B5804693CA42FC5
      941765365F6A499A2D206B7002A141C4CC1D44F8DB9DD64C86AD9F1189F411A0
      BDD6F80044F354F0A392BB4B082D507293CE116567AD81656676FCF384E4260B
      5279AC7851C91F91CAE105AC0E5279EB9F5CEF8B9EA6567B63B8314090CA9D05
      EB24AC240D06C3EAAD158A5E8A6B6AD389898ED61334422997AD75810C02CB13
      33BEF506F5B80AEABD1CF5D755800B02EB730AF5A358E1E670F05E54EFC99A3C
      CE9E1476C66452AA3C2D8F360F06400B0F33A7851DB567F4785F9E744985B72B
      75CF47222B185CF6BC5CEB176DE2E75FCDA6576B07B223CDAC6D31A3C6B490CE
      36ABCE666F31F70990C3E41289DF694A4A5D5405460BAF531A1645A9C773D611
      16A4E205A32665130B14B361DED58C8A71F4054E0BB8AEF0AA82654662D66BD9
      C3CD939239AA64ED640018F3A39230047B4D1879B872472FAE9DAE80181E769B
      AA50B9DE0032B85C8F360B85D573BC006570AB3CDEF646849118B49DEE893DD0
      68C175FA53DE9757F5B00B2B9C506DF6B7FD5B7AA212305D11B0717A316404CB
      9F034600624CC6E3D2EAEA158ACF76A91AA02D7DA5202D7F7622AA9A1564CD6F
      5DCF1D203E461335DD5A98083971000203E615039E7479D7CC753BB200213E68
      003CF390997176DE9E7546F09C8E2EDCF37173C4723ABB559E74005F9A37FE6F
      B42F23C2293A95B9004C13FDCF5E97508E416544F9BECABC2BF056A00ABE79F4
      FACCE8B0A84CCE67B635E341C2A8B9004FEC970A385C499CF3CF3CF3CF3CF390
      F3AF72A729E6DF12151DAA19BD005076847429C598B31662CC598B31662C562C
      76C3300600C0180300600C018010400888D0DCFF4608000E8065140729D01EF5
      14036C9A0010B9499C6631EE3988064802B51444465A04600C018023E0015110
      B95AC36E91A4132A829965071B505803003E800A3E68FFB548E24822FE030060
      0710044935B2474903DF28E00C00FC00A4996123E84F0060090011E48CB38030
      060024012A48C898030060024013B48EBD73C01803004400B12475F8D600C007
      0002B42005C40DB1238877803002F000884F4157EFA8C080281140E908D0691C
      AB3ADAE405002923AF72B00600BA801AADA7DBA9F509141080281140E908DA48
      E442E1F1994C891CABBA0393ECA005246A5C01801C4008C4AA9A91D018588133
      9C4FE926A07481AA48E442DC577E509123BC80A37769800A48E94CE00C000600
      A3E69237FC1E304525DE1491D03A40D524722162F1F192648C5E3530DE248029
      233BC01801DC00E4C190F90479263142BA04503A60D524732166C767D32477DC
      20DBA5A2480348F001D82EB3DD2484015A30742F491CC85DF8001E648E0D8F25
      DA992880150AEA32600C01802200524732175132648DE882A1DA85D1002A9CD1
      D803006002401491CC85924F09689238E2C7534A57CC00560EC8C8C96B0E3405
      88118030058C0088EA88EDA446642E99F523B1247124D1803FA8B006005A2C99
      0B8D1A084D1122ED6732A83A0140323A6B6F2A6BEE0D02DBE58604432DAE7521
      E418C0667EE73E937005E60019BA4096007E31F00600C01803006B9B00600C01
      80300600C01B62C018033A719635C0180300600C0180300600C0180380F8032F
      D33A2BC8AC01803006B2B0066A600C0180300600C018036BDCDF644640600CB9
      C0180346700600C0180356D8004A4DF29F00600C0180365B80331F37F00600CF
      DC019A19D19938F300600C01AA9C01802ECE00356301B00CAE0B8423341D590F
      B06120D24133F0D2682D0010747E20FCE5BAC95B0455889E111D386840C9C446
      9EF2076CCB790D7B31FC4C6F0A42BA634E73C302271EAD541296AC004A05B800
      5CA41285253B1D0F0E182E01268E6F89C38906F079AE3338087114D8B1388958
      31EFCE8781392AE789ABC593A84C1C0892FD1539009C57400216E11500A80EC0
      408076038E3C581F942CC0C5806A114A1804281018444B01280C2203F230DD85
      8204C870B22434A4507241123E644630E494151271C81D53D4625235130E644C
      6A0C38ECB03C8894A0F6440D281FB0017D4808900E502F4032811025A1D7882D
      A11D021CD045FE0C84966C25D3290A06932C0696AE94A225E74AF5811342CC68
      9847706A65A34278C37CA002E009280926281124661C31005E3443741002EC82
      6DA53F9926881D0BA196C2800A06080C2015018C865D032804BE0D0D0013C4F4
      C4988A56150227AFE5846C909010D0A27030A1750C8C665C9C75325D6009E3B1
      43A6DD3912A71D821900398402100C3C010E06B50C885C6808A0D98093444DB8
      FE603080B3A08AC1557A3A989A54D3B0A27C0AA88C580F7A55478516C329F321
      52AE800BE6CA0098B1910886DD6F000C01A0004C0A98297C0B189860B60C2834
      A8D9100D107D51C5E4909C61381060B4A187C66A9266238BD830CCD99C5A1419
      9CE00E402726D52A9A1047E52AA6FAC06BF439631EC3262F1CA014E031835815
      1806C08A1802710B90484C78F83864F5A154C4C4987CF906F92E1084B48719D1
      69DA98DD4C02527F84368660B424D4A2AF9E09466A937C5521524E584F51F11C
      200380CC04AC037A045C05581FF088809D2860D7821DE81270004B2B9842A707
      C606C6C475EFCA26301513A57A17BE800B0743255E26FE122214CAC007803C00
      510C2F04E4E295D183520441467C11BA4705D3806784D991C6C029006E0B114D
      0450A28DA98F97CDFC2B700C4001A8633713BF822FD2B0415694088C60B189BC
      28EE432E4D1410D2A983820F1C89CCDD26D401E823D05E00E3E006E8AE297819
      7E4B0652A879E81B0224612FBB1FAE00C4022107249E4329B11BF2524335B280
      4FD4585861FEF247F00160482C3EC017C0F2821A817D117061A85982A7B1E2B9
      1ED43AC235849FC376910AC0C7407765B6019F481F439E8C3D33FE2917173480
      0A57BB28173DD74597413032DCD0B783AF944FA04309831E1FB805AD8A026024
      A0FF81DF004A1EF812F842F844512B03DF095704142FF0D571E7C509498FC847
      424F437E961F927F998FCA01A46B419C2256898245D922BFD39F122B88C97622
      F1059B31B11C0550B9490286D329EF279805C075691D9813C076013801C14FC2
      3980EC0AE7073D8D9C1DE817E805FA49B8180152E0BB41065248A55B84D0000E
      18E00D3A4B6A348019D40474B0D45AFA4DBA763C453C54E09E5E514BE876B2E3
      D3E0035C5E5986467B80FC08E01941200580080086D0ABC186004A0060D0A3DC
      3179313802AC287D2076931B85402FB711BE022F06F0CB3F050BC69F806E5156
      F858C3C7C9EF490268500F80964FA699442FC1C792CF94C715E0C07700B801E0
      0BA8E040426C010435E400E81060C738278064E91B8010C8A049DF208F892482
      83020FC931F924628B01CF93C7F38027884F4FC35F9AE7425F0301157E4C1E2C
      8F961F0830905F0F8E3A7732578C04E01F020C093033F050434C117E02FA2130
      24204C0281229E006B84701630BA782981218808204FA25FCD2FA0E087801562
      5BB131F1123245738ACC48CF418DA65E7E74E484E0B8BED1C03000C601B00060
      3800C607820AFC59C013009A1D10500063C3D006690490230E58020398020849
      1169F015E464A71C80979F8FC474822CC8EEFCD5FCFF11629C522AA447468110
      0A419004E00030F126FFC01E029C16203F03F808707B40E2120C244078E0F182
      4E0839087238809101D19339090643E420C825909F221C660BB19A408919588C
      8FD334F609CFC9B7D03CC21B23919C9F94E33B558799A8BF7CC3D938048037E0
      AE087D0D029C0C30F0C0FBC2EFC6270D8C0DF88C60A6818634191D98ABF110C4
      272A0817120A2C2045B058233217F059661E6529F10E677188B985A7E18FCD9D
      F3FBC0AE30726151A1F3A1BE1315E284033411937E0B60401A09FF137019A01F
      C33A03901F4009D88E2063EA0B4C24CECE1CE81B0165A14280DF89CBA8B931BE
      D2DC86FBE1B00ED3099E0D03869EC6734CD4258D021094401D00B08256C00F88
      8E086DA2FC2082801B4E00001E79E920D10FC8B107C6615697F00B800804A007
      A81350C100810FFB8A9A2F208D015280504A943C81D042851C9C1AD46C8001C0
      8F92AC25CEA1C3CBF29081250F07087E79185059E8988DF48C2286B540047126
      34D22DD250E24EB839F475100800E022083600AE0E7830EE8DF508ADE49E1F2D
      DE8BE682004C0762BC294FB101F283B1925EC96ED4794A44727044A00D893281
      384E9095A094009006D861B034A2130536576909D20598106283ED6F24114C3C
      62B8452A67088E6DCCB50482200C5489A088F47CAC4ED7F72B3ED3450994EC0F
      745770C18E767546A0E4C7E88C6DCBA107BEC845440BAAC31099F34B72A1F2DB
      EC48324020CC63E752CC6C659206115E8D42872446832C3C03B27160C20F216B
      8B800B546E480B730803A42AC675699A635C70020040094440015CE609525EF4
      D0FD39EF1A5E245F7AE9250A4731FBD4397A571D652D8965C0CF33367260F09E
      A61287BD6CE24AB0504EF69C3AF9C0A0C4A4A636EFA55616027F109FAF066B20
      3992E1BDE323590426187B398D00B17DBF00078883F42E366A2DCCF11E605438
      3CD4AA9A4F1EBB3CD7C31D3329ABE5758630D2BAFAD4001E19331C9034F40D64
      4C311006111E3F3031991A5905F0409D89E65D30584F3415F3FB39096DC1DF88
      83D49C3C2E4293DD44D2B919EFED2C702A118F1BFAFB400DFD28DFA6AA103055
      5FD90FFB3AA1C37F28DFDF16FF05C83929086FEC7C240C2DF3FBF307162D4C4D
      1C904C49A60618AA5CC721D0E48BF4D6727BAE88AE3D5C91300C8711CD45D155
      D1E6124706AFA5771803F02F000B9C016600F42640DBF891810710460128906C
      0B1A56901014410A85F34A12077C725BEA00305BFA5F1496F4D4D8D1970946B5
      A0044320330133400F0111908181A98D929F442C4A0D7E205FC93C077C453A08
      9C96F4D94E26C044BACE5F5166808945AE127D83A973EA1A62E7D063809E4A95
      155F005A05380170603F044E1661F03CC1F68659119400E81F8E1A2888C3F692
      C601325418985054FA5F3A2EDC945C6529186C160E8847408C0B86474549D94B
      1F87581D2F5183110C928643F0012C7009C00C81D0163079026306901C402D00
      F6C16E023D210C814644A94874143E962E029C2D94928C2F9C1738096E76FA38
      5252B83B2999E8916898A6720B2711D7C8014B8F471E5F3193E7C004A28B80DC
      03740DC143811008408501F4025000F436F07D69118054E4DBC13386CE3778A2
      416C82F901C299A8340E0778B0F40C8289E1B7A0C4025070A49CF5057817EA3C
      509BC385E13093571471235618B9BD16BDA2D2600F80BC076021810F80270EB4
      407003E1B68BCE024819F1D9C38F8E8E437C244926928924C7C47BE5D24B65A5
      2BE4C1486C0DAC448B452CC665217F395264E20FFC45881D795053F3F3B324D1
      25764A5CE61E7BCB9004E00F2F0372019C187019C2ED006423C84D985F3097E0
      AFC5D98FF3261A44AF017E2E00C1889CA353948911144AC4CFCCF10104032D89
      34540F0264039647014974835F1E05159529E50BF7C2A3A45267C70078B807F9
      E03E34A4FBE439C0B597C869C2FECFC121FC001B9FC3914701EBB5DB4F8202E2
      37DEB7ADFBFDE1791E9FDEEFD037DABD6EC601C0380700FC20362A762AF62B76
      2BF6AC7FD69FEB6F5DB2DF7C4D301BFEDBF7BF53FF262CA0801D90C9F00E01C0
      3807E301B553B557B55BB55FFEB3FCBE7F4808444271D758A8A901D7BC038070
      0E01ADC06D55ED56ED57ED58F4FDC0380700E01854FDCB4E01C0380700CDD69B
      567A9560BA3AC7552BD7A0D93C2F340763EAB803D1F9341AFD7EF201C0380700
      D4C06E53EE54EE55EE56EE80EE58F842B151009801F1F250E2991EC01C7B2EE6
      601C0380700D6C07F9FE088440211E8781E6BB542DB7629DD89F319A4FC89F72
      79A8F613399D1875BEF67BE4201C0380700FCC0372A772AF72B7759BB963BB14
      F4FDC0380700E018BE7EE5A700E01C038066F69EEC51BB3DEE596F47E63C3FBF
      D838444487601C0380700D6C06BD663782B55CB0C3FC088727EFFB96BBB67EEC
      4FBC1F58E3DB78F657AA88B6F5757179A01C0380700D7406E55EE56EE57E6E3B
      A9C38BE6DCBA3D3FE8FB3F2C388C666823E2B1A113EF00E01C03806BF01A8150
      B208E4AA6509CCF0A50E2317994629FEFA3C180D1C0B1F98E45B4780700E01C0
      326D1DD18F9EEEBCCE29FBAD3E01C0380700CEAD3DD696FDCFA894CB410546E5
      344437DADC0380700E01B2406F55EF56EF57EF5AFD4F63E4A27FDEB5DBEE8C50
      9A06DF1313B3118E80700E01C03807C6037ABFED773C62371CD469F4FDFB67FE
      C2036176FB7E213A30F8D80700E01C035F01BD57BD5BBD5FBF14EFF53DF696F8
      5F6D1E01C0380700FAF68FD8769E3127EEB4F80700E01C033BB4F7DA586C6A51
      10F4A0641174C28180700E01C03807C6037ABFC67FCA062490BFE058D118A3C6
      D9C392F8DF127544AE80700E01C03807C803C51BB26E13F027C64F842C864B82
      8A07C7A9700E01C0380700DD01E15FE3D4F2B18120216161F132DB4E6B68F00E
      01C0380655DA3940BC6D24FDD69F00E01C038069D69F8C518F96170BB4F0FDB4
      43780700E01C03806E80F13F61622328EF3FDF4FE36BECB6CB7E01C0380700E0
      18101E394E5D3726D16B7FE024635D1C0380700E01B90AF1E9FB21B0DE1174D2
      9C47D2F6D1E01C0380700C3768F858FF4FDD69F00E01C038069F69F8C518C8E0
      E8B83C8EAC0380700E01C030203C2C72F1B1322F27B3F04C51800183080700E0
      1C038060407F628F10BFCDF780300E01C0380700C100F1697C0E071518A3B68F
      00E01C03806D9DA3FD3F75A7C0380700E01AADA7FD8A3C2DB80700E01C03807C
      603C41BF0783C5CD8A32F19D3500E01C0380700C100DDC51E7BF700E01C03807
      00F8C06F38A3B47F00E01C038061FB47FA7EEB4F80700E01C0357B4FFF146934
      BA9E01C0380700E018601F4628F0B8FE240380700E01C030C0377146E6BC7C34
      0380700E01C030C0379C51DA3F80700E01C030DDA3BB8A3A91E01C0380700DC3
      69FFE28F1FC2E6C0380700E01C030E03EAC51F1BA1D580700E01C038063006EE
      28D9CD77040380700E01C03180379C51DA3F80700E01C0318DA3BB8A3A91E01C
      0380700DE169FFE28CA6553540380700E01C032203EBC51B85CD9080700E01C0
      38064406EE28FB7DEF0C0380700E01C0328037BC51DA3F80700E01C0324DA3BB
      8A3A91E01C0380700F2369FFE28CB0B4CA01C0380700E019401F5E28D64B76B4
      0380700E01C032A03771469D5330201C0380700E019601BDE28ED1FC0380700E
      0193ED1DDC51D48F00E01C038079DB4FFF14747380700E01C03E611F7628D64B
      56A40380700E01C0330037B147D1EA76E01C0380700E019801E6E28ED1FC0380
      700E01956D1DEC51D48F00E01C03807C1B4FFF147803C0380700E01C03EE01F7
      E28C24182140380700E01C033A037F14731F80700E01C03E711E7628ED1FC038
      0700E0197ED1DFC51CC7E01C0380700F9769FFDADF87D3EE80700E01C0380674
      07DF8A3F7C0C1780700E01C038069006FE28FC5E8F6C0380700E01C034A03CFC
      51DA3F80700E01C0339DA3BF8A3A91E01C0380700FA369FFE28F359ACF403807
      00E01C034A03F3C51B65BAE580700E01C0380694079628D3AA95B40380700E01
      C035003E0C51DA3F80700E01C0348DA3E58A3A91E01C0380700FB569FFE28FD3
      ECFAC0380700E01C035003F3C51B75C8EC80700E01C03806A4079628DB8DC71C
      0380700E01C035403E4C51DA3F80700E01C0349DA3E58A3A91E01C0380700FBB
      69FFE28CAC5D3FC0380700E01C035803F5C51E79D277100E01C0380700D600F2
      C51DB9780700E01C03E811F2E28ED1FC0380700E01A7ED1F2C51D48F00E01C03
      807E5B4FFF147C5E3F3601C0380700E01AC01FAE28FBDE3F440380700E01C035
      E03CB147C0E473A01C0380700E01B301F3628ED1FC0380700E01A7ED1F2C51D4
      8F00E01C03807E9B4FFF147EA7CA1680700E01C03806D007F18A3C7AB700E01C
      0380700FE0079628D7ECE6BC0380700E01C036803E6C51DA3F80700E01C0357D
      A3E78A3A91E01C0380700FE769FFE28C14282A01C0380700E01B40180C519D92
      0A180700E01C03806D0079E28C08242601C0380700E01B501F5E28ED1FC03807
      00E01AE6D1F3C51D48F00E01C03807F7B4FB14700E01C038067D628CE87E5040
      380700E01C036C03B14700E01C038067F628ED1FC0380700E01B36D1EC51C038
      0700E01A6F8A3BD9380700E01C0366FA6D52AB6571E28D209A5A40380700E01C
      036C03C4FFF038BCB45ADB89E59080700E01C03806DC07D78A3B47F00E01C038
      06D5B47FE7EEB4F80700E01C0355B4FFF146C86433E01C0380700E01B701E163
      B89E2FF17DBEC0E3C51BF5FD9380700E01C03806DC078B4754AA58E8B5BEC767
      C500E01C0380700DC00F0B1DF87EF871E28ED1FC0380700E01B56D1FF9FBAD3E
      01C0380700D56D3FFC5186879340380700E01C037203C2C7482756022292CE08
      5AFFAFF03A3EAFAE7E01C0380700FB457F4FA82A163F51D87988B5B79BF33500
      E01C0380700DC80F0B1D209C5388E8F0FADA3C0380700E01BDED1FF9FBAD3E01
      C0380700D8AD3F16965E5E7622C16CF02EB75FC300E01C0380700F8C07E3F27B
      C5E6FBA0911109C5C4727F0B5DE2F9CC8B8BCAE989B2DC7840380700E01C03E4
      01E15FF53ABE0138DC6F713F9FFC0177BBFE21FCBE40700E01C0380700F90078
      9E72F9D9348EF787C9259B68F00E01C03806F9B47FE7EEB4F80700E01C0362B4
      FC7A8EA052B0910DFE1F10280700E01C03807D003D4FBAD982D014FDE96BF99F
      00187B9F19D08C844C2D0DE8F67F575700E01C03806855FA56FA57FE4FB20342
      CFE07179E37A3D5FA32E1C52700E01C0380700FA407A57EA151B011697AB470F
      91CAF6D1E01C0380700CABB47D2C3FE7EEB4F80700E01C0365B4FD4FD9F930A2
      1F57BBE142D7E6F3BA2809C0380700E01B0407A55FAC4FE95FEA7ED2525411DE
      BFC3EB45F31C6D06BBA87CC749E0139AE6FB780700E01C035901E957E95BE95F
      FEBAF5EA59E29F3188B67D7AAF33780700E01C03D2AFD627F6AFCF2954F22D2F
      BFDFF49004040D5B4780700E01C032C6D1C7A55380A7EEB4F80700E01C0367B4
      FFC77DAF79ED1182C96C23D5F1C1C2980700E01C035E01ED57F0F89CC47D27B9
      F7D313F00E01C0380700D3DB6BDFA9E69369FC895522E601C0380700D7807B55
      FABD6F0C8703F26D1E9FEF13FFB07DFD4ED86FBCEDA3C0380700E018B68E1E34
      364E6BA0ED59E7EEB4F80700E01C03AD3E01C0380700E01C0380700E01C03807
      00E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700E01C038
      0700E01C0380700E01C0380700E01C0380700E01C0380700E01C0380700F401F
      C4C0FC0844003AF8030CC03BC47F210F0C05A65005211FF703FA003F2077EC4E
      FD91F94041122ED82D1203838593D3ECFB40380700E01F5407B54FB55FB56FF5
      F68FCFE7F721A8DC9047DE26EA5CC61124965B40380700E01F6007B54FB55FB5
      6FB57FA2CFF77D3EC449A556A85D6A8B2B485EF00E01C03806CC01ED57ED5BED
      5FED63D3F700E01C03807E99FBA13C0380700E01B5427DC23D46AF848836DA6E
      BC89E17A9F19190D2741192CD6D93B1DCF3C0380700E019B00F6A7F6A9F6ABF6
      ADF73B7B58FFC2B399ED385F53EA049420243CA666A6B00E01C03806BE036BB6
      9DE569385DC54F9637210B5FFC53EE7DD66BB6822D2CEC7E49A16FA895EC02F5
      3AFDB80700E01C03EE80F6A9F6ABF6ADF788BDAC7DCFFD3F700E01C03806059F
      BA13C0380700E01B5427DE28F7B43DC1FD6F07935A7C0380700E01A06EF57BEA
      8AE5763D8A1A169491E01EF14FB59FEC7CA07412EC167358AFEEBDC89592C969
      9B87C7E71970B96623D6B04071537D80818CB85F31E01C0380700CE203DA8FDA
      97DD97AD96ECA32795CBC37BFF40290B2F709F7C97EFFC9F7CCEF7AEA0C9E56A
      D5144700E01C03806CD01BDDFFAD314CB07C0C07DCFFFFDE7A7EE01C0380700D
      B27EF709D38AC5D2211FF8CB80700E01C036780F9B1BF15F30113392F469A184
      FCEF7F31EFCA0F1C940AE8B4BD46B36B00E01C03806C003E2AFE2B7E2BFE42B0
      78B07A8D9FE9BB4F56676BCF4A6EDBC7F8514363A1F154CE1743C9189FEEF8BC
      E61F950E700E01C038065C03E29FE777F69ECBCC375FB1E133098CCE4ED2F8B5
      F9DE32E9E1106FB7FC0CDD7EBF8201C0380700D8007C55FC56FC57FCC53F394F
      CC4FD3F700E01C03806209FBE4F3D09E01C0380700F6613F314FC84FCC518E47
      65330F8A47632CD66BF80700E01C03807BA03E2BFE6D4D58B861261196971D1B
      5BB1DC9B47D5370329554B14FD87CF50F9E9FF2EFD94CB731B63B7E940380700
      E01BB80F8A5F98A7E7A9FCF9DF9CABD8EDBA2984FB4DAF413A03E7A9700E01C0
      380700DF01F15FF3666AE5B300CB4B4BB4FDC0380700E01974FDF79DFFBB4278
      0700E01C033AC27E7A9FC84FCC51F2D3F9DE7E43780700E01C03806F80F8B4C6
      470793B3F13151B31C1C1E98EA79549B2FD1F65301850384C81EC9B46FE61113
      1A4E28EBC780700E01ADE0FE628F8A9F8ABF8B1D6CBC68A7147CB5B108848747
      B80700E01C035D15F3D3FD9ECF7C9D99F3E97A7EE01C0380700C533F797EA5AF
      D09E01C0380700D0D09F1190D12613F3147CA07EF2CE01C0380700E01FB00FB6
      9FD5AFDFABFA0B4729D5C9C518A126AD4038A36FE131B628E01C03806A2628FA
      A9F7B147DA03F77FD1240380700E01C036803EED1F9FE2F5A71474FDC0380700
      E019127EE84F00E01C03806DD09FEC51F56DC0380700E01C03F601F712FE9F57
      E2C51C0380700E01F87147DB5780700E01C03807EE03DEC51D1CE01C0380700F
      067EE84F00E01C038078309FEC51B1D8F8180700E01C03806D007628E01C0380
      700F138A3E84E01C0380700E01FB80F7B14747380700E01C03C59FBA13C03807
      00E01E3427FB147E4F4FB601C0380700E01B701D8A380700E01C03C4E28F5FB1
      DDC0380700E01C036E03DFC51D1CE01C0380700F2E7EE84F00E01C038079709F
      EC51B43018A80700E01C03806DC07628E01C0380700F418A300010780700E01C
      03806DC07BF8A3A39C0380700E01E9CFDD09E01C0380700F4E13FD8A35F62638
      0700E01C038078407628E01C0380700F4B8A362B670700E01C0380700F080F9B
      14747380700E01C03D69FBA13C0380700E01EBC27FB14711700E01C03807AC23
      B14700E01C03807B0C51F83C1E880700E01C038078407CF8A3A39C0380700E01
      EBCFDD09E01C0380780E5E13DD8A3AD01C0380780F01E03BD01F8A3C0780F01E
      0398628F63F80F01E03C072C23A7C51E45E03C0780F01CE4FDF09F01E03C0780
      E7213DD6B6464A4D80F01E03C0780E100FC51E03C0780F01CEB1462E2E4380F0
      1E03C0780E300E9F147C73C0780F01E039E9FBE13E03C0780F01CF427BB14724
      924AF01E03C0780F01C601F8A3C0780F01E039DE28EA17C0780F01E03C077203
      B3C51F1CF01E03C0780E967EF84F80F01E03C074B09EFC518A8B10603C0780F0
      1E038C03F14780F01E03C074AC51C7E472AC0780F01E03C071807678A3E39E03
      C0780F01D34FDF09F01E03C0780E9A13DF8A33C1E94D80F01E03C0780E380FC5
      1E03C0780F01D2F147F3AF01E03C0780E54476B8A3E39E03C0780F01D94FDF09
      F01E03C0780ECA13DF8A3E94F01E03C0780E5447E28F01E03C0780EC78A39F52
      69580F01E03C0780E400ED7147B2BC0780F01E03B49FBE13E03C0780F01DA427
      BF14603068BB01E03C0780F01C801DC628D66B86227146512C9DC38A32D2F3AF
      14780F01E0358B147554F778A386C3E3D80F01E03C0780E400EE3147C73C0780
      F01E03B79FBE13E03C0780F01DBC27BF14776BB02E03C0780F01E039203018A3
      A1E91B30CD06BC10CC361B60D198ECA0C484A569B8386C3639DE3E03C0780EDB
      C2F552F5C51D553D557DF628C8C90B301E03C0780F01C901DF628F8E780F01E0
      3C077B3F7C27C0780F01E03BD84FE28F01E03C0780E9D8A36DC0A287BE43C2B3
      A2948AB3998CCA33C5E35223DB2DB783D96CB6C4E29F01E03C0780C9C03AA9FA
      AA7AAAFF14780F01E03C07E28F01E03C0780F01F8A3C0780F01E03C0613147FD
      CF80F01E03C073603AC278D4864E0C51984C6A23C7324CD29C5BB71BF133CEA7
      5474F8375B7FAF84E70A0A088A4623F80F01E03C06AC01D547D54BD54FD553D5
      5785C51C7E4B33C0780F01E03C0720061B147C73C0780F01E03BF9FBE13E03C0
      780F018484F7628E3F2499603C0780F01E039003AC27A151A8E82021224E28E4
      F319BA26EA269F450946590860B29AA825158D89B77AF83F5B83A3A9DB5701E0
      3C0780DBC07552F553F554F555F58373FA1D1418A3B158ED380F01E03C0780E4
      00EAB1ECBB60300C51F1CF01E03C0780C2CFDF09F01E03C0780C2C27BB147FB2
      780F01E03C073423AC278B45E3C9B63AE28D78C96B229CB12D1441112C788B42
      D6092714F5F53D5CB3642207118B224F3099A190D46E603C0780F01AB007551F
      552F553F554F555F5836D86DC1C18A3964BE6980F01E03C0780E400EAB1D9CD1
      6D21A5A5B39FBC0780F01E032F9FBE13E03C0780F018984F5C5198989F2158B1
      5FA2DF7B08C0780F01E03C072A030B101545B17C8A10A452AC81C9F2121274FA
      972ECBB40A714F5F53ED56ABCA16CBD67A6DFD42AA57A24E4C4A2380F01E03C0
      6B401D547D54BD54FD553D557D6D0C301F2027D478E4723A8BEDF4390A8A8AD8
      0F01E03C0780E580759E759B099C9EF7900A45FE7EF01E03C0780CC27EE7E9FE
      C2E13E03C0780F01B0E13CBA653E4C27AF27E371B90261B971717E03C0780F01
      E039601D67DD6AC166027ECDC7951A28CA5EE24E2DEB8A7AFA9F76DF03445256
      059A82312CC88BB80C1B44ED4252B80F01E03C06DE03AA97AA9FAAA7090C8769
      FA2E793DA0A714763B2D9D3F3D990EEA2C0780F01E03C072E03AFD575FA8EB69
      75A07E7EF01E03C0780CAF3F75F53F84F80F01E03C072F09EB05EB09EB3F7108
      A469140A0521213B359AEA909E03C0780F01D9007555F5C4FD55FD67EDB21619
      3B43190F092886C46328B9AED0CABD4FADB5D7156924E301542ED16A42540359
      ADD9580F01E03C06CD01DAA4EAA7EAA9EB04CD53C56CBD75D7156B73450F2A7F
      EDC5BE03C0780F01D9007557759F7AABF944A65AAB4BB2592E7CFDE03C0780F0
      19A4FDD9C0018709F01E03C0780DA509CDA734AAA13DA478CC6E4E431590D057
      7DCD0E0EF01E03C0780D68075F49E412896218CC767AA7DEB08EAC8E412795A8
      3F5E29EA5B1EE94341BB1052DF86C362D96780F01E039941F553F6AA3AAC7091
      0EBEA7B71FD0E43B1DD03C0780F01E035A01D957CD2713F52CFB7A7F6C4FF3F7
      80F01E03C06E2CFDDAE8EDA07B423A1D1A9DB37C0780F01E0352AFAA2EE0F20F
      2944D27C27C0780F01E03C065B098786A4745C7718555E0BF21780F01E03C076
      F99ECADECAFF5FF80F01E03C0780F01E03C0780F01E03C0780F01E03C0780F01
      E03C0780F01E03C0780F01E03C0780F01E03C0780F01E03C0780F01E03C0780F
      01E03C0780F01E03C0780F01E03C0780F01E03C0780F01E03C0780F01E03C078
      0F01E03C0780F01E03C074C01D1862994C2140094B00EAEC0700580F2C06019D
      506CA82EC19583ED800210A783DA5D0462615D08B47B95407B03EE0ADB09E372
      694A470452B24712A8DB501EC0FB817BA1D7044810386A83F545D80D501EC0FB
      05E5C9B0A61BB60F3A1DF589DDF0284DE033A1E50A986C4E388E2FAD17A5296A
      92F01C2625174C5A2D238C8FC0EACE9A8BBB9EF0ABC077477BE8BCE53E516905
      05144A323234647DF45CCE3F116494949724E0E0EE088FA00C37D73BEB7E908B
      BE77DD23F685F621E432293CC0ADD6F8845ECFECBAECF4EEF110D148BC6E4326
      9946EB0BD99FD897B09E2A30E045C1ADF069DD8EFB22E04EFAD5DD677D87F60B
      8215C3A1F14507ECF2ED35F63FEC7B8246C9090A141FB4BFCEA7B449F4C3AD17
      995BF023761DA11DF60FD677E8DA123798620C3AAA3704C98901E8DE8DA62374
      A01D68DAC4EA3F4873BA4650412421A6760102A6CD060C12316039609C9D82EF
      5507EAC8DA18C304B7EBC17C8277DC1632C819B8EAC8DCF286791B41A62976B1
      1BA79874D5BF0236B03BD44B8FB12EC8DCB1E15E2148DFC0E69337451BD84C3E
      82DFDA66E89DE3FE39556620EF0ADF7F2917C11BFA3F2378187FADFF9DFF92FC
      4986B5C3BFAD04C2CDFE9FAD538F91B598278DF738FDA37FD6BEC986BE77ADA3
      6CF5F984D2B04C9B66F41391B288D811DEBD49782876836E304D0EBE36671FE1
      8D7237818659A09EE58EF2104DED8EF54E3F73367959D803C19BAFCC3EAADFDD
      B27C51DF66EDEAC9F1661825BE8266EEDB9D9BBF1E6EED778946FBEAB83E95F7
      E03C61DC4FF92FC6780FDFA1E211BEFDBF8C391BF92F87C3787EDE0C07F65F87
      AC787EDE1C07F85FEDF9F2E61F528DF825CC49DF00DCC061430DCD6FFA23E611
      7379A42801AA601F5580E23B01FC48C033BA120505F9CE987F1002587CFBFDAF
      FEB5160395EC038EFF574FC4FF8ABFA65FDB88E01FC2F8C75FC29FC31FFF2238
      078C49E8AB38EFDB3BFF402F37C2B85E393BB5DFA2FFA61FA8BFE084780FE17F
      6A044461B956FFD1B1C9DE49BE1FDA2E8349AEC200F41A3D6F783934186F05BF
      D2C8A9C457F3FDE7073F0FE39F18C312B7E46E46E46E46FBC4BBEF6A32372364
      11BC17007CF515BB53CF4B4FBF7AA8DE4159E796FEEFBEBCB4EF577956FCA7A2
      53C95D292D48DF74C312B7FCF4672477ABF555BC9509FEB4211B3F986256FF9F
      68FBEA2B7DEBEAB37CFEB7E87E28DFD1F91BC4C34B7FD6F423BFBBFD6FFE211A
      E3E46DFA09E4FCD53FA8DFFC593B7FADDF9DFC08DB42FEA1EFBF52866F41391B
      2E8DE769DFC14978A8768378104DD0EF39671FDF8D72378986E360985C778541
      3E863BD538FECCD9E567600F166FA230C6ADFF2C9F3877D9BB7AB27D0987AB5B
      E199BBB6E766EFBB9BBB5DE2B797EF6BEDB9C6187A3695F38FDF59C6A37EF9C7
      187B8B7F688DE3FA5E038BC7EF31C8DFBF4DAE959EECEF07F47C33BC5C0785F4
      DFE17833563261905BFD325E9F5C850035EC03EB301DF8C073B5806914252A0B
      9A72C1FC40191FBF64BF65BF9091F018B56BF23FF0A7F007F9AD2401FC6F93E5
      F8E7073A0B342774B4064182C9DE1A7700F79EECB3C5ACFF88FCAEF437FB9803
      21262F17C3F7BB95C98F84E281D61A19330180DFEA0593B20F2E01EF31F967E4
      B3F223C2B17EC5686A14348A1F32FA07605B04C3D990EC6E62F23A15CD8FF4FE
      0FF89E03DAEEB89DE2164EFFAF2C8EC84DC93E063F2CFCD67E7959F80604987A
      D21D05FBD190F457D09B05DB9C23067F1279B1F0C8AF980603FFB60B27792F2F
      ECA6C49E6C9C82CF0EA2F6B2C7159E0E1C341B980C1CF877143C79FBF99FD93F
      91BC8DF2376B4A8DF36461AB1063E1887807A323209D863EC363BCA797A76165
      9FA323FAACF0F3A43F8900387D5A516783230DDAE80306461E9CE580CB8DF424
      C18F8717601878ABA323154ECC7047989DCB3F483FAB239678D59E0498757750
      1FADDD9B3B1C66651FF0B9A1B9B6461E02C030F7F4DB2393BE14EE24F519EAC8
      F31678C9DF60B3E03D059FFB7B1FB07F01AACFC678DAC9CE9A7AFFAE7105884C
      67FC30CFFFAF45918FB5B00C7FA536C8F413B3B28E59E5CB3CEACF3BA7FD859F
      EAC7FC0FE5EB3F5B47D6E4FBD3D9601E92B650C3DC9EBDCF194B1FD66018E8CF
      5DEB84277FE23DC49DCB3F559E7DD1CB3C3ACFB8FE7FF9DDB02768DFFD199FF4
      7E4EF8D3B89349A33967862CF807ABEE7DE8F8B5FDBEBF93B0D4EE24F621FB44
      BDBF290A006A5807E1603BFD80E7EB00CFE87094177F5583FB0036FE84705A39
      D5390187467FF2C4710A3FE09C80C46E4A7346AC465E47AE27803E46AB277451
      7744D967F22CF1D0EBF70590E00195401D85F84C5E551AADC6FB829E41F7E89D
      63D753E0188DD258EC9DEBBCB806519183EFDF8CE89559E2B9D37F82F3FE84BB
      2707D73F401F1F91CE467B3DA8E2C62C9DF2A7604FFF907F9B17B2CF32C9C4AB
      D7FE841DB1DEFE84129FB76D48C98A53C066993C9DEF27712669939ADECECB3D
      5E868165BF8B3C0F4C0B3C4E7E6FE8537DF3D1FD088DC52FDBEFDB8120987194
      F076D4C13B076C4F93B967820FA6647D0B3C7DADF8082D3F6D78567EDF7E8B23
      BFA100DC591ED28E70707300D2035BF7EF5A76BF90AFC4EE59FB41FDB8B32CFD
      C6FBCA3F5FF42BE51FC3FA111B8C13059F8CA3931618403480F7FBF64EF853B8
      93DE0FEEC8FC1678B6BEC1674066D67EFF0089CFC7FD08311FC7FD0EEC7C1F7A
      BAAF63EF00D403DFEFDE54ED7CA3E013B967EF07F7947E559FE2C7001D26ACF7
      1FD09BB93C77F42E98F8191E874FAC807C4C7CAA761C47A5A772CF0C1F31D19E
      4D67BA38EE3F84666FE1BB4661D17BAF47E4EFD93BA0F9CD17EF893FEF8477ED
      6B00BBD1F16BFBFD7F276649DD07DD917EF27F97BA8500362C03F5301C816039
      F9B00D6887D9417E4A4C3FB8038FE945908F465D80F86722271CD28EE84AFF5A
      34C231E476F2F006F174F2CC3CEB89D31DE1EB6FB00F8F7845171F6645458F16
      5E80C42E1B895D567CD46CEFF6AF7F957DE228DEC8E5D476023DC11A210FB921
      F4643E6CFC490F1E78EACC33D1C7E22887E11FC3BDF75F7AA8D8678472CA3AD1
      1E3C8F84248587F79E3C298C37CB7E46E46E46E46C792FCF0FE46E46F9D1B350
      1851B2BADC8E485D5B552FCF4BD9D2F534B63259DD2BCD0346FAE618F5BE1C1E
      EC4EF246C75B70AF67B3236DF708646DFCAE7681A36BA619B2DFE11BF51DEA25
      C7D897646CBD652F9B43EB6CCDDCCC33A5BFBCCDD33BCBE710AB33C77F8B7F39
      DFC82246C91F91BE0C32D9492B32D6EE1CC3E4B3BFE104FC66E5F2A9F871F237
      D304F4BDF6C448D97A6BFA61F51DE988DB7AE3F31C86826BDB37A09C8D8C46FA
      E77A7D25F0A1DBFBDEA8278CC89AB08FF11AE46F830F1BC13F713BFFA09BB63B
      D538E299B38ACEC01F0CDFDE619DADFDEB27D11DF66EDE2C9F46618F5BEBFE6E
      C7E84C5D57B37766EDD36E7B9F01C5E8799DB98BC078C3B89E44BF1F37931B3D
      D2BE1172BC7328D8BDBFDD987BF46C48FA43BDF22E288E43FE11B7C8B8897247
      D2413E11772CC3EB5BE97EA3247F83BFF517E09F17C1E52BFFA27247F846D2A2
      EF9186B16FF5FF07C4C9FA1DEEA03E7F6F2A5F5A8BE406180FDBCAFFFF069F8F
      F10A006C9807EB603E0D80EBCB00D6687D9417040987F9000881295926625ED6
      E6A037EDB488F29B12AB92C3AEA20321DBF88253A24B44BE29DBC06B586C9DAD
      4EE24E59EEEB3CAF3706524B32BEC03C3975CFE8B4FDE5344C7CADE48EB2C9CF
      0C0321DF35CB276013B893967BCACF2B712C3C880644996D84B6425FB6F80760
      5B04CBEA12F1A5C0CC5B1D239CB093BADD70201A38DD2E9F7A3D93BF64EE24E5
      9EF4B3C7B3D180C8EB2FBD4BBC23F7D4BDF1F026C176EDEB819F24992E32D64C
      03220C7CBD93B484EE24FA859E5E10F6B2F52B3CB3C25BC9180C9CD979425EAA
      8D8F8C07F76F5A7EEDE44B819E1646584F806E191FD27656265CD57B4EE59EF8
      B3CBEA1FF102D80E5FC4FD96796FA4BAE230193232F857E806E4678991978330
      0DD323009DE3E04F113B967CB3FA2B3C7E088C07E1CEC6BB1C78E51C6177433C
      6C8CBDC1806E991C9D804EE24DFD67936BEC16700692B3C7F088C06A9EF29E36
      9D73569EB1E23C81641329FF7633E726E6C8CFE8D806F191844EF1CA3F493B96
      7F56B3FC58E303E68B3DE5C9F792B1003DA93DF1BCD19F3C7F3947D9EDB7100D
      4C8F9DEBAC2763C47E12772CF967F5167E5FE77E7E3FE5F71ED19F3A33E7D1F9
      3B08F2E24E59F8AB3E01FD00EF46C6D8C7F5FC9DACA771279A0FFF890BD91E00
      36CC03F5B00CBEB00CBED806E047E8A0B881827FFBA1E00C600C26232A03EA00
      30BDB008D86B2200EC5FAF00782FD780087ED3734CCD3BFB26FDA2702E05BB02
      FF54D9A6FBC632FE5B7F0CC9BE47289BF1DB07F336F69550F090030B185FA604
      803C17C4FC4FC4FC4FED24FB0D7AC1E00632586BF360DD60EDF77C003C502589
      5D5001840C2C5804FEB096E4A25A49F8FF8FF0A7FFE02A00F0FFF73FA829628B
      2793CD8BBD00030817D27F5A4B725147FC7FC7FFE1FEBF3000787F8081621C96
      4B3CF9C0E1F2FF0801840EB93FB325B928A3FE3FE3FFF0FF1098003C83FEF7C9
      F7B1F9B2D96D5BDD9EB8018418613FB625B928A3FE3FE3FFF4FF7BCD001E1FE6
      C707CCD8B0985C8383F80030833827FA4390047FC7FC7FFE9FFB847A00EDDFAD
      976E164084C1200EE57F149F8FF8FF8FF8FFDF9F003DB3FE0F8DEB3DD1E6E224
      00779DFC727DBD80D90023FE3FE3FC09FEEE4B007BBBFFE7338A570BE8EDF1FB
      C51006B04FAED4C011FF1FF1FE1CFFBC5FBCBF89F89F89F89F0A4F837E6E0A80
      580500A0140280500A0140280500B1C0540D80500BB3E7900445402DC013000F
      017EB807E1E64FEC724CF20085F0BF63AD73E4FC819F8333EE696D0A23855870
      3309FDB932C7CF200D133215CF9E40132C7540A71E6102CD27F418153DFAE4FF
      9AE4EFFE2A029DF9C2A8A3E77AC0A6B900A0140280500A0140280500A0140280
      500A0140280500A0140280500A0166DC9703F9BAA180EE0CEBFE6EDFCFECDFDE
      FA1D8770ECF876C237ABFB07BFE2743E2C07ADEC2719CFC5A6A44395D0F2FE80
      413F0F9BE0C49B08C2732950DEF8EEA9C8E778F5BE77D625149B33B9ED50BC5E
      8656D75735834EA3B71395E0E976BE9871C8ED008347181DC5BC5BC5BC5BC5BC
      5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5
      BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BC5BF1B8DD0D26A75F99CEEA18BADB6EF8
      791CC6734BA6D6F81E4FD916F16F16E60778C326EB30708050CB784C4C6D8B46
      30D99062F8BE9516F16F16E6476330D684B3C545515262C58C01C0ED026FA88B
      8E10CDDB5A2DE2DE2DCD0ED8A267B4CB6FFDFFFFBC2F9E58C5A611C57ABCD610
      5F3562DE2DE2DFAF48AF65E1DC3BDE077FFFCDEFEAE0140280500A0140280500
      A01402804BF805482C58C02F9013000741DF92F4C83B7C8E1572C7831DBB2A82
      34BBE97F84F3BC423BCFE655B61DBD1C2258AEC5A011F2258843C374AA12A37E
      92F1001E9ECC967D25EBB8E00168B65BFD168F476E72A8E92CE35AFF8963FD2F
      35AA87FB91979DBE802DD7D551BC9AFA1E4BE6BEBB6A3B283C3F92C58AA8AC27
      726FCC8154458FB858C0280500A0140280500A0140280500A0140280500A0140
      280500A0140280500B05BB1414B2F0D1DF7FCDDFB6FC77E2A31F9BFE860FE4FC
      DF047F400318E4A03C52006040411C3B8770EE1DC3B41FF800C2F743A5E0AD57
      AE5066000020E0D172E174318610590EE1DC3B8770ED46200779EAFCC371BA43
      ED100353AAD6EA90006047414610309BB19703B62C7EFFCFE3162F07DE158AB6
      3E5801ABD5ECFE0F8FF3CBE6342C141D1E360F1919003E8B78770EF000ED816C
      0068F2CA1D94FF379BD2D8ECB6BFF04863D4F47B57B4001810C0E60A3069840C
      26691DF06BD8ED8A262D1229456B138B4B6B8A7572D7DFF93F2EA7D8F7DC2E37
      73014663331AF17CE665E181C2640786C4D2C56CBBE07716F0EE1DE451DB26AC
      00653ECA1199F7B1F17E8C32DCFD13DD771A9A4B181CC1460D7626F06BD8ED8B
      104070F63F341A0D4780E65E7E446C262F2CC1ADE37DE65822D324C26DDF94E8
      381DC5BC3B877B1876D396CFEFC515D3FAD814C38D234FDB197FB85DD483803C
      9EC70A3B6B7103899C58F0B9C41D8EDCB47C076BBB0EF2F53580E0F95E92D37C
      F3E87DD1C3A3400306E78D99A46A1AFBD78BC5B7A4F7043C67E07716F0EE1DF3
      D1DF980876B2F270C73338A3B1D7A8570BBC70EC00E5D3B6876CAE20791A7718
      E32F32C3E0EDCAE7899C8F2BE93DCF8BF9EC60078E78BC9E75EEDDA4D9C1703B
      8B78770EFD38EDED2DDF00703A31FA1F8C397640F05BD84003E9FC3FBF4E8003
      823C08BEB55DB138998E6C3037193DC2763B73333CE93E70F163D2F73EB08B9D
      F214F149DC4B96FC0EFB2DC2320EB96FD9E6EA2BC445E541C01E2C9F25961DC3
      B06AADEF27A3EA7D76C58C768785BBB23D435DDD47252003853CAB571338B1C6
      4E38EC76EB9F57ADD8F8B9FE6FB411E9FB5F61ED30AC57A000E08DF9CD3AEA90
      B1310CE6BE03C628E5BF03BECB70AB9FD05BF679BB3ED02A001C290EE1DFF0ED
      F172E000E06C3EB3C69DDF2F1A945591797DF63C85BA90F24A5C10F28EF81D70
      D3CA3B899C59E0D7B1DBCA23E921F4EBD2F4FEC78A772192CD8F8F07E03030C7
      5DBE045F4E4F732FC7672DF81DC5BC3B876100EDD4FBC8BB5EDFE46BC2FCCABD
      EDBDE78D875A97B6DC6F5EEF7B003839C28FA277C1C3899C58E3271C763BD3F6
      4DBDE143EEFDF1FDDC08E4A001DD1BBE47DA8D56F3EC15F25DC0EFB2DFDA25E0
      B7F423E22DFB3CDF5AAFCEEE0F37E6B3EBAA1DC3BFF1DFB961E910F8AF1D7CBE
      53DFAD3F68800FA96700760E7EE4B8A5DA6B8B38CCEB83B9C759FE597579A57C
      D31A914CB0013F8C4350DDE2E7C2C7251F1BEF03BECB7EEE43D2DFB0778CB7EC
      F3CAAFF401E9E7D83A1DC3B003BCD43E467D97CB3C10DB1EDEB264FC28D46ADF
      AFFE0AF895401814C0D67A63826C166497FBDB4F476FB699AF644CCDE169DABE
      DAA1522BB4FD8376E172603B17E66FB33C0EE71E13F377DF3065B83641B72DF8
      3CFDE2370008770EDA2ABCD49E5266485BB0785A0F154284A1AD7E8E1C03C01E
      97781ACE86609B242F2F1BDD667A3BD88FD199E1F6FFD2E6A7F43A4D48ECEC7C
      66349B983EF5723C5F2FEC0730582C87D744D472B5B23CE51D703B005BF2B918
      CB70479F4270010EE1D83557A5D3ADE5AEE5D8EC477B6A92EABE0FDE4F063FBC
      8279059BC9007A0BC0A606B041826C55D9721838E4779E4DB2DA0DBCD2D2B968
      C03F23D598B9FEF4803173FDBFA89187635B56C5BE7BB1CC1FCA0AEC207608B7
      F6417705B823CF0BDC0043B877E95567881A4CEC866A07230E788F93C6A553AC
      B14C8300605327FB3C68C5579C52CD8760E090EF070F37B3F34FACDA36DBCEEC
      D37A31000C5D592239BDDCD7864A3821DC5BC3B876F23B5B5E5A659B600317FE
      62031576A1540185BE7F5BEC6AC740F3E14E0C998EF0B4CDE5B69BAED020188F
      F487602F17267EDCCBB66ECEE87716F0EE1DA543BCF30B3CCECFE4BA68007937
      F4A3ACC8E64E465B362B1CE8065B7E481664C7035F08F3F65F86A0877947B9D3
      CCE9FE7943949F9B0BFE8280777703B8B78770ECB8EFDCF7FAFF805981D6FD20
      0CCC5E54A7A0700180EC0A7C1DCBD5EC650EE1DC3B8770EF3F41EC019FDCE635
      33478CC019EA06083917C3B8770EE1DC3BCF674900337D99F19E791FF479FBF5
      6CE008214C3B8770EE1DC3BC665002004008010010001DFB3B00200400801000
      AB0039F002004008010035A800680100200400801000C4ABCDDFF7F027C1803E
      A60474DC03E9AB006AF37AA90BA3B81FF6D84F80611A906B68EAE4C4B15200C0
      43CB7F8770EE1DC3B2E3B437B40182FCF2ED5EB85FA10E0033E0562B1DB18619
      31643B8770EE1DC3B508401981C44A654DEC8401A8D56CB4A8006023B0A60833
      015D8C990ED50AD59E7D91835C0025934A3FCA0018142E3B8B78770EF763BFB2
      F791E5252D33185F4BA7D5D9ED374512D1DBC1E7F52EA800602301D814C0D608
      304D923BCE6C791DE7723E3333EC8CD8260A73FACEAFCEF5F588006F07716F0E
      E1DA7A3B59A0018BF3202633EFEC0441C197FA240EAEE356496603B02981AEC4
      DF0D498EF0B1CAACC98974BA5E18230540031726BB61B3C45F01D87C911DC5BC
      3B877AE8EC94A8B3FE00837E5204B93E86E0E370DF3A4C5FF817C827800C0467
      0DB0298DAF0418ADF059832C0BF23BCF4FF1726CB65B87F3FF498E9D5EB56021
      89F2ABE13D1843FEFFE420E2230C8CF872655C64CF061DC5BC3B876F23BFB011
      8D6724E3155E31DC9F5C0BE470EC0184FE368C6CB820C91AD647A32FB2C3F0EF
      E6ADA456D116DCFF1DD0F53FD02E25FF2800753E5FE1ABB766796EBE626D266C
      61FB04D16F0EE1DC3BD4F8201E306FCA07D288B46B20DD40FD193549EAABD007
      CC9B64CB7B49AD8B44DB6E5A32D1C763BE2BD53D96DC9ED566E4072DCBFA2ED7
      27C00088549A46271AF4EDD5CEBCBCC1E4F95EF723B0C5BFCC80C96E18F3D689
      BA2A8770EFD2AAF54E6E2F35547C5BFD4DBB8DD3E4D80372E7DD5AE89B56AED0
      3E8E3B1DECA26E165AAD66D6C4C69DAB77B95C9FAB4C0B0AC8B7677B751AC39F
      6FDC1F23B245BF2355D2DC91E7B565E0021DC3B0C3BDC526A7CB9AE6D9754EF6
      186C6A5CDA97737833B00785E3FA869D000D046C10D1DE86B651F44DA2CFC6BE
      0EF6E7374AFBC4CC9F2DE83C54C954EAA424242FC568FB7E60B6B976B434B7E4
      77C96E419067CB7E4F3D9A1DCEFFFB9BD046E38E1DC3B643B4D28151B22F81E0
      78EB76E6BEDB05B66D96E6019FCD2001B781B832FC17A14DC11EE0E344DA2CD1
      968E3C1DF0FC5F4DAB9F71FDDEBD57D7F172711000D047EB9F7221B1C36F1B85
      E3BA3E477E16FE311FCB7F01DEB2DFC3CDE4F87D7FCF1FCF3FF9ADA148770EC8
      0EFFCB0B3D72CF5F57CEE53F7AD3EF2001B6D3E003F08EE8AB453AD37459CE67
      741DB511B41BF582234B1DCCB87301B925D3773ED6ADEE99000D8ABA0ED0A77D
      DFFD1B4C9B0DF7D2BE477E16FFAE4E4B7FC23EE2DFC3CFDF400393CFF08C3B87
      640760A4F204B93FFA6BB3D326F9A3BB8FDC59ECFF16006853435B235A26D160
      2A5FC1D8E063243BEFBED36AAD60B72B739E69E3699371E422D22DE1DC3B877B
      E766D266C85E7BE33EC33DF42ECBB8C57EA000DE34001047435A20D136C85EC1
      616C0843BDA49DC9BF19D176BEFFC6321CB9F6447643B573ED69F23BF0B71CC8
      3E45BF879E35000D303C0008230EE1D9555795CC30EDAEEDD8E387077C56EE49
      DB7C9FD2A9D0FAE052006853435BBB3D136E0176E43471E0EDF9C0B19DA34D5C
      998715C7E4B2797F6FE1FB77203A32793D9F18BC5E3D40A655A8D46AEDCA96EA
      677E33D8A5C8EFC2DC7B20F916FE1E67725CA4AE14401A148770ECBAABDC956F
      6437503B1876D8F5542B968BC1C28803429A1ADDC96CA26F14B719DA38F077B2
      41BF036ACCD905F846037DC826B2C1641FC5D5BBD7659AE7637B75BC5BE47716
      F0EE1DF503B686869EDB0680357FEE1F7477B010B0034B7DFEB53AD97F1CC429
      D19723B290CC3F762962F1B91CDF3FE8356F6E405E0F47BE128006821E0F17B3
      85C4EBCFBC6BB1EC7CDC98EF6CE2DE1DC3B877A38DE7A6FCA9BFC971D000614E
      19F56EBAB6721269A50ECFDE803411B205BA5AD0D0847BD0310D791DE3990F11
      B51DBBEC70CF5718EE9C854F8E9753BF18F16EEDBBC8759E1C134DCD5D5B130C
      0EE2DE1DC3B771D9D0F7F90805B81DD51BA00DCC5ED4A7B07001A0ED0A083BBB
      98F0650EE1DC3B8770EFB9A7E003BFB9EC6A608B2E00EF6E3841A8BE1DC3B877
      0EE1DF7B3A5801DC25EF8CFBC8F147917EADDC0134298770EE1DC3B877CBDA00
      400801002001E0005EEB40080100200400DCC01DA00801002004008007800240
      0801002004008004346A70AC6204FA3807A7E08EC1C07D37F00D4A4F7D01775F
      83FEB308201FC351ED6DB6705DB64A001C08776FF0EE1DC3B876587690F40038
      5FDD8CEFD6D207000301D15DBEDF73F1865C590EE1DC3B8770ED35F003AF8D42
      AA597ADF0031F8FCA60D000E047814E107602BC1943B8770EE1DC3B165EFA3CA
      525A7730BDA6D36F97CE68924944E7A7DBEE631000E04703B829C1AE10709BA4
      775CD8C3B8770EE1DFA83B5BA001CBF1CAE675F33E29158E7C324DD505CBC8D5
      D259C0EE0A706BC13086B0EE1DC3B8770ECD0E8F0A4613B7F3FC35FF0CCC8A82
      C6CCF0E361D9F77E5FFC17D11000E04770DB829CDAF841C26E1670CB82F0EE1D
      C3B8770EC5808E6B3D271DF35F31DEA7FE0BF470F001C4FF368E6CBC20E91AE6
      47C32165861DC3B8770ECF876DA6F391329B52F7CA0C1344DDF320ED52F12C20
      EF64DF8002267A49BB581CD8B84CDDBA6FF70CB8710EE1DC3B8770EFAF276FDF
      BD81044D3D865BF323E914C1A98038283AB5E1370B3865C388770EE1DC3B8779
      C4001E67C70D134E9523A353BF80629C5BF34EE66A3929E04703B877C1AE92CE
      1370B08358770EE1DC3B876AA57ADFA45F36CDF47C0B0BC93AF6FAF3DF4FDC27
      70EBAEF7C007708B829D823EC1C709B859C32E1C43B8770EE1DC3B26587336B0
      D97CBE7B29FDD69FC1000ED49F8002047BB93C29E69BC2CD333B0EE1DC3B877E
      D0EFB50FDC315CD957197D3517BDDE68B2592CF135204CF51D576AD74E00381D
      C14E0D77A63C26E1677C904EDA43B8770EE1D9F0EFB527D499D217FECA636FFD
      086793CEFE6218440037E38002047835C20E137485F54D135990EE1DC3B8767E
      3BD4EA5B371DF3D6EBB1366B61B36E1B9FAB8AE339AAF8C8B88BD53007053835
      C20E1376017865C388770EE1DC3B8769CA185EEC876A07A30E0B0785DCB7AF51
      94CE6D1495801C14E0D7083A4D7B87BDB0EE1C43B8770EE1DC3BE1DB6363A951
      400397FF60178778E5600716FDFD6ED79BA502414F0CA1DC3B8770EE1DF0E3BC
      C2EF33BBF92DA20019533EEEAECAC748A2A954B3114003811D205D96AE0D1047
      DFDF906B0EE1DC3B8770ED60B43A9005D81DC55000ECC5F54A06CE00381DC142
      077AF57C1943B8770EE1DC3BEF947C0077F73D7C9AC4E6003BD40E10682F8770
      EE1DC3B877B5AC803B84BDF19F767CB1E7BB27DF4FF7004D0A61DC3B8770EE1D
      F3538010020040080096002F9CD002004008010002E0072E00400801002006B1
      0005002004008010020008F1BDC8F01413EFE01ED382215E03AD9700D4E31120
      2F93707FDC66CA0300D45B5B7F305C55948007021D9BFC3B8770EE1D901D9FBD
      000E17F772D68C4659FCE000E07349BA9D4F5E30CC0B21DC3B8770EE1DA64000
      EBE35DAFD95ED80019DCEEA30C8007023C0A7083B015E0CA1DC3B8770EE1D972
      F7D1E5454D53985EEB77BFD46A364A3532BC24383DA34003811C0EE0A706BC41
      E26F91DD33630EE1DC3B876311DAE9000F5F8F27A3E7D9F1FD249DF19346D4B9
      7C46AF92CF077853C35C098A358770EE1DC3B8767A90907E3FA7070787CF87E4
      CB90E93E9E38E679E0DFAFFF0BEB48007823F86DE14F6D7E20F1378B3C65E178
      770EE1DC3B8765C047B59F938FF9AFD8EFD3FF85FE387000F27FDB47B65F107C
      8D7B23F19172C26877E1DFC047000C507716F0EE1DE6076EE793DD8AC969FFCA
      0E93C6FFFB20FD52F92C50E955415937C997F693DB1789B09C6B2FF1978E0D0E
      CB325ED70A5D79BCA18EE2DE1DC3B58077F792120E1214551598296FED7FE453
      8BF3C160F0E5F9BB8AB5F1378B3C65E382C3BFD76F032E07D981DC5BC3B876CC
      8EF5680067B9F6C4B82EEDB7C6AC9736CF7CB7F90BF66BFC1FFD757823E51FC7
      7E1AF947F1378B0C352E3BF5CFF46FF96736C8FC11EEB7C90FADF561DC5BC3B8
      76DB8ED88C768FD03ED1BA7219DE79B07DEDFCF961B0D8BE3833C003C29F823F
      C1C789BC580640705C761BB941C0C0280A0A40561DC5BC3B876E80ECD961F65F
      C8F00BE4653C75A7D8DF8006A7000002077240A438902CD333BA0ECC2CE065C0
      2CB4713E2B8EE2DE1DC3B7C0766A4F7EDFDC2F23676DC83CD168B65C6149ECE8
      006E9BE738604005ADAC634203424680980B07C91C545AE1D987C60001DE459A
      675820EE2DE1DC3B5E1D8D0B0A4C128EA12ACBCA82A1B1414870A7F87F001834
      0000680800984858A9A36C0BF477C8F8C3BC9E53338A0EE2DE1DC3B5F1DEB75E
      E1EB7AE421762FE702E61FC3F327EA9ABEE0AF5BB21248002DCB801DE785FB01
      A020026181A032038E20EF40000A6383B8B78770ED847634343B203502230E1B
      1391F53D82237DBEE6252C80005006808049A8E1E8D8701C43B8770EE1DC3B03
      B7070C02C280005FE317E077905C0002DC7F5AC9DC6E2030A40CA1DC3B8770EE
      1D81C0F32C6DD07F25B74003D1FAB2A4656048A2F588CDFC2000010240865A80
      68C231FDF986B0EE1DC3B8770EDBADE519804303B8F200033162AEC965C0001C
      02860E8BD5E4650EE1DC3B8770EC7889C8007F722F93D11D7000F500083417C3
      B8770EE1DC3BDE97000384A3E331D9F34791DCF1F4F8E009714C3B8770EE1DC3
      B0D4E004008010020024000DE734008010020040025001D680100200400801B9
      600FA0040080100200400F92DC5BF9A9813F9003DB8089D801DFA000D4FF14D0
      17DC007FD06ECC03E46BF8D6F34CD75665A000010ECDFE1DC3B8770EC80ECFDB
      F000178EE5B59ACDC3E1C0027D40AA7E3F1FC0C3262C8770EE1DC3B8769EEC00
      2F99AAD56DF5FE00353ACD6619000008EC280403015D8CA1DC3B8770EE1D9B28
      A23CAA2A2C0617D1E8F535FB2DB2F57ACBFF921436480000400700A00D010013
      091DD33630EE1DC3B876521DAE50000BF1F8FDC0867CA553AD00C9EB7DF01EE3
      5092C00E01401AF04C61AC3B8770EE1DC3B4B4E4F4F2995E4A4E54AC572E700C
      2B2A038FFC8E5C0BFC05F59400002070D805036B02002602C0320178770EE1DC
      3B8766C0406B224E07CD618E8A7F01711C3C00027C3680D9408048D06460646C
      B0AC1D8C04780002CDFFA6F53311DC5BC3B8764076FD7FE11C8EB7B0F9431BC6
      F340C806A04D2AC0CC32A831AA24C87690362026CD352D7C0C80E160EC2E7243
      B12C5981DC5BC3B877981D8BC92714CF2D636AF318B73536E317401E55A81301
      601901C2C1D96FAAB351DC5BC3B877991DED1000DE7B1EFDD1765F311AB59D9B
      730AAC485866A6929008128E076034251C0980B0C358770EE1DC3B876D96CB74
      503F7BE97BDB96EDBF8BDB179E19D8BBA24000C50608C60E00980B00C80E21DC
      3B8770EE1D9B2C298A8CBC05F231843AE4351AB4003B920521A68166999D8770
      EE1DC3B2E8ECD67F9C6A9B0EFBF42458F345CEEA7A26938A4D997C000280343D
      3102602CF2E1E1DC3B8770ED247635262930485B60DC3C4D3B62E7EB3B26DFE9
      3C40001A02002612162B58DACC8770EE1DC3B491DED36CE24F2B1D85D8EB1DF5
      FC0F67B4CEF7D8796CE6935D2EC80001401A02002618050320388770EE1DC3B8
      76B2B3871D901A8111872F97CC034287577BC9EC45640000A00D01009353C3D3
      DDE2388770EE1DC3B876476E4E98E5E50002BFCE0508EF20D00025B9FEB7496B
      6DC221491943B8770EE1DC3B2383ED91F6F8FF25B640012C4BD5939583228D26
      B36BEA8001041902396A21A108CFF7E21AC3B8770EE1DC3B7BBE1942011C0EE5
      88001CC59A941A0C0010710A083A6F57B1943B8770EE1DC3B3D69EC007FB937C
      8145F4001F500883317C3B8770EE1DC3BDE9A000784A7E333D9F14793D933F4F
      9E008614C3B8770EE1DC3B2D4E0040080100200260005E734008010020040016
      001CF8010020040080014001EC0080100200400801EA83BB877510242480F6E4
      22A32077D320354FC34405FFB21FFC1BD100FA1AFE35BD976BDF198800104393
      7F8770EE1DC3B003B4AEEC0045E7B96E0713B9283000B15AB1B0582C5130C10B
      21DC3B8770EE1DA77A001BE56FB85D7EAF400D8EC7698B4000823B0A1101C057
      6328770EE1DC3B8762CA298F2B6C4C4585F7BBDEADA6D774D069B6424343DBC4
      000820838850868880898C8EE79B18770EE1DC3B1E8ED8480015F986C4E40B3E
      60B099246590E5D9DF91A8C9610710A10D782610D61DC3B8770EE1DA82A2A301
      82CA09181867349B19B6A5AE91C0C474932BFC85F5D4000820F0D8850B6B2202
      2622C2322178770EE1DC3B8762C0416B264E0FCD658E9A7F21731C3C00127CB6
      82D94880C8D16464642CB0C3B8770EE1DA60EF2994CB3F703883F286AFAF6CC5
      901D52925841D393720011326498F690B62226DA776EE88C88E21DC3B8770EE1
      D9BC948A4936FC3F38E08B72C8CC8A631A0004283AB522622C2322388770EE1D
      C3B877B740000C100BE0F87E54635769DBFC677D8642CB351C949041947381D2
      1A325844C45831AC3B8770EE1DC3B74BB1E4645C0C0D0D7C3F5010DED9BCFC56
      332478746EF7C001E1110A1C119C1C11311611911C43B8770EE1DC3B1E585946
      B9D22BE4E53CF5A7B7E800752C401E038F7248A4B4D22CCF33B0EE1DC3B87694
      1D9D4398CFBF771F40B291AE07CD1793D5F6AD56AFFF9680010A10D1F4C48988
      B0C978FB690EE1DC3B8769A3B3A933498642DEA7FB167D5F5C37B2ED7BF18E37
      C0E0018F8868880898C859AD61EB321DC3B8770ED3477B8DD3C2412099376219
      066982AD64BEFD400076DB75D49140017A8000C1642843444044C700A4644710
      EE1DC3B8770ED8D8F1C7B207502630EA351AB170BD2CF97CBF822D40021421A2
      20326A787A761C4710EE1DC3B8770EC8EDE1E348C7A00057F9C0411DE39AC004
      B73FD6F9DFE61F0C524650EE1DC3B8770EC8E0F9847CCE3FC96E1000659A86E4
      E560C8A399CEEDFDA0004106408E5A88686233FDF8C6B0EE1DC3B8770EF1D8E6
      F0C04703B97A00073166A5056180041C42830E9BD5EC650EE1DC3B8770ECFCA3
      D800FF726F914060C003EA0110662F8770EE1DC3B877BFB6800F094FC667B3E3
      8F27B267E9F3C010A298770EE1DC3B8765A9C008010020040051000FCE680100
      2004008009C003DB0020040080100058803D80100200400801003D58797180D0
      0912203DC908B2081F7D080D51E8B46171490FFE8EE2007D0D7F1ADF97E6FEAC
      71800821C5BFC3B8770EE1DFF0EC5FBD001179EE5BB5E0F816860032998D3C66
      37224C3022C8770EE1DC3B8769FE8006F8DDCEF7BFDBD0036DB7DC640600208E
      C284407015D8CA1DC3B8770EE1DA32F663CB2B2B41617F7FBFEF79D4F1381CCE
      C13151575C60020820E21421A220226323B9E6C61DC3B8770ED423B618C0057E
      6371FA12CF9A0D06C1196BDB2EDBDC6A325841C428435D8986358770EE1DC3B8
      76B4BABCCB67B5C484851D0EA76ED1B774E4709E4FAC0AFF217D9D0002083C36
      2142DAC8808988B08C885E1DC3B8770EE1D8F0105AC99383F35963A69FC85CC7
      0EC0049F2DA0B6522032345919190F2C30EE1DC3B876A23BD3EB35B92D0690FC
      A1D1F81F09640750288C85901C9B9CBB219319323DA42D8889BF0FE014464471
      0EE1DC3B8770ECDE4A8D4AB9CAF2FD5505BA29B4DF6E303000E5CFBAB522622C
      2322388770EE1DC3B877D3180058924F69BAC70263500002153C1931B4E4AD1A
      E720837E647643464B08988B10358770EE1DC3B876EF7ABE8C8B8904E2F07050
      426F6CC816532DA3470F4DE01BF647088850E08CE0E10990B10C90E21DC3B877
      0EE1D932C2ED3D383A5F2B29EBAD3F48C00B527D8008115DC94294D350B33CCE
      C3B8770EE1D9C4764A4F0603C40C5B26DF2F3470182C4B1D90CEE21B40082883
      4A4690990B0952F0EE1DC3B8770ED6A4D526290BC9F44D4726CAF56000201CF8
      1803C60E002045069081099485AAD626B321DC3B8770ECD077D7F1BC978C6775
      762739DACD33198D40786848F4E218E1EDB80082883484084CB00A8648710EE1
      DC3B8770ED64A976416A05461D76BB8062311D70B87C4839C000828834840A4D
      570F576890E21DC3B8770EE1DA1DBCBCEB99918012FF580543BC4BA00116EBFA
      D154B93E88294328770EE1DC3B876870BE485F25AFE4BA63003C6F8606B2B0A4
      51DEF17AFE46004085204B2D4834411AFEFC8358770EE1DC3B877A8D53D08025
      81DD18600598B5528550E0040E41420755EAF6328770EE1DC3B876BE51EC00BF
      B957C8C5310002F501083317C3B8770EE1DC3BF0DD000B84ABE335D9F24795D9
      35F4FAE008414C3B8770EE1DC3B4BDA00400801002001B0009E7340080100200
      4003C001FA8010020040080062401EC0080100200400801E9F3D149E8C90122E
      807D64117E203F46040338FA4B1885A474BDF7FE778A03E46AB83050001D1686
      85773992CA68B93FA008650CA194320032F7D2C597197F6D72C5F40168783D6B
      7BE1375FC1A47339BC4C562B2670393A5FF8568BD9FBF477C0E8650CA1943200
      32F7D221289E8A43D8D09F8FD3FBC4E2724FB4027E60882DC72E9F0985C4340D
      7393C73AF7BB5C13150B091FD0001682E41043286441979FE7F7F2797E9F0F8F
      D505755ACD64323F0CBDF514983613C1124C39BCEE8D9D0097EC2BF52765E47D
      D45EF2BECFD5C2E373E3B9C692810282A2BD5EAF58A23F9192F37C241311B41B
      4E24B0F3032CE74CD5B1DE86E20A44758E07A3FA295E9F1F52985C63D7EBF860
      0048590210BE1979C197BEF15D3756555450124BBCFF9BF3EBE48BCE5745522C
      30986C7A50049321B52BC4CD0A23F8192FCB715C774A138A08C763BB0D8AC866
      9A8C9244D06C385EAF87F900865AFB7FC03A5EAF81910935544986B71C0E3475
      2D4BA5E50CBFE0CBDF72560AB85410FB3F102AF129142910E3B8FEB14164BAD2
      3EA2F28DA86E5C64AD01083CBFC90930B85C6A507C5F49E09A8C92A122E369B4
      DBE20180DD31FC00C8B25934F4FE179C070887D4B5A8A08C4508D84C263C3209
      465EFA9CE10009BC2536800AA4002B3038403C9FCA8B09DEF62F00324205ED72
      6A3A8D4EA95662B4D361976ACD4174ACD0D7043250207CA0A564354BAA708AC2
      D7EC812876604321A865EFA4C05B81C3AF70BA9E216100156365336AECD4CDE9
      5A9704841C2E2AC46F5C1F0019055B1960678F3FBCE73244DA21132753E47432
      24CD920BB22CBB7A8ECC20C9214A89782E83A7553294AA6FCA16705C4F810C87
      F197BE9DC400504105BB003CC7EBA28C26839245897B2A5DD28C5E6A1059E632
      698F03067F80805F09C661AC06648ADEDB36324262E00CB3BA74324CF519EB2D
      48DBC5B1ED05CE745FC0F8C8810C8D3197BEAC0EA0020E20CE4004EA12B64A01
      2B0453AC6BBD5EAFB28B21943228C921A976683A7F00A2543233197BF29DF400
      5C0A52FA898C800B410A655B66EDDE5847289B2004328650CA19762CFBE5948C
      80083EAA3400531C008650CA19432E3D3B801002004008019FFD5C0080100200
      400FBE3A7ED3BC8E50491201F4D0473480FCA62019B7E600842CBD3BF7C1B79C
      A03E06A6FE000BD645CCF5ACF5C45C7002194328650C808CB99D35E7F71DD270
      26CAD5B73B1DFE7F344E8777819BCDE88F27E79E7742E3C5E2C6DDECE2194328
      650C808CBEF97D888A458901E90D73D70480582C61B1CEEDD72F1C578CBFBFDF
      F90575DAEE12F11505CA208650CA194320632FBE452707C57A86F3CE917BC85F
      C61786CBC3C45FAD962EA1AF1AD023C420014470CA194328640C65F7CB83D97E
      249732F6356BF1504AF7617D5A822B3CCBBCA99A17F368650CA194320632FBEC
      862AB854105E59AD87194DC7C5148723E2120F2F4599CD46DA8BCA36A1BC3286
      50CA1905197FFB0F9002FB1D4074005F4DAFC4961D145C4BAF35A0D1AE9A2F90
      54584CDBB17C328650CA197632FFF2E039D6ECE83DDF0FE0E0800862BC9EF47D
      DFAD50022F12E55FBC2FCB5083A9D4588DE98598650CA19432EC65FFEC110014
      10416EC00BD9F5F87BB6F0E00BF27D4359E0D7DB84E319B550494590CA194328
      641865FFEB03A80083883390010D17DD7E57C400564A8A7EB3C8F6DFEFFC4145
      90CA194328641865FFEA77D001702B9BE7BC144C6400EABC6F653247D5FBC516
      11CA26C8010CA19432865D8B3FFD652320020FAC1A860A678010CA19432865C7
      A77002004008010033BFAB80100200400801FFE7AFAC5F2F28249900FAE822EB
      4076B240338FEC910846FD5FFFC62FC1407002004008019B01A9E28010020040
      07C000708010020040009401DD84994D8765D255E2FE80400793DDF231E001EC
      F77C9785E841959B42F85F0BCCC5E7A7E7E853A5D2EAD7836BA28BC455EC5A07
      64005F62C2F3D0BFC3E2F59E8F8CA5C6AD2693550BCD45E952A592BF9AC6E673
      8BC015E1D2F9E173ADA6DA702FE81FE0C00B746516642F5EC6365B2DDC1B86F5
      62F20BD05EBDC25F692F660F962DBCCF13E9A0A4A56CC57551EAF67D2D9EA3C2
      179F45EBD5D1A0E88297B2F0C97AB49354B554227C7C7D19A3DA7C85E29A5C28
      00BFB64292803B17F5FC3EAD1E8F523E2413DBEE3749C0E67A4B6F402F4BE5DD
      7A9EF329A0E98DCC665C4E2747BD86C339AE17A7D29B469B51A94DA135C46019
      E71B1BE1F3FAE179EE2F4BC13E05E79251A870150A87BC6F47E647E3ADDAF449
      F2F9E8BE9F2237BE7E762F49975FC1E50A0503A9327C3E30ABC03D10BC906033
      25987A60B2C984D32E8FA6EBABA41C817A7D29AB26CBF2FA00A33349A5DC0C06
      A3F56610BDA0179B4E0782F6A94A805838360CA7D515F626EC01D8BD7D1482EA
      7239BCDE76E779CA5F306DC5EA780AFB3B53FCB17AF6CD572B65B8E14E3D26A9
      C7A9BF40085EDD0BD126BB26A9CD7CB6A57F198FCD652BE93254C28479003B17
      8F07A4B52A69E2ACA024B33FF9A40AEDC5EA57FB7D8595FE58BD3DA55A6A90D4
      91A9EC45BE0384E3A90085EE08BD3B34E491380E83E442B33D9F6CE4947654B6
      D0DADBCD048482E93B4FA508CA00F917FBCF8616252CF97877D5CD1573181179
      8BD2902DCFAFE97762F5FE025A4A78D55C293B4C2103A17B205EA8D151BA6FA9
      C7A00340D937E92C52768FF586E429288109152925090BDE71795632003406AE
      F5A179A8BD5699400B67CA0814589E2A7CDD8690755BDB55BC96D22A4385F0BE
      17C2F2DD7760059EB4B00305169394A2297152F50BE17C2F85EAA779000FA7DC
      055D42B4B575097242F85F0BE17FFFB0BEB943EFE20012A01FB101DEC80EF5A8
      0670FDCA20B8D477FFF323F8501C008010020066800BB1F00200400800F98016
      BCA00400801003050077F852F70D7958BCC45EDA2003F5FF8518F0000000005F
      1AAC14762C85F0BE17C2F5DA14295D715EEAAF3597E14BDEA5E2364005C0C85F
      0BE17C2F2AF64AA0F07F64A5628995E69A27164614BD2E8EBFC10016E38A2C85
      F0BE179B0BCD46C3B2D1DA58CB8CC96C6FF7FC850892FC50ADB2721D359754B8
      50010390A4A0085F0BE179B8BD2C04F816D317976B69EA5DC0C0C21ED80C1EF7
      7DBF27188D2AA80BB7344697F1085F0BE17C2F5EF214A65EF3A9C573BA1E297F
      A2952FF5F822FC1FB13760085F0BE179D0BD7DB4B004F7E098AAFC2BC0F4BE25
      306B8F8FEFF8082EBCD64305CDB423C8010BE17C2F3A17AFBA530244E25FEBF0
      AF7FC3EDF0FD80E50AC201819207205A7D284650042F85F0BE17A17ABA55750B
      E2044E2007C3F3814BF85662D83C930BC6B35429288109158018CB7AECE42F85
      F0BE17AAD328016C3941028B393EA7D04F9BB0D20EA30FAEC24184753C1E70BE
      17C2F85E5BAEEC00B256960050A2D0F18D3DCDA70DE7DDEA97B42F85F0BE17AA
      9DDF8000C181F6BB7D7DEDA138C77A970A5C90BE17C2F85FFFEC6F6B9F6FD603
      07F51B1D070739C87E122613406DE7B0820AF031C0DEC77141CC4746E78E7538
      BCC4DF734EEDEB788F7EDCD9F31F228478B247D1E1E7DC2CC5CF616DD8370C17
      B2FABB858D8810EF8D758A30EB8D9E8078A870EFE282320C0D2DA1C047A26DE1
      D37619DE4D8177D0D06E6D06C162B7DB89E204F58F7A9236A915B06F149E0038
      F93981DAFEF61B8D073DABD8369CC9D6371FABE1773CBED02F53E0FAAC71E237
      48811D149DE30EF8844D711CBE52326BFFEBE964CCACFD081AC80FC0753B808D
      BCC647A7E9253FB67D4EC70003D39EC1CE2670E1EDA677EFB9FE6B763184338E
      451F682B4D9A63E667415F54797E1B1C27693DFEDD6F3F61A6333FF8F5899D0F
      2951A53E45D8FE0AA6F69C82626D1FF451229B7E0B79B4F808B40E66E3616916
      D97E809A178AB50D04F69911F4D5ACC4EFFE803DF2F656CC00285198300471B7
      005EA40DF6A2484CE78405807BB13DB833B141ECFD205884020BDBC016C6D093
      42CD0D341B08A3F8FCF0382C961708452CEE91BE846FC7D34983DA96AE860F6C
      2E136D6E759B78C817F189C1A203AD6EBF7FD9274B1BAD88C9812A0ECDC82030
      2041CE6838844D09051E70084032D94D085D0104942B8240E95D8D0DEEAE0FF0
      BDDA48D423F31B6128936C48BA457819B7CF5D38CD02B0491BEC59F75BA99DE9
      FF6444BF1B0C80C0932EC92983C851CFE0AE9488D14852CD2C030ED72890FC53
      6494FEDA1CC2AC800E86579B61B4F5211D682180F175510E02117F035386EC3D
      BABEC9F90E14AE346E0AF8594D839CEF2FA0F3DB7E04A7C29084137679DBC202
      A501350F43DA617861F29C1887C2D230C80E495FF900508E41048AF40279B684
      89E19F608412A1E41040F0B7DEC422A4DBF46AE48893730969B31184D93E1214
      B8CB2AD2D6284B2C4BA839B7CC61465FEDC37D1F2E99069FCFF838253FF878A3
      F042079391B9D1FBC093858F3578E0A0B9ACF643D60238F962B214A25EBFCFEF
      BF81FCFE5FDC606F6B9C6A24DF1FEECF89B8F8C68186654E9728D0AA5BF24D33
      3A9F5650AAFF5193D8730B395278946E6841863820CC510FB2F6D806803FF092
      1B0E0921C684BA305B1FC39751014BA31FB04B3F61329240418CDC018CEC300F
      99CDFDDD3533C4596807F1C82FE00F154BA61817260940BD354EC1855B1D86C2
      3C6214E9723A44DBB79E40CD3CAE417E4DB370C290AD4DEE7333AA1CD0419A0C
      D281E2DA973EC1A596DC168A223054E836ABBF9D6BAB1BE974738D6321931755
      4BEA35843B057C0E6F708394BF6F441B878C9E4EBE79E3D871CF88679F1B1FDC
      37DD606E1F05A2114EA16579471E60F0CC728B852E051E421F4ECB67A9D9E65D
      740822B372F3A04510212F80880A6066905D9859A23E86274AC1EA6175ABCF14
      9DBA76DB3658A9580814FE1CCE843B873349C69FC10368DF6239102E047B9F7F
      13C7A91C0B6FCE07EA99793FA7E902954DE77BC03B13A8360816F7A046B041A5
      17B98BE2C85EDF3DA0AC1B25F0A90285FC9DFAED12E27C7FD7D02C47ECE619F3
      931DACD07C8B56E110E2450521F032DB692D621979BF6FC4F7F4FABC3FF03EF8
      679D0C716483D24829BC80201948F75360DFF00363604003A9FCE9E503F59934
      C285AB3F8FE7F39B79720D3081B4430E3F2E209F2FFE4BCCF0B1879ACBCA687F
      4F364FA829C73FFBFF614CE65497FE4AB3592CFAB02BF72D2F6A6A73C1ED5319
      0A34B3C1ED86B22F24F31C3BB02AE92873EBC5E33D1F4570A5078A87CA1A150E
      94142A1B660E8C3FA985308ABBFCA1FDF0FC43F73FD397783FFE0D25F8A007A6
      4441B0F07ED829FB26EA7F09F443CA064CC58983517DFFB60A3D92F99585BA9C
      1369DD4F010679BBCEDB4833CD2187FC72A57C3A72E25C8238C4C13EB0312878
      AFE3A14697815A646C5A9BA1014A2B2428594402042ED237E4DBF277FC40CC31
      1908AAF2D8666FADDE4E4F677B1AC8B1BC7DD5BB67C724B18D9F9D67BA927EA4
      22D89FA80C053F3AD68EF3D70A80BA509FF764290D36DA852EA270007F79B0C1
      FB3640699236173470EC4D36B0FA608C484C12161D0004E62C043716FBF58DF1
      A45E826008BD0486917A098222E75172FB323547E2B4AD291EAD125F119765E6
      110397D09836902134100616495D4FCBD6388D9009E7B6BA9C0EF2BE7647705F
      5C77D766BE5FF989D29845EBC04D8CA68D6A7DED5B641FC179BA835C379864E4
      5BEFD746AC029A684C6A84B5C2A1DC3B05C02D0979F7D85C3FF617F3DBD41765
      A6E2B2083CA816213616F8B96A6561BE8EFB0684E240039F52204A1ECFFE0113
      BB4D064D7CC2120B0EBBDF463058D268389A1CB0D0477189D78405AE102CD262
      4CB25B44020A2EB6085DF46BB2360301ABCC0D34B1C055C3E00CCEAA40827BD6
      67EBD59C600AFDF06C013B55277E10634C93F64983D0A8C7B855A3492CBBFAA6
      606EB931DE66259FD3666203F72FB87B72FB824E02333CEC4CCE22FA14614BED
      70B3B2FA1974C5F4078BE9CCDFFB20A8B6ABE9AD32D25C3E82C5393D59CCFA6B
      306FA6FAC15C0D67DA9815B06BD05AAA9510E741D880B26DF8A43FBC784789C8
      D484DE5F598D5E743028C83A18FF3D1A1E455748B1DF92FC748244029429639B
      812935060BC969FA745A06F66EC2483B18CD651B5C00258E4F9564AF7770D503
      DDB0453CF21672471DFDD1CA37C200D28B36690A8B515F02648C04A599567C33
      EF7947DB7B3C19D81D9871D571093985AFE29306D8C1B1545C784C0DA5977476
      CC1CF8FF1353E3667C7FCA34B15CD832F385E39E9FD4F3B3E73127AD473B5785
      523A01DA6A0F020DED2F1D130A8E0BF94396EE605779289555ACCE73871F0307
      020CDDBE653C60C35C854034EF9D3CDBCF0525FBCC6D7172CDC0AAC733FE9D05
      D733BB39DDE255A1F55FACFC455740CC3E9D07E0D084907B87C2DCA56D1034FA
      808BEBF6D82BEFDAEB44E835F420C4780B003F60BE891D0E64FB90C4F83775E5
      93FBA8C4BA5714A75F8266E545B3B49EF218A7E2175D847FFB3CE7C3121900F1
      21944B51B48C0B5E3059B12196D2AF230177CCECEDE8A1A76EA9A5F27CE6B7DC
      657B8AFAFE2D42DCE77820DF83038AC60C148CA775DB5818B7E329AA79060C15
      6AC31C29EFE2772F9C3B73F942C3E9418690E8FA32E45539236822334D5D4F3F
      D79B1B1F0D0DABA3E79BF54E7F875324959E3456778857A3FAD8F4E12CCC0750
      B8DD6B3CAAB5BF9AB25FA7375C3C24BCE537A240BC70ACF1FC7D82C46F734B64
      11913A3235020BF465D1A3FBF2E3C56F47159A7AFB5C656F634D2BFCC9CF6B4F
      08F6ACE3D143D4B1592E9C8F0DFA37A7A99CEE1D4D374074A9B5B6B2A46433A5
      C3E076FF7CF80F3704AEF3D83F810F9C16F82EECE25E1F7B0F13114D684DFDFB
      F74071309F4F641347D80F389CFF793C7E8399BCFB3E6D2743AEBF1CD48BD12F
      D852D67EAFACC36A4DF784464E8610189FEF0F82FDFB53ECD0175FCB0CA70F54
      7DF6658D3BF9091D43EED766A13AD66F6728E661AC75CF329DEDEF2FB4A81E90
      74654730AB339BCD13D63027E5A2CFFF762C7D355079EF01AE4D194DA6DEE757
      39D2DFFADA04F7779F3C909E4A766157D775921DD92E7912C44907B94F6BFB29
      37859EF4C63DE3D7D39EB7AF32DDBEBF6793F6394633E72D461DF1866B7DD1D4
      7FD5EC5F2CFCB53E3F19E25724DEC5C75CBC705D340669E1B91FBF840E77FD64
      A77075A4C1EF24BD07044C1E1243B87EE28AC25157B50DF0514E1321D51C6E4D
      74D9C4FD6970DBB7ED38BB0115CF9D60805AB5946813F3DFAD2679A3F3AB1F9A
      D7B67FCE517FB75CCD5E9F419BA4A2FF3AFA26D7E43F5B7E64BF563D3CF3D62A
      CC77829D60B6286F4B1511B619FA658839BC9FD173AFFE59FB0BC793AE9D0D14
      C1E40E9B857DDB2A36790D36D953803EC7F6A61277768FB7DA97A3B9229AC06F
      3522048C2FFFE2368EBFB008317DD590DD7DEB5A3F3F635ABF6E6D8C92F5D80B
      412BA26F0C78151A61F6E1DAD231B4D07FB0B90F1DCD998A0AB8534D9411D0DA
      5FBBEB5BBFCD250212893A7CB5D4BE483BC697CF0CB47C4A6FBF22123205C884
      47BC6C884916AAD910FFE5FF82F4C2893E2852B74498A4A56D5B6DFFF00E84DF
      2E5049B7F801E9B2E5C3D19E86C650DB772FF36EBCF59FD4C5CFCB159B93FD72
      B08B3B72858EEF83E1E07DB71D33E3F0F023F8BE6B5E4CEF5F046053B09408F7
      99A6DFA8B0756190B9F451BD1F823AC8B83D1731AC63CE887F58BEABA47EAA8A
      53F452CF32072BF723B5751486199AA59E4BD27BE79B60E9FB8DDE6BB32F69A9
      4FA50F30BF8CB63B8E43E00E8E6B1A5635276452B118C0A5FB692B1E7C696563
      0E34EF89C0E6DD0D00F380730CDAFA205C0198D132FDBD05063E0BD1701E976F
      98ED6B20AEABBFF1710E9230D7BF77F13F31D722CC639090696266B3EF10C3C3
      DCF4CD9D37D842D2BCF597DCC4EED5FF668B24AB1008F36404C81613A8A40B0A
      72AFEF76D9455C1F67824FC505D3F367BFBDC8FD17FBEF05004AE12DFE9586E8
      D2BCAC1B144AF06C9F45A7FA684E173525A16FCD9FA5C53191826C78B6211C1F
      2D531EB6FEFEEFCB54FDD719D9CC1F57ACF413F6A8418E60FC74E59735016750
      7F0F05CA08070D31E7392A02C71256DE2D094ECE25813E53F050F7BCE8378D51
      D71330DBA0FB09CC5F0F703DDB0C65B2A27E90E5E026A647CA3ECCC7712A0CD5
      65BDA81A81647AA71C8E077BEF05A810DE8D80B8848FAD251E9C0470CC198073
      6B964C22619F97E625E5191D4092A1673FAA07BD84F502052CEA6FA9F7A0284F
      7E026A153A04E364A54E65D93D808C3EDB16FE08984C001311A62130624CC797
      EE110631783DAA1076CBE7F4EB68026B99FF56382C44EF3090E0082EB3DE34FA
      94DE27637F7C0B7E02761602368CD18EBB214394260CE8843236A2C1179DAB5F
      E049FA28664034687870B98660650E62FE3284F02A383D03B5431BE71AF7F31C
      47119E654C03E06E0461AD0A255C013659F3280C5516B6BABF810E17FED77074
      27292D34B6DC81B6AC8B7E4128D089869396FE038AEA8EDE59583DA0DEDBCEDE
      5266C604DB84D0E28BCE9BCE24EA3FEE03E1701BB66C5E8907004386A65EE34D
      A0C698301EF25FC7D5B51F0E2AF380FB159DB11F947DBFB3BEBACE28C59C1808
      A0679D49FC37151ED539D55EEE46969F79F6FCF8C6E6043FDC6FE7CC36AB89F3
      C4901971C2CBCAFA9DDEFE89CB797716537160D6B852DE9DC5D33CE47CC21E8E
      EC5CB2C66D22945ED13F836C2D49CF8173B33D5DC8B72DD83885DD167743BB13
      F3FBEBF7EF7C334432772B50C9EEF1D3A9E3D66E68F7396273812FC6D522F7BA
      B69EEBDE83F71BFE5481D5376A5BDABE0A7ECF50C46FF9BDC48E3FFB61D36E78
      6A625E6F0FF01BF41F1FBA68774169B28FE6ABFFE6BC22D8F1B39010AC1594D0
      AD84C4951E5A4ECD0B2CC95979AAFF3799453A3DA6EF004CB961313B9FEDD796
      DB80B82264AD1780CF75F6C35FCDCA698EFFE70DE845FF739017AE72E974DE14
      E7F8394C655D813FED0323CD4CE5BD5CA6E41DE15E518AF3EAA8D6DBEFB4A6C5
      249CF2B0C7797CF9FF29DA9EBAD970722F566D0E0C5D536C93687909B6D23944
      8D5FB960692ABF3DE4EFCDFC7A65E528E5477D4686C55CA09EFE57CF51542E4D
      FF2926214C6A440D033365D16323C7D64951256B2B752E0A36117A27ED690145
      E29782FB001AF4F66D3887DE7394D7BF96E8832BAC4FFBFED47B9941D107A145
      2B0F5E40251A6ACA2B8D2033F023E44B53F876193D3F8C48392ABCAED38F1AE1
      0D9E37EBC86C81F9EFC6B2024CD4B7A26C6AF01B2220E6CCF522FBCDF09BB0FA
      785E2E509B659EA340B6DBF540C575D9A936C76B1D0E18AB981EE4C55CF5EAD2
      6953EABDC8203B6F0A726FF9DA9A99B8C27C9ABA5DE2D2B70021BEEE28C2B6F2
      A06698EADE563ADBF53433245AC7339270811019CE8DFCFDF2B2EE7C4E0ABA07
      05548FECF27C916CEC8F0AF81A7D619C4BEFE8747E3D53A8A723F8403DB349D0
      9D9778CC0BB25B3B3F1F5670DBE1D66EB0B030213E547E19B1F962BC023FCA48
      FF33FF8A98005806743578593BE02AE8E669FB66AB78A832A8E0CEFF79D96705
      B47DF9E0703410EC1A163F43E02A7AFC301951A63E31A06FD88C2EEE703559C1
      A71A4056740018E9084C5367E8DF59CDC291CD66E450A78CDFAEC415E4B6E554
      A1849220BB6625379E35722CB6AEA4B72D713F65BE2E594D85E1C7B3CFC4F927
      7EAACB2DFA53DCDBA29B3CB458DFC404BDFE0A1C6BFBF6460607962A8F5C1095
      DE854213B9BA30E25569F256AE0705404E82A7E952273F3ABE0D6E4443834856
      0DCE56646EB64D3FEA02FAE61B759AFE687E32F86F07002C0B854F86FECCB240
      732C5C2B2932F1DC065969942E815ACCB2799C65D508465C575E4C52F5935CCB
      DD600065CC169532C6B80CB9F7B7CF4CB367D996266FBAD001D793550A98A17E
      EA62FA3B139654699A5DDCFAD10A22856639EF3DC0E0A9A503C49DC523AB89AB
      C2F87D2952E84819C8C0041007D6807AEC03FF980309F34C386000FF48001B67
      E7FAF9E73707A3C99A1EE7CB665FF80A07608E0A517DB05E809017D80B1EB5F8
      1BCFDBF3DF018FC9F48A17B8FF823FB0104EF43FCF72492373A54CFE7E809F45
      F6F17A02405F802ABF32F8FE2F93ECFD7EFFB8CC6E38D26EA0970C867B4ED5B9
      4362117E9DA770F4FA855F23CAF4026262A805F8BE3FA6C416E91CDE990E0BE8
      542A6D252D357D440081D823EC5E5F2F998C935A81F21E97E2FBAFA9FF09C583
      1626262E83A671D71B8DDFDAF6FE1252527EAEAEA805EC5FCFEB1F7A02405628
      08119B3DF88C4E36EAEAEE29FFBFF602585859C53F65B35B229FA25269DF37D1
      F9E344008A88BA7A60DE6A0F7705F9CCEE96281F5D7A008AF62A2EC5F9465B9A
      FD5FD2108CC8447F47A3D05E606314CDAAD56F3A99202022B1D96D23E3E43151
      1C9FE7C9B4A02405F602BB869992C68F14FC75B1BA1B8DD418ED8221B1DC5339
      6CB6674CE33A5F6BDDF96052383CF0E919FF391FCD82FB62E6C4229CA9D62B71
      EEC7D9C1E0F1789C4E802C1E1A8FD604605FAF398DF2F9762FC832ACC63BC8C1
      64138C0ACB68B6453E3A3A4105F20E5EEF77FA9D4EB91E71C9FE4636D38081C5
      7E6FA612B1D2745777090ABC540763099752CF0401E408C0BF623BC048BF862F
      897E06060C474CA6936DC6EF862C964C314E451B258862371FC08C5451E2C57B
      B3FFD0DA5E6C1BD4C453F145417FA1E9FBD1328A7224D5CB159A0BE05E499474
      FD8BC381C1B419482705E3D1E934DEA3EB2B7DC30100BD8BE3C2FEA7FD80139B
      1E28E02F64C1678468722A6539B1D56F0BE26A940E8DD3E3A3A81867C0BF623B
      C048BF862FF98FE998442E34D8D2BD9F67E23AA2F0F8FCC75391028F163A792E
      3B3FC800BA0BE38C923512FA2EA3D92115149A13A9CA4AB0B062DE925F179F62
      F0805869C3F1BE245806419C6E1D515028947182FFEB3CA51AF9C3716701562F
      3626534A679DA65E6E5F82D5FC673F0B7E569FE143DB8F623BC048BF8E2F897C
      B30D76BF832E665D16A5C0F130F60BA285B7889616A661AF2A3A48149719217B
      3FC78DA9FC63993804A3195659465B9EF95F6BF3FB17C4B239B8B6F272726551
      F62FF7FE1FBA5CFC5A55DAF58BCEF53D7EC5F0AB981792D1263E54D1C9FE7326
      44E02373771B14E3B0691FC4A1053705F32B32873F28BD1D5D21D77E9D88EF01
      22FE38BFDCE0738985391C21CE60329AA2A8D790646C5900A5128970F2D00706
      062635CB5CC9A8D8D5896905E3C926624B5408090988EC1C762F94C302302F29
      3E6377B178101615D7BD3BCD52352D8115145757057B1556230BE54441F4BCA9
      8C8BB6030C617FE3E56442008CBD2993CE1B8E1E05F02B6B4ACD3F45AF901E7F
      5C4FEDC0200E0245F700BE25F0DBC0613111BD453FE4793E5C3F0C811AA2E5AA
      454531B4736A7ADFEACB36A7E0BE29C8EF2683EF17CA8B90122A21A0DC9D1C97
      62F2E1C4EC739D742CC7945E1209F62F3545CBAE9910A42A6AE4C2FA60132A60
      167B1DAF8CC9B01E58A3B1EA63F6D02B31C3C33BDA2B73C7C74BD88EF0122FEA
      0BF0B89C7C6E32510CA720165279A5A25D74C689A5EBDFCFBC4E23D36BC82F92
      171BD5E2FCEE7752696882F98A494BD2603B178E48A4FB86EEC3A569994E402D
      555561A5A25D745C9361D32267179A3D2CB9C05A926A0CC07A43B7EC833F409F
      E4597B938BA193CEFC759E13B11DE0245FD717C3FE33B946331496D8F555F92D
      14E496598929988884559AFB71E635E2051D6FD3D62DD1EE5002C53F2F3E557C
      56FD8BE0823CB38BE6CB25D74980EC5FD7787E658AC96A8F6A0BE29C8F163DD8
      F2E3020CA354B1C83938623C1F92CE2F36F999C380BFBC356C33E1F98A62F07C
      CE43D330F2759567C161E3BA916DB542BDCFD88EF0122FF10BF322D67C3C26A1
      CF9C796C729264A84E9B556B15B94F9023E8F47B73700793701BC94E0BFE9F5F
      BC7612EC60766BC229F8994AA082F8FB26C4667BA4B1762FC7E472A33199225C
      FC545087929BEC7B3F1CD10C9D1AAD56AF2A0A70EB2AD1B4F38BFDBFDE90E021
      BEBCB762C356E8DAFA94C774F9880E32D6209D4B1B93A3D7B9C91FCF31D88EF0
      122FF10BF938C37CCBE4CD94DF94965951124EE5D2C70730DD13880080B9C04F
      9B186E2B68C3560BE6FEE627A5E7CC3EF58022818AF63E0EC5F14FD1B49D6034
      231424B2CEA5D7B665BF5857B7345451D9CE354004F1F6758CE2F2B683A84048
      0BE0055D6017E518C545EFFBFF7192A0B5DB0DC5B263A0530E310587CC416623
      26C160A7CD496C5F1F345458BB1D65F9EA97580267F66C76F17CBC99504391D9
      1CBE30CDBA629EA9CB131A84C9F42D3BADEBBC5EA7C1F2AE6C0B1192FA07070C
      23F538BD01202D2017CC01A8C859DA99BC763731AB00040EC11C1498048BF245
      E809017C00AAEE09411C08004D007CC807B1C03FF680303F1433063F07F54003
      39F6DF9471B27D5C54212E06BF2FFE0140EC11C14A2FAF8BD01202F8016DFBCF
      7B77FDC9EFDC6AA59D4D369C05253F2022EA0619FC1339DF8FF94EF003A0045F
      6217A02405F202AC397017FC0613CB9F9B1799DC98BC94813AD33899362F3191
      3C9598CE01014596112835C6DBD460BEA351A9CE114ACADA004E20411F62F9F9
      1CAFD95A04294670CEF0CD01CD934FB1A75B090909E762A017B17F1FF47DE809
      0156A02AB67DF7CC704F60A29F9A099ED3453F3EB18A7E9B52AA4D13CD82C004
      5456CC1C48E30927E0BE63CA29F9925DA004EB04545D8BE63449F2FCFC99FA9C
      8E9B718A670B86C4994C9010114F3827C07151189FE7D5DE202405F402279E1B
      688D1E29F8EB6374128B8753161000339105C780100408CD85CF6FB5FCAEFA72
      417CCE54D2156ABF6B8F77AC0102F38693473D8BF73E8BAB9A759B8934138008
      46C5F86839375B3DE58F38C4FF248E118042128EAFFA10D77AC0502FD88EE012
      2FF00BE25F7F8383380F3ABB3C26EB0045446E36E8FFFBF497D5158DE136C514
      57D0BE05E4994ECCF62F2090499065209ED8BE3C2FAA7FFC3BF9B6740C02FF68
      55EFD33E05FB11DC0245FE217D800C35E32CE114EB043B63C2B9E2994FC72D25
      C747FD3148C17C71928D0CA7C4BBC3A5F24BE2F3EC5E2E1E10A72E27E4115ECE
      E1C78A77911E2F62FFAB3EA3A8B9DCBA870100A81A4BE016F011C23D88EF0122
      FF20BE25F2CC27490EA7E3C59E1648E73C6B3A9F92D124527907A3FC89D29F9C
      379463246A0BE0165201C01D8467C073B2DD8BC162116CB9F9E62C53F1E2CA88
      F9BF0FE63149F8BC56325A24C7CFCA4E4FF3ED3AA7010A2B81476B96AF3046F0
      122FF50BC59D26D130A73D3A9F52C3FE3C598CB3AA294F31118F1A3749ECA19F
      E2FA2B870FABE0BEE5BAB108A367E0B05F3B02239803B08CA4F9DA8EC5E28158
      E6770E7B9B14FC78B3F443AA28F2229F9517319196CB6C0E2F16FADD5380B751
      4E9AFC02FA823780917FB45F12F86DCF6B27F5B0FF97153EAB8F16002671E223
      152CCF74FB9296DA7A715FA3D29F82FBD46DE0038467DA52E8BB17988CC6BA5E
      A4ADA7D8114FC22A2A28F160027E5F14FC78B322115A1C5F5717784E021C051D
      805BC04708F623BC048BFDC2FDA0171F3ECF3A9FEAB3F8A7E3BC99FD1D795EB7
      1FEABAD417C90B9F7CED8BE2E7A4D2A9B2603B17CF6CA7D9E753FD56812A3A6C
      3A644CE2F37FB7E3380BC40A3B60E0BC556EEC47780917FC45F0FF8CEE5189E4
      77B49BB78B23FCE1BCFA647BF36EF2465609453F2F3E5579E63FB17C7F070047
      4F36A12603B17CFADEDF73BB4DACDEA5A3C53BC8981A9C319F9D9C5F47F43C87
      010F4CDB988F80E380AB3ECF85D88EF0122FF90BF2C1D67C90E9D3CEF81B1269
      45C66349BE70DE6B3E5D8FBFDFF1DAE3AE85B156C9905FFCFE7FF7BBEE349268
      B0FB0044BE0BCE009A2D92C5D8BF2D96D9134AE5EE07179F151400458109C930
      7368F2FAA566CBB1E9BC0F10E2FFD023D070113B1BE2D98D973EC0501DD86BF0
      048BFF42FE8E3E9332F9336537E52596544493B8E7A383AFD96D474BE02F99CC
      E77B594A3167C033905F37F7313D1BBCBC9EB00459315ECC88762F8A7EC1B4AE
      32D170BF2596752F21CA363B8F03C5C0E0E14C7671514004F1F6758CE2F2EE51
      E840480BF0055F60976500C54407068A316634D85CDF3DD39D029871882C3E62
      0B3119318B053E0A5B42F9733151732EA9D5E6C23AC011C94D8EDE2F93372A08
      A8552DD2D5055B5F58F745595859DB7F2DCDF99E6FABE8FADEF64D936C525F46
      C3B23485C717A02405B402F68DBD58FC7B73369606D52D860081D82382938091
      7E38BD01202FC0153DB1483B80800A600FA300F5F80703E00C0DC518E18F81FD
      B0015E7DB7E89C785EF71808878367EFFBC0503B0470528BECA2F40480BF005E
      1FA811C105A92FE742C6BE3567348DE55FC02A66471B0934833702A5C3C0BEB2
      517D985E809017F00ACFE6878442213E75A66C5E63E26C825204DFD9FD583FF3
      100A3E21942E6201778F33D1417CE369A1A1ACACADA0040ECF7EBB17CEABCAFD
      95A140D35574EF0CD01CD934FB1A75B09C9CA67C0100BD8BF810C7DE809015A6
      02E1144FCCC704CFEC53F3AB5336B14FCE89453F3D4FEF44F5517132716B9DCA
      53A2FB8F2AA06E497680155ED545D8BEE3463A92257BE44DE475DB8D53398CC6
      64EA647C7C82FBE97E03AA88E4FF3F4FB101202FE01613F1BC4568F54FD75B5B
      A5F20EFB4D4017671789F5DC9F689417AFE57CF9D28BEEBB6E90AED36BDDEC01
      76B9762E7005DC1DD1CF62FF2FD1F6AE9D6B053C13A00BCA9BA3FA2FBCCD8989
      8ABDF3AF38E4FF260F71C04272BF3892359EF602A0EEC35FE0245FF817D4BF07
      0712F01EF5826E8A9FECC3AA2BEC4545F47F8D3497E1788E3754FD5273751683
      BB53F64CAF667B1795CB463A32BD60985F5514EF0BE29F1B605CCDFEA70112E1
      9B7D15A0EEC3404048BFF22FD852AEBC65BC22BD39BDCCAF08FF661DE298462C
      0D7C98AE7ACB8E8FFC0F18A2FAE32C8D1D4F9DDE7608A29BDA2B25F579F62F24
      930A579717B2D7C8CABCED6CBFECCAA8ACE157F145FF167E1F9873E9FD5E0269
      C1F5E32D02CE08A0258F1FD0EC47380817FEC5F52FB6617A48F53FD7F0AD5456
      452DD8E8FF66F4A7EF0DED18DBB745F52D0BD935B547D8BD8AC9685B9FB7E688
      5F551598FBF94BC9FE7E97E1E026BC8F63FCEB42FD88E70102F4217B87A8E2AE
      14E532C98A2FA95F517DCB45C6BC5E82F8F85EF39DD17DF59EDAA22FC16CC1BF
      F17B319693EF6A3B17AF17CCABDC3BED4CEA5FB79165A2E3233D9FD93C5ED2FB
      7F8F0174CB5FCAD07402340BD88E70102F4B17D4BE9B77DACB8B987F6D63E595
      3A0084B4554B5BD5C6D47BBC790CA7A5A53F45E969AA2FC8945A7527382EFD63
      6E8BB17BC9E4F89225399EDC3C34734FDB51740157B425A2E442369125E80BE3
      4CC49800BCA69F61AB4EA420B004760BEC47380817A80BFACA1C7DFB3EBC2B2C
      A9DE2C14FDD8A5CFEB9531EFF37ED3DB517D90B87DF345F73F49C5F4231188C4
      ECC0782FBED95FB3EBC2C718F76F2778B54FDA8EBB0EB91380BDE9F924CE02EF
      969CAD4BE845388C17FB85F4FFACEEE59EB74AA8A74BE0F16DA2DE1BDFA65D2B
      262CBECD161AA7EDE7D5336F4A802799583FE91CAA5D76A16603C17DFADF0185
      C5578555150EF92076EC6BC8A43DE18DFCEE02F8EF74993809A0F4FD935A0BA0
      29077DF4281182FF70BF328D67D90EAF0ACB2DA6786BC2A534FFBC37B85FB892
      FBFDFFFD65B3D19470F1028BFF9FEFFF0F87CE7C2001523B7B1000517C029745
      B576F82FD8EC762E171BB2BC2AA8AB08AB0212D16025BEAB59B7875EBFC9F6C0
      5E94994D9C04DBCEFE11E7B4D6002A0B541DEA0102F482FE96724372F9736577
      E50545093BAE0E572D98C12FA0BE5F37A1F0671ECDBFB1C6D17DDFDDC4F57797
      7C7D400AB26ABDB910F05F54FE0589638E473BBEAA2BD4BE6799E8F30CDB3F5F
      B15975D9DE355005F1F6F58E02F6EE7A9E00801240149186DBB4035512E172C6
      E53CF3B67C3F17D7040AD1754169F3505B88CB8C5A29EC3F3A17DB93AA8BF529
      4B7DD8474002B92BB1D985F666ED4135DB4EA95302C8F0CCB362C3725CE7A8EA
      3C9F57D5FE7F3FF137BE727CFD97D66B65C76A5E02F00400B6405E6692965734
      E45D6DD59CBB2C00287688E8A600205F902F00400BF804F722C6B0E100064A03
      E8D03C7681D37A03FF3875C031E83FB4006D5FB6FDD384B7D9C65A8DE2575E20
      80543B4474520BE502F004009100BED5556B0562C10817B751F3241F019B6B4A
      02CA2D054B12F76EF0D2F29C31F04417CB45E00801270160FCE361B0E2805B9F
      BB17B9FDB8F57E249FFD0DF616F8CB7ED86A36DDB85AD391C29FEC517DF759B9
      C1D6D656E002876F6D3B17DEABDAFDB5A12EE4D9ADEF0DD01DD935FB1AF5B1FF
      6C5FB7BB17F0AAAFBC0100295004934191EE382E7F6A9FBD5ABD7BAA7EF44AA9
      FBF395EA75D125005544ADB55D1C789BD517DC795503724BBE00AAF6AA2EC5F7
      1A393EC9BD5CFD5E475DB8D53399CCE75EA657D8586F9C17E03AA89E4FF09A59
      00400940090475DD6D68F54FD75B0F6A6E2C2802FD99ECA051F78AB0DA25E2DE
      BF9540EFF45F73957485769B5EEA6005FF0B97CCE6DDC1DD1CF62F422555774E
      B582C209D005236AFCA2FB0D2F95B7BE75E7409FE1C4B30012E99508E054CB53
      00A853B10260102F4517D4BF0F0F22F01EF5839FF0282A2BEC4557BA3FD97A4B
      F67DDF97AA7EA8DE717C1515932BD99EC5EE1743D68CAF58140BEF2CABC2F4A7
      D9BD071905F8009D3259F3F95A145EEE539D88E60102F4517B047CEBC65BC22B
      D33DE5455B45971D1FFD0F8745F5C6591ABD8ADE54564BEAF3EC5EC965B72F2E
      2F9E5BEA8A8BFD2CFF0BDEE16ABF001343C0A97B3BF61327A4F7B11CC0205E96
      2FA97DB30BD24AF0A0A8ACB2CD2D16572C8A5BB1D1FEBDE94FDE1BDA31B46F34
      9A60ADDEA90050A5F80EF65BB17B8DCCF1B73F790B0544B8FC01096BB7757B51
      663EFE53027F8F84C9D809B7245DC62678B5202A1498460BF185F22F1BC5B853
      AD72F8CB5515F14EE32EB9BA934B27589BEB0DC65D446FB9B88AF5E1E45E3A02
      8BEFACF54E24E2000B49F7B51D8BD8CCA6ADEE1BD915CA77B50DA3871F5FD12D
      D5FDFF7A1EDD5D9DAB79571919CCF6E602F7D2719C010024E02A97D36EFB595E
      155457DA982A2B6FD054571A35515C6D6319F7B4DC26B4A7E8BEA9CBEEE72002
      FDA57F26EC5EE177C4EFD9FC9FABFDBAA8AE3220A8AAE4AA8AF9BB5515C88556
      9017C71DCD20080127017C2FDC7DFB3EBC299515CF8F6A8ABBCB9FD9532FF766
      BECA5745F642E1F7CF2802371E945980EC5F7DB2BF67D785DAA2B90199515D87
      5C89C05EF853B6002004A0054FFACEED18D6E90545761CA1515E1BDFA6670E2E
      76ADC6121AA7EDE7C164F28029036A77B17DFADF2196CCD784A5515FBFEAA287
      0C6FE77017E37C56F004009500B49FEB3EC87578565966544FB8846E0A8AD475
      55C90467A724E8F80517A0A0A3F2391CAA1DE6005AC7ABB7B17EBF6DBA763B9F
      F5E15545ECFD68CD9372E49BADD75CCA8AD472896AC580BD0568E0008012B017
      5B59A5B97CB9B2BBF282A2849DF6A8AA5F417C8E4753EADAC5DA0C07B545F644
      6E27ADE7DAA6E90057F155EDC88762FAA7F18D3B6977BF6315515EA5F8A8ABB3
      AA8A802E376F58E02F6A6D0E8008012C01485A2CDBCD6AA8994D26DFC14493D5
      E3199B040AC85D4169F3505B88CB9E8A29E53CF917DE175A34B88CBB08E90059
      35BB1D985F666ED4137DCEFBD5F67DFB77DEFA8E5B9BEFBE8FA110944E2AD56C
      46876BE3FCF65F5E0FA8B5F7D202F00400B9C05E67EBB63756DBDC6DD50EB589
      80287688E8A600205F8A2F0040096009CE4595BBBFE0065A03EB503CAE81D8EA
      0348EEE38063C87F5C00FFBF6DAFDE1B9F5F1E32438DC9B3F380A87688E8A417
      CC05E008012C01321F1AFD057B95FCEEB6BD431D6F9E4675E02F0CD45937F276
      870F5FD3C3AB95417CD85E008012F016B1CA455F4FF8FDE235D8BDCFEDD905A4
      0BC468786B7DAFBE34502C723D2BDA94DEBE1C2B1517DF2DAF4AAD6573802876
      F9AFD8BEF8F57C95B5A1BDF33E843407764D7EC6BD6C606062BF00502F62FE16
      95F78020058C80A267D22DD935E21D53F7AB57AC754FDF56EA9F90CA6796F037
      1F802AA28EDB2E5E13E8AA2FB8F2AA06E4979C017C68AA8BB17DC68DEB65F226
      F23AEDC6A99D96D3750532BABAC37CE0BF01D545027F8583E002004B804E13DC
      F6EB47AA7EEC6A0EFEFD357ECC751F68E6FDC35DCD53F7ED8BF3F67F9567A3E8
      BEED96A9CF04E00BE5FD7CD40176BF00A5DC1DD1CF62F66359BB5DE5F32EA9FA
      EE76E0311B97E617EE66BB3BBC6EF9E79D027F88DBF29013919581444FD3B00B
      0239C3A0BE945F92FDE9BEFB3F66EE0A89BCED7E3FFC00CA8B211951678BA5AE
      A7FBC2A97FA5F9206653F94CC05F811053FA4CB7667B17C522F27C32A514EADF
      C15169B980BF2A2EDE17753EF755F1728B5202A2DAA9F033F023A03A0BE985F2
      82895F197708AE979BDEA85CA8B51D412FCF157CC167C1516971A9FFEDADF0BF
      720A08BC401329F8853497E5E7E0BDB2DB766DCAEFB332A2D2CBE29FCF1632CB
      85FDD67FE2C4E1E706A4054B7E4E97C16CFD61D05F4C2FC97EB30DD24CF0B479
      CA8B3AAD6BB9E2E968D7519516BA8D76353FE80AA9FDC37D463A8DE200DEEB69
      92C2CDEEFC429A4D7765BC17C824740D73FB90B1545ABBB127AFFF773F563EBA
      2D31F9EBC49FE13C925402774B98D6693DBF00B023AC3A0BEC45F6EFD3F3D853
      DF67E7851545A9DA2E3E6545AA5EEB7F51B752B1A985FBD67CA59167006EC244
      5FA61B5F0E0BEA4FDDA8F05ED56CBAF7D9FBECC8AA2D7F9177FE2A2D8C8D2F51
      17CB17924B005FF29BBC7FC084B33B37B4400BFAE2FC97E36F7D9F9E16545BEC
      C763DA0913FE2A8B63472A2D8DABD6EB4BC0AD5AA9FC2FCA5B7BB910078A7E2A
      8B05F7DA5BF26F05EFB814837D9EA6AD2D0E545B190F078C07D17E545ABF7644
      24598EC288BDFF059958029ACE97E4CB02FB4400BFB22F553E71FBECFCF0B28A
      D8AAC00CA8A2F174B45BADF76DB14D9FDB8C88A1BB226C7617EB638FDF385F1C
      FEC740785F80BA6AA4F309BE980F45FBDB2DF67E785B1551DAE6545178BA0CEF
      8036C3B644E22F7F30E67D013A1A5B0A95ADCBD0164BF0165102C0102FE917E3
      FF33BD967CDD2291CA00CA9752AEE1BEC6EDD680BD14369AA794FEBCF8BECD9F
      7582FC11D0136D4354BFA2FDF5BDCEE776CF0A6D3EA42E17E54B1E18EFCEE22F
      BCF913DE80A14F0ED713E227BD2E91881700817F50BE97F6B3F4876785A5124E
      3FD78B8FFDAA5DB1AD52EC2513B10B01712C2F474A4FE6733A7A8EB386C238C0
      19CC60BEBEACBB7D17DCEE97F80C264F9E16C766E3FE54BEBC5CFA7566EE1D35
      DCEEF88BD216B3DE80A1F7C74485FD7594058232881780817F50BFB178E46CBE
      6CD96D696965D511193BCE0F545E4B325F817D1E975BF2E2491A2E787B85FA44
      7627B3BFDA0FF2006C82657BA5F7D17E53F74F0FD1C32453AD2CBBA96B65BB27
      A2E9BCE7F41E439D9EE356006C6EEEB1C45ED5B8A8801002580287A998BAC936
      A7DD8F07E30ED13ACF97DC1A2816C38E4171F3905D88CDB0BC29E43D7517EB84
      D469B119B611E400D9FDDE1C4C2FDC79D504F07CC0FA1E87B7E87CCFE9068750
      2753AAA5A2D58EE072BB9068E4F697D8743A4F9E8C45E008017500BB13CA2A4D
      C5C03A64C9FE6ED50060EE11E14C4040BEC85E008012C010}
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 705
    Top = 243
    Bitmap = {
      494C010101000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000948C8C00948C
      8C00948C8C00948C8C00948C8C00948C84009484840094848400948484008C84
      84008C8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00949494008C9CA5007BA5
      B5005AA5B5000894B50000A5BD0000B5CE0000BDD60000C6D60010CED60021CE
      CE0039BDC60063A5AD008C848400948484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ADADAD009C9C9C008CADBD0084B5CE0073B5CE006BBD
      CE0031A5C6000094B50000A5BD0000ADCE0000BDD60000CEDE0000D6E70000E7
      EF0000EFF70000FFFF0000FFFF0031C6CE00848484009C949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C009CBDD6008CBDCE0084B5CE0073B5CE006BB5
      CE00299CBD000094B50000A5BD0000ADC60000BDD60000C6DE0000D6E70000E7
      EF0000EFF70000F7F70000FFFF0000EFF70000CEE7008C848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5009CADB50094BDD6008CB5CE0084B5CE0073B5CE0073B5
      CE00219CBD000094B50000A5BD0000ADC60000BDCE0000C6DE0000D6E70000DE
      EF0000EFF70000F7F70000FFFF0000EFF70000D6EF00738C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADA5A5009CB5BD0094BDD6008CB5CE0084B5CE0073B5CE0073BD
      CE00219CBD000094B50000A5BD0000ADC60000BDCE0000C6D60000D6E70000DE
      EF0000EFF70000F7F70000FFFF0000EFF70000D6EF005A949C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADA500A5BDC60094BDD6008CB5CE0084B5CE0073B5CE006BB5
      CE00299CBD000094B50000A5BD0000ADC60000BDCE0000C6D60000D6E70000DE
      EF0000EFEF0000F7F70000FFFF0000EFF70000D6EF00429CA5008C8484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00A5BDCE0094BDD6008CB5CE0084B5CE0073B5CE006BB5
      CE0039A5C6000094B50000A5BD0000ADC60000BDCE0000C6D60000D6DE0000DE
      EF0000E7EF0000F7F70000FFFF0000EFF70000D6E70031A5B500948C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00A5C6D60094BDCE008CB5CE0084B5CE0073B5CE006BB5
      CE005AB5CE000094B50000A5BD0000ADC60000BDCE0000C6D60000D6DE0000DE
      E70000E7EF0000F7F70000FFFF0000EFF70000D6E70021ADC600948C84000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A5C6DE0094BDCE008CB5CE0084B5CE0073B5CE006BB5
      CE0063B5CE00109CBD00009CBD0000ADC60000B5CE0000C6D60000CEDE0000DE
      E70000E7EF0000F7F70000FFFF0000F7F70000D6E70008BDCE00948C84000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5ADAD00A5C6DE0094BDCE008CB5CE0084B5CE0073B5CE006BB5
      CE0063B5CE0039ADC600009CBD0000ADC60000B5CE0000C6D60000CEDE0000DE
      EF0000E7EF0000F7F70000FFFF0000F7F70000D6E70000C6DE008C8484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5ADB500A5C6D60094BDCE008CB5CE0084B5CE0073B5CE006BB5
      CE005AB5CE005ABDCE0008A5BD0000ADC60000B5CE0000C6D60000CEDE0000DE
      E70000E7EF0000F7F70000FFFF0000F7FF0000DEE70000C6DE007B8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500ADB5BD00A5C6D60094BDCE008CB5CE0084B5CE0073B5CE006BB5
      CE005AB5CE005AB5CE0031B5CE0000ADC60000B5CE0000C6D60000CEDE0000DE
      E70000E7EF0000EFF70000FFFF0000F7FF0000DEEF0000C6DE006B9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500ADBDC600A5C6D60094BDCE008CB5CE0084B5CE0073B5CE006BB5
      CE005AB5CE0052B5CE004ABDCE0000ADC60000B5CE0000C6D60000CEDE0000DE
      E70000E7EF0000EFF70000FFFF0000F7FF0000DEEF0000C6DE005294A5009C94
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDB5B500ADBDCE00A5C6D60094BDCE008CB5CE0084ADC60073B5CE006BC6
      D60063CEDE0063D6E70063DEE7004ADEE70039DEE70042DEEF0042E7EF0042E7
      EF0031EFF70008F7F70000FFFF0000F7FF0000DEEF0000C6DE00429CAD009C94
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDB5B500ADC6D600A5C6D60094CED60094D6E7008CE7EF0094EFEF0094E7
      EF0094E7EF009CE7EF009CE7EF0094E7EF007BE7EF0084EFF7008CF7F70094FF
      FF00A5FFFF00BDFFFF00C6FFFF00A5FFFF005AE7EF0000C6DE0021A5BD009C94
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDB5B500ADCEDE00A5DEE700ADDEEF00ADDEEF00A5DEEF009CDEE7009CDE
      EF0094DEEF0094DEEF008CDEEF008CE7EF0073DEEF0073E7EF007BEFF70084EF
      F70084F7FF008CF7FF0094FFFF009CFFFF00ADFFFF00CEF7F70042B5CE009C94
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500BDDEE700B5DEEF00ADDEE700A5DEE7009CDEE70094DEE70094D6
      E7008CDEE7008CDEE70084DEEF0084DEEF006BDEEF006BDEEF0073E7EF0073EF
      F7007BEFF70084F7F7008CF7FF008CFFFF0094F7FF008CF7F700CEE7EF00948C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500D6DEDE00A5D6E700A5DEE7009CDEE70094D6E70094D6E7008CD6
      E70084D6E70084D6E70084D6E7007BD6E70063D6E7005AD6E70063DEEF006BE7
      EF0073E7F7007BEFF7007BEFF70084F7F70084F7F7009CF7F700EFF7F7009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00DEDEDE00D6DEDE00B5D6DE009CD6DE0084D6DE0084D6E70084D6
      E70084D6E7007BD6E7007BD6E70073D6E7005ACEE70052CEE7005AD6EF0063DE
      EF0063E7EF0063EFF7006BF7F7008CFFFF00C6FFFF00EFF7F700F7EFEF009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600DEDEDE00DEDEDE00DEDEDE00E7DEDE00D6DEDE00BDD6DE00ADD6
      DE0094D6DE0084D6DE007BDEE70073DEE7004ADEE70042E7EF0052F7F70073F7
      F7009CFFF700C6FFFF00EFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600CECECE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00EFDEDE00EFE7E700F7EF
      EF00F7EFEF00FFF7F700FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00BDBD
      BD009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600CECECE00DEDEDE00D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600DEDEDE00E7E7E700EFEF
      EF00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00C6C6
      C6009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00D6D6D600DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00E7E7E700DEDEDE00DEDEDE00E7E7E700E7E7
      E700EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00D6D6
      D6009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600D6D6D600DEDEDE00E7E7E700EFEFEF00EFEFEF00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00DEDE
      DE009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00EFEFEF00EFEFEF00D6D6D600CECECE00CECECE00C6C6C600C6C6C600CECE
      CE00CECECE00D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00E7E7E700EFEF
      EF00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00EFEFEF009C9C9C0094949400ADADAD00B5B5B500BDBDBD00C6C6C600CECE
      CE00CECECE00D6D6D600D6D6D600DEDEDE00DEDEDE00E7E7E700E7E7E700EFEF
      EF00EFEFEF00F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6D6
      D600CECECE00EFEFEF00F7F7F700EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700EFEFEF00EFEF
      EF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700ADAD
      AD00ADADAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00C6C6C600C6C6C600CECECE00D6D6D600DEDEDE00E7E7
      E700EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEF
      EF00E7E7E700D6D6D600CECECE00BDBDBD00ADADAD00A5A5A500A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500ADAD
      AD00ADADAD00ADADAD00ADADAD00A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A5009C9C9C00A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFC007FF000000000000000000000000FF0000FF000000000000000000000000
      FC00003F000000000000000000000000FC00003F000000000000000000000000
      F800003F000000000000000000000000F800003F000000000000000000000000
      F800001F000000000000000000000000F800001F000000000000000000000000
      F800001F000000000000000000000000F800001F000000000000000000000000
      F800001F000000000000000000000000F800001F000000000000000000000000
      F000001F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      E000000F000000000000000000000000E0000007000000000000000000000000
      E0000007000000000000000000000000E0000007000000000000000000000000
      E0000007000000000000000000000000E0000007000000000000000000000000
      E0000007000000000000000000000000E0000007000000000000000000000000
      F800001F000000000000000000000000FF8001FF000000000000000000000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object Mem_CortesFijos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 704
    Top = 208
    object Mem_CortesFijosClave: TSmallintField
      AutoGenerateValue = arAutoInc
      FieldName = 'Clave'
    end
    object Mem_CortesFijosHoraCorte: TTimeField
      DefaultExpression = '04:00'
      FieldName = 'HoraCorte'
    end
    object Mem_CortesFijosActivo: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Activo'
    end
  end
  object Ql_UltimoCorte: TQuery
    DatabaseName = 'DBGASCONSOLA'
    SQL.Strings = (
      'select first 1 fechahorafinal,corte from dpvgcvol'
      'where estatus='#39'C'#39
      'order by fecha desc, corte desc')
    Left = 705
    Top = 279
    object Ql_UltimoCorteCORTE: TIntegerField
      FieldName = 'CORTE'
    end
    object Ql_UltimoCorteFECHAHORAFINAL: TDateTimeField
      FieldName = 'FECHAHORAFINAL'
    end
  end
  object Mem_CorteManual: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 704
    Top = 168
    object Mem_CorteManualCorte: TBooleanField
      FieldName = 'Corte'
    end
  end
  object Timer1: TVrTimer
    Enabled = False
    Interval = 1400
    OnTimer = Timer1Timer
    Left = 713
    Top = 107
  end
  object Timer3: TVrTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer3Timer
    Left = 753
    Top = 107
  end
  object VrTimer1: TVrTimer
    Enabled = False
    Interval = 700
    OnTimer = VrTimer1Timer
    Left = 753
    Top = 147
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer2Timer
    Left = 777
    Top = 203
  end
  object Socket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = Socket1Read
    Left = 792
    Top = 296
  end
end
