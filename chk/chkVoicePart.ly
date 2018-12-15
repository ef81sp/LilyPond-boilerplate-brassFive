\version "2.18.2"
#(ly:set-option 'relative-includes #t)

\include "../voices/marks.ly"
\include "../voices/keys.ly"
\include "../voices/keys.ly"
\include "../voices/marks.ly"
\include "../voices/01-voiceTpI.ly"
\include "../voices/02-voiceTpII.ly"
\include "../voices/03-voiceHr.ly"
\include "../voices/04-voiceTb.ly"
\include "../voices/05-voiceTu.ly"

chk =
\new Staff \with { \consists "Page_turn_engraver" }
\transpose bes, c
% \transpose f, c
<<
  % \clef "bass"
  \marks \keys
  % \voiceTpI
  \voiceTpII
  % \voiceHr
  % \voiceTb
  % \voiceTu
>>
