#!/bin/bash

for file in src/*.html

do
  
  echo "Minimizing $file …"
  "$(npm bin)/html-minifier" -o dist/"$(basename "$file")" --collapse-whitespace --remove-attribute-quotes --remove-comments --remove-script-type-attributes --remove-style-link-type-attributes --minify-css --minify-js "$file"

  echo "Inlining critical css …"
  "$(npm bin)/critical" dist/"$(basename "$file")"  -c dist/css/main.css --inline -w 350 -h 575 -w 500 -h 575 -w 1300 -h 900 -H dist/"$(basename "$file")" --minify


  echo "Minimizing $file …"
  "$(npm bin)/html-minifier" -o dist/"$(basename "$file")" --collapse-whitespace --remove-attribute-quotes --remove-comments --remove-script-type-attributes --remove-style-link-type-attributes --minify-css --minify-js dist/"$(basename "$file")"


done
