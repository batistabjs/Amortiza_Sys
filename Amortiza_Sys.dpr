program Amortiza_Sys;

uses
  Vcl.Forms,
  unt_frameAmortiza in 'View\iframes\unt_frameAmortiza.pas' {frame_Amortiza: TFrame},
  unt_framebody in 'View\iframes\unt_framebody.pas' {frame_body: TFrame},
  unt_framebotoeslat in 'View\iframes\unt_framebotoeslat.pas' {frame_botaolat: TFrame},
  unt_framecabecalho in 'View\iframes\unt_framecabecalho.pas' {frame_cabecalho: TFrame},
  unt_framerodape in 'View\iframes\unt_framerodape.pas' {frame_rodape: TFrame},
  unt_frmamortiza in 'View\unt_frmamortiza.pas' {frm_amortiza},
  unt_Main in 'View\unt_Main.pas' {frm_main},
  AmortizaController in 'Controller\AmortizaController.pas',
  AmortizaObj in 'Model\AmortizaObj.pas',
  Functions in 'Controller\Functions.pas',
  Globals in 'Controller\Globals.pas',
  UserObj in 'Model\UserObj.pas',
  unt_frameUser in 'View\iframes\unt_frameUser.pas' {frame_User: TFrame},
  unt_frmUser in 'View\unt_frmUser.pas' {frm_User},
  UserController in 'Controller\UserController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
