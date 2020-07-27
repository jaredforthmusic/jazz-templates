[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)


# LilyPond Jazz Templates

GNU LilyPond templates for jazz.

## Templates

This repository currently contains templates for two variations on the jazz trio, as well as a quartet and jazz combo: 

- [Drums - Bass - Piano](./templates/piano-trio-template.ly)
- [Drums - Bass - Guitar](./templates/guitar-trio-template.ly)

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

## Contributions

This repository is a work in progress. As such, contributions are welcome. All contributors must abide by the [Contributor Covenant Code of Conduct](./CODE_OF_CONDUCT.md). 

## License

Licensed under the [GNU General Public Licence, Version 3](./LICENCE).

Any contribution intentionally submitted for inclusion in this repository by you shall be licensed as above, without any additional terms or conditions.