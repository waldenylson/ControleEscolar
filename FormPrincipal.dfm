object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Hint = 'Configura'#231#245'es'
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CFEscolar v1.0.0.4 - BETA'
  ClientHeight = 227
  ClientWidth = 1087
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object cadastros: TImage
    Left = 589
    Top = 40
    Width = 105
    Height = 105
    Cursor = crHandPoint
    Hint = 'Gerenciar Cadastros'
    Center = True
    ParentShowHint = False
    ShowHint = True
  end
  object relatorios: TImage
    Left = 710
    Top = 40
    Width = 105
    Height = 105
    Cursor = crHandPoint
    Hint = 'Extrair Relat'#243'rios'
    Center = True
    ParentShowHint = False
    ShowHint = True
    OnClick = relatoriosClick
  end
  object configuracoes: TImage
    Left = 830
    Top = 40
    Width = 105
    Height = 105
    Cursor = crHandPoint
    Hint = 'Configura'#231#245'es'
    Center = True
    ParentShowHint = False
    ShowHint = True
    OnClick = configuracoesClick
  end
  object login: TImage
    Left = 949
    Top = 40
    Width = 105
    Height = 105
    Cursor = crHandPoint
    Hint = 'Login/Logout do Sistema'
    Center = True
    ParentShowHint = False
    ShowHint = True
    OnClick = loginClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 208
    Width = 1087
    Height = 19
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
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 1087
    Height = 25
    ActionManager = ActionManager1
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Spacing = 0
    ExplicitLeft = 456
    ExplicitTop = 8
    ExplicitWidth = 150
    ExplicitHeight = 29
  end
  object TrayIcon1: TTrayIcon
    Left = 624
    Top = 352
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 664
    Top = 400
  end
  object BalloonHint1: TBalloonHint
    Style = bhsStandard
    Left = 768
    Top = 144
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = mnuAlunosNovo
                Caption = '&Novo'
              end>
            Caption = '  &Alunos'
          end
          item
            Items = <
              item
                Action = Action1
                Caption = '&Novo'
              end>
            Caption = '&Turmas'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Left = 528
    Top = 152
    StyleName = 'Platform Default'
    object mnuAlunosNovo: TAction
      Category = 'Alunos'
      Caption = 'Novo'
      OnExecute = mnuAlunosNovoExecute
    end
    object TAction
      Category = '&alunos'
    end
    object Action1: TAction
      Category = 'Turmas'
      Caption = 'Novo'
    end
  end
end
