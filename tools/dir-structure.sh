#!/bin/bash

# if dist/ exists do
if [ -d dist ]; then

  # remove old dist/ directory and
  # contents then make new one
  rm -rf dist
  mkdir -p dist/{css,img,js}

else

  # make new dist/ directory
  mkdir -p dist/{css,img,js}

fi
