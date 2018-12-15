#(ly:set-option 'relative-includes #t)
\version "2.18.2"

\include "../config/confHeader.ly"
\include "../config/confPartName.ly"
\include "../config/confParts.ly"
\include "./chkVoicePart.ly"

\layout { \confPartsLayout }
\book {
  \score {
    \chk
  }

  \paper { \confPartsPaper }
}
