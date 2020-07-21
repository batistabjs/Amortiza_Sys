object frm_User: Tfrm_User
  Left = 0
  Top = 0
  Caption = 'Altera'#231#227'o de User'
  ClientHeight = 490
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panel_bottom: TPanel
    Left = 0
    Top = 461
    Width = 657
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    inline frame_rodape1: Tframe_rodape
      Left = 0
      Top = 0
      Width = 657
      Height = 29
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 657
      ExplicitHeight = 29
      inherited panel_bottom: TPanel
        Width = 657
        ExplicitWidth = 657
      end
      inherited Panel1: TPanel
        Width = 657
        ExplicitWidth = 657
      end
    end
  end
  object body: TPanel
    Left = 0
    Top = 45
    Width = 657
    Height = 416
    Align = alClient
    BevelOuter = bvNone
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    inline frame_body1: Tframe_body
      Left = 0
      Top = 0
      Width = 657
      Height = 416
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 657
      ExplicitHeight = 416
      inherited Panel2: TPanel
        Width = 657
        Height = 416
        Align = alClient
        ExplicitWidth = 657
        ExplicitHeight = 416
      end
    end
  end
  object cab: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    inline frame_cabecalho1: Tframe_cabecalho
      Left = 0
      Top = 0
      Width = 657
      Height = 45
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 657
      ExplicitHeight = 45
      inherited Panel1: TPanel
        Width = 657
        ExplicitWidth = 657
        inherited Panel3: TPanel
          Width = 598
          ExplicitLeft = 59
          ExplicitWidth = 598
          inherited Label5: TLabel
            Width = 142
            Caption = 'Altera'#231#227'o de usu'#225'rio'
            ExplicitWidth = 142
          end
        end
      end
      inherited panel_bottom: TPanel
        Width = 657
        ExplicitWidth = 657
      end
    end
  end
  inline frame_User1: Tframe_User
    Left = 8
    Top = 51
    Width = 393
    Height = 311
    TabOrder = 3
    ExplicitLeft = 8
    ExplicitTop = 51
    ExplicitWidth = 393
    ExplicitHeight = 311
    inherited Label1: TLabel
      Width = 320
      Caption = 
        'A API do clima tempo disponibiliza somente 1 cidade no plano Fre' +
        'e.'
      ExplicitWidth = 320
    end
    inherited edt_nome: TLabeledEdit
      EditLabel.ExplicitWidth = 50
    end
    inherited edt_login: TLabeledEdit
      EditLabel.ExplicitWidth = 61
    end
    inherited Button1: TButton
      OnClick = frame_User1Button1Click
    end
    inherited Button2: TButton
      OnClick = frame_User1Button2Click
    end
    inherited OpenDialog1: TOpenDialog
      Filter = 'png|*.png|jpg|*jpg'
    end
  end
  inline frame_botaolat1: Tframe_botaolat
    Left = 456
    Top = 47
    Width = 201
    Height = 414
    TabOrder = 4
    ExplicitLeft = 456
    ExplicitTop = 47
    ExplicitWidth = 201
    ExplicitHeight = 414
    inherited Panel2: TPanel
      Width = 201
      Height = 408
      ExplicitWidth = 233
      ExplicitHeight = 408
      inherited sb_calcula: TSpeedButton
        Left = 8
        Top = 5
        Width = 185
        Caption = 'Confirmar'
        Font.Color = clBlack
        ParentFont = False
        OnClick = frame_botaolat1sb_calculaClick
        ExplicitLeft = 8
        ExplicitTop = 5
        ExplicitWidth = 185
      end
      inherited SpeedButton4: TSpeedButton
        Left = 8
        Top = 56
        Width = 185
        Caption = 'Cancelar'
        Font.Color = clBlack
        ParentFont = False
        OnClick = frame_botaolat1SpeedButton4Click
        ExplicitLeft = 8
        ExplicitTop = 56
        ExplicitWidth = 185
      end
    end
  end
end
