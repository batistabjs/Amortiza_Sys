unit unt_frameUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Datasnap.Provider, Vcl.ComCtrls;

type
  Tframe_User = class(TFrame)
    edt_nome: TLabeledEdit;
    edt_cidade: TLabeledEdit;
    edt_login: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    Image2: TImage;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
