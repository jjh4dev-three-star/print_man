object frm_CJ_Korea: Tfrm_CJ_Korea
  Left = 0
  Top = 0
  Caption = 'CJ'#45824#54620#53685#50868
  ClientHeight = 385
  ClientWidth = 712
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
end
