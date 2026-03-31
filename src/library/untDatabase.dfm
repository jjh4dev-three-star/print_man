object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 366
  Width = 587
  object dbLinkage: TFDConnection
    Left = 256
    Top = 88
  end
  object dbZipNo: TADOConnection
    LoginPrompt = False
    Left = 176
    Top = 88
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 368
    Top = 88
  end
  object db_Oracle: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=221.149.104.164:31521/ORCL'
      'User_Name=SAASDEV'
      'Password=monvc2021@'
      'CharacterSet=UTF8')
    Left = 160
    Top = 216
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 288
    Top = 224
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 416
    Top = 184
  end
end
