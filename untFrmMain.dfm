object frmMain: TfrmMain
  Left = 440
  Top = 256
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FireDAC'
  ClientHeight = 580
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnSearchData: TButton
    Left = 56
    Top = 66
    Width = 121
    Height = 40
    Caption = 'Pesquisar dados'
    TabOrder = 1
    OnClick = btnSearchDataClick
  end
  object btnInsertNewData: TButton
    Left = 241
    Top = 66
    Width = 121
    Height = 40
    Caption = 'Gerar novos dados'
    TabOrder = 2
    OnClick = btnInsertNewDataClick
  end
  object btnTestConnectionApp: TButton
    Left = 110
    Top = 12
    Width = 198
    Height = 40
    Caption = 'Testar Conex'#227'o da Aplica'#231#227'o'
    TabOrder = 0
    OnClick = btnTestConnectionAppClick
  end
  object gbData: TGroupBox
    Left = 12
    Top = 116
    Width = 394
    Height = 446
    Caption = ' Data of People '
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 11
      Top = 21
      Width = 372
      Height = 413
      DataSource = DMMain.dsData
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Width = 271
          Visible = True
        end>
    end
  end
end
