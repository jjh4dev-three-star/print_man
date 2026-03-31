object frm_Barcode_Sample: Tfrm_Barcode_Sample
  Left = 0
  Top = 0
  Caption = #48148#53076#46300'_'#49368#54540
  ClientHeight = 387
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 32
    Top = 31
    Width = 75
    Height = 25
    Caption = 'cxButton1'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxGrid1: TcxGrid
    Left = 131
    Top = 31
    Width = 525
    Height = 130
    TabOrder = 1
    object tv1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssNone
      OptionsView.GroupByBox = False
      object tv1Idx: TcxGridColumn
        Caption = #48264#54840
        HeaderAlignmentHorz = taCenter
      end
      object tv1Printer: TcxGridColumn
        Caption = #54532#47536#53552#49440#53469
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenActivated = True
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 340
      end
      object tv1Chk: TcxGridColumn
        Caption = #49440#53469
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderAlignmentHorz = taCenter
        Width = 107
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tv1
    end
  end
  object Memo_Error: TMemo
    Left = 88
    Top = 183
    Width = 386
    Height = 169
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object frxReport1: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44254.500000000000000000
    ReportOptions.LastChange = 46093.800145601850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 592
    Top = 232
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 70.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 245.669450000000000000
        Top = 18.897650000000000000
        Width = 377.953000000000000000
        RowCount = 1
        object Barcode_Ord_No: TfrxBarCodeView
          Align = baCenter
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 51.181200000000000000
          Top = 75.590650000000000000
          Width = 275.590600000000000000
          Height = 121.574830000000000000
          AutoSize = False
          BarType = bcCode128
          CalcCheckSum = True
          Frame.Typ = []
          Rotation = 0
          TestLine = False
          Text = '1234567890'
          WideBarRatio = 2.000000000000000000
          Zoom = 3.062117777777778000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Memo_Box_no: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 336.693260000000000000
          Top = 3.779530000000000000
          Width = 41.259740000000000000
          Height = 30.236240000000000000
          AllowExpressions = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo_Deal_Comp_Name: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 81.417440000000000000
          Top = 22.677230000000000000
          Width = 215.118120000000000000
          Height = 30.236240000000000000
          AllowExpressions = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #44144#47000#52376)
          ParentFont = False
        end
      end
    end
  end
end
