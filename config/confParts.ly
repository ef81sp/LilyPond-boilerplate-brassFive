\version "2.18.2"
\include "confCommon.ly"

%{
  confParts
  パート譜に関する設定
%}

confPartsPaper = \paper {
  bookTitleMarkup  = \confCommonBookTitleMarkup
  oddHeaderMarkup  = \confCommonOddHeaderMarkup
  evenHeaderMarkup = \confCommonEvenHeaderMarkup
  oddFooterMarkup  = \confCommonOddFooterMarkup
  evenFooterMarkup = \confCommonOddFooterMarkup

  % ■ページ番号
  print-page-number = ##t

  % ■ページめくり
  %%% ・最適ページめくり
  page-breaking = #ly:page-turn-breaking
  %%% ・最小ページめくり
  % page-breaking = #ly:minimal-breaking

  % ■ページあたりのシステム数
  %%% ・最大
  max-systems-per-page = #11
  %%% ・通常
  % systems-per-page = #10
  %%% ・最小
  min-systems-per-page = #9

  %%% 間隔の設定
  %%%%% 「システム」: いわゆる段、行のこと。

  % (タイトルまたは最上位の) マークアップ〜その後のシステム
  markup-system-spacing.minimum-distance = #7
  markup-system-spacing.basic-distance = #11
  % score の最後のシステム〜その後に続く (タイトルまたは最上位の) マークアップ
  score-markup-spacing.minimum-distance = #10
  % 2 つの (タイトルまたは最上位の) マークアップ
  markup-markup-spacing.basic-distance = #6
  % 同じ score の中にある 2 つのシステム
  system-system-spacing.minimum-distance = #12
  system-system-spacing.basic-distance = #14

  % 印刷可能エリアの上端 (つまり、トップ マージンの下端) 〜ページの最初の (タイトルまたは最上位の)マークアップ
  top-markup-spacing.minimum-distance = #2

  last-bottom-spacing.minimum-distamce = #11
  last-bottom-spacing.basic-distamce = #15
}

confPartsLayout = \layout {
  % 譜サイズ。標準は20
  #(layout-set-staff-size 18)
  \context {
    \Score
    % 小節の幅
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)

    % 長休符を普通の形にする
    \override MultiMeasureRest.expand-limit = #1

    % テンポ記号を小さく
    \override MetronomeMark.font-size = #-1

    % 文字のクレッシェンドとかにつく破線を消す
    \override DynamicTextSpanner.style = #'none

    % ページめくりを許す休みの長さ
    % \override Staff.minimumPageTurnLength = #(ly:make-moment 5/2)
  }

  % 調号が変わるときナチュラルを出さない
  \set Staff.printKeyCancellation = ##f

  % ■リハーサルマーク
  %%% ・小節番号に
  \set Score.markFormatter = #format-mark-box-barnumbers
  %%% ・アルファベットに
  % \set Score.markFormatter = #format-mark-box-letters

  % 譜の横にパート名を出さない
  \set Staff.instrumentName = ##f
  \set Staff.shortInstrumentName = ##f
}
