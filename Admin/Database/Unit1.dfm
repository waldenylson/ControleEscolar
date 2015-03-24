object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CFEscolar - Configura'#231#227'o Banco de Dados'
  ClientHeight = 154
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 8
    Width = 479
    Height = 137
    Caption = '   Servidor MariaDB  '
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 32
      Width = 62
      Height = 13
      Caption = 'Endere'#231'o IP:'
    end
    object Label2: TLabel
      Left = 17
      Top = 56
      Width = 85
      Height = 13
      Caption = 'Nome de Usu'#225'rio:'
    end
    object edit: TLabel
      Left = 68
      Top = 104
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object Label3: TLabel
      Left = 72
      Top = 80
      Width = 30
      Height = 13
      Caption = 'Porta:'
    end
    object txtIP: TEdit
      Left = 104
      Top = 29
      Width = 161
      Height = 21
      TabOrder = 0
    end
    object txtUsuario: TEdit
      Left = 104
      Top = 53
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object txtSenha: TEdit
      Left = 104
      Top = 101
      Width = 161
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 271
      Top = 99
      Width = 81
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object txtPorta: TEdit
      Left = 104
      Top = 77
      Width = 161
      Height = 21
      TabOrder = 4
    end
  end
end
