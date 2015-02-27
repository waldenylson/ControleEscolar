object frmFrequencia: TfrmFrequencia
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 768
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 270
    Height = 368
  end
  object Label2: TLabel
    Left = 40
    Top = 382
    Width = 84
    Height = 19
    Caption = 'F1 - Ajuda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 154
    Top = 382
    Width = 89
    Height = 19
    Caption = 'ESC - SAIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image2: TImage
    Left = 14
    Top = 319
    Width = 259
    Height = 48
  end
  object GroupBox1: TGroupBox
    Left = 284
    Top = 2
    Width = 719
    Height = 374
    Caption = '  Informa'#231#245'es Aluno  '
    TabOrder = 0
    object Label1: TLabel
      Left = 66
      Top = 223
      Width = 44
      Height = 19
      Caption = 'FOTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 208
      Top = 54
      Width = 173
      Height = 33
      Caption = 'MATR'#205'CULA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 403
      Top = 102
      Width = 389
      Height = 33
      DataField = 'nome'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 288
      Top = 99
      Width = 93
      Height = 33
      Caption = 'NOME:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 272
      Top = 143
      Width = 109
      Height = 33
      Caption = 'TURMA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 403
      Top = 146
      Width = 389
      Height = 27
      DataField = 'turma'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 272
      Top = 185
      Width = 109
      Height = 33
      Caption = 'TURNO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 403
      Top = 188
      Width = 389
      Height = 26
      DataField = 'turno'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAviso: TLabel
      Left = 97
      Top = 249
      Width = 251
      Height = 77
      Caption = 'lblAviso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblAviso2: TLabel
      Left = 55
      Top = 332
      Width = 106
      Height = 33
      Caption = 'lblAviso'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object Panel1: TPanel
      Left = 11
      Top = 26
      Width = 152
      Height = 191
      TabOrder = 1
      object foto: TImage
        Left = 1
        Top = 2
        Width = 149
        Height = 187
        Center = True
      end
    end
    object txtMatricula: TEdit
      Left = 403
      Top = 62
      Width = 237
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnEnter = txtMatriculaEnter
      OnExit = txtMatriculaExit
      OnKeyDown = txtMatriculaKeyDown
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 746
    Width = 1024
    Height = 22
    Panels = <
      item
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 700
      end
      item
        Alignment = taCenter
        Width = 70
      end
      item
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
    ExplicitTop = 528
    ExplicitWidth = 1300
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 112
    Top = 472
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 40
    Top = 616
  end
  object Connection: TUniConnection
    ProviderName = 'MySQL'
    Port = 3307
    Database = 'controle_escolar'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 424
    EncryptedPassword = 'CEFFCDFFCCFFCBFFCAFFC9FF'
  end
  object QueryEntrada: TUniQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM "entrada"')
    Active = True
    Left = 40
    Top = 520
    object QueryEntradaid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryEntradaaluno_id: TIntegerField
      FieldName = 'aluno_id'
      Required = True
    end
    object QueryEntradadata: TDateField
      FieldName = 'data'
      Required = True
    end
    object QueryEntradahora: TTimeField
      FieldName = 'hora'
      Required = True
    end
  end
  object MySQLProvider: TMySQLUniProvider
    Left = 40
    Top = 472
  end
  object QuerySaida: TUniQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM "saida"')
    Active = True
    Left = 40
    Top = 568
    object QuerySaidaid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QuerySaidaaluno_id: TIntegerField
      FieldName = 'aluno_id'
      Required = True
    end
    object QuerySaidadata: TDateField
      FieldName = 'data'
      Required = True
    end
    object QuerySaidahora: TTimeField
      FieldName = 'hora'
      Required = True
    end
  end
  object Query: TUniQuery
    Connection = Connection
    SQL.Strings = (
      
        'SELECT "a"."nome", "a"."foto", "a"."data_nasc", "t"."turma", "t"' +
        '."turno" FROM "alunos" "a", "turmas" "t" WHERE("a"."turma_id" = ' +
        '"t"."id")')
    Left = 112
    Top = 424
    object Querynome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 255
    end
    object Queryfoto: TStringField
      FieldName = 'foto'
      Size = 255
    end
    object Querydata_nasc: TStringField
      FieldName = 'data_nasc'
      Required = True
      Size = 255
    end
    object Queryturma: TStringField
      FieldName = 'turma'
      ReadOnly = True
      Required = True
      Size = 255
    end
    object Queryturno: TStringField
      FieldName = 'turno'
      ReadOnly = True
      Required = True
      Size = 50
    end
  end
end
