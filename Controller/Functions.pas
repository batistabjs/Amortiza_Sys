{
 Functions e objetos auxiliares para leitura e escrita de informações nos forms
}
unit Functions;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage,
  System.JSON, System.Classes, IdHTTP, dxGDIPlusClasses, IniFiles;

type
//objeto INI responsável por ler e criar o ini
TLeIni = class
  Fcidade, Fclima_url, Fclima_dir :  string;
public
    constructor Create();
    procedure leINI();
    procedure updateINI;
    procedure criaINI;
    property cidade: String read Fcidade;
    property clima_url: String read Fclima_url;
    property clima_dir: String read Fclima_dir;
end;

//objeto clima que chama a api do clima tempo
TClima = class
  Fcidade, Ftemperatura, Fclima_condition :  string;
  Fimg: TPngImage;
  public
    constructor Create(dir_img, dir_url: string);
    property cidade: String read Fcidade;
    property temperatura: String read Ftemperatura;
    property clima_condition: String read Fclima_condition;
    property img : TPngImage read Fimg;
end;

//procedure padrão para criação dos forms do sistema
procedure VemForm(NomeFrm: String; FormPai: TForm);

implementation

constructor TLeIni.Create();
begin
  leINI;
end;

procedure TLeIni.leINI();
var
  ArquivoINI: TIniFile;
begin
    try
      ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
      Fcidade := ArquivoINI.ReadString('cidade', 'codigo','');
      Fclima_url := ArquivoINI.ReadString('clima', 'clima_url','');
      Fclima_dir := ArquivoINI.ReadString('clima', 'clima_dir','');
      if (Fcidade='') or (Fclima_url='') or (Fclima_dir='') then criaINI;
    finally
      ArquivoINI.Free;
    end;
end;

procedure TLeIni.CriaINI();
var
  ArquivoINI: TIniFile;
begin
  try
    ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
    ArquivoINI.WriteString('cidade', 'codigo', '6761');
    ArquivoINI.WriteString('clima', 'clima_url', 'http://apiadvisor.climatempo.com.br/api/v1/weather/locale/6761/current?token=ff35a51f1c51f9a24db7a4beb00ce597');
    ArquivoINI.WriteString('clima', 'clima_dir', ExtractFilePath(Application.ExeName)+'imgs_test\previsao_tempo');
  finally
    ArquivoINI.Free;
  end;
  leINI;
end;

procedure TLeIni.UpdateINI();
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
  ArquivoINI.ReadString('cidade', 'codigo', '6761');
  ArquivoINI.ReadString('clima', 'clima_url', 'http://apiadvisor.climatempo.com.br/api/v1/weather/locale/6761/current?token=ff35a51f1c51f9a24db7a4beb00ce597');
  ArquivoINI.ReadString('clima', 'clima_dir', ExtractFilePath(Application.ExeName)+'/imgs_test/previsao_tempo');
  ArquivoINI.Free;
end;

constructor TClima.Create(dir_img, dir_url: string);
var
  idhttp1: TIdHTTP;
  json: string;
  obj: TJSONObject;
  data: TJSONValue;
  id_img: string;
begin
  IdHTTP1 := TIdHTTP.Create;
  try
    try
      //criação do request a API (uso necessário do atributo UserAgent)
      IdHTTP1.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
      //popula o json com os dados vindos da API
      json := IdHTTP1.Get(dir_url);
    finally
      IdHTTP1.Free;
    end;

    //Parse e Encode do Json para faciliar a captura de valores
    obj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(json),0) as TJSONObject;

    //captura dos dados relacionados a cidade e estado
    Fcidade := obj.GetValue<string>('name')+'/'+obj.GetValue<string>('state');
    //dados relaciondos ao clima do atributo 'data'
    data := obj.Get('data').JsonValue;

    if data = nil then raise Exception.Create('Error parsing JSON');
    try
      //preenchimento dos labels e imgs do Form relacinados ao clima
      Ftemperatura:= data.GetValue<string>('temperature');
      if temperatura.Length>2 then begin
        Ftemperatura := temperatura.Remove(temperatura.Length-2)+'º';
      end else begin
        Ftemperatura := temperatura+'º';
      end;
      Fclima_condition := data.GetValue<string>('condition');
      id_img:= data.GetValue<string>('icon');

      Fimg := TPNGImage.Create;
      Fimg.LoadFromFile(dir_img+'\'+id_img+'.png');
    finally
      obj.Free;
    end;
  except
    on E : Exception do
    begin
      ShowMessage('Error' + sLineBreak + E.ClassName + sLineBreak + E.Message);
    end;
  end;
end;

procedure VemForm(NomeFrm: String; FormPai: TForm);
var
  Frm: TForm;
begin
  //cria o form em tempo de execução qquando assim é chamado
  Frm:= TFormClass(findclass('T'+NomeFrm)).create(FormPai);

  {if Assigned(Frm) then begin
      Frm.Show;
  end
  else
  begin
    MessageDlg('Formulário '+NomeFrm+' não encontrado!', mtError, [mbOK], 0)
  end; }
end;

end.
