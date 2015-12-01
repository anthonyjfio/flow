#!/bin/bash

# For every file in `src/css/` that has a `css` extension do
for file in src/css/*.css

do

  echo "Generating CSS …"

  # Run through postcss using imports, cssnext and optimizations
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
    # Output file to `dist/css/`
    -o dist/css/"$(basename "$file")" \
    # Input file
    src/css/"$(basename "$file")"

  # Run through uncss
  "$(npm bin)/uncss" \
    # Pass in `html` files to check usage
    -H dist/*.html \
    # Input file
    -s css/"$(basename "$file")" | \
    # Run through postcss again to make sure it's optimized
    # and has appropriate prefixes
    "$(npm bin)/postcss" \
    -u cssnano \
    -u autoprefixer \
    # Output file to `dist/css/`
    -o dist/css/"$(basename "$file")"

done
