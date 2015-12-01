#!/bin/bash

# For every file in `src/js/` that has a `js` extension do
for file in src/js/*.js

do

  echo "Generating JS …"

  # Run through browserify
  "$(npm bin)/browserify" "$file" | \
  # Run through babel with `es2015` presets and plugins
  # for optimization
  "$(npm bin)/babel" --presets es2015 \
  --plugins \
    transform-member-expression-literals,transform-merge-sibling-variables,transform-property-literals,transform-minify-booleans,transform-remove-console,transform-remove-debugger | \
  # Run through uglifyjs and output to `dist/js/` directory
  "$(npm bin)/uglifyjs" --compress -o dist/js/"$(basename "$file")"

done
