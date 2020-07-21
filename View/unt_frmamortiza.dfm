object frm_amortiza: Tfrm_amortiza
  Left = 0
  Top = 0
  Caption = 'Amortiza'#231#227'o'
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
            Caption = 'Cadastrar Nova'
          end
        end
      end
      inherited panel_bottom: TPanel
        Width = 657
        ExplicitWidth = 657
      end
    end
  end
  inline frame_Amortiza1: Tframe_Amortiza
    Left = 0
    Top = 52
    Width = 490
    Height = 401
    TabOrder = 3
    ExplicitTop = 52
    ExplicitWidth = 490
    ExplicitHeight = 401
    inherited Label2: TLabel
      Left = 455
      ExplicitLeft = 455
    end
    inherited edt_capital: TLabeledEdit
      Text = '300000'
    end
    inherited edt_meses: TLabeledEdit
      Text = '5'
    end
    inherited edt_juros: TLabeledEdit
      Width = 121
      Text = '4'
      ExplicitWidth = 121
    end
    inherited DBGrid1: TDBGrid
      Width = 471
      DataSource = frame_Amortiza1.DataSource1
      Columns = <
        item
          Expanded = False
          FieldName = 'Meses'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Juros'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Amortizacao_Saldo'
          Width = 141
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pagamento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Saldo_Devedor'
          Width = 74
          Visible = True
        end>
    end
    inherited ClientDataSet1: TClientDataSet
      ProviderName = 'DataSetProvider1'
    end
    inherited DataSource1: TDataSource
      DataSet = frame_Amortiza1.ClientDataSet1
    end
    inherited DataSetProvider1: TDataSetProvider
      DataSet = frame_Amortiza1.ClientDataSet1
      Options = [poAllowMultiRecordUpdates, poAutoRefresh, poUseQuoteChar]
    end
  end
  inline frame_botaolat1: Tframe_botaolat
    Left = 496
    Top = 76
    Width = 153
    Height = 326
    TabOrder = 4
    ExplicitLeft = 496
    ExplicitTop = 76
    ExplicitHeight = 326
    inherited Panel2: TPanel
      Height = 329
      ExplicitHeight = 329
      inherited sb_calcula: TSpeedButton
        Caption = 'Confirmar'
        Font.Color = clBlack
        ParentFont = False
        OnClick = frame_botaolat1sb_calculaClick
      end
      inherited SpeedButton4: TSpeedButton
        Caption = 'Cancelar'
        Font.Color = clBlack
        ParentFont = False
        OnClick = frame_botaolat1SpeedButton4Click
      end
    end
  end
end
