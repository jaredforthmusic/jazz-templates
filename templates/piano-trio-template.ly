\version "2.20.0"
% LilyJAZZ Fonts
\include "LilyJAZZ.ily"

\header {
  title = "Example Song"
  subtitle = "Piano Trio"
  composer = "Example Composer"
  meter = "moderato"
  piece = "Swing"
  tagline = "Trio Template Example by jaredforthmusic.com"
}

\book {
    \bookOutputName "piano-trio"
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

% ------ Bass Guitar ------
Bass = \relative c {
  \Key
  c1 | c | c
  c1 | c | c
  c1 |
}
bass = {
  \global
  \clef bass
  <<
    \Bass
  >>
}

% ------ Drums ------
up = \drummode {
  \voiceOne
  hh4 <hh sn> hh <hh sn>
  hh4 <hh sn> hh <hh sn>
  hh4 <hh sn> hh <hh sn>
  hh4 <hh sn> hh <hh sn>
  hh4 <hh sn> hh <hh sn>
  hh4 <hh sn> hh <hh sn>
  hh4 <hh sn> hh <hh sn>
}
down = \drummode {
  \voiceTwo
  bd4 s bd s
  bd4 s bd s
  bd4 s bd s
}

drumContents = {
  \global
  <<
    \new DrumVoice \up
    \new DrumVoice \down
  >>
}

%%%%%%%%% It All Goes Together Here %%%%%%%%%%%%%%%%%%%%%%

\score {
  <<
    \new StaffGroup = "rhythm" <<
      \new PianoStaff = "piano" \with {
        instrumentName = "Piano"
        midiInstrument = "acoustic grand"
      }
      \piano
      \new Staff = "bass" \with { instrumentName = "Bass" }
      \bass
      \new DrumStaff \with { instrumentName = "Drums" }
      \drumContents
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