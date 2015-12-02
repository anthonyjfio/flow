#!/bin/bash

# For every file in dist/ that has a html extension do
for file in dist/*.html

do
  
  # line 13 run through html-minifier
  # line 14 output file
  # line 15-21 pass html-minifier options
  # line 22 input file
  echo "Minimizing $file …"
  "$(npm bin)/html-minifier" \
    -o dist/"$(basename "$file")" \
      --collapse-whitespace \
      --remove-attribute-quotes \
      --remove-comments \
      --remove-script-type-attributes \
      --remove-style-link-type-attributes \
      --minify-css \
      --minify-js \
    "$file"

  # line 30 run through critical
  # line 31 input html files
  # line 32 css files
  # line 33-36 pass critical options
  # line 37 output html files
  echo "Inlining critical css …"
  "$(npm bin)/critical" \
    dist/"$(basename "$file")" \
    -c dist/css/main.css \
      --inline \
    -w 350 -h 575 \
    -w 500 -h 575 \
    -w 1300 -h 900 \
    -H dist/"$(basename "$file")" \
      --minify

  # run through html-minifier again same as before
  echo "Minimizing $file …"
  "$(npm bin)/html-minifier" \
    -o dist/"$(basename "$file")" \
      --collapse-whitespace \
      --remove-attribute-quotes \
      --remove-comments \
      --remove-script-type-attributes \
      --remove-style-link-type-attributes \
      --minify-css \
      --minify-js \
    dist/"$(basename "$file")"

done
