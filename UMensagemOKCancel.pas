unit UmensagemOKCancel;

interface
function mensagem(corpo: string): integer;

implementation
uses
 Messages, Controls, Dialogs, FMTBcd, StdCtrls, Buttons, Forms;

function mensagem(corpo: string): integer;
var
  mensagem : TForm;
begin
  mensagem := CreateMessageDialog('''' + corpo + '''', mtConfirmation, [mbOK, mbCancel]);  
  (mensagem.FindComponent('Cancel') as TButton).Caption := 'Cancelar';
  result := mensagem.ShowModal;
end;

end.