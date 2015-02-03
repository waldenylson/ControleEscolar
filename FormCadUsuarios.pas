unit FormCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ActnMenus, ImgList, ActnList,
  XPStyleActnCtrls, ExtCtrls, DBCtrls, DB, ADODB, StdCtrls, Mask, ComCtrls,
  Menus, UMensagemConfirm,
  Buttons, System.Actions;

type
  TfrmCadUsuarios = class(TForm)
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
    TabControl1: TTabControl;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation
uses FormSobre, FormDataModule;

{$R *.dfm}

procedure TfrmCadUsuarios.aboutExecute(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(self);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Release;
    frmSobre.Free;
  end;
end;

procedure TfrmCadUsuarios.addExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Insert;
end;

procedure TfrmCadUsuarios.cancelExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Cancel;
end;

procedure TfrmCadUsuarios.delExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Delete;
end;

procedure TfrmCadUsuarios.editExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Edit;
end;

procedure TfrmCadUsuarios.fistExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.First;
end;

procedure TfrmCadUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    self.Close;
end;

procedure TfrmCadUsuarios.lastExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Last;
end;

procedure TfrmCadUsuarios.nextExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Next;
end;

procedure TfrmCadUsuarios.postExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Post;
end;

procedure TfrmCadUsuarios.prevExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Prior;
end;

procedure TfrmCadUsuarios.refreshExecute(Sender: TObject);
begin
  frmDataModule.tbUsuarios.Refresh;
end;

procedure TfrmCadUsuarios.sairExecute(Sender: TObject);
begin
  Close;
end;

end.
