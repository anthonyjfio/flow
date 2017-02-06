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
    dist/"$(basename "$file")" \
      --collapse-whitespace \
      --remove-attribute-quotes \
      --remove-comments \
      --remove-script-type-attributes \
      --remove-style-link-type-attributes \
      --minify-css \
      --minify-js \
    > dist/"$(basename "$file")".min

  mv dist/"$(basename "$file")".min dist/"$(basename "$file")" 

done
