#!/bin/bash

# For every file in `src/` that has a `html` extension do
for file in src/*.html

do
  
  echo "Minimizing $file …"
  # Run through html-minifier
  "$(npm bin)/html-minifier" \
    # Output file
    -o dist/"$(basename "$file")" \
    # Pass html-minifier options
      --collapse-whitespace \
      --remove-attribute-quotes \
      --remove-comments \
      --remove-script-type-attributes \
      --remove-style-link-type-attributes \
      --minify-css \
      --minify-js \
    # Input file
    "$file"

  echo "Inlining critical css …"
  # Run through critical
  "$(npm bin)/critical" \
    # Input files
    dist/"$(basename "$file")" \
    # Css files
    -c dist/css/main.css \
    # Pass uncss options
      --inline \
    -w 350 -h 575 \
    -w 500 -h 575 \
    -w 1300 -h 900 \
    # Html files
    -H dist/"$(basename "$file")" \
      --minify

  echo "Minimizing $file …"
  # Run through html-minifier again
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
