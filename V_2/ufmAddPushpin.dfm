object fmAddPushpin: TfmAddPushpin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1091#1083#1072#1074#1082#1091
  ClientHeight = 133
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxlbName: TcxLabel
    Left = 40
    Top = 24
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object cxteName: TcxTextEdit
    Left = 112
    Top = 23
    Properties.OnChange = cxteNamePropertiesChange
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Width = 257
  end
  object cxteType: TcxTextEdit
    Left = 112
    Top = 50
    Properties.OnChange = cxteTypePropertiesChange
    TabOrder = 2
    Width = 257
  end
  object cxlbType: TcxLabel
    Left = 40
    Top = 51
    Caption = #1058#1080#1087
  end
  object pButtomPanel: TPanel
    Left = 0
    Top = 92
    Width = 421
    Height = 41
    Align = alBottom
    TabOrder = 4
    ExplicitLeft = 228
    ExplicitTop = 136
    ExplicitWidth = 185
    DesignSize = (
      421
      41)
    object cxbtOK: TcxButton
      Left = 255
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxbtOKClick
    end
    object cxbtCancel: TcxButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = cxbtCancelClick
    end
  end
end
