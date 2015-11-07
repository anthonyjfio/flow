#!/bin/bash

if [ -d dist ]; then
  rm -rf dist
  mkdir -p dist/{css,img,js}
else
  mkdir -p dist/{css,img,js}
fi
