\version "2.18.2"

\include "./voices/keys.ly"
\include "./voices/marks.ly"
\include "./voices/01-voiceTpI.ly"
\include "./voices/02-voiceTpII.ly"
\include "./voices/03-voiceHr.ly"
\include "./voices/04-voiceTb.ly"
\include "./voices/05-voiceTu.ly"

%%%% TpI %%%%
staffTpI = \new Staff = "TpI" \with { \consists "Page_turn_engraver" }
\transpose bes, c <<
  \marks \keys
  \voiceTpI
>>

%%%% TpII %%%%
staffTpII = \new Staff = "TpII" \with { \consists "Page_turn_engraver" }
\transpose bes, c <<
  \marks \keys
  \voiceTpII
>>

%%%% HrI %%%%
staffHr = \new Staff = "Hr" \with { \consists "Page_turn_engraver" }
\transpose f, c <<
  \marks \keys
  \voiceHr
>>

%%%% Tb %%%%
staffTb = \new Staff = "Tb" \with { \consists "Page_turn_engraver" }
<<
  \marks \keys
  \clef bass
  \voiceTb
>>

%%%% HrIII %%%%
staffTu = \new Staff = "Tu" \with { \consists "Page_turn_engraver" }
<<
  \marks \keys
  \clef bass
  \voiceTu
>>
