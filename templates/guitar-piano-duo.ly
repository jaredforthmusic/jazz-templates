\version "2.20.0"
% LilyJAZZ Fonts
\include "LilyJAZZ.ily"

\header {
  title = "Example Song"
  subtitle = "Piano/Guitar Duo"
  composer = "Example Composer"
  meter = "moderato"
  piece = "Swing"
  tagline = "Trio Template Example by jaredforthmusic.com"
}

\book {
    \bookOutputName "piano-guitar-duo"
}

\paper  {
  left-margin = 0.75\in
  % Set LilyJAZZ fonts
  #(define fonts
    (make-pango-font-tree "LilyJAZZText"
                          "LilyJAZZText"
                          "LilyJAZZText"
                          (/ staff-height pt 20)))
}

%#(set-global-staff-size 16)
\include "english.ly"

%%%%%%%%%%%% Some macros %%%%%%%%%%%%%%%%%%%

sl = {
  \override NoteHead.style = #'slash
  \hide Stem
}
nsl = {
  \revert NoteHead.style
  \undo \hide Stem
}
crOn = \override NoteHead.style = #'cross
crOff = \revert NoteHead.style

%% insert chord name style stuff here.

jazzChords = { }

%%%%%%%%%%%% Keys %%%%%%%%%%%%%%%%%

global = { \time 4/4 }

Key = { \key c \major }

% ############ Rhythm Section #############

% ------ Guitar ------
gtr = \relative c'' {
  \Key
  c1
  \sl
  b4 b b b
  \nsl
  c1
  b4 b b b
  b4 b b b
  b4 b b b
  b4 b b b
}
gtrHarmony = \chordmode {
  \jazzChords
  s1 c2:min7+ d2:maj9
}
guitar = {
  \global
  \clef treble
  <<
    \gtr
  >>
}

%% ------ Piano ------
rhUpper = \relative c'' {
  \voiceOne
  \Key
  c1 | c | c
  c1 | c | c
  c1 |
}
rhLower = \relative c' {
  \voiceTwo
  \Key
  e1 | e | e
  e1 | e | e
  e1 |
}

lhUpper = \relative c' {
  \voiceOne
  \Key
  g1 | g | g
  g1 |
}
lhLower = \relative c {
  \voiceTwo
  \Key
  c1 | c | c
  c1 | c | c | c
}

PianoRH = {
  \clef treble
  \global
  <<
    \new Voice = "one" \rhUpper
    \new Voice = "two" \rhLower
  >>
}
PianoLH = {
  \clef bass
  \global
  <<
    \new Voice = "one" \lhUpper
    \new Voice = "two" \lhLower
  >>
}

piano = {
  <<
    \new Staff = "upper" \PianoRH
    \new Staff = "lower" \PianoLH
  >>
}

%%%%%%%%% It All Goes Together Here %%%%%%%%%%%%%%%%%%%%%%

\score {
  <<
    \new StaffGroup = "rhythm" <<
      \new ChordNames = "chords" \gtrHarmony
      \new Staff = "guitar" \with { instrumentName = "Guitar" }
      \guitar
      \new PianoStaff = "piano" \with {
        instrumentName = "Piano"
        midiInstrument = "acoustic grand"
      }
      \piano
    >>
  >>
  \layout {
    % \context { \Staff \RemoveEmptyStaves }
    \context {
      \Score
      \override BarNumber.padding = #3
      \override RehearsalMark.padding = #2
      skipBars = ##t
      % Turn LilyJAZZ Fonts on
      \jazzOn
    }
  }
  \midi { }
}