unit unt_frmamortiza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, unt_framerodape,
  unt_framecabecalho, unt_framebotoeslat, unt_framebody, unt_frameAmortiza,
  Vcl.Grids, ComCtrls;

type
  Tfrm_amortiza = class(TForm)
    panel_bottom: TPanel;
    body: TPanel;
    cab: TPanel;
    frame_cabecalho1: Tframe_cabecalho;
    frame_rodape1: Tframe_rodape;
    frame_body1: Tframe_body;
    frame_Amortiza1: Tframe_Amortiza;
    frame_botaolat1: Tframe_botaolat;
    procedure FormCreate(Sender: TObject);
    procedure frame_botaolat1sb_calculaClick(Sender: TObject);
    procedure frame_botaolat1SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_amortiza: Tfrm_amortiza;

implementation

{$R *.dfm}

uses AmortizaController, AmortizaObj;

procedure Tfrm_amortiza.FormCreate(Sender: TObject);
begin
  //FFormState := FFormState - [fsVisible];
end;

procedure Tfrm_amortiza.frame_botaolat1sb_calculaClick(Sender: TObject);
var
  dados_amortiza : TAmortiza;
  AmortizaController : TAmortizaController;
begin
  AmortizaController := TAmortizaController.Create();

  with frame_Amortiza1 do begin
    dados_amortiza := TAmortiza.Create(
                        edt_capital.Text,
                        edt_meses.Text,
                        edt_juros.Text
                      );

    AmortizaController.Salvar(dados_amortiza);

    //O FDados é um cliente data set criado para persistir e popular componentes
    //com os dados semelhante a uma tabela do sistema referente a amortização
    //aqui ele já foi preenchido através do controler e criado no objeto para
    //alimentar o data source ligado ao dbgrid.
    DataSource1.DataSet:= dados_amortiza.Dados;
  end;
end;

procedure Tfrm_amortiza.frame_botaolat1SpeedButton4Click(Sender: TObject);
begin
  Self.Close;
end;

initialization
  // o forma é criado em tempo de execução. é preciso registrar sua classe para sua chamada.
  RegisterClass(Tfrm_amortiza);

end.
