\version "2.18.2"
\include "confPartInstName.ly"

%{
  confScoreInstName
  スコア・パート譜で用いるパート名
%}

confScoreInstNameTpI = \context Staff = "TpI" {
  \set Staff.instrumentName = \nameTpI
  \set Staff.shortInstrumentName = \nameShTpI
}
confScoreInstNameTpII = \context Staff = "TpII" {
  \set Staff.instrumentName = \nameTpII
  \set Staff.shortInstrumentName = \nameShTpII
}
confScoreInstNameHr = \context Staff = "Hr" {
  \set Staff.instrumentName = \nameHr
  \set Staff.shortInstrumentName = \nameShHr
}
confScoreInstNameTb = \context Staff = "TbI" {
  \set Staff.instrumentName = \nameTb
  \set Staff.shortInstrumentName = \nameShTb
}
confScoreInstNameTu = \context Staff = "Tu" {
  \set Staff.instrumentName = \nameTu
  \set Staff.shortInstrumentName = \nameShTu
}