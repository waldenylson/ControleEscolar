unit untSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, jpeg;

type
  TFrmSplash = class(TForm)
    pnlSplash: TPanel;
    Image: TImage;
    lblStatus: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    procedure PTempo(Sender : TObject);
    function Tempo(T : Integer) : Integer;
    procedure TempoIntervalo(Sender : TObject);
    procedure Intervalo(Sender : TObject);
    procedure PCorFonte(Sender : TObject);
    function CorFonte(CF : TColor) : TColor;
    function Escreva(Caption : String) : String;
    procedure PCorPreenchFonte(Sender : TObject);
    function CorPreenchFonte(CPF : TColor) : TColor;
    procedure IniciaSplash(Sender : TObject);
    procedure pnlSplashClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;
  Sender : TObject;
Contador : Integer;
TAguarde : Integer;
  implementation

{Function Escreva--------------------------------------------------------------}
function TFrmSplash.escreva(Caption : String) : String;             {Escreva}
begin
  Result := Caption;
  lblStatus.Caption := Result;
end;

procedure TFrmSplash.FormCreate(Sender: TObject);
begin
  
end;

{Function Tempo----------------------------------------------------------------}
function TFrmSplash.Tempo(T : Integer) : Integer;                    {Tempo}
begin
  Result := T;
  lblStatus.Repaint;
  Sleep(Result);
end;

{function CorFonte-------------------------------------------------------------}
function TFrmSplash.CorFonte(CF : TColor) : TColor;              {CorFonte}
begin
  Result := CF;
  lblStatus.Font.Color := Result;
end;

{Function CorPreenchFonte------------------------------------------------------}
function TFrmSplash.CorPreenchFonte(CPF : TColor) : TColor; {CorPreenchFonte}
begin
  Result := CPF;
  lblStatus.Color := Result;
end;

{Procedure PCorPreencheFonte---------------------------------------------------}
procedure TFrmSplash.PCorPreenchFonte(Sender : TObject);  {PCorPrennchFonte}
begin
  lblStatus.Color := clWindow;
end;

procedure TFrmSplash.pnlSplashClick(Sender: TObject);
begin
  
end;

{Procedure PCorFonte-----------------------------------------------------------}
procedure TFrmSplash.PCorFonte(Sender : TObject);          {PCor da Fonte}
begin
  lblStatus.Font.Color := clGray;
end;

{Procedure TempoIntervalo------------------------------------------------------}
procedure TFrmSplash.TempoIntervalo(Sender : TObject);     {TempoIntervalo}
begin
  lblStatus.Repaint;
  Sleep(0);
end;

{Procedure PTempo--------------------------------------------------------------}
procedure TFrmSplash.PTempo(Sender : TObject);             {PTempo}
begin
  lblStatus.Repaint;
  Sleep(1000);
end;

{Procedure Intervalo-----------------------------------------------------------}
procedure TFrmSplash.Intervalo(Sender : TObject);           {Intervalo Label}
begin
  lblStatus.Caption:='                                                                                      ';
  Sleep(1);
end;

{Inicia Splash-----------------------------------------------------------------}
procedure TFrmSplash.IniciaSplash(Sender : TObject);
{Tome Nota:--------------------------------------------------------------------}
{Se Desejar Cor e Preenchimento de fontes label Padrão,
Apague todas as linhas de Código abaixo da Seção Desejada a se tornar cor padrão
Comandos : CorPrrenchFonte(Cor da Letra) e CorFonte(Cor da Letra)}

{Se Desejar Colocar uma Cor Para cada Fonte ou Preenchimento para cada Label,
Inclua Qualquer dos Comandos Abaixo em (Cores Label), nas Seções Abaixo
Comandos : CorPrrenchFonte(Cor da Letra) e CorFonte(Cor da Letra)}

{Nota : O Label de Cada Seção Ficara da Cor que vc Determinar no Comando,
se você desejar 2 Labels da mesma cor, um após o outro, não Nescessita repetir
o Código, Basta Deixar a Próxima Seção sem o Código, e assim por diante}

{Fim Nota----------------------------------------------------------------------}
      begin
      
{Cores Padrões-----------------------------------------------------------------}
        PCorPreenchFonte(Sender);
       //Preenchimento Padrão de Fundo de Fonte, Altere Funçao(Cor PreenchFonte)
        PCorFonte(Sender);
       //Cor Padrão de Fonte, altere na UntSplash Funçao (CorFonte)

{Seções de Labels--------------------------------------------------------------}
        Intervalo(Sender);//Comando de Intervalo entre Labels}
        TempoIntervalo(Sender);//Duração de Intervalo
        Escreva('Criando Formulários da Aplicação....');
        PTempo(Sender);//Tempo de Apresentação do label}
                    {Para Ultilizar Tempo padrão troque por : PTempo(Sender

        {Cores Label}
        Intervalo(Sender);
        TempoIntervalo(Sender);
        Escreva('Criando Menus e Submenus de Acesso.....');
        PTempo(Sender);

        {Cores Label}
        Intervalo(Sender);
        TempoIntervalo(Sender);
        Escreva('Atualizando Registros e Informações......');
        PTempo(Sender);

        {Cores Label}
        Intervalo(Sender);
        TempoIntervalo(Sender);
        Escreva('Preparando Formulários Para Acesso a Dados.......');
        PTempo(Sender);

        {Cores Label}
        CorFonte(clblue);
        Intervalo(Sender);
        TempoIntervalo(Sender);
        Escreva('Inicializando o sistema... Por Favor Aguarde...!');
        Tempo(5000);
{Labels Aguarde----------------------------------------------------------------}
        {or Contador := 1 to 1 do
        begin
          Intervalo(Sender);
          TempoIntervalo(Sender);
          {Cores Label}
          {screva('Aguarde Inicializando o Sitema');
          Tempo(TAguarde);/Tempo de Apresentação do label}
                {Para Ultilizar Tempo padrão troque por : TempoIntervalo(Sender)
          {Cores Label}

    //  end;
end;
{Finaliza Splash---------------------------------------------------------------}
{$R *.dfm}
end.
