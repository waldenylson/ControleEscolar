object frmDataModule: TfrmDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 530
  Width = 1053
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'DATABASE/Banco.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    Left = 48
    Top = 8
  end
  object IBTableAlunos: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterCancel = IBTableAlunosAfterCancel
    AfterPost = IBTableAlunosAfterPost
    BeforeDelete = IBTableAlunosBeforeDelete
    BeforePost = IBTableAlunosBeforePost
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'turma_id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'matricula'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'nome'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'rg'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'data_nasc'
        DataType = ftDate
      end
      item
        Name = 'sexo'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 1
      end
      item
        Name = 'endereco'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'bairro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'cidade'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'fone'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'foto'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'RDB$21'
        Fields = 'matricula'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY22'
        Fields = 'id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN29'
        Fields = 'turma_id'
      end>
    StoreDefs = True
    TableName = 'alunos'
    Left = 48
    Top = 112
    object IBTableAlunosid: TIntegerField
      FieldName = 'id'
    end
    object IBTableAlunosturma_id: TIntegerField
      FieldName = 'turma_id'
      Required = True
    end
    object IBTableAlunosmatricula: TIntegerField
      FieldName = 'matricula'
    end
    object IBTableAlunosnome: TIBStringField
      FieldName = 'nome'
      Required = True
      Size = 255
    end
    object IBTableAlunosrg: TIBStringField
      FieldName = 'rg'
      Size = 255
    end
    object IBTableAlunossexo: TIBStringField
      FieldName = 'sexo'
      Size = 1
    end
    object IBTableAlunosendereco: TIBStringField
      FieldName = 'endereco'
      Size = 255
    end
    object IBTableAlunosbairro: TIBStringField
      FieldName = 'bairro'
      Size = 255
    end
    object IBTableAlunoscidade: TIBStringField
      FieldName = 'cidade'
      Size = 255
    end
    object IBTableAlunosfone: TIBStringField
      FieldName = 'fone'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 255
    end
    object IBTableAlunosfoto: TIBStringField
      FieldName = 'foto'
      Size = 255
    end
    object IBTableAlunosdata_nasc: TDateField
      FieldName = 'data_nasc'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase
    Left = 48
    Top = 56
  end
  object IBTableTurmas: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterPost = IBTableTurmasAfterPost
    BeforeDelete = IBTableTurmasBeforeDelete
    BeforePost = IBTableTurmasBeforePost
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'turma'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'turno'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY25'
        Fields = 'id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'turmas'
    Left = 48
    Top = 160
    object IBTableTurmasid: TIntegerField
      FieldName = 'id'
    end
    object IBTableTurmasturma: TIBStringField
      FieldName = 'turma'
      Required = True
      Size = 255
    end
    object IBTableTurmasturno: TIBStringField
      FieldName = 'turno'
      Required = True
      Size = 50
    end
  end
  object DataSourceListTurmas: TDataSource
    DataSet = IBTableTurmas
    Left = 336
    Top = 48
  end
  object IBQueryLogin: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    Active = True
    SQL.Strings = (
      'SELECT * FROM "usuario"')
    Left = 48
    Top = 320
    object IBQueryLoginid_usuario: TIntegerField
      FieldName = 'id_usuario'
      Origin = '"usuario"."id_usuario"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object IBQueryLoginlogin: TIBStringField
      FieldName = 'login'
      Origin = '"usuario"."login"'
      Required = True
      Size = 255
    end
    object IBQueryLoginsenha: TIBStringField
      FieldName = 'senha'
      Origin = '"usuario"."senha"'
      Required = True
      Size = 255
    end
    object IBQueryLoginusuario: TIBStringField
      FieldName = 'usuario'
      Origin = '"usuario"."usuario"'
      Required = True
      Size = 255
    end
  end
  object IBTableUsuarios: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterPost = IBTableUsuariosAfterPost
    BeforePost = IBTableUsuariosBeforePost
    Active = True
    FieldDefs = <
      item
        Name = 'id_usuario'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'login'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'senha'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'usuario'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY26'
        Fields = 'id_usuario'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'usuario'
    Left = 48
    Top = 208
    object IBTableUsuariosid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object IBTableUsuarioslogin: TIBStringField
      FieldName = 'login'
      Required = True
      Size = 255
    end
    object IBTableUsuariossenha: TIBStringField
      FieldName = 'senha'
      Required = True
      Size = 255
    end
    object IBTableUsuariosusuario: TIBStringField
      FieldName = 'usuario'
      Required = True
      Size = 255
    end
  end
  object DataSourceEmpresas: TDataSource
    DataSet = IBTableEmpresas
    Left = 336
    Top = 104
  end
  object IBTableEmpresas: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'RazaoSocial'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'Email'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'home'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'cnpj'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'endereco'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'estado'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'cidade'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'bairro'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'cep'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'fone1'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'fone2'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'fax'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'Nportaria'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'DataPuclicacao'
        DataType = ftDate
      end
      item
        Name = 'Media'
        DataType = ftWideString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY31'
        Fields = 'id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'empresas'
    Left = 48
    Top = 264
    object IBTableEmpresasid: TIntegerField
      FieldName = 'id'
    end
    object IBTableEmpresasNome: TIBStringField
      FieldName = 'Nome'
      Required = True
      Size = 100
    end
    object IBTableEmpresasRazaoSocial: TIBStringField
      FieldName = 'RazaoSocial'
      Size = 100
    end
    object IBTableEmpresasEmail: TIBStringField
      FieldName = 'Email'
      Size = 50
    end
    object IBTableEmpresashome: TIBStringField
      FieldName = 'home'
      Size = 50
    end
    object IBTableEmpresascnpj: TIBStringField
      FieldName = 'cnpj'
      EditMask = '00\.000\.000\/0000\-00;1;_'
      Size = 50
    end
    object IBTableEmpresasendereco: TIBStringField
      FieldName = 'endereco'
      Size = 100
    end
    object IBTableEmpresasestado: TIBStringField
      FieldName = 'estado'
      Size = 2
    end
    object IBTableEmpresascidade: TIBStringField
      FieldName = 'cidade'
      Size = 50
    end
    object IBTableEmpresasbairro: TIBStringField
      FieldName = 'bairro'
      Size = 50
    end
    object IBTableEmpresascep: TIBStringField
      FieldName = 'cep'
      EditMask = '00000\-999;1;_'
    end
    object IBTableEmpresasfone1: TIBStringField
      FieldName = 'fone1'
      EditMask = '!\(99\)0000-0000;1;_'
    end
    object IBTableEmpresasfone2: TIBStringField
      FieldName = 'fone2'
      EditMask = '!\(99\)0000-0000;1;_'
    end
    object IBTableEmpresasfax: TIBStringField
      FieldName = 'fax'
      EditMask = '!\(99\)0000-0000;1;_'
    end
    object IBTableEmpresasNportaria: TIBStringField
      FieldName = 'Nportaria'
      Size = 50
    end
    object IBTableEmpresasDataPuclicacao: TDateField
      FieldName = 'DataPuclicacao'
      EditMask = '!99/99/0000;1;_'
    end
    object IBTableEmpresasMedia: TIBStringField
      FieldName = 'Media'
    end
  end
  object IBQueryMatricula: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    Active = True
    SQL.Strings = (
      'SELECT COUNT(*) as "qtd" FROM "alunos"')
    Left = 48
    Top = 384
    object IBQueryMatriculaqtd: TIntegerField
      FieldName = 'qtd'
      ProviderFlags = []
    end
  end
  object IBTableFeriados: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterCancel = IBTableAlunosAfterCancel
    AfterPost = IBTableAlunosAfterPost
    BeforeDelete = IBTableAlunosBeforeDelete
    BeforePost = IBTableAlunosBeforePost
    FieldDefs = <
      item
        Name = 'data'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'descricao'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY33'
        Fields = 'data'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'feriados'
    Left = 184
    Top = 192
    object IBTableFeriadosdata: TDateTimeField
      FieldName = 'data'
      Required = True
    end
    object IBTableFeriadosdescricao: TIBStringField
      FieldName = 'descricao'
      Size = 255
    end
  end
  object IBQueryAutoComplete: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    Active = True
    SQL.Strings = (
      'select "a"."id", "a"."nome", "a"."matricula" from "alunos" "a"')
    Left = 376
    Top = 320
    object IBQueryAutoCompleteid: TIntegerField
      FieldName = 'id'
      Origin = '"alunos"."id"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryAutoCompletenome: TIBStringField
      FieldName = 'nome'
      Origin = '"alunos"."nome"'
      Required = True
      Size = 255
    end
    object IBQueryAutoCompletematricula: TIntegerField
      FieldName = 'matricula'
      Origin = '"alunos"."matricula"'
      Required = True
    end
  end
  object DataSourceAutoComplete: TDataSource
    DataSet = IBQueryAutoComplete
    Left = 376
    Top = 368
  end
end
