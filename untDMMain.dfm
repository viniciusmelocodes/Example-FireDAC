object DMMain: TDMMain
  OldCreateOrder = False
  Height = 172
  Width = 410
  object qryData: TFDQuery
    AutoCalcFields = False
    Connection = connectionApp
    SQL.Strings = (
      'SELECT * FROM PEOPLE')
    Left = 144
    Top = 8
    object qryDataID: TIntegerField
      DisplayLabel = 'Code'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDataNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Name Person'
      FieldName = 'NAME'
      Origin = '`NAME`'
      Size = 70
    end
  end
  object qrySearch: TFDQuery
    AutoCalcFields = False
    Connection = connectionApp
    Left = 224
    Top = 8
  end
  object connectionApp: TFDConnection
    Params.Strings = (
      'ConnectionDef=MySQL Connection')
    LoginPrompt = False
    Left = 50
    Top = 10
  end
  object dsData: TDataSource
    DataSet = qryData
    Left = 320
    Top = 8
  end
end
