object frame_User: Tframe_User
  Left = 0
  Top = 0
  Width = 470
  Height = 392
  TabOrder = 0
  object Image2: TImage
    Left = 200
    Top = 64
    Width = 161
    Height = 153
    Center = True
    Stretch = True
  end
  object Image1: TImage
    Left = 16
    Top = 64
    Width = 161
    Height = 153
    Center = True
    Stretch = True
  end
  object Label1: TLabel
    Left = 16
    Top = 296
    Width = 113
    Height = 25
    Caption = 'Label1'
  end
  object edt_nome: TLabeledEdit
    Left = 16
    Top = 24
    Width = 105
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome User'
    TabOrder = 0
  end
  object edt_cidade: TLabeledEdit
    Left = 256
    Top = 24
    Width = 105
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    Enabled = False
    TabOrder = 1
  end
  object edt_login: TLabeledEdit
    Left = 136
    Top = 24
    Width = 105
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Login'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 223
    Width = 161
    Height = 34
    Caption = 'Alterar Imagem User'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 200
    Top = 223
    Width = 161
    Height = 34
    Caption = 'Alterar Imagem Empresa'
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 328
    Top = 56
  end
end
