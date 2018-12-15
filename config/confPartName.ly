\version "2.18.2"
%{
  confPartName
  パート名の定義
%}

% number
nameI = #"1"
nameII = #"2"

% instrumentName
nameTp = \markup {\concat { "B" \flat " " "Trumpet "} }
nameShTp = \markup {\concat { "B" \flat " " "Tp."} }

nameTpI = \markup{ \concat { \nameTp " " \nameI } }
nameShTpI = \markup{ \concat { \nameShTp " " \nameI } }
nameTpII = \markup{ \concat { \nameTp " " \nameII } }
nameShTpII = \markup{ \concat { \nameShTp " " \nameII } }

nameHr = #"F Horn "
nameShHr = #"Hn."

nameTb = #"Trombone "
nameShTb = #"Tb."

nameTu = #"Tuba"
nameShTu = #"Tu."
