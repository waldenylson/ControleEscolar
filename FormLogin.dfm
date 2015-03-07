object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'CFEscolar - Login do Sistema'
  ClientHeight = 166
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 374
    Height = 153
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 18
      Width = 46
      Height = 13
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 33
      Top = 52
      Width = 38
      Height = 13
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 198
      Top = 111
      Width = 165
      Height = 19
      Cursor = crHandPoint
      Caption = 'Powered by Ws-Systemas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = Label3Click
    end
    object Label5: TLabel
      Left = 352
      Top = 125
      Width = 12
      Height = 19
      Caption = '&&'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 291
      Top = 128
      Width = 55
      Height = 19
      Cursor = crHandPoint
      Caption = 'DBSites'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = Label4Click
    end
    object txtUser: TEdit
      Left = 78
      Top = 15
      Width = 249
      Height = 21
      TabOrder = 0
      OnEnter = txtUserEnter
      OnExit = txtUserExit
      OnKeyDown = txtUserKeyDown
      OnKeyPress = txtUserKeyPress
    end
    object txtPass: TEdit
      Left = 78
      Top = 49
      Width = 169
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnEnter = txtPassEnter
      OnExit = txtPassExit
      OnKeyDown = txtPassKeyDown
    end
    object BitBtn1: TBitBtn
      Left = 252
      Top = 47
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
end
