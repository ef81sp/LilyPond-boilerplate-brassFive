#(ly:set-option 'relative-includes #t)
\version "2.18.2"

\include "config/confHeader.ly"
\include "config/confPartName.ly"
\include "config/confParts.ly"
\include "staves/staves.ly"

%{
  scoreParts
  各パート譜のトップレベル定義
%}

\layout { \confPartsLayout }

%%%% TpI %%%%
#(define output-suffix "01-TpI")
\book {
  \score {
    \staffTpI
  }

  \header {
    instrument = \nameTpI
  }
  \paper { \confPartsPaper }
}

%%%% TpII %%%%
#(define output-suffix "02-TpII")
\book {
  \score {
    \staffTpII
  }

  \header {
    instrument = \nameTpII
  }
  \paper { \confPartsPaper }
}

%%%% HrI %%%%
#(define output-suffix "03-Hr")
\book {
  \score {
    \staffHr
  }

  \header {
    instrument = \nameHr
  }
  \paper { \confPartsPaper }
}

%%%% TbI %%%%
#(define output-suffix "04-Tb")
\book {
  \score {
    \staffTb
  }

  \header {
    instrument = \nameTb
  }
  \paper { \confPartsPaper }
}

%%%% Tu %%%%
#(define output-suffix "05-Tu")
\book {
  \score {
    \staffTu
  }

  \header {
    instrument = \nameTu
  }
  \paper { \confPartsPaper }
}