unit FormGerenciarCadastroTurmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, DB, ToolWin, ActnMan, ActnCtrls,
  ActnMenus, ImgList, ActnList, XPStyleActnCtrls, ExtCtrls, System.Actions;

type
  TfrmGerenciarCadastroTurmas = class(TForm)
    TabControl1: TTabControl;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    StatusBar1: TStatusBar;
    DBNavigator1: TDBNavigator;
    ActionManager1: TActionManager;
    fist: TAction;
    prev: TAction;
    next: TAction;
    last: TAction;
    add: TAction;
    del: TAction;
    edit: TAction;
    post: TAction;
    cancel: TAction;
    refresh: TAction;
    sair: TAction;
    about: TAction;
    ImageList1: TImageList;
    ActionMainMenuBar1: TActionMainMenuBar;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    procedure aboutExecute(Sender: TObject);
    procedure fistExecute(Sender: TObject);
    procedure prevExecute(Sender: TObject);
    procedure nextExecute(Sender: TObject);
    procedure lastExecute(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure postExecute(Sender: TObject);
    procedure cancelExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure sairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciarCadastroTurmas: TfrmGerenciarCadastroTurmas;

implementation

uses FormSobre, FormDataModule;

{$R *.dfm}

procedure TfrmGerenciarCadastroTurmas.aboutExecute(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Application);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Release;
    frmSobre.Free;
  end;
end;

procedure TfrmGerenciarCadastroTurmas.addExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Insert;
end;

procedure TfrmGerenciarCadastroTurmas.cancelExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Cancel;
end;

procedure TfrmGerenciarCadastroTurmas.delExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Delete;
end;

procedure TfrmGerenciarCadastroTurmas.editExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Edit;
end;

procedure TfrmGerenciarCadastroTurmas.fistExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.First;
end;

procedure TfrmGerenciarCadastroTurmas.lastExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Last;
end;

procedure TfrmGerenciarCadastroTurmas.nextExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Next;
end;

procedure TfrmGerenciarCadastroTurmas.postExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Post;
end;

procedure TfrmGerenciarCadastroTurmas.prevExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Prior;
end;

procedure TfrmGerenciarCadastroTurmas.refreshExecute(Sender: TObject);
begin
  frmDataModule.IBTableTurmas.Refresh;
end;

procedure TfrmGerenciarCadastroTurmas.sairExecute(Sender: TObject);
begin
  self.Close;
end;

end.
