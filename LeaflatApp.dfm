object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Leaflat Application v.1.0'
  ClientHeight = 568
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 624
    Top = 0
    Align = alRight
    PanelStyle.Active = True
    Style.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
    Height = 568
    Width = 256
    object cxComboBox1: TcxComboBox
      Left = 6
      Top = 13
      Properties.OnEditValueChanged = cxComboBox1PropertiesEditValueChanged
      TabOrder = 0
      Width = 247
    end
    object cxListBox1: TcxListBox
      Left = 6
      Top = 40
      Width = 247
      Height = 241
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 105
    DesignSize = (
      624
      568)
    Height = 568
    Width = 624
    object dxMapControl1: TdxMapControl
      Left = 2
      Top = 2
      Width = 617
      Height = 564
      Align = alClient
      CenterPoint.Longitude = 33.400000000000000000
      CenterPoint.Latitude = 47.900000000000000000
      PopupMenu = PopupMenu1
      TabOrder = 0
      ZoomLevel = 10.000000000000000000
      OnMouseDown = dxMapControl1MouseDown
      ExplicitLeft = 1
      ExplicitTop = 1
      object dxMapControl1ImageTileLayer1: TdxMapImageTileLayer
        ProviderClassName = 'TdxMapControlBingMapImageryDataProvider'
      end
      object dxMapControl1ItemLayer1: TdxMapItemLayer
        ProjectionClassName = 'TdxMapControlSphericalMercatorProjection'
      end
      object dxMapControl1BingMapReverseGeoCodingDataProvider1: TdxMapControlBingMapReverseGeoCodingDataProvider
        OnResponse = dxMapControl1BingMapReverseGeoCodingDataProvider1Response
      end
      object dxMapControl1BingMapGeoCodingDataProvider1: TdxMapControlBingMapGeoCodingDataProvider
        OnResponse = dxMapControl1BingMapGeoCodingDataProvider1Response
      end
      object dxMapControl1BingMapRouteDataProvider1: TdxMapControlBingMapRouteDataProvider
        OnResponse = dxMapControl1BingMapRouteDataProvider1Response
      end
      object dxMapControl1BingMapMajorRoadRouteDataProvider1: TdxMapControlBingMapMajorRoadRouteDataProvider
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 619
      Top = 2
      Width = 3
      Height = 564
      AlignSplitter = salRight
      AutoSnap = True
      ExplicitLeft = 614
    end
    object cxTextEdit1: TcxTextEdit
      Left = 418
      Top = 21
      Anchors = [akTop, akRight]
      Properties.OnChange = cxTextEdit1PropertiesChange
      TabOrder = 2
      TextHint = #1042#1074#1077#1076#1110#1090#1100' '#1085#1072#1079#1074#1091' '#1085#1072#1089#1077#1083#1077#1085#1086#1075#1086' '#1087#1091#1085#1082#1090#1091
      Width = 181
    end
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 32
    object File1: TMenuItem
      Caption = #1054#1087#1094#1110#1111
    end
  end
  object ActionList1: TActionList
    Left = 216
    Top = 232
    object actAddStartPoint: TAction
      Caption = #1055#1086#1095#1072#1090#1082#1086#1074#1072' '#1090#1086#1095#1082#1072
      OnExecute = actAddStartPointExecute
    end
    object actChangeStartPoint: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1086#1095#1072#1090#1082#1086#1074#1091' '#1090#1086#1095#1082#1091
      OnExecute = actChangeStartPointExecute
    end
    object actAddNextPoint: TAction
      Caption = #1053#1072#1089#1090#1091#1087#1085#1072' '#1090#1086#1095#1082#1072
      OnExecute = actAddNextPointExecute
    end
    object actDeletePoint: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1090#1086#1095#1082#1091
      OnExecute = actDeletePointExecute
    end
    object actClearAllPoint: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1091#1089#1110' '#1090#1086#1095#1082#1080
      OnExecute = actClearAllPointExecute
    end
    object actSetAsStartPoint: TAction
      Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1087#1086#1095#1072#1090#1082#1086#1074#1086#1102' '#1090#1086#1095#1082#1086#1102
      OnExecute = actSetAsStartPointExecute
    end
    object actSetAsEndPoint: TAction
      Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1082#1110#1085#1095#1077#1074#1086#1102' '#1090#1086#1095#1082#1086#1102
      OnExecute = actSetAsEndPointExecute
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 296
    Top = 232
    object AddEndPoint1: TMenuItem
      Action = actAddStartPoint
    end
    object ChangeStartPoint1: TMenuItem
      Action = actChangeStartPoint
    end
    object AddMiddlePoint1: TMenuItem
      Action = actAddNextPoint
    end
    object DeletePoint1: TMenuItem
      Action = actDeletePoint
    end
    object Clear1: TMenuItem
      Action = actClearAllPoint
    end
    object SetAsEndPoint1: TMenuItem
      Action = actSetAsStartPoint
    end
    object SetAsEndPoint2: TMenuItem
      Action = actSetAsEndPoint
    end
  end
end
