{
  Objeto Amortiza que cria o objeto e as funções para calculo da Amortização
  Tem chamadas no form 'frm_Amortiza' e na 'AmortizaController'
}

unit AmortizaObj;

interface

uses
   System.SysUtils, Data.DB, DBClient, Functions;

type
  TAmortiza = class (TObject)
  strict private
    FCapital: string;
    FJuros: string;
    FMeses: string;
    //O FDados é um cliente data set criado para persistir e popular componentes
    //com os dados semelhante a uma tabela do sistema referente a amortização
    FDados: TClientDataSet;
  public
    constructor Create(Capital, Meses, Juros : string);
    procedure Confirmar(Capital, Meses, Juros : string);
    property Capital: string read FCapital;
    property Juros: string read FJuros;
    property Meses: string read FMeses;
    property Dados: TClientDataSet read FDados;
  end;

implementation

{ TEndereco }

constructor TAmortiza.Create(Capital, Meses, Juros : String);
begin
  FCapital := Capital;
  FJuros := Juros;
  FMeses := Meses;
end;

procedure TAmortiza.Confirmar(Capital, Meses, Juros : string);
var
  saldo_aux, saldo_dev_acumulado, juros_acumulado: real;
  i: integer;
  cap, jur : real;
  mes : integer;
begin
   cap := StrtoFloat(capital);
   jur := StrToFloat(juros);
   mes := StrToInt(meses);

   FDados := TClientDataSet.Create(nil);

   with FDados do
   begin
       if FieldCount = 0 then begin
           FieldDefs.Clear;
           FieldDefs.Add('Meses', ftString, 10);
           FieldDefs.Add('Juros', ftString, 10);
           FieldDefs.Add('Amortizacao_Saldo', ftString, 10);
           FieldDefs.Add('Pagamento', ftString, 10);
           FieldDefs.Add('Saldo_Devedor', ftString, 10);

           CreateDataSet;
        end;

       saldo_dev_acumulado := cap;

       for I := 0 to mes+1 do
       begin
         Append;

         if i < mes then begin
            if i = 0 then begin
              Fieldbyname('Meses').AsString := '0';
              Fieldbyname('Juros').AsString := '0';
              Fieldbyname('Amortizacao_Saldo').AsString := '0';
              Fieldbyname('Pagamento').AsString := '0';
              Fieldbyname('Saldo_Devedor').AsString := FloatToStr(cap);
            end else
            begin
              Fieldbyname('Meses').AsString := IntToStr(i);
              Fieldbyname('Juros').AsString := FloatToStr(saldo_aux * (jur/100));
              Fieldbyname('Amortizacao_Saldo').AsString := '';
              Fieldbyname('Pagamento').AsString := '';
              Fieldbyname('Saldo_Devedor').AsString := FloatToStr(saldo_dev_acumulado);
            end;
         end
         else begin
             if i = mes then begin
                Fieldbyname('Meses').AsString := IntToStr(i);
                Fieldbyname('Juros').AsString := FloatToStr(saldo_aux * (jur/100));
                Fieldbyname('Amortizacao_Saldo').AsString := FloatToStr(cap);
                Fieldbyname('Pagamento').AsString := FloatToStr(saldo_dev_acumulado);
                Fieldbyname('Saldo_Devedor').AsString := '0';
             end else
             begin
                Fieldbyname('Meses').AsString := 'Totais';
                Fieldbyname('Juros').AsString := FloatToStr(juros_acumulado);
                Fieldbyname('Amortizacao_Saldo').AsString := FloatToStr(cap);
                Fieldbyname('Pagamento').AsString := FloatToStr(saldo_dev_acumulado);
                Fieldbyname('Saldo_Devedor').AsString := '';
             end;
         end;

         Post;

         if i < mes then begin
             juros_acumulado := juros_acumulado + saldo_dev_acumulado * (jur/100);
             saldo_aux := saldo_dev_acumulado;
             saldo_dev_acumulado := saldo_dev_acumulado + (saldo_dev_acumulado * (jur/100));
         end;
       end;
   end;

end;

end.
