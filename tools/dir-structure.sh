#!/bin/bash

# If `dist/` exists do
if [ -d dist ]; then

  # Remove old `dist/` directory and
  # contents then make new one
  rm -rf dist
  mkdir -p dist/{css,img,js}

else

  # Make new `dist/` directory
  mkdir -p dist/{css,img,js}

fi
