#!/bin/bash

for file in src/*.html

do
  
  echo "Compressing $file …"
  "$(npm bin)/html-minifier" -o dist/"$(basename "$file")" --collapse-whitespace --remove-comments "$file"

  echo "Inlining critical css …"
  "$(npm bin)/critical" dist/"$(basename "$file")"  -c dist/css/main.css --inline -H dist/"$(basename "$file")" --minify

done
