#!/bin/bash

for file in src/*.html
do
  echo "Compressing $file …"
  "$(npm bin)/html-minifier" -o dist/"$(basename "$file")" --collapse-whitespace --remove-comments "$file"
done
