#!/bin/bash

for file in src/css/*.css

do

  echo "Generating CSS …"

  "$(npm bin)/postcss" \
    -u postcss-import \
    -u cssnext \
    -u postcss-colormin \
    -u postcss-minify-font-values \
    -u postcss-merge-longhand \
    -u postcss-minify-selectors \
    -u postcss-unique-selectors \
    -u postcss-zindex \
    -u postcss-merge-rules \
    -u postcss-merge-idents \
    -u postcss-reduce-idents \
    -u postcss-discard-duplicates \
    -u postcss-discard-empty \
    -u postcss-discard-comments \
      --postcss-discard-comments.removeAll true \
    -u postcss-discard-unused \
    -u cssnano -u autoprefixer \
    -o dist/css/"$(basename "$file")" \
    src/css/"$(basename "$file")"

  "$(npm bin)/uncss" \
    -H dist/*.html \
    -s css/"$(basename "$file")" | \
    "$(npm bin)/postcss" \
    -u cssnano \
    -u autoprefixer \
    -o dist/css/"$(basename "$file")"

done
