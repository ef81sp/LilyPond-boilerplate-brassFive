\version "2.18.2"

mkAccel = \tempo \markup { \italic accel. }
mkRit = \tempo \markup { \italic rit. }
mkAtacca = \markup {\right-align \italic atacca. }

marks = {
  \compressFullBarRests
  \numericTimeSignature

  \tempo 4 = 100
  s1 | \bar "|."
}
