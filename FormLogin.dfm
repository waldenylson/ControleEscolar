object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CFEscolar - Login do Sistema'
  ClientHeight = 501
  ClientWidth = 800
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
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 800
    Height = 500
    AutoSize = True
    Center = True
  end
  object Label1: TLabel
    Left = 155
    Top = 239
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
    Left = 163
    Top = 273
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
    Left = 580
    Top = 433
    Width = 209
    Height = 19
    Cursor = crHandPoint
    Caption = 'Powered by Ws-Systemas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    OnClick = Label3Click
  end
  object Label4: TLabel
    Left = 727
    Top = 469
    Width = 63
    Height = 19
    Cursor = crHandPoint
    Caption = 'DBSites'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    OnClick = Label4Click
  end
  object Label5: TLabel
    Left = 720
    Top = 453
    Width = 11
    Height = 19
    Caption = '&&'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object txtUser: TEdit
    Left = 208
    Top = 236
    Width = 249
    Height = 21
    TabOrder = 0
    OnEnter = txtUserEnter
    OnExit = txtUserExit
    OnKeyDown = txtUserKeyDown
    OnKeyPress = txtUserKeyPress
  end
  object txtPass: TEdit
    Left = 208
    Top = 270
    Width = 169
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnEnter = txtPassEnter
    OnExit = txtPassExit
    OnKeyDown = txtPassKeyDown
  end
  object BitBtn1: TBitBtn
    Left = 382
    Top = 268
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
