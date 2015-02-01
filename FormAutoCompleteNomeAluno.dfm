object frmAutoCompleteNomeAluno: TfrmAutoCompleteNomeAluno
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = '  CFEscolar - Persquisa R'#225'pida de Alunos'
  ClientHeight = 181
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 24
    Width = 61
    Height = 13
    Caption = 'Nome Aluno:'
  end
  object Edit1: TEdit
    Left = 72
    Top = 21
    Width = 348
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 43
    Width = 412
    Height = 130
    DataSource = frmDataModule.DataSourceAutoComplete
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = '  NOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'matricula'
        Title.Caption = '  Matr'#237'cula'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 108
        Visible = True
      end>
  end
end
