object frm_Login: Tfrm_Login
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #49324#50857#51088' '#51064#51613
  ClientHeight = 210
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #44404#47548#52404
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 40
    Top = 51
    Width = 51
    Height = 16
    Caption = #50500#51060#46356
  end
  object Label2: TLabel
    Left = 34
    Top = 99
    Width = 68
    Height = 16
    Caption = #48708#48716#48264#54840
  end
  object edt_ID: TEdit
    Left = 112
    Top = 48
    Width = 202
    Height = 24
    TabOrder = 0
  end
  object edt_PW: TEdit
    Left = 112
    Top = 96
    Width = 202
    Height = 24
    TabOrder = 1
  end
  object btn_Login: TButton
    Left = 32
    Top = 144
    Width = 282
    Height = 25
    Caption = #47196#44536#51064
    TabOrder = 2
    OnClick = btn_LoginClick
  end
end
