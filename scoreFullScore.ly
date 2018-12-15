\version "2.18.2"
#(ly:set-option 'relative-includes #t)

\include "config/confHeader.ly"
\include "config/confFullScore.ly"
\include "config/confPartName.ly"

\include "./staves/staves.ly"

%{
  fullScore
  フルスコアのトップレベル定義
%}

\layout { \confLayoutFullScore }

\book {
  \score {
    \new StaffGroup = "B5" <<
      \staffTpI
      \staffTpII
      \staffHr
      \staffTb
      \staffTu

      \context Staff = "TpI" {
        \set Staff.instrumentName = \nameTpI
        \set Staff.shortInstrumentName = \nameShTpI
      }
      \context Staff = "TpII" {
        \set Staff.instrumentName = \nameTpII
        \set Staff.shortInstrumentName = \nameShTpII
      }
      \context Staff = "Hr" {
        \set Staff.instrumentName = \nameHr
        \set Staff.shortInstrumentName = \nameShHr
      }
      \context Staff = "Tb" {
        \set Staff.instrumentName = \nameTb
        \set Staff.shortInstrumentName = \nameShTb
      }
      \context Staff = "Tu" {
        \set Staff.instrumentName = \nameTu
        \set Staff.shortInstrumentName = \nameShTu
      }
    >>
  }

  \header {
    instrument = "Score"
  }
  \paper {
    \confPaperFullScore
  }
}
