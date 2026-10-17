\version "2.24.0"

\header {
  title = "Between Floors"
  subtitle = "for solo piano"
  composer = "AI draft (test)"
  tagline = ##f
}

upper = {
  \clef treble
  \key e \minor
  \time 4/4
  \tempo "Andante, con calma" 4 = 63

  % 1-2
  r1
  r1
  % 3-8
  b'8\mp( d''4 e''8 ~ e''4 d''8 b'8)
  a'4.( b'8 ~ b'2)
  b'8( d''4 e''8 ~ e''4 g''8 e''8)
  d''4.( c''8 ~ c''2)
  e''8( d''8 c''4 ~ c''8 b'8 a'4)
  dis''4( b'8 a'8 ~ a'2)
  % 9-14
  e''8\mf( a'8 c''8 e''8 ~ e''4 d''8 c''8)
  d''8( fis'8 a'8 d''8 ~ d''4 e''8 fis''8)
  g''8( d''8 b'8 d''8 ~ d''4 e''8 g''8)
  e''8( c''8 g'8 c''8 ~ c''4 d''8 e''8)
  a''4\<( g''8 e''8 ~ e''4 d''8 c''8)
  a''4( g''8 fis''8 ~ fis''4 dis''8 b'8)
  % 15-20
  b'8\f( d''4 e''8 ~ e''4 g''8 b''8)
  a''4( g''8 e''8 ~ e''4 d''8 c''8)
  b'8( d''4 g''8 ~ g''4 a''8 b''8)
  a''4( fis''8 d''8 ~ d''4 e''8 fis''8)
  g''4\>( e''8 c''8 ~ c''4 b'8 a'8)
  fis''4\mp( dis''8 b'8 ~ b'2)
  % 21-26
  b'8( d''4 e''8 ~ e''4 d''8 b'8)
  a'4.( b'8 ~ b'2)
  b'8( d''4 e''8 ~ e''4 g''8 e''8)
  d''4.( b'8 ~ b'2)
  e''8( d''8 c''4 ~ c''8 b'8 a'4)
  dis''4( b'8 a'8 ~ a'2)
  % 27-30
  b'8\pp( d''4 e''8 ~ e''2)
  d''4.( b'8 ~ b'2)
  c''4( b'8 a'8 ~ a'2)
  <g' b' e''>1\ppp\fermata
  \bar "|."
}

lower = {
  \clef bass
  \key e \minor
  \time 4/4
  \set Staff.pedalSustainStyle = #'mixed

  % 1-2
  e,8\p\sustainOn b, e g e b, e g
  c,8\sustainOff\sustainOn g, c e c g, c e
  % 3-8
  g,8\sustainOff\sustainOn d g b g d g b
  fis,8\sustainOff\sustainOn a, d fis d a, d fis
  e,8\sustainOff\sustainOn b, e g e b, e g
  a,8\sustainOff\sustainOn e a c' a e a c'
  c,8\sustainOff\sustainOn g, c e c g, c e
  b,8\sustainOff\sustainOn fis b dis' b fis b dis'
  % 9-14
  a,8\sustainOff\sustainOn e a c' a e a c'
  d,8\sustainOff\sustainOn a, d fis d a, d fis
  g,8\sustainOff\sustainOn d g b g d g b
  c,8\sustainOff\sustainOn g, c e c g, c e
  a,8\sustainOff\sustainOn e a c' a e a c'
  b,8\sustainOff\sustainOn fis b dis' b fis b dis'
  % 15-20
  e,8\sustainOff\sustainOn b, e g b g e b,
  c,8\sustainOff\sustainOn g, c e g e c g,
  g,8\sustainOff\sustainOn d g b d' b g d
  d,8\sustainOff\sustainOn a, d fis a fis d a,
  a,8\sustainOff\sustainOn e a c' e' c' a e
  b,8\sustainOff\sustainOn fis b dis' fis' dis' b fis
  % 21-26
  e,8\sustainOff\sustainOn b, e g e b, e g
  c,8\sustainOff\sustainOn g, c e c g, c e
  a,8\sustainOff\sustainOn e a c' a e a c'
  g,8\sustainOff\sustainOn d g b g d g b
  c,8\sustainOff\sustainOn g, c e c g, c e
  b,8\sustainOff\sustainOn fis b dis' b fis b dis'
  % 27-30
  e,8\sustainOff\sustainOn b, e g ~ g2
  c,8\sustainOff\sustainOn g, c e ~ e2
  a,8\sustainOff\sustainOn e a c' ~ c'2
  <e, b, e>1\fermata\sustainOff
  \bar "|."
}

\score {
  \new PianoStaff \with { instrumentName = "Piano" } <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}
