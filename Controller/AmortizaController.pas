{
  Controller respons�vel por tratar as informa��es e permitir ou n�o executar
  no objeto de Amortiza para calcular os dados
}

unit AmortizaController;

interface

uses
  System.Classes, System.SysUtils, Vcl.Forms, AmortizaObj;

type
  TAmortizaController = class(TForm)
  public
    constructor Create();
    procedure Salvar(const Amortiza: TAmortiza);
    function ValidaNumero(numero : string): boolean;
  end;

implementation

constructor TAmortizaController.Create();
begin

end;

procedure TAmortizaController.Salvar(const Amortiza: TAmortiza);
begin
    if not ValidaNumero(Amortiza.Capital) then
    raise Exception.Create('Preencha capital a ser calculado.');

    if not ValidaNumero(Amortiza.Meses) then
    raise Exception.Create('Preencha a quantidade de meses.');

    if not ValidaNumero(Amortiza.Juros) then
    raise Exception.Create('Preencha o valor dos juros.');

    // se o objeto for v�lido, o m�todo Confirmar � invocado
    Amortiza.Confirmar(Amortiza.Capital, Amortiza.Meses, Amortiza.Juros);
end;

function TAmortizaController.ValidaNumero(numero : string): boolean;
begin
  if StrToIntDef(numero, 0) = 0 then
    result := false
  else
    result := true;
end;


end.
