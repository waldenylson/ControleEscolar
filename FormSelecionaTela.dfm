object frmSelecionaTela: TfrmSelecionaTela
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CFEscolar - Sele'#231#227'o de Tela'
  ClientHeight = 179
  ClientWidth = 442
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 32
    Top = 14
    Width = 140
    Height = 130
    Cursor = crHandPoint
    Center = True
  end
  object Image2: TImage
    Left = 264
    Top = 14
    Width = 140
    Height = 130
    Cursor = crHandPoint
    Center = True
    OnClick = Image2Click
  end
  object Label1: TLabel
    Left = 64
    Top = 150
    Width = 74
    Height = 23
    Caption = 'ALUNOS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 304
    Top = 150
    Width = 67
    Height = 23
    Caption = 'Turmas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
end
