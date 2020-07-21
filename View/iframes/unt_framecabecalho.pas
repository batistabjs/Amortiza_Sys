unit unt_framecabecalho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxGDIPlusClasses;

type
  Tframe_cabecalho = class(TFrame)
    Panel1: TPanel;
    panel_bottom: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
