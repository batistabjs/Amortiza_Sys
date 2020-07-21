{
  Controller respons�vel por tratar as informa��es e permitir ou n�o executar
  no objeto de Usu�rio
}

unit UserController;

interface

uses
  System.Classes, System.SysUtils, Vcl.Forms, UserObj;

type
  TUserController = class(TForm)
  public
    constructor Create();
    procedure Salvar(const Usuario: TUsuario);
  end;

implementation

constructor TUserController.Create();
begin

end;

procedure TUserController.Salvar(const Usuario: TUsuario);
begin
    if Usuario.Fname = '' then
    raise Exception.Create('Preencha o nome do usu�rio.');

    if Usuario.Flogin = '' then
    raise Exception.Create('Preencha o login do usu�rio.');

    // se o objeto for v�lido, o m�todo Confirmar � invocado
    Usuario.UpdateUser();
end;

end.
