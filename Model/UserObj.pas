{
  Objeto Usuario que cria o objeto e as funções para setar variaveis iniciais de
  usuário do sistema (ainda em implementação);
  Tem chamadas no form 'frm_Usuário' e na 'usuarioController'
}

unit UserObj;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Imaging.pngimage,
  Data.DB, DBClient;

type
TUsuario = class
  FuserId, Fname, Flogin, Fcidadeid :  string;
  Ffoto, Fempresalogo : TPngImage;
  //O FDados é um cliente data set criado para persistir os dados semelhante a uma
  //tabela do sistema referente ao usuarios.
  FDados: TClientDataSet;
  public
    constructor Create();
    procedure UpdateUser();
    property userId: String read FuserId;
    property name: String read Fname;
    property login: String read Flogin;
    property cidadeid: String read Fcidadeid;
    property foto : TPngImage read Ffoto;
    property empresalogo : TPngImage read Fempresalogo;
    property Dados: TClientDataSet read FDados;
end;

implementation

constructor TUsuario.Create();
begin
  FuserId := '1';
  Fname := 'Bruno Batista';
  Flogin := 'batista.bjs';
  Fcidadeid := '6761';
  Ffoto := TPngImage.Create; Ffoto.LoadFromFile(ExtractFilePath(Application.ExeName)+'/imgs_test/eu.png');
  Fempresalogo := TPngImage.Create; Fempresalogo.LoadFromFile(ExtractFilePath(Application.ExeName)+'/imgs_test/empresa_logo.png');

  FDados := TClientDataSet.Create(nil);

   with FDados do
   begin
       if FieldCount = 0 then begin
           FieldDefs.Clear;
           FieldDefs.Add('id', ftString, 10);
           FieldDefs.Add('name', ftString, 10);
           FieldDefs.Add('login', ftString, 10);
           FieldDefs.Add('cidadeid', ftString, 10);
           FieldDefs.Add('foto', ftBlob);
           FieldDefs.Add('empresa_logo', ftBlob);
           CreateDataSet;
        end;

        Append;
        FieldByName('id').AsString := FuserId;
        FieldByName('name').AsString := Fname;
        FieldByName('login').AsString := Flogin;
        FieldByName('cidadeid').AsString := Fcidadeid;
        FieldByName('foto').Assign(Ffoto);
        FieldByName('empresa_logo').Assign(Fempresalogo);
        Post;
   end;
end;

procedure TUsuario.UpdateUser();
var
  vStream : TMemoryStream;
begin
   with FDados do
   begin
        First;
        Edit;
        ParamByName('name').AsString := Fname;
        ParamByName('login').AsString := Flogin;
        ParamByName('cidadeid').AsString := Fcidadeid;
        //vStream := TMemoryStream.Create;
        //Ffoto.SaveToStream(vStream);
        //ParamByName('foto').LoadFromStream(vStream);
        //Fempresalogo.SaveToStream(vStream);
        //ParamByName('empresa_logo').LoadFromStream(vStream);
        Post;
   end;
end;

end.
