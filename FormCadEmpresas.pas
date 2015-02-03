unit FormCadEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImgList, ActnList, XPStyleActnCtrls, ActnMan, ComCtrls, StdCtrls,
  Mask, DBCtrls, ToolWin, ActnCtrls, ActnMenus, ExtCtrls, System.Actions;

type
  TfrmCadEmpresas = class(TForm)
    DBNavigator1: TDBNavigator;
    ActionMainMenuBar1: TActionMainMenuBar;
    TabControl1: TTabControl;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    StatusBar1: TStatusBar;
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
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
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
    procedure aboutExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresas: TfrmCadEmpresas;

  implementation

uses FormDataModule, FormSobre;

{$R *.dfm}

procedure TfrmCadEmpresas.aboutExecute(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(self);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Release;
    frmSobre.Free;
  end;
end;

procedure TfrmCadEmpresas.addExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Insert;
end;

procedure TfrmCadEmpresas.cancelExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Cancel;
end;

procedure TfrmCadEmpresas.delExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Delete;
end;

procedure TfrmCadEmpresas.editExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Edit;
end;

procedure TfrmCadEmpresas.fistExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.First;
end;

procedure TfrmCadEmpresas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    self.Close;
end;

procedure TfrmCadEmpresas.lastExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Last;
end;

procedure TfrmCadEmpresas.nextExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Next;
end;

procedure TfrmCadEmpresas.postExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Post;
end;

procedure TfrmCadEmpresas.prevExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Prior;
end;

procedure TfrmCadEmpresas.refreshExecute(Sender: TObject);
begin
  frmDataModule.tbEmpresas.Refresh;
end;

procedure TfrmCadEmpresas.sairExecute(Sender: TObject);
begin
  self.Close;
end;

end.
