{***********************************************************************************
**  SISTEMA........: AdminSys_Delphi - Tela Admin para uso em Sistemas Delphi     **
**  USO............: Liberado para cópia e alteração                              **
**  LINGUAGEM......: Delphi 10.3 Rio / Componentes Nativos                 **
** ------------------------------------------------------------------------------ **
**  DESENVOLVEDOR..: Bruno Batista                                         **
**  E-MAIL.........: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ *************************************************************************************}

unit unt_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Vcl.Imaging.jpeg, System.JSON, IdHTTP, dxGDIPlusClasses,
  IniFiles, MidasLib,
  //pas do projeto
  functions, globals, unt_frmamortiza, UserObj;

type
  Tfrm_main = class(TForm)
    panel_central: TPanel;
    panel_conteudo: TPanel;
    panel_img_centro: TPanel;
    img_centro: TImage;
    panel_top: TPanel;
    panel_maximize: TPanel;
    panel_img: TPanel;
    img_logo: TImage;
    panel_top_conteudo: TPanel;
    panel_bottom: TPanel;
    sp_menu: TSplitView;
    ImageList: TImageList;
    cb_menu_main: TCategoryButtons;
    panel_user_config: TPanel;
    img_user: TImage;
    lb_user: TLabel;
    lb_name_user: TLabel;
    lb_hora: TLabel;
    lb_data: TLabel;
    lb_server: TLabel;
    lb_on_offline: TLabel;
    lb_cidade: TLabel;
    sp_sec: TSplitView;
    cb_menu_sec: TCategoryButtons;
    tm_hora: TTimer;
    img_config: TImage;
    PopupMenu1: TPopupMenu;
    Configuraes1: TMenuItem;
    Sair1: TMenuItem;
    img_clima: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lbtempo_condition: TLabel;
    tm_clima: TTimer;
    lb_temperatura: TLabel;
    sp_sub: TSplitView;
    cb_menu_sub: TCategoryButtons;
    panel_hora: TPanel;
    panel_clima: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure img_logoClick(Sender: TObject);
    procedure tm_horaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_menu_mainHotButton(Sender: TObject; const Button: TButtonItem);
    procedure panel_conteudoClick(Sender: TObject);
    procedure cb_menu_secHotButton(Sender: TObject; const Button: TButtonItem);
    procedure cb_menu_secClick(Sender: TObject);
    procedure img_configClick(Sender: TObject);
    procedure tm_climaTimer(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  //lista de arrays para cadastro do menu lateral feito com SplitView Duplo
  array_amortiza: array[0..0] of string = ('Calcular Amortização');
  array_amortiza_hint: array[0..0] of string = ('frm_amortiza');

var
  frm_main: Tfrm_main;
  button_menu_sec: TButtonItem;

implementation

{$R *.dfm}

//form create: responsável por capturar variáveis setadas no arquivo config.ini
//o arquivo config.ini está no mesmo diretório da aplicação
//Também carrega as configurações de usuário
procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  //centraliza o form antes do Show na tela baseado no monitor
  Left:=(Screen.Width-Width)  div 2;
  Top:=(Screen.Height-Height) div 2;

  Globals.ArquivoINI := TLeIni.Create();
  Globals.User := TUsuario.Create();

  lb_name_user.Caption := Globals.User.Flogin;
  img_user.Picture.Assign(Globals.User.Ffoto);
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  tm_hora.OnTimer(Self);  //timer que atualiza o painel de hora setado para 15 segundos
  tm_clima.OnTimer(Self); //timer que atualiza o painel de clima setado para 30 minutos
end;

//timer responsavel por atualizar os labels de hora e data
procedure Tfrm_main.tm_horaTimer(Sender: TObject);
begin
  lb_hora.Caption:=formatdatetime('hh:mm',now);
  lb_data.Caption:=formatdatetime('dd/mm/yyyy',now);
end;

//timer responsavel pela conexão a API do Clima Tempo e capturar dados do clima
procedure Tfrm_main.tm_climaTimer(Sender: TObject);
begin
  //chama o Obj clima e suas funções para atualizar o painel de clima
  FreeAndNil(Clima);
  Clima := TClima.Create(ArquivoINI.Fclima_dir, ArquivoINI.Fclima_url);

  lb_cidade.Caption := Clima.Fcidade;
  lb_temperatura.Caption := Clima.Ftemperatura;
  lbtempo_condition.Caption := Clima.Fclima_condition;
  img_clima.Picture.Assign(Clima.Fimg);
end;

//Popula o menu lateral Principal. O uso dos arrays é temporário (somente para os testes)
procedure Tfrm_main.cb_menu_mainHotButton(Sender: TObject;
  const Button: TButtonItem);
var
  I: Integer;
begin
   sp_sec.Open;

   if Assigned(Button) then
   begin
      cb_menu_sec.Categories[0].Index:=0;
      while cb_menu_sec.Categories[0].Items.Count > 0 do begin
        cb_menu_sec.Categories[0].Items.Delete(0);
      end;

      if Button.Hint = 'Amortização' then begin
          for I := 0 to High(array_amortiza) do begin
            cb_menu_sec.Categories[0].Items.Add;
            cb_menu_sec.Categories[0].Items[I].Caption:=array_amortiza[I];
            cb_menu_sec.Categories[0].Items[I].Hint:=array_amortiza_hint[I];
          end;
      end;
  end;
end;

procedure Tfrm_main.cb_menu_secHotButton(Sender: TObject;
  const Button: TButtonItem);
var
  I: Integer;
begin
   sp_sec.Open;

  if Assigned(Button) then
   begin
      button_menu_sec := Button;
  end;
end;

procedure Tfrm_main.Configuraes1Click(Sender: TObject);
begin
  VemForm('frm_User', Self);
end;

procedure Tfrm_main.cb_menu_secClick(Sender: TObject);
begin
  VemForm(button_menu_sec.Hint, Self);
end;

procedure Tfrm_main.panel_conteudoClick(Sender: TObject);
begin
  //rotina para fechar os menus laterais quando clicar no panel central da janela Admin
  if sp_sec.Opened then
    sp_sec.Close;
  if sp_sub.Opened then
    sp_sub.Close;
end;

procedure Tfrm_main.Sair1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure Tfrm_main.img_configClick(Sender: TObject);
var
  p: TPoint;
begin
  //ao clicar na engrenagem superior direita, abre-se o menu popup para config
  p:= img_config.ClientToScreen(Point(0,img_config.Height));
  PopupMenu1.Popup(p.X,p.Y);
end;

//ao clicar na logo superior esquerda, abre-se e fecha-se o menu
procedure Tfrm_main.img_logoClick(Sender: TObject);
begin
  if sp_menu.Opened then
    sp_menu.Close
  else
    sp_menu.Open;
end;

end.
