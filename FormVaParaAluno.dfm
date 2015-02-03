object frmVaParaAluno: TfrmVaParaAluno
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = '  CFEscolar - V'#225' para...'
  ClientHeight = 66
  ClientWidth = 350
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 35
    Width = 77
    Height = 13
    Caption = 'Matr'#237'cula Aluno:'
  end
  object txtMatricula: TEdit
    Left = 123
    Top = 32
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnKeyDown = txtMatriculaKeyDown
  end
  object BitBtn1: TBitBtn
    Left = 250
    Top = 30
    Width = 75
    Height = 25
    Caption = '&GO'
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
