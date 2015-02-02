object frmSelecionaTela2: TfrmSelecionaTela2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CFEscolar - Sele'#231#227'o de Tela'
  ClientHeight = 179
  ClientWidth = 434
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Image3: TImage
    Left = 43
    Top = 8
    Width = 140
    Height = 130
    Cursor = crHandPoint
    Center = True
  end
  object Label3: TLabel
    Left = 80
    Top = 144
    Width = 78
    Height = 23
    Caption = 'Usu'#225'rios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Image1: TImage
    Left = 256
    Top = 8
    Width = 140
    Height = 130
    Cursor = crHandPoint
    Center = True
    OnClick = Image1Click
  end
  object Label1: TLabel
    Left = 288
    Top = 144
    Width = 88
    Height = 23
    Caption = 'Empresas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
end
