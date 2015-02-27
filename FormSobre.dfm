object frmSobre: TfrmSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sobre o programa!'
  ClientHeight = 213
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 458
    Height = 196
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 322
      Height = 67
      Caption = 'Ws-Systemas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 191
      Top = 77
      Width = 165
      Height = 23
      Caption = 'Solu'#231#245'es Tecnol'#243'gicas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 328
      Top = 176
      Width = 127
      Height = 13
      Cursor = crHandPoint
      Hint = 'Visitar o WebSite do Desenvolvedor...'
      Caption = 'www.ws-systemas.com.br'
      Color = clBtnFace
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      OnClick = Label3Click
    end
    object Label4: TLabel
      Left = 13
      Top = 127
      Width = 188
      Height = 24
      Caption = 'Waldenylson Silva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 150
      Width = 72
      Height = 13
      Caption = '(81)9978-7362'
    end
    object Label6: TLabel
      Left = 32
      Top = 163
      Width = 164
      Height = 13
      Caption = 'waldenylson_eear@yahoo.com.br'
    end
  end
end
