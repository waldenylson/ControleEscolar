object frmDataModule: TfrmDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 530
  Width = 1053
  object DataSourceListTurmas: TDataSource
    DataSet = tbTurmas
    Left = 336
    Top = 48
  end
  object DataSourceEmpresas: TDataSource
    DataSet = tbEmpresas
    Left = 336
    Top = 104
  end
  object DataSourceAutoComplete: TDataSource
    DataSet = QueryAutoComplete
    Left = 640
    Top = 128
  end
  object UniConnection: TUniConnection
    ProviderName = 'MySQL'
    Port = 3308
    Database = 'controle_escolar'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 8
    EncryptedPassword = 'CEFFCDFFCCFFCBFFCAFFC9FF'
  end
  object tbAlunos: TUniTable
    TableName = 'alunos'
    Connection = UniConnection
    Active = True
    BeforePost = tbAlunosBeforePost
    AfterPost = tbAlunosAfterPost
    AfterCancel = tbAlunosAfterCancel
    BeforeDelete = tbAlunosBeforeDelete
    Left = 40
    Top = 112
    object tbAlunosid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object tbAlunosturma_id: TIntegerField
      FieldName = 'turma_id'
      Required = True
    end
    object tbAlunosmatricula: TIntegerField
      FieldName = 'matricula'
      Required = True
    end
    object tbAlunosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 255
    end
    object tbAlunosrg: TStringField
      FieldName = 'rg'
      Required = True
      Size = 255
    end
    object tbAlunosdata_nasc: TStringField
      FieldName = 'data_nasc'
      Required = True
      Size = 255
    end
    object tbAlunossexo: TStringField
      FieldName = 'sexo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbAlunosendereco: TStringField
      FieldName = 'endereco'
      Required = True
      Size = 255
    end
    object tbAlunosbairro: TStringField
      FieldName = 'bairro'
      Required = True
      Size = 255
    end
    object tbAlunoscidade: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 255
    end
    object tbAlunosfone: TStringField
      FieldName = 'fone'
      Required = True
      Size = 255
    end
    object tbAlunosfoto: TStringField
      FieldName = 'foto'
      Size = 255
    end
  end
  object tbTurmas: TUniTable
    TableName = 'turmas'
    Connection = UniConnection
    Active = True
    BeforePost = tbTurmasBeforePost
    AfterPost = tbTurmasAfterPost
    BeforeDelete = tbTurmasBeforeDelete
    Left = 40
    Top = 160
    object tbTurmasid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object tbTurmasturma: TStringField
      FieldName = 'turma'
      Required = True
      Size = 255
    end
    object tbTurmasturno: TStringField
      FieldName = 'turno'
      Required = True
      Size = 50
    end
  end
  object tbUsuarios: TUniTable
    TableName = 'usuario'
    Connection = UniConnection
    Active = True
    BeforePost = tbUsuariosBeforePost
    AfterPost = tbUsuariosAfterPost
    BeforeDelete = tbUsuariosBeforeDelete
    Left = 40
    Top = 216
    object tbUsuariosid_usuario: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_usuario'
    end
    object tbUsuarioslogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 255
    end
    object tbUsuariossenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 255
    end
    object tbUsuariosusuario: TStringField
      FieldName = 'usuario'
      Required = True
      Size = 255
    end
  end
  object tbEmpresas: TUniTable
    TableName = 'empresas'
    Connection = UniConnection
    Active = True
    BeforeDelete = tbEmpresasBeforeDelete
    Left = 40
    Top = 264
    object tbEmpresasid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object tbEmpresasNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 100
    end
    object tbEmpresasRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 100
    end
    object tbEmpresasEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object tbEmpresashome: TStringField
      FieldName = 'home'
      Size = 50
    end
    object tbEmpresascnpj: TStringField
      FieldName = 'cnpj'
      Size = 50
    end
    object tbEmpresasendereco: TStringField
      FieldName = 'endereco'
      Size = 100
    end
    object tbEmpresasestado: TStringField
      FieldName = 'estado'
      FixedChar = True
      Size = 2
    end
    object tbEmpresascidade: TStringField
      FieldName = 'cidade'
      Size = 50
    end
    object tbEmpresasbairro: TStringField
      FieldName = 'bairro'
      Size = 50
    end
    object tbEmpresascep: TStringField
      FieldName = 'cep'
    end
    object tbEmpresasfone1: TStringField
      FieldName = 'fone1'
    end
    object tbEmpresasfone2: TStringField
      FieldName = 'fone2'
    end
    object tbEmpresasfax: TStringField
      FieldName = 'fax'
    end
    object tbEmpresasNportaria: TStringField
      FieldName = 'Nportaria'
      Size = 50
    end
    object tbEmpresasDataPuclicacao: TDateField
      FieldName = 'DataPuclicacao'
    end
    object tbEmpresasMedia: TStringField
      FieldName = 'Media'
    end
  end
  object tbFeriados: TUniTable
    TableName = 'turmas'
    Connection = UniConnection
    Left = 40
    Top = 328
  end
  object MySQLProvider: TMySQLUniProvider
    Left = 40
    Top = 56
  end
  object QueryLogin: TUniQuery
    Connection = UniConnection
    SQL.Strings = (
      'SELECT * FROM "usuario"')
    Active = True
    Left = 40
    Top = 392
    object QueryLoginid_usuario: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_usuario'
    end
    object QueryLoginlogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 255
    end
    object QueryLoginsenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 255
    end
    object QueryLoginusuario: TStringField
      FieldName = 'usuario'
      Required = True
      Size = 255
    end
  end
  object QueryMatricula: TUniQuery
    Connection = UniConnection
    SQL.Strings = (
      'SELECT COUNT(*) as "qtd" FROM "alunos"')
    Active = True
    Left = 40
    Top = 448
    object QueryMatriculaqtd: TLargeintField
      FieldName = 'qtd'
      ReadOnly = True
      Required = True
    end
  end
  object QueryAutoComplete: TUniQuery
    Connection = UniConnection
    SQL.Strings = (
      'select "a"."id", "a"."nome", "a"."matricula" from "alunos" "a"')
    Active = True
    Left = 640
    Top = 88
    object QueryAutoCompleteid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryAutoCompletenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 255
    end
    object QueryAutoCompletematricula: TIntegerField
      FieldName = 'matricula'
      Required = True
    end
  end
end
