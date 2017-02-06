#!/bin/bash

# For every file in `src/` that has a `html` extension do
for file in src/*.html

do
  
  echo "Generating $file …"
  "$(npm bin)/mustache" \
    -p src/partials/top.mustache \
    -p src/partials/bottom.mustache \
    package.json \
  "$file" > dist/"$(basename "$file")"

done
  
    # line 10-11 use paritals top.mustache and bottome.mustache
    # # to finish off each html file in src/. If you're
    # # using more partials be sure to add them below or
    # # split up script accordingly
    # line 12 mustache needs a json file so I'm passing it
    # # package.json switch to you're own json file
    # # to pass the templates different data
    # line 13 output the file into the dist/ directory
