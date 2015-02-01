object frmExtrairRelatorios: TfrmExtrairRelatorios
  Left = 0
  Top = 0
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = 'CFEscolar - Extrair Relat'#243'rios'
  ClientHeight = 232
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 201
    Height = 87
    Caption = '   TIPO RELAT'#211'RIO   '
    TabOrder = 0
    object rbFaltasAluno: TRadioButton
      Left = 21
      Top = 20
      Width = 177
      Height = 17
      Caption = ' Faltas/Presen'#231'as por Aluno'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbFaltasTurma: TRadioButton
      Left = 21
      Top = 40
      Width = 164
      Height = 17
      Caption = ' Faltas/Presen'#231'as por Turma'
      TabOrder = 1
    end
    object rbFaltasPeriodo: TRadioButton
      Left = 21
      Top = 60
      Width = 177
      Height = 17
      Caption = ' Faltas/Presen'#231'as por Per'#237'odo'
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 229
    Top = 8
    Width = 314
    Height = 87
    Caption = '   Complementos   '
    TabOrder = 1
    object Label1: TLabel
      Left = 37
      Top = 53
      Width = 34
      Height = 13
      Caption = 'Turma:'
    end
    object Label2: TLabel
      Left = 24
      Top = 22
      Width = 47
      Height = 13
      Caption = 'Matr'#237'cula:'
    end
    object ComboBoxTurma: TDBLookupComboBox
      Left = 76
      Top = 48
      Width = 209
      Height = 21
      KeyField = 'id'
      ListField = 'turma'
      ListSource = frmDataModule.DataSourceListTurmas
      TabOrder = 0
    end
    object txtMatricula: TEdit
      Left = 76
      Top = 19
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 24
    Top = 103
    Width = 521
    Height = 81
    Caption = '  Selecione o P'#233'riodo   '
    TabOrder = 2
    OnClick = GroupBox3Click
    object Image1: TImage
      Left = 175
      Top = 46
      Width = 16
      Height = 15
      Picture.Data = {
        07544269746D6170EE000000424DEE0000000000000076000000280000001000
        00000F000000010004000000000078000000120B0000120B0000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00888888888800888888888888800088888888888800708888888888800770
        8888888888007770888888888007777088888888007777708888888FF7777770
        88888888FF777770888888888FF777708888888888FF777088888888888FF770
        888888888888FF708888888888888FF088888888888888F08888}
    end
    object Image2: TImage
      Left = 205
      Top = 46
      Width = 16
      Height = 15
      Picture.Data = {
        07544269746D6170EE000000424DEE0000000000000076000000280000001000
        00000F000000010004000000000078000000120B0000120B0000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF008888F088888888888888F008888888888888F700888888888888F7700888
        88888888F777008888888888F777700888888888F777770088888888F7777770
        08888888F777770088888888F777700888888888F777008888888888F7700888
        88888888F700888888888888F008888888888888F08888888888}
    end
    object dtInicial: TDateTimePicker
      Left = 24
      Top = 44
      Width = 145
      Height = 21
      Date = 41203.630362418980000000
      Time = 41203.630362418980000000
      TabOrder = 0
    end
    object dtFinal: TDateTimePicker
      Left = 227
      Top = 44
      Width = 145
      Height = 21
      Date = 41203.630362418980000000
      Time = 41203.630362418980000000
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 24
    Top = 192
    Width = 521
    Height = 1
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 295
    Top = 200
    Width = 124
    Height = 25
    Caption = 'Gerar Relat'#243'rio'
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 421
    Top = 200
    Width = 124
    Height = 25
    Caption = 'Cancelar'
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
end
