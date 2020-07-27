#!/bin/bash

# Compile files
lilypond templates/*.ly 

# Move to ./output
mv *.pdf *.midi output/