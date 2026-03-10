object frm_HttpReqListen: Tfrm_HttpReqListen
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 0
  Caption = #49569#51109#51064#49604#45824#44592#51473
  ClientHeight = 429
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #44404#47548#52404
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Memo1: TMemo
    Left = 24
    Top = 24
    Width = 393
    Height = 169
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 439
    Top = 24
    Width = 386
    Height = 169
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo_Error: TMemo
    Left = 24
    Top = 215
    Width = 386
    Height = 169
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    DefaultPort = 48080
    OnCommandOther = IdHTTPServer1CommandOther
    OnCreatePostStream = IdHTTPServer1CreatePostStream
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 360
    Top = 208
  end
end
