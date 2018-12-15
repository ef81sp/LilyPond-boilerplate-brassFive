# LilyPond 金管五重奏テンプレート
Make it easy to compose.

## 概要
LilyPondで金管五重奏を浄書するためのテンプレートです。
レイアウトを「いい感じ」に設定済みなので、譜面の入力のみに集中できます。

## コンセプト
- ボイス(≒音符)だけ入力しよう
- 使い回せる設定は使いまわそう

## LilyPondって何？
楽譜を出力するためのソフトウェアです。
FinaleやSibeliusのようなグラフィカルな入力ではなく、TeXのようにテキストベースで入力し、コンパイルします。
無料で使えます！(GPL)
[LilyPond – みんなの楽譜作成: LilyPond... みんなの楽譜作成](http://lilypond.org/index.ja.html)

## 参照すべきドキュメント
使用前に、LilyPondファイルの入力仕様はある程度知っておいたほうがよいでしょう。
[GNU LilyPond 学習マニュアル: LilyPond — 学習マニュアル](http://lilypond.org/doc/v2.18/Documentation/learning/index.ja.html)

## フォルダ構成
```
.
├ chk/          ... 入力確認用
├ config/       ... 設定ファイル
├ pdf/          ... パート譜の出力先
├ staves/       ... スタッフ(*)
├ voices/       ... ボイス(*) 基本的に触るのはこの下のファイルだけ
├ fullScore.ly  ... フルスコアのスコア(*)ファイル
├ package.json  ... コマンド(後述)の定義ファイル
├ readme.ja.md  ... このファイル
└ scoreParts.ly ... パート譜のスコア(*)ファイル
```
### (*)ボイス、スタッフ、スコア
LilyPondにおいて「コンテキスト」と呼ばれる、入力の細かさのレベルについた名前です。
細かい順に、ボイス(音符)、スタッフ(五線)、スコア(楽譜全体)です。
詳細は以下をご覧ください。
[GNU LilyPond 学習マニュアル: 3.3.1 コンテキストの説明](http://lilypond.org/doc/v2.18/Documentation/learning/contexts-explained)

このテンプレートは、事前にいい感じにレイアウトの設定を行っておくことで、**ボイスだけ入力すればいい感じの楽譜ができる**ことを目的にしています。

## コマンド
[Node.js](https://nodejs.org/ja/) を導入するとコンパイルを簡単に行うことができるようになります。
```sh
## パート譜のコンパイル
### ./pdf/ フォルダに出力されます
npm run parts

## スコアのコンパイル
### このファイルと同じフォルダ(./)に出力されます
npm run score

## 入力中の譜面の確認(後述)
npm run chk
```

## 入力

考え方とファイル構成を確認した後、具体的な入力方法を確認します。

### 思想
このテンプレートでは、**音符とメタ情報を分割して入力する**ことを思想として持っています。
ここでの「メタ情報」とは、**すべてのパートで共通に扱われる情報**を指します。
具体的には以下のようなものです。
- 調号
- テンポ記号
- 練習番号
- 縦線
- etc...

これにより、以下を図ります。
- 入力量の削減
- 入力ミスの削減

### ファイル構成
`./voices/`フォルダ以下をご覧ください。
```
01-voiceTpI.ly
02-voiceTpII.ly
03-voiceHr.ly
04-voiceTb.ly
05-voiceTu.ly
keys.ly
marks.ly
```

#### 各ファイルに対して入力するもの
- `voice`とついたファイル
  - 音符
  - 強弱記号
  - 固有の発想記号
- `keys.ly`
  - 調号
- `marks.ly`
  - 調号以外のメタ情報

### 入力方法
#### `voice`とついたファイル
- **実音(in C)で入力する**
  - 移調は`./staves/`フォルダ以下のファイルで管理しています。
- メタ情報を記述しないこと以外は普通に入力する
  - ⭕ 音符
  - ⭕ 音量記号
  - ⭕ アーティキュレーション
```ly
%%%% Tp1 %%%%
voiceTpI = \relative c' {
  c4 ( \mf d e f ) |
  g-- a-. b-- c-. |
  d \< e8 f g4 c |
  f e8 d c2 \! |
}
```

#### `keys.ly`
- 調号情報**のみ**を記述する
- 透明休符(`s1`)を使って小節を埋める
  - `s1*<小節数>`と書くことができます
```ly
key = {
  \key c \major
  s1*4 |
}
```

#### `marks.ly`
- 調号以外のメタ情報**のみ**を記述する
  - 練習番号
  - テンポ記号
  - 発想記号
  - 終止線
  - etc...
- 透明休符(`s1`)を使って小節を埋める
  - `s1*<小節数>`と書くことができます
```ly
key = {
  \mark \default
  \tempo 4 = 100

  s1*4 |
  \bar "|."
}
```

### 入力のチェック

`npm run chk` コマンドで特定のパートのみを出力することができます。出力は`./chk/`ディレクトリに行われます。

`./chk/chkVoicePart.ly` 後半に以下の記述があります。
必要なものに応じて各行をコメントアウト・アンコメントをしてください。

トランペット2番の例(in Bb, ト音記号)
```ly
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
```

トロンボーンの例(in C, ヘ音記号)
```ly
chk =
\new Staff \with { \consists "Page_turn_engraver" }
% \transpose bes, c
% \transpose f, c
<<
  \clef "bass"
  \marks \keys
  % \voiceTpI
  % \voiceTpII
  % \voiceHr
  \voiceTb
  % \voiceTu
>>
```

## ライセンス
MIT