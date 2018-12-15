\version "2.18.2"

\include "confCommon.ly"

#(set-global-staff-size 14)

confPaperFullScore = \paper {
  print-page-number = ##t
  bookTitleMarkup  = \confCommonBookTitleMarkup
  oddHeaderMarkup  = \confCommonOddHeaderMarkup
  evenHeaderMarkup = \confCommonEvenHeaderMarkup
  oddFooterMarkup  = \confCommonOddFooterMarkup
  evenFooterMarkup = \confCommonOddFooterMarkup

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
  top-markup-spacing.minimum-distance = #6

  last-bottom-spacing.minimum-distamce = #10
  last-bottom-spacing.basic-distamce = #15

}

confLayoutFullScore = \layout {
  % 譜サイズ。標準は20
  % #(layout-set-staff-size 9)
  \context {
    \Score
    % 小節の幅。
    % \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)
    % 長休符を棒状にするしきい値。
    % \override MultiMeasureRest.expand-limit = #1

    % テンポ記号の大きさ
    \override MetronomeMark.font-size = #-2

    % 文字のクレッシェンドとかにつく破線を消す
    \override DynamicTextSpanner.style = #'none

    % 譜の横のパート名を右揃えにする
    \override InstrumentName.self-alignment-X = #RIGHT
    \override ShortInstrumentName.self-alignment-X = #RIGHT

    % 小節番号を全部出す
    \override BarNumber.break-visibility = #'#(#t #t #f)

    % ページめくりを許す休みの長さ
    % \override Staff.minimumPageTurnLength = #(ly:make-moment 5/2)
  }

  % 調号が変わるときナチュラルを出さない
  \set Staff.printKeyCancellation = ##f
  % リハーサルマークを小節番号に
  \set Score.markFormatter = #format-mark-box-barnumbers
  % リハーサルマークを四角囲みのアルファベットに
  % \set Score.markFormatter = #format-mark-box-letters

}

