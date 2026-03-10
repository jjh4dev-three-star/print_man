object frm_CJ_Daetong: Tfrm_CJ_Daetong
  Left = 0
  Top = 0
  Caption = 'CJ'#45824#54620#53685#50868' '#49569#51109#52636#47141
  ClientHeight = 639
  ClientWidth = 1255
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
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 94
    Height = 33
    Caption = #52636#47141
    TabOrder = 0
    OnClick = Button1Click
  end
  object cxGrid1: TcxGrid
    Left = 315
    Top = 8
    Width = 758
    Height = 122
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
  object cxGrid2: TcxGrid
    Left = 8
    Top = 143
    Width = 1094
    Height = 298
    TabOrder = 2
    object dbtv_M: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.KeyFieldNames = 'MID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object dbtv_MRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        Options.Editing = False
      end
      object dbtv_MColumn1: TcxGridDBColumn
        Caption = 'rec'
        DataBinding.FieldName = 'Column1'
        Visible = False
        Width = 30
      end
      object dbtv_MColumn2: TcxGridDBColumn
        Caption = 'row'
        DataBinding.FieldName = 'Column2'
        Visible = False
        Width = 64
      end
      object dbtv_MSame_Group: TcxGridDBColumn
        Caption = #47926#51020#48264#54840
        DataBinding.FieldName = 'Same_Group'
        Options.Editing = False
        Width = 73
      end
      object dbtv_MTran_Comp: TcxGridDBColumn
        Caption = #53469#48176#49324
        DataBinding.FieldName = 'Tran_Comp'
        Options.Editing = False
        Width = 64
      end
      object dbtv_MdlvClsfCd: TcxGridDBColumn
        Caption = #48176#45804#53552#48120#45328#53076#46300' - '#46020#52265#51648#53076#46300
        DataBinding.FieldName = 'dlvClsfCd'
        Visible = False
        Width = 84
      end
      object dbtv_MdlvSubClsfCd: TcxGridDBColumn
        Caption = #48176#45804#49548#48516#47448#53076#46300
        DataBinding.FieldName = 'dlvSubClsfCd'
        Visible = False
        Width = 83
      end
      object dbtv_MdlvClsfNm: TcxGridDBColumn
        Caption = #48176#45804#53552#48120#45328#47749
        DataBinding.FieldName = 'dlvClsfNm'
        Visible = False
        Width = 64
      end
      object dbtv_MStatus: TcxGridDBColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'Status'
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_Inner_Seq: TcxGridDBColumn
        Caption = #46356#53580#51068#51032' ord_inner_seq  '#47785#47197
        DataBinding.FieldName = 'Ord_Inner_Seq'
        Visible = False
        Options.Editing = False
        Width = 92
      end
      object dbtv_MItem_Seq: TcxGridDBColumn
        Caption = #46356#53580#51068#51032' Item_seq  '#47785#47197
        DataBinding.FieldName = 'Item_Seq'
        Visible = False
        Options.Editing = False
        Width = 83
      end
      object dbtv_MAct_Seq: TcxGridDBColumn
        Caption = #46356#53580#51068#51032' Act_seq  '#47785#47197
        DataBinding.FieldName = 'Act_Seq'
        Visible = False
        Width = 64
      end
      object dbtv_MPack_Ord_Inner_seq: TcxGridDBColumn
        Caption = 'tv2_MPack_Ord_Inner_seq'
        DataBinding.FieldName = 'Pack_Ord_Inner_seq'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MPack_Item_Seq: TcxGridDBColumn
        Caption = 'tv2_MPack_Item_Seq'
        DataBinding.FieldName = 'Pack_Item_Seq'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MInvoiceNo: TcxGridDBColumn
        Caption = #49569#51109#48264#54840
        DataBinding.FieldName = 'InvoiceNo'
        Options.Editing = False
        Width = 105
      end
      object dbtv_MOrd_Name: TcxGridDBColumn
        Caption = #51452#47928#51064
        DataBinding.FieldName = 'Ord_Name'
        Options.Editing = False
        Width = 76
      end
      object dbtv_MOrd_Tel: TcxGridDBColumn
        Caption = #51068#48152#51204#54868
        DataBinding.FieldName = 'Ord_Tel'
        Options.Editing = False
        Width = 90
      end
      object dbtv_MOrd_HP: TcxGridDBColumn
        Caption = #55092#45824#54256
        DataBinding.FieldName = 'Ord_HP'
        Options.Editing = False
        Width = 90
      end
      object dbtv_MOrd_ZipNo: TcxGridDBColumn
        Caption = #50864#54200#48264#54840
        DataBinding.FieldName = 'Ord_ZipNo'
        Options.Editing = False
        Width = 72
      end
      object dbtv_MOrd_Addr: TcxGridDBColumn
        Caption = #51452#47928#51452#49548
        DataBinding.FieldName = 'Ord_Addr'
        Options.Editing = False
        Width = 109
      end
      object dbtv_MOrd_Addr1: TcxGridDBColumn
        Caption = #51452#47928#51452#49548'1'
        DataBinding.FieldName = 'Ord_Addr1'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_Addr2: TcxGridDBColumn
        Caption = #51452#47928#51452#49548'2'
        DataBinding.FieldName = 'Ord_Addr2'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MRcv_Name: TcxGridDBColumn
        Caption = #49688#52712#51064
        DataBinding.FieldName = 'Rcv_Name'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.MaxLength = 0
        Properties.WordWrap = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MRcv_Tel: TcxGridDBColumn
        Caption = #51068#48152#51204#54868
        DataBinding.FieldName = 'Rcv_Tel'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.MaxLength = 0
        Properties.WordWrap = False
        Options.Editing = False
        Width = 111
      end
      object dbtv_MRcv_HP: TcxGridDBColumn
        Caption = #55092#45824#54256
        DataBinding.FieldName = 'Rcv_HP'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.MaxLength = 0
        Properties.WordWrap = False
        Options.Editing = False
        Width = 108
      end
      object dbtv_MRcv_ZipNo: TcxGridDBColumn
        Caption = #50864#54200#48264#54840
        DataBinding.FieldName = 'Rcv_ZipNo'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaxLength = 0
        Width = 84
      end
      object dbtv_MRcv_Addr1: TcxGridDBColumn
        DataBinding.FieldName = 'Rcv_Addr1'
        Visible = False
        Options.Editing = False
        Width = 64
        IsCaptionAssigned = True
      end
      object dbtv_MRcv_Addr2: TcxGridDBColumn
        DataBinding.FieldName = 'Rcv_Addr2'
        Visible = False
        Options.Editing = False
        Width = 64
        IsCaptionAssigned = True
      end
      object dbtv_MRcv_Addr: TcxGridDBColumn
        Caption = #49688#52712#51452#49548
        DataBinding.FieldName = 'Rcv_Addr'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.MaxLength = 0
        Properties.WordWrap = False
        Width = 109
      end
      object dbtv_MAddr_For_Check_ZipNo: TcxGridDBColumn
        Caption = #49688#52712#51064' '#50864#54200#48264#54840' '#52404#53356#50857#51452#49548
        DataBinding.FieldName = 'Addr_For_Check_ZipNo'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_Comp_Code: TcxGridDBColumn
        Caption = 'ord_comp_code'
        DataBinding.FieldName = 'Ord_Comp_Code'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_Comp_Name: TcxGridDBColumn
        Caption = #51452#47928#49324
        DataBinding.FieldName = 'Ord_Comp_Name'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.MaxLength = 0
        Properties.WordWrap = False
        Options.Editing = False
        Width = 42
      end
      object dbtv_MOrd_Date: TcxGridDBColumn
        Caption = #51452#47928#51068#51088
        DataBinding.FieldName = 'Ord_Date'
        Visible = False
        Options.Editing = False
        Width = 76
      end
      object dbtv_MOrd_Type1: TcxGridDBColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'Ord_Type1'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_Item_Code: TcxGridDBColumn
        Caption = #51452#47928#49324' '#49345#54408#53076#46300
        DataBinding.FieldName = 'Ord_Item_Code'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_item_name: TcxGridDBColumn
        Caption = #51452#47928#49345#54408#47749
        DataBinding.FieldName = 'Ord_item_name'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_Item_Opt1: TcxGridDBColumn
        Caption = #51452#47928#50741#49496'1'
        DataBinding.FieldName = 'Ord_Item_Opt1'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_Item_Opt2: TcxGridDBColumn
        Caption = #51452#47928#50741#49496'2'
        DataBinding.FieldName = 'Ord_Item_Opt2'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MItem_Code: TcxGridDBColumn
        Caption = #51116#44256'('#51088#49324')'#49345#54408#53076#46300
        DataBinding.FieldName = 'Item_Code'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MItem_Name: TcxGridDBColumn
        Caption = #51116#44256'('#51088#49324')'#49345#54408#47749
        DataBinding.FieldName = 'Item_Name'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOption_Name: TcxGridDBColumn
        Caption = #51116#44256'('#51088#49324')'#50741#49496
        DataBinding.FieldName = 'Option_Name'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MType_Name: TcxGridDBColumn
        Caption = #51116#44256'('#51088#49324')'#53440#51077
        DataBinding.FieldName = 'Type_Name'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MQty_Out_Fix: TcxGridDBColumn
        Caption = #51456#48708#47049
        DataBinding.FieldName = 'Qty_Out_Fix'
        Visible = False
        Options.Editing = False
      end
      object dbtv_MSell_Price: TcxGridDBColumn
        Caption = #54032#47588#44032
        DataBinding.FieldName = 'Sell_Price'
        Visible = False
        Options.Editing = False
      end
      object dbtv_MFix_Fare_Code: TcxGridDBColumn
        Caption = 'fix_fare_code'
        DataBinding.FieldName = 'Fix_Fare_Code'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_No1: TcxGridDBColumn
        Caption = #51452#47928'No1'
        DataBinding.FieldName = 'Ord_No1'
        Options.Editing = False
        Width = 102
      end
      object dbtv_MOrd_No2: TcxGridDBColumn
        Caption = #51452#47928'No2'
        DataBinding.FieldName = 'Ord_No2'
        Options.Editing = False
        Width = 47
      end
      object dbtv_MFix_Fare_Code_Name: TcxGridDBColumn
        Caption = #50868#51076#44396#48516
        DataBinding.FieldName = 'Fix_Fare_Code_Name'
        Options.Editing = False
        Width = 70
      end
      object dbtv_MBox_Type: TcxGridDBColumn
        Caption = #48149#49828
        DataBinding.FieldName = 'Box_Type'
        Options.Editing = False
        Width = 29
      end
      object dbtv_MFix_Fare_Price: TcxGridDBColumn
        Caption = #50868#51076#44552#50529
        DataBinding.FieldName = 'Fix_Fare_Price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        Properties.MaxLength = 0
        Options.Editing = False
        Width = 64
      end
      object dbtv_MIslandArea: TcxGridDBColumn
        Caption = #46020#49436#51648
        DataBinding.FieldName = 'IslandArea'
        Options.Editing = False
        Width = 55
      end
      object dbtv_MAir_Price: TcxGridDBColumn
        Caption = #54637#44277#47308
        DataBinding.FieldName = 'Air_Price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        Properties.MaxLength = 0
        Options.Editing = False
        Width = 47
      end
      object dbtv_MShip_Price: TcxGridDBColumn
        Caption = #49440#48149#47308
        DataBinding.FieldName = 'Ship_Price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        Options.Editing = False
        Width = 45
      end
      object dbtv_MItems_List: TcxGridDBColumn
        Caption = #45236#54408#47785#47197
        DataBinding.FieldName = 'Items_List'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.MaxLength = 0
        Properties.VisibleLineCount = 3
        Properties.WordWrap = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MItemCode_List: TcxGridDBColumn
        Caption = #49345#54408#53076#46300#47785#47197'('#51221#47148')'
        DataBinding.FieldName = 'itemCode_List'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.VisibleLineCount = 3
        Width = 54
      end
      object dbtv_MItemCount: TcxGridDBColumn
        Caption = #45236#54408#44032#51648#49688
        DataBinding.FieldName = 'ItemCount'
        Width = 64
      end
      object dbtv_MSumQty: TcxGridDBColumn
        Caption = #45236#54408' '#52509#49688#47049
        DataBinding.FieldName = 'SumQty'
        Options.Editing = False
        Width = 71
      end
      object dbtv_MRackDisp: TcxGridDBColumn
        Caption = #47196#52992#51060#49496
        DataBinding.FieldName = 'RackDisp'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.VisibleLineCount = 3
        Width = 64
      end
      object dbtv_MSumOfPrice: TcxGridDBColumn
        Tag = 45824
        Caption = #52509#44552#50529
        DataBinding.FieldName = 'SumOfPrice'
        Options.Editing = False
        Width = 70
      end
      object dbtv_MOrd_Memo: TcxGridDBColumn
        Caption = #48176#49569#47700#49884#51648
        DataBinding.FieldName = 'Ord_Memo'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.WordWrap = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MTran_BookNo_Date: TcxGridDBColumn
        DataBinding.FieldName = 'Tran_BookNo_Date'
        Visible = False
        Options.Editing = False
        Width = 64
        IsCaptionAssigned = True
      end
      object dbtv_MTran_BookNo_Seq: TcxGridDBColumn
        DataBinding.FieldName = 'Tran_BookNo_Seq'
        Visible = False
        Options.Editing = False
        IsCaptionAssigned = True
      end
      object dbtv_MDel_DateTime: TcxGridDBColumn
        Caption = #49325#51228#51068#49884
        DataBinding.FieldName = 'Del_DateTime'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MRcv_Info: TcxGridDBColumn
        Caption = #49688#52712#51064' '#51221#48372
        DataBinding.FieldName = 'Rcv_Info'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MOrd_State: TcxGridDBColumn
        DataBinding.FieldName = 'Ord_State'
        Visible = False
        Options.Editing = False
        Width = 64
      end
      object dbtv_MTRAN_PACKING_KEY: TcxGridDBColumn
        DataBinding.FieldName = 'TRAN_PACKING_KEY'
        Options.Editing = False
        Width = 64
      end
      object dbtv_MAddr_Check: TcxGridDBColumn
        Caption = #51452#49548#54869#51064
        DataBinding.FieldName = 'Addr_Check'
        Options.Editing = False
        Width = 64
      end
      object dbtv_MRcvAddr_Old: TcxGridDBColumn
        Caption = #44396#51452#49548#50557#52845
        DataBinding.FieldName = 'RcvAddr_Old'
        Visible = False
        Width = 64
      end
      object dbtv_MdlvPreArrBranCd: TcxGridDBColumn
        Caption = #48176#45804#50696#51221#51216#49548#53076#46300
        DataBinding.FieldName = 'dlvPreArrBranCd'
        Visible = False
        Width = 64
      end
      object dbtv_MdlvPreArrBranNm: TcxGridDBColumn
        Caption = #48176#45804#50696#51221#51216#49548#47749
        DataBinding.FieldName = 'dlvPreArrBranNm'
        Visible = False
        Width = 64
      end
      object dbtv_MdlvPreArrBranShortNm: TcxGridDBColumn
        Caption = #48176#45804#50696#51221#51216#49548#50557#52845
        DataBinding.FieldName = 'dlvPreArrBranShortNm'
        Visible = False
        Width = 64
      end
      object dbtv_MdlvPreArrEmpNum: TcxGridDBColumn
        Caption = #48176#45804#50696#51221#49324#50896#48264#54840
        DataBinding.FieldName = 'dlvPreArrEmpNum'
        Visible = False
        Width = 64
      end
      object dbtv_MdlvPreArrEmpNm: TcxGridDBColumn
        Caption = #48176#45804#50696#51221#49324#50896#47749
        DataBinding.FieldName = 'dlvPreArrEmpNm'
        Visible = False
        Width = 64
      end
      object dbtv_MdlvPreArrEmpNickNm: TcxGridDBColumn
        Caption = #48176#45804#50696#51221#49324#50896#48516#47448#53076#46300
        DataBinding.FieldName = 'dlvPreArrEmpNickNm'
        Visible = False
        Width = 64
      end
      object dbtv_MrcvrShortAddr: TcxGridDBColumn
        Caption = #49688#54868#51064#51452#49548#50557#52845
        DataBinding.FieldName = 'rcvrShortAddr'
        Visible = False
        Width = 64
      end
      object dbtv_MrcvrClsfAddr: TcxGridDBColumn
        Caption = #49688#54868#51064#48516#47448#51452#49548
        DataBinding.FieldName = 'rcvrClsfAddr'
        Visible = False
        Width = 64
      end
      object dbtv_MferryFare: TcxGridDBColumn
        Caption = #46020#49440#51648' '#50868#51076
        DataBinding.FieldName = 'ferryFare'
        Visible = False
        Width = 64
      end
      object dbtv_MTml_Code: TcxGridDBColumn
        DataBinding.FieldName = 'Tml_Code'
        Visible = False
        Width = 64
      end
      object dbtv_MDeleteChk: TcxGridDBColumn
        Caption = #49325#51228#44148#54869#51064'(0:'#51221#49345',1:'#51068#48512#49325#51228',2:'#51204#48512#49325#51228')'
        DataBinding.FieldName = 'DeleteChk'
        Visible = False
        Width = 64
      end
      object dbtv_MAddrFixed_Chk: TcxGridDBColumn
        Caption = #51452#49548#49688#51221#52404#53356'(0:'#50896#48376',1:'#49688#51221#46120')'
        DataBinding.FieldName = 'AddrFixed_Chk'
        Width = 64
      end
      object dbtv_MPrintedCount: TcxGridDBColumn
        Caption = #52636#47141#54943#49688
        DataBinding.FieldName = 'PrintedCount'
        Options.Editing = False
        Width = 53
      end
      object dbtv_MPrint_reg_userid: TcxGridDBColumn
        Caption = #52572#52488#52636#47141'ID'
        DataBinding.FieldName = 'Print_reg_userid'
        Options.Editing = False
        Width = 64
      end
      object dbtv_MPrint_reg_datetime: TcxGridDBColumn
        Caption = #52572#52488#52636#47141#51068#49884
        DataBinding.FieldName = 'Print_reg_datetime'
        Options.Editing = False
        Width = 155
      end
      object dbtv_MPrint_edt_userid: TcxGridDBColumn
        Caption = #52572#51333#52636#47141'ID'
        DataBinding.FieldName = 'Print_edt_userid'
        Options.Editing = False
        Width = 64
      end
      object dbtv_MPrint_edt_datetime: TcxGridDBColumn
        Caption = #52572#51333#52636#47141#51068#49884
        DataBinding.FieldName = 'Print_edt_datetime'
        Options.Editing = False
        Width = 172
      end
      object dbtv_Mrcvr_NewAddr: TcxGridDBColumn
        Caption = #46020#47196#47749#51452#49548
        DataBinding.FieldName = 'rcvr_NewAddr'
        Visible = False
      end
      object dbtv_Mrcvr_NewAddrDtl: TcxGridDBColumn
        Caption = #46020#47196#47749#51452#49548#49345#49464
        DataBinding.FieldName = 'rcvr_NewAddrDtl'
        Visible = False
      end
      object dbtv_Mrcvr_OldAddr: TcxGridDBColumn
        Caption = #44396#51452#49548
        DataBinding.FieldName = 'rcvr_OldAddr'
        Visible = False
      end
      object dbtv_Mrcvr_OldAddrDtl: TcxGridDBColumn
        Caption = #44396#51452#49548#49345#49464
        DataBinding.FieldName = 'rcvr_OldAddrDtl'
        Visible = False
      end
      object dbtv_Mrcvr_NewAddrYn: TcxGridDBColumn
        Caption = #46020#47196#47749#51452#49548'YN'
        DataBinding.FieldName = 'rcvr_NewAddrYn'
        Visible = False
      end
      object dbtv_MdawnDeliveryYn: TcxGridDBColumn
        DataBinding.FieldName = 'dawnDeliveryYn'
        Width = 100
      end
      object dbtv_MdawnDeliveryMessage: TcxGridDBColumn
        DataBinding.FieldName = 'dawnDeliveryMessage'
        Width = 150
      end
      object dbtv_MdoorAccessType: TcxGridDBColumn
        DataBinding.FieldName = 'doorAccessType'
        Width = 100
      end
      object dbtv_MdoorPassword: TcxGridDBColumn
        DataBinding.FieldName = 'doorPassword'
        Width = 100
      end
      object dbtv_MdawnSms: TcxGridDBColumn
        DataBinding.FieldName = 'dawnSms'
        Width = 60
      end
      object dbtv_MzipCd: TcxGridDBColumn
        DataBinding.FieldName = 'zipCd'
        Width = 80
      end
      object dbtv_Mcity: TcxGridDBColumn
        DataBinding.FieldName = 'city'
        Width = 80
      end
      object dbtv_MmallId: TcxGridDBColumn
        DataBinding.FieldName = 'mallId'
        Width = 80
      end
      object dbtv_MmallNm: TcxGridDBColumn
        DataBinding.FieldName = 'mallNm'
        Width = 100
      end
      object dbtv_Mdong: TcxGridDBColumn
        DataBinding.FieldName = 'dong'
        Width = 80
      end
      object dbtv_MdelvType: TcxGridDBColumn
        DataBinding.FieldName = 'delvType'
        Width = 60
      end
      object dbtv_MstateNm: TcxGridDBColumn
        DataBinding.FieldName = 'stateNm'
        Width = 80
      end
      object dbtv_MdelvTypeNm: TcxGridDBColumn
        DataBinding.FieldName = 'delvTypeNm'
        Width = 100
      end
    end
    object dbtv_D: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DetailKeyFieldNames = 'Mid'
      DataController.KeyFieldNames = 'Mid'
      DataController.MasterKeyFieldNames = 'MID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object dbtv_DRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object dbtv_DStatus: TcxGridDBColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'Status'
        Width = 64
      end
      object dbtv_DInvoiceNo: TcxGridDBColumn
        Caption = #49569#51109#48264#54840
        DataBinding.FieldName = 'InvoiceNo'
        Width = 105
      end
      object dbtv_DItem_Code: TcxGridDBColumn
        Caption = #51088#49324#49345#54408#53076#46300
        DataBinding.FieldName = 'Item_Code'
        Width = 64
      end
      object dbtv_DItem_Disp: TcxGridDBColumn
        Caption = #48176#49569#49345#54408
        DataBinding.FieldName = 'Item_Disp'
        Width = 284
      end
      object dbtv_DOrd_Item_Disp: TcxGridDBColumn
        Caption = #51452#47928#49345#54408
        DataBinding.FieldName = 'Ord_Item_Disp'
        Width = 167
      end
      object dbtv_DItem_Name: TcxGridDBColumn
        Caption = #51088#49324#49345#54408#47749
        DataBinding.FieldName = 'Item_Name'
        Visible = False
        Width = 64
      end
      object dbtv_DOption_Name: TcxGridDBColumn
        Caption = #51088#49324#50741#49496
        DataBinding.FieldName = 'Option_Name'
        Visible = False
        Width = 64
      end
      object dbtv_DType_Name: TcxGridDBColumn
        Caption = #51088#49324#53440#51077
        DataBinding.FieldName = 'Type_Name'
        Visible = False
        Width = 64
      end
      object dbtv_DQty_Out_Fix: TcxGridDBColumn
        Caption = #49688#47049
        DataBinding.FieldName = 'Qty_Out_Fix'
        Width = 36
      end
      object dbtv_DSell_Price: TcxGridDBColumn
        Caption = #44552#50529
        DataBinding.FieldName = 'Sell_Price'
        Width = 64
      end
      object dbtv_DOrd_Item_Name: TcxGridDBColumn
        Caption = #51452#47928#49345#54408#47749
        DataBinding.FieldName = 'Ord_Item_Name'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_Inner_seq: TcxGridDBColumn
        Caption = 'ord_inner_seq'
        DataBinding.FieldName = 'Ord_Inner_seq'
        Visible = False
        Width = 64
      end
      object dbtv_DItem_Seq: TcxGridDBColumn
        Caption = 'item_Seq'
        DataBinding.FieldName = 'Item_Seq'
        Visible = False
        Width = 64
      end
      object dbtv_DQty_Out_Fix_List: TcxGridDBColumn
        DataBinding.FieldName = 'Qty_Out_Fix_List'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_Item_Opt1: TcxGridDBColumn
        Caption = #51452#47928#50741#49496
        DataBinding.FieldName = 'Ord_Item_Opt1'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_Item_Opt2: TcxGridDBColumn
        Caption = #51452#47928#50741#49496'2'
        DataBinding.FieldName = 'Ord_Item_Opt2'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_Type1: TcxGridDBColumn
        Caption = #53440#51077
        DataBinding.FieldName = 'Ord_Type1'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_No1: TcxGridDBColumn
        Caption = 'ord_no1'
        DataBinding.FieldName = 'Ord_No1'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_No2: TcxGridDBColumn
        Caption = 'ord_no2'
        DataBinding.FieldName = 'Ord_No2'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_Date: TcxGridDBColumn
        Caption = #51452#47928#51068
        DataBinding.FieldName = 'Ord_Date'
        Visible = False
        Width = 64
      end
      object dbtv_DOrd_Item_Code: TcxGridDBColumn
        Caption = #51452#47928#49345#54408#53076#46300
        DataBinding.FieldName = 'Ord_Item_Code'
        Visible = False
        Width = 64
      end
      object dbtv_DBacode_Scan: TcxGridDBColumn
        Caption = #51088#49324#49345#54408#53076#46300
        DataBinding.FieldName = 'Bacode_Scan'
        Visible = False
        Width = 64
      end
      object dbtv_DRack_Code: TcxGridDBColumn
        Caption = #47196#52992#51060#49496#53076#46300
        DataBinding.FieldName = 'Rack_Code'
        Visible = False
        Width = 64
      end
      object dbtv_DRack_Disp: TcxGridDBColumn
        Caption = #47196#52992#51060#49496
        DataBinding.FieldName = 'Rack_Disp'
        Width = 64
      end
      object dbtv_DDel_Datetime: TcxGridDBColumn
        Caption = #49325#51228#51068#49884
        DataBinding.FieldName = 'Del_Datetime'
        Width = 64
      end
      object dbtv_DOrd_Kind1: TcxGridDBColumn
        Caption = #51452#47928#44396#48516
        DataBinding.FieldName = 'Ord_Kind1'
        Visible = False
        Width = 64
      end
      object dbtv_DCategory1: TcxGridDBColumn
        Caption = #51452#47928#44396#48516
        DataBinding.FieldName = 'Category1'
        Visible = False
        Width = 64
      end
      object dbtv_DCategory2: TcxGridDBColumn
        Caption = #51452#47928#44396#48516
        DataBinding.FieldName = 'Category2'
        Visible = False
        Width = 64
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = dbtv_M
      object cxGrid2Level1: TcxGridLevel
        GridView = dbtv_D
      end
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 16
    Top = 447
    ParentFont = False
    TabOrder = 3
    Height = 169
    Width = 521
    object lb_epost_install: TLabel
      Left = 244
      Top = 126
      Width = 251
      Height = 16
      Cursor = crHandPoint
      Caption = #50864#52404#44397' '#49569#51109#52636#47141#51060' '#50504#46112#44221#50864' '#53364#47533#54616#50668' '#49444#52824#54616#49464#50836'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      Visible = False
    end
    object cxLabel9: TcxLabel
      Left = 31
      Top = 27
      Caption = #52636#47141#51456#48708
      ParentFont = False
      Transparent = True
    end
    object chkPrintFromTo: TcxCheckBox
      Left = 19
      Top = 122
      Caption = #52636#47141' '#47926#51020#48264#54840
      ParentFont = False
      TabOrder = 1
      Transparent = True
      Visible = False
    end
    object edtPrintFrom: TcxSpinEdit
      Left = 118
      Top = 121
      Enabled = False
      ParentFont = False
      Properties.AssignedValues.MaxValue = True
      Properties.MinValue = 1.000000000000000000
      Properties.SpinButtons.Position = sbpHorzRight
      TabOrder = 2
      Value = 1
      Visible = False
      Width = 57
    end
    object edtPrintTo: TcxSpinEdit
      Left = 181
      Top = 121
      Enabled = False
      ParentFont = False
      Properties.AssignedValues.MaxValue = True
      Properties.MinValue = 1.000000000000000000
      Properties.SpinButtons.Position = sbpHorzRight
      TabOrder = 3
      Value = 1
      Visible = False
      Width = 57
    end
    object pbPrintDataInput: TcxProgressBar
      Left = 85
      Top = 23
      ParentFont = False
      Properties.ShowTextStyle = cxtsText
      Properties.Text = #52636#47141#45824#44592
      TabOrder = 4
      Width = 366
    end
    object btnCancel: TcxButton
      Left = 252
      Top = 59
      Width = 61
      Height = 56
      Caption = #45803#44592
      TabOrder = 6
    end
    object btnOK: TcxButton
      Left = 65
      Top = 59
      Width = 173
      Height = 56
      Caption = #52636#47141
      TabOrder = 5
    end
  end
  object mem_non_print: TcxMemo
    Left = 543
    Top = 455
    ParentFont = False
    Properties.ReadOnly = True
    Properties.ScrollBars = ssVertical
    TabOrder = 4
    Height = 107
    Width = 434
  end
  object cxCheckListBox1: TcxCheckListBox
    Left = 1000
    Top = 470
    Width = 90
    Height = 50
    Items = <>
    TabOrder = 5
  end
  object cxListBox1: TcxListBox
    Left = 1005
    Top = 526
    Width = 97
    Height = 68
    ItemHeight = 13
    TabOrder = 6
  end
  object CHKLISTBOX1: TcxCheckListBox
    Left = 1108
    Top = 124
    Width = 94
    Height = 124
    ImeName = 'Microsoft IME 2010'
    Items = <
      item
        Text = #47196#52992#51060#49496
      end
      item
        Text = #49345#54408#53076#46300
      end
      item
        Text = #51088#49324#53076#46300
      end
      item
        State = cbsChecked
        Text = #49345#54408#47749
      end
      item
        State = cbsChecked
        Text = #50741#49496
      end
      item
        State = cbsChecked
        Text = #53440#51077
      end
      item
        State = cbsChecked
        Text = #49688#47049
      end>
    ParentFont = False
    TabOrder = 7
  end
  object LISTBOX1: TcxListBox
    Left = 1108
    Top = 268
    Width = 88
    Height = 124
    ImeName = 'Microsoft IME 2010'
    ItemHeight = 13
    Items.Strings = (
      #49345#54408#47749
      #50741#49496
      #53440#51077
      #49688#47049)
    ParentFont = False
    TabOrder = 8
  end
  object chk_Korex_Addr: TcxCheckBox
    Left = 127
    Top = 8
    Caption = #51452#49548#51221#51228#54616#44592
    ParentFont = False
    TabOrder = 9
    Transparent = True
  end
  object md_invoice_master: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvParamCreate, rvMacroCreate, rvMacroExpand, rvParamExpand, rvPersistent, rvSilentMode]
    ResourceOptions.ParamCreate = False
    ResourceOptions.MacroCreate = False
    ResourceOptions.ParamExpand = False
    ResourceOptions.MacroExpand = False
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockWait, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 48
    Top = 56
    object md_invoice_masterColumn1: TStringField
      FieldName = 'Column1'
      Size = 50
    end
    object md_invoice_masterColumn2: TStringField
      FieldName = 'Column2'
      Size = 50
    end
    object md_invoice_masterSame_Group: TIntegerField
      FieldName = 'Same_Group'
    end
    object md_invoice_masterStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object md_invoice_masterOrd_Inner_Seq: TStringField
      FieldName = 'Ord_Inner_Seq'
      Size = 4000
    end
    object md_invoice_masterItem_Seq: TStringField
      FieldName = 'Item_Seq'
      Size = 4000
    end
    object md_invoice_masterAct_Seq: TStringField
      FieldName = 'Act_Seq'
      Size = 3000
    end
    object md_invoice_masterPack_Ord_Inner_seq: TLargeintField
      FieldName = 'Pack_Ord_Inner_seq'
    end
    object md_invoice_masterPack_Item_Seq: TStringField
      FieldName = 'Pack_Item_Seq'
      Size = 3000
    end
    object md_invoice_masterTran_Comp: TStringField
      FieldName = 'Tran_Comp'
      Size = 50
    end
    object md_invoice_masterInvoiceNo: TStringField
      FieldName = 'InvoiceNo'
      Size = 50
    end
    object md_invoice_masterOrd_Name: TStringField
      FieldName = 'Ord_Name'
      Size = 50
    end
    object md_invoice_masterOrd_Tel: TStringField
      FieldName = 'Ord_Tel'
      Size = 50
    end
    object md_invoice_masterOrd_HP: TStringField
      FieldName = 'Ord_HP'
      Size = 50
    end
    object md_invoice_masterOrd_ZipNo: TStringField
      FieldName = 'Ord_ZipNo'
      Size = 50
    end
    object md_invoice_masterOrd_Addr: TStringField
      FieldName = 'Ord_Addr'
      Size = 500
    end
    object md_invoice_masterOrd_Addr1: TStringField
      FieldName = 'Ord_Addr1'
      Size = 400
    end
    object md_invoice_masterOrd_Addr2: TStringField
      FieldName = 'Ord_Addr2'
      Size = 400
    end
    object md_invoice_masterRcv_Name: TStringField
      FieldName = 'Rcv_Name'
      Size = 50
    end
    object md_invoice_masterRcv_Tel: TStringField
      FieldName = 'Rcv_Tel'
      Size = 50
    end
    object md_invoice_masterRcv_HP: TStringField
      FieldName = 'Rcv_HP'
      Size = 50
    end
    object md_invoice_masterRcv_ZipNo: TStringField
      FieldName = 'Rcv_ZipNo'
      Size = 50
    end
    object md_invoice_masterRcv_Addr1: TStringField
      FieldName = 'Rcv_Addr1'
      Size = 400
    end
    object md_invoice_masterRcv_Addr2: TStringField
      FieldName = 'Rcv_Addr2'
      Size = 400
    end
    object md_invoice_masterRcv_Addr: TStringField
      FieldName = 'Rcv_Addr'
      Size = 500
    end
    object md_invoice_masterAddr_For_Check_ZipNo: TStringField
      FieldName = 'Addr_For_Check_ZipNo'
      Size = 50
    end
    object md_invoice_masterOrd_Comp_Code: TStringField
      FieldName = 'Ord_Comp_Code'
      Size = 50
    end
    object md_invoice_masterOrd_Comp_Name: TStringField
      FieldName = 'Ord_Comp_Name'
      Size = 50
    end
    object md_invoice_masterOrd_Date: TStringField
      FieldName = 'Ord_Date'
      Size = 50
    end
    object md_invoice_masterOrd_Type1: TStringField
      FieldName = 'Ord_Type1'
      Size = 50
    end
    object md_invoice_masterOrd_Item_Code: TStringField
      FieldName = 'Ord_Item_Code'
      Size = 50
    end
    object md_invoice_masterOrd_item_name: TStringField
      FieldName = 'Ord_item_name'
      Size = 50
    end
    object md_invoice_masterOrd_Item_Opt1: TStringField
      FieldName = 'Ord_Item_Opt1'
      Size = 50
    end
    object md_invoice_masterOrd_Item_Opt2: TStringField
      FieldName = 'Ord_Item_Opt2'
      Size = 50
    end
    object md_invoice_masterItem_Code: TStringField
      FieldName = 'Item_Code'
      Size = 50
    end
    object md_invoice_masterItem_Name: TStringField
      FieldName = 'Item_Name'
      Size = 200
    end
    object md_invoice_masterOption_Name: TStringField
      FieldName = 'Option_Name'
      Size = 100
    end
    object md_invoice_masterType_Name: TStringField
      FieldName = 'Type_Name'
      Size = 100
    end
    object md_invoice_masterQty_Out_Fix: TIntegerField
      FieldName = 'Qty_Out_Fix'
    end
    object md_invoice_masterSell_Price: TCurrencyField
      FieldName = 'Sell_Price'
    end
    object md_invoice_masterFix_Fare_Code: TStringField
      FieldName = 'Fix_Fare_Code'
      Size = 50
    end
    object md_invoice_masterOrd_No1: TStringField
      FieldName = 'Ord_No1'
      Size = 50
    end
    object md_invoice_masterOrd_No2: TStringField
      FieldName = 'Ord_No2'
      Size = 50
    end
    object md_invoice_masterFix_Fare_Code_Name: TStringField
      FieldName = 'Fix_Fare_Code_Name'
      Size = 50
    end
    object md_invoice_masterBox_Type: TStringField
      FieldName = 'Box_Type'
      Size = 50
    end
    object md_invoice_masterFix_Fare_Price: TStringField
      FieldName = 'Fix_Fare_Price'
      Size = 50
    end
    object md_invoice_masterIslandArea: TStringField
      FieldName = 'IslandArea'
      Size = 50
    end
    object md_invoice_masterAir_Price: TStringField
      FieldName = 'Air_Price'
      Size = 50
    end
    object md_invoice_masterShip_Price: TStringField
      FieldName = 'Ship_Price'
      Size = 50
    end
    object md_invoice_masterItems_List: TStringField
      FieldName = 'Items_List'
      Size = 10000
    end
    object md_invoice_masterItemCount: TIntegerField
      FieldName = 'ItemCount'
    end
    object md_invoice_masterSumQty: TIntegerField
      FieldName = 'SumQty'
    end
    object md_invoice_masterRackDisp: TStringField
      FieldName = 'RackDisp'
      Size = 3000
    end
    object md_invoice_masterSumOfPrice: TStringField
      FieldName = 'SumOfPrice'
      Size = 50
    end
    object md_invoice_masterOrd_Memo: TStringField
      FieldName = 'Ord_Memo'
      Size = 500
    end
    object md_invoice_masterTran_BookNo_Date: TStringField
      FieldName = 'Tran_BookNo_Date'
      Size = 50
    end
    object md_invoice_masterTran_BookNo_Seq: TIntegerField
      FieldName = 'Tran_BookNo_Seq'
    end
    object md_invoice_masterDel_DateTime: TStringField
      FieldName = 'Del_DateTime'
      Size = 50
    end
    object md_invoice_masterRcv_Info: TStringField
      FieldName = 'Rcv_Info'
      Size = 50
    end
    object md_invoice_masterOrd_State: TStringField
      FieldName = 'Ord_State'
      Size = 50
    end
    object md_invoice_masterTRAN_PACKING_KEY: TStringField
      FieldName = 'TRAN_PACKING_KEY'
      Size = 50
    end
    object md_invoice_masterAddr_Check: TStringField
      FieldName = 'Addr_Check'
      Size = 50
    end
    object md_invoice_masterRcvAddr_Old: TStringField
      FieldName = 'RcvAddr_Old'
      Size = 400
    end
    object md_invoice_masterdlvPreArrBranCd: TStringField
      FieldName = 'dlvPreArrBranCd'
      Size = 50
    end
    object md_invoice_masterdlvPreArrBranNm: TStringField
      FieldName = 'dlvPreArrBranNm'
      Size = 50
    end
    object md_invoice_masterdlvPreArrBranShortNm: TStringField
      FieldName = 'dlvPreArrBranShortNm'
      Size = 50
    end
    object md_invoice_masterdlvPreArrEmpNum: TStringField
      FieldName = 'dlvPreArrEmpNum'
      Size = 50
    end
    object md_invoice_masterdlvPreArrEmpNm: TStringField
      FieldName = 'dlvPreArrEmpNm'
      Size = 50
    end
    object md_invoice_masterdlvPreArrEmpNickNm: TStringField
      FieldName = 'dlvPreArrEmpNickNm'
      Size = 50
    end
    object md_invoice_masterdlvClsfCd: TStringField
      FieldName = 'dlvClsfCd'
      Size = 50
    end
    object md_invoice_masterdlvSubClsfCd: TStringField
      FieldName = 'dlvSubClsfCd'
      Size = 50
    end
    object md_invoice_masterdlvClsfNm: TStringField
      FieldName = 'dlvClsfNm'
      Size = 50
    end
    object md_invoice_masterrcvrShortAddr: TStringField
      FieldName = 'rcvrShortAddr'
      Size = 50
    end
    object md_invoice_masterrcvrClsfAddr: TStringField
      FieldName = 'rcvrClsfAddr'
      Size = 50
    end
    object md_invoice_masterferryFare: TStringField
      FieldName = 'ferryFare'
      Size = 50
    end
    object md_invoice_masterTml_Code: TStringField
      FieldName = 'Tml_Code'
      Size = 50
    end
    object md_invoice_masterDeleteChk: TStringField
      FieldName = 'DeleteChk'
      Size = 50
    end
    object md_invoice_masterAddrFixed_Chk: TStringField
      FieldName = 'AddrFixed_Chk'
      Size = 50
    end
    object md_invoice_masterPrintedCount: TStringField
      FieldName = 'PrintedCount'
      Size = 50
    end
    object md_invoice_masterPrint_reg_userid: TStringField
      FieldName = 'Print_reg_userid'
      Size = 50
    end
    object md_invoice_masterPrint_reg_datetime: TStringField
      FieldName = 'Print_reg_datetime'
      Size = 50
    end
    object md_invoice_masterPrint_edt_userid: TStringField
      FieldName = 'Print_edt_userid'
      Size = 50
    end
    object md_invoice_masterPrint_edt_datetime: TStringField
      FieldName = 'Print_edt_datetime'
      Size = 50
    end
    object md_invoice_masteritemCode_List: TStringField
      FieldName = 'itemCode_List'
      Size = 10000
    end
    object md_invoice_masterrcvr_NewAddr: TMemoField
      FieldName = 'rcvr_NewAddr'
      BlobType = ftMemo
    end
    object md_invoice_masterrcvr_NewAddrDtl: TMemoField
      FieldName = 'rcvr_NewAddrDtl'
      BlobType = ftMemo
    end
    object md_invoice_masterrcvr_OldAddr: TMemoField
      FieldName = 'rcvr_OldAddr'
      BlobType = ftMemo
    end
    object md_invoice_masterrcvr_OldAddrDtl: TMemoField
      FieldName = 'rcvr_OldAddrDtl'
      BlobType = ftMemo
    end
    object md_invoice_masterrcvr_NewAddrYn: TStringField
      FieldName = 'rcvr_NewAddrYn'
      Size = 1
    end
    object md_invoice_masterMID: TIntegerField
      FieldName = 'MID'
    end
    object md_invoice_masterdawnDeliveryYn: TStringField
      FieldName = 'dawnDeliveryYn'
    end
    object md_invoice_masterdawnDeliveryMessage: TStringField
      FieldName = 'dawnDeliveryMessage'
      Size = 500
    end
    object md_invoice_masterdoorAccessType: TStringField
      FieldName = 'doorAccessType'
    end
    object md_invoice_masterdoorPassword: TStringField
      FieldName = 'doorPassword'
      Size = 40
    end
    object md_invoice_masterdawnSms: TStringField
      FieldName = 'dawnSms'
    end
    object md_invoice_masterzipCd: TStringField
      FieldName = 'zipCd'
    end
    object md_invoice_mastercity: TStringField
      FieldName = 'city'
      Size = 100
    end
    object md_invoice_mastermallId: TStringField
      FieldName = 'mallId'
      Size = 100
    end
    object md_invoice_mastermallNm: TStringField
      FieldName = 'mallNm'
      Size = 500
    end
    object md_invoice_masterdong: TStringField
      FieldName = 'dong'
      Size = 500
    end
    object md_invoice_masterdelvType: TStringField
      FieldName = 'delvType'
      Size = 40
    end
    object md_invoice_masterstateNm: TStringField
      FieldName = 'stateNm'
    end
    object md_invoice_masterdelvTypeNm: TStringField
      FieldName = 'delvTypeNm'
      Size = 500
    end
  end
  object md_invoice_detail: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvParamCreate, rvMacroCreate, rvMacroExpand, rvParamExpand, rvPersistent, rvSilentMode]
    ResourceOptions.ParamCreate = False
    ResourceOptions.MacroCreate = False
    ResourceOptions.ParamExpand = False
    ResourceOptions.MacroExpand = False
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockWait, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 152
    Top = 57
    object md_invoice_detailStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object md_invoice_detailInvoiceNo: TStringField
      FieldName = 'InvoiceNo'
      Size = 50
    end
    object md_invoice_detailItem_Disp: TStringField
      FieldName = 'Item_Disp'
      Size = 400
    end
    object md_invoice_detailOrd_Item_Disp: TStringField
      FieldName = 'Ord_Item_Disp'
      Size = 400
    end
    object md_invoice_detailItem_Name: TStringField
      FieldName = 'Item_Name'
      Size = 400
    end
    object md_invoice_detailOption_Name: TStringField
      FieldName = 'Option_Name'
      Size = 50
    end
    object md_invoice_detailType_Name: TStringField
      FieldName = 'Type_Name'
      Size = 50
    end
    object md_invoice_detailQty_Out_Fix: TStringField
      FieldName = 'Qty_Out_Fix'
      Size = 50
    end
    object md_invoice_detailSell_Price: TStringField
      FieldName = 'Sell_Price'
      Size = 50
    end
    object md_invoice_detailOrd_Item_Name: TStringField
      FieldName = 'Ord_Item_Name'
      Size = 400
    end
    object md_invoice_detailOrd_Inner_seq: TStringField
      FieldName = 'Ord_Inner_seq'
      Size = 3000
    end
    object md_invoice_detailItem_Seq: TStringField
      FieldName = 'Item_Seq'
      Size = 3000
    end
    object md_invoice_detailQty_Out_Fix_List: TStringField
      FieldName = 'Qty_Out_Fix_List'
      Size = 3000
    end
    object md_invoice_detailOrd_Item_Opt1: TStringField
      FieldName = 'Ord_Item_Opt1'
      Size = 200
    end
    object md_invoice_detailOrd_Item_Opt2: TStringField
      FieldName = 'Ord_Item_Opt2'
      Size = 200
    end
    object md_invoice_detailOrd_Type1: TStringField
      FieldName = 'Ord_Type1'
      Size = 50
    end
    object md_invoice_detailOrd_No1: TStringField
      FieldName = 'Ord_No1'
      Size = 50
    end
    object md_invoice_detailOrd_No2: TStringField
      FieldName = 'Ord_No2'
      Size = 50
    end
    object md_invoice_detailOrd_Date: TStringField
      FieldName = 'Ord_Date'
      Size = 50
    end
    object md_invoice_detailOrd_Item_Code: TStringField
      FieldName = 'Ord_Item_Code'
      Size = 50
    end
    object md_invoice_detailItem_Code: TStringField
      FieldName = 'Item_Code'
      Size = 50
    end
    object md_invoice_detailBacode_Scan: TStringField
      FieldName = 'Bacode_Scan'
      Size = 50
    end
    object md_invoice_detailRack_Code: TStringField
      FieldName = 'Rack_Code'
      Size = 50
    end
    object md_invoice_detailRack_Disp: TStringField
      FieldName = 'Rack_Disp'
      Size = 200
    end
    object md_invoice_detailDel_Datetime: TStringField
      FieldName = 'Del_Datetime'
      Size = 50
    end
    object md_invoice_detailOrd_Kind1: TStringField
      FieldName = 'Ord_Kind1'
      Size = 50
    end
    object md_invoice_detailCategory1: TStringField
      FieldName = 'Category1'
      Size = 50
    end
    object md_invoice_detailCategory2: TStringField
      FieldName = 'Category2'
      Size = 50
    end
    object md_invoice_detailMid: TIntegerField
      FieldName = 'Mid'
    end
  end
end
