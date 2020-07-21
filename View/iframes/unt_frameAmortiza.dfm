object frame_Amortiza: Tframe_Amortiza
  Left = 0
  Top = 0
  Width = 462
  Height = 324
  TabOrder = 0
  object Label2: TLabel
    Left = 431
    Top = 27
    Width = 11
    Height = 13
    Caption = '%'
  end
  object edt_capital: TLabeledEdit
    Left = 16
    Top = 24
    Width = 169
    Height = 21
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = 'Capital a pagar:'
    TabOrder = 0
  end
  object edt_meses: TLabeledEdit
    Left = 214
    Top = 24
    Width = 83
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde de Meses:'
    TabOrder = 1
  end
  object edt_juros: TLabeledEdit
    Left = 328
    Top = 24
    Width = 97
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Juros:'
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 64
    Width = 431
    Height = 249
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = 'Meses N'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Juros'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Amortiza'#231#227'o Saldo Devedor'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Pagamento'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Saldo Devedor'
        Width = 74
        Visible = True
      end>
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 248
  end
  object DataSource1: TDataSource
    Left = 304
    Top = 248
  end
  object DataSetProvider1: TDataSetProvider
    Left = 384
    Top = 184
  end
end
