#!/bin/bash

# For every file in `src/js/` that has a `js` extension do
for file in src/js/*.js

do

  echo "Generating JS …"
  "$(npm bin)/browserify" "$file" | \
  "$(npm bin)/babel" --presets es2015 \
  --plugins \
    transform-member-expression-literals,transform-merge-sibling-variables,transform-property-literals,transform-minify-booleans,transform-remove-console,transform-remove-debugger | \
  "$(npm bin)/uglifyjs" --compress -o dist/js/"$(basename "$file")"

done

# line 9 run through browserify
# line 10-12 run through babel with `es2015` presets and plugins
# # for optimization
# line 13 run through uglifyjs and output to `dist/js/` directory

