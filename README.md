[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)


# LilyPond Jazz Trio

A GNU LilyPond template for a jazz trio. 

## Templates

This repository currently contains templates for two variations on the jazz trio: 

- [Drums - Bass - Piano]()
- [Drums - Bass - Guitar]()

They are found in the [templates](./templates) directory. 

## Usage 

The `[build.sh](./build.sh)` script runs the program and directs compiled files to the `output` directory. Run `./build.sh` to compile on Linux and Mac systems. Both PDF and MIDI files are created from the source code. 

## Font Installation 

The fonts for this are the excellent [LilyJAZZ](https://github.com/OpenLilyPondFonts/lilyjazz) fonts. You can get them from GitHub or the [fonts](./fonts) directory. To install, copy LilyJAZZ.otf and LilyJAZZText.otf to your LilyPond `otf` fonts directory (often found in `~/lilypond/usr/share/lilypond/current/fonts/otf`) and copy LilyJAZZ.ily to the LilyPond `ly` directory (often found in `~/lilypond/usr/share/lilypond/current/ly`). 

If you want to disable LilyJAZZ fonts, comment out `\include "LilyJAZZ.ily"`, `\jazzOn`, and 

```lilypond
  #(define fonts
    (make-pango-font-tree "LilyJAZZText"
                          "LilyJAZZText"
                          "LilyJAZZText"
                          (/ staff-height pt 20)))
```