{
  Controller responsável por tratar as informações e permitir ou não executar
  no objeto de Usuário
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
    raise Exception.Create('Preencha o nome do usuário.');

    if Usuario.Flogin = '' then
    raise Exception.Create('Preencha o login do usuário.');

    // se o objeto for válido, o método Confirmar é invocado
    Usuario.UpdateUser();
end;

end.
