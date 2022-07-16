object RADM: TRADM
  OldCreateOrder = False
  Height = 324
  Width = 883
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=Roman_Kursovoy;Data Source=127.0.0.1;Us' +
      'e Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;W' +
      'orkstation ID=DESKTOP-9VBOF0G;Use Encryption for Data=False;Tag ' +
      'with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADOQueryPostavshik: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Postavshik')
    Left = 152
    Top = 16
  end
  object ADOQueryAVTO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from AVTO')
    Left = 312
    Top = 16
  end
  object ADOQueryDog: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Dog')
    Left = 464
    Top = 16
  end
  object ADOQueryReklamac: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Reklamac')
    Left = 632
    Top = 16
  end
  object ADOQueryOtch: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'Select * from AVTO')
    Left = 784
    Top = 16
  end
  object DataSourcePostavshik: TDataSource
    DataSet = ADOQueryPostavshik
    Left = 152
    Top = 72
  end
  object DataSourceAVTO: TDataSource
    DataSet = ADOQueryAVTO
    Left = 312
    Top = 72
  end
  object DataSourceDog: TDataSource
    DataSet = ADOQueryDog
    Left = 464
    Top = 72
  end
  object DataSourceReklamac: TDataSource
    DataSet = ADOQueryReklamac
    Left = 632
    Top = 72
  end
  object DataSourceOtch: TDataSource
    DataSet = ADOQueryOtch
    Left = 784
    Top = 72
  end
  object ADOStoredProcVvod_Postavshik: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Vvod_Postavshik;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NaimPost'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end>
    Left = 144
    Top = 128
  end
  object ADOStoredProcVvod_AVTO: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Vvod_AVTO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = -6
      end
      item
        Name = '@Marka'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = ''
      end
      item
        Name = '@Model'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = ''
      end
      item
        Name = '@DataPostav'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 16
        Value = '0:00:00'
      end
      item
        Name = '@N_Sertif'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@BazCena'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = 0c
      end
      item
        Name = '@Moshnost'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@N_Post'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@RashodTopliva'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@TipKorobki'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = ''
      end
      item
        Name = '@Proizvod'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ''
      end
      item
        Name = '@Obem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 312
    Top = 128
  end
  object ADOStoredProcVvod_Dog: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Vvod_Dog;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@FIOPokup'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = ''
      end
      item
        Name = '@AdresKlienta'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ''
      end
      item
        Name = '@Cena'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = Null
      end
      item
        Name = '@DataZakluch'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 16
        Value = '0:00:00'
      end
      item
        Name = '@N_Dvig'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@KodTovara'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@N_kuzova'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 464
    Top = 128
  end
  object ADOStoredProcVvod_Reklamac: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Vvod_Reklamac;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@DataReklam'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 16
        Value = '0:00:00'
      end
      item
        Name = '@N_Dog'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Neisprav'
        Attributes = [paNullable]
        DataType = ftString
        Size = 80
        Value = ''
      end
      item
        Name = '@Rezult'
        Attributes = [paNullable]
        DataType = ftString
        Size = 80
        Value = ''
      end
      item
        Name = '@SummaUbit'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = Null
      end>
    Left = 632
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from AVTO where 1=1')
    Left = 784
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 784
    Top = 192
  end
end
