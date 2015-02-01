unit FormCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ActnMenus, ImgList, ActnList,
  XPStyleActnCtrls, ExtCtrls, DBCtrls, DB, ADODB, StdCtrls, Mask, ComCtrls,
  Menus, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractTable, UMensagemConfirm,
  Buttons;

type
  TfrmCadUsusarios = class(TForm)
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
  frmCadUsusarios: TfrmCadUsusarios;

implementation
uses FormSobre, FormDataModule;

{$R *.dfm}

procedure TfrmCadUsusarios.aboutExecute(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(self);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Release;
    frmSobre.Free;
  end;
end;

procedure TfrmCadUsusarios.addExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Insert;
end;

procedure TfrmCadUsusarios.cancelExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Cancel;
end;

procedure TfrmCadUsusarios.delExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Delete;
end;

procedure TfrmCadUsusarios.editExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Edit;
end;

procedure TfrmCadUsusarios.fistExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.First;
end;

procedure TfrmCadUsusarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    self.Close;
end;

procedure TfrmCadUsusarios.lastExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Last;
end;

procedure TfrmCadUsusarios.nextExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Next;
end;

procedure TfrmCadUsusarios.postExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Post;
end;

procedure TfrmCadUsusarios.prevExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Prior;
end;

procedure TfrmCadUsusarios.refreshExecute(Sender: TObject);
begin
  frmDataModule.IBTableUsuarios.Refresh;
end;

procedure TfrmCadUsusarios.sairExecute(Sender: TObject);
begin
  Close;
end;

end.
