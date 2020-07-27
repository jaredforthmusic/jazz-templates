[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)


# LilyPond Jazz Templates

GNU LilyPond templates for jazz. The purpose of this repository is to have an list of templates to get started quickly with a jazz composition. The best part of composing is creating music, not fighting with technology, so my hope is that this will make creating beautiful jazz scores with LilyPond more accessible to more composers.  

## Templates

This repository currently contains the following templates:

### Duos

- [Duo | Bass - Piano](./templates/piano-bass-duo.ly)
- [Duo | Guitar - Piano](./templates/guitar-piano-duo.ly)

### Trios

- [Trio | Drums - Bass - Piano](./templates/piano-trio.ly)
- [Trio | Drums - Bass - Guitar](./templates/guitar-trio.ly)

### Quartets

- [Quartet | Drums - Bass - Piano - Guitar](./templates/piano-guitar-quartet.ly)

They are found in the [templates](./templates) directory.

### Adding New Templates

There are quite a few more instrumentation variations that are used in jazz, so feel free to add the combination most useful for you. The easiest way to get started is to copy one of the existing templates and modify it to satisfy your use case. See [contributions](#contributions) for more information on contributing to the repository. 

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