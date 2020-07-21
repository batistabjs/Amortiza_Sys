unit unt_frmUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, unt_framerodape,
  unt_framecabecalho, unt_framebotoeslat, unt_framebody, unt_frameAmortiza,
  Vcl.Grids, ComCtrls, unt_frameUser;

type
  Tfrm_User = class(TForm)
    panel_bottom: TPanel;
    body: TPanel;
    cab: TPanel;
    frame_cabecalho1: Tframe_cabecalho;
    frame_rodape1: Tframe_rodape;
    frame_body1: Tframe_body;
    frame_User1: Tframe_User;
    frame_botaolat1: Tframe_botaolat;
    procedure FormCreate(Sender: TObject);
    procedure frame_botaolat1sb_calculaClick(Sender: TObject);
    procedure frame_botaolat1SpeedButton4Click(Sender: TObject);
    procedure frame_User1Button1Click(Sender: TObject);
    procedure frame_User1Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_amortiza: Tfrm_User;

implementation

{$R *.dfm}

uses Globals, UserController, UserObj;

procedure Tfrm_User.FormCreate(Sender: TObject);
begin
  //FFormState := FFormState - [fsVisible];
end;

procedure Tfrm_User.FormShow(Sender: TObject);
begin
  //o form principal ao abrir já preencheu o objeto usuarios
  //aqui é feita somente uma chamada ao objeto para preencher os dados na janela
  //de alteração de usuário

  with frame_User1 do begin
    edt_nome.Text := Globals.User.Fname;
    edt_login.Text := Globals.User.Flogin;
    edt_cidade.Text := Globals.User.Fcidadeid;
    Image1.Picture.Assign(Globals.User.Ffoto);
    Image2.Picture.Assign(Globals.User.Fempresalogo);
  end;
end;

procedure Tfrm_User.frame_botaolat1sb_calculaClick(Sender: TObject);
var
  png : TPngImage;
  UserController : TUserController;
begin
  UserController := TUserController.Create();

  with frame_User1 do begin
    Globals.User.Fname := edt_nome.Text;
    Globals.User.Flogin := edt_login.Text;

    Globals.User.Ffoto.Assign(Image1.Picture.Bitmap);
    Globals.User.Fempresalogo.Assign(Image2.Picture.Bitmap);

    UserController.Salvar(Globals.User);
  end;
end;

procedure Tfrm_User.frame_botaolat1SpeedButton4Click(Sender: TObject);
begin
  Self.Close;
end;

procedure Tfrm_User.frame_User1Button1Click(Sender: TObject);
begin
  if frame_User1.OpenDialog1.Execute then
  begin
    frame_User1.Image1.Picture.LoadFromFile(frame_User1.OpenDialog1.FileName);
  end;
end;

procedure Tfrm_User.frame_User1Button2Click(Sender: TObject);
begin
  if frame_User1.OpenDialog1.Execute then
  begin
    frame_User1.Image2.Picture.LoadFromFile(frame_User1.OpenDialog1.FileName);
  end;
end;

initialization
  // o forma é criado em tempo de execução. é preciso registrar sua classe para sua chamada.
  RegisterClass(Tfrm_User);

end.
