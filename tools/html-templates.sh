#!/bin/bash

# For every file in `src/` that has a `html` extension do
for file in src/*.html

do
  
  echo "Generating $file …"
  "$(npm bin)/mustache" \
    # Use paritals `top.mustache` and `bottome.mustache`
    # to finish off each `html` file in `src/`. If you're
    # using more partials be sure to add them below or
    # split up script accordingly
    -p src/partials/top.mustache \
    -p src/partials/bottom.mustache \
    # Mustache needs a `json` file so I'm passing it
    # `package.json` switch to you're own `json` file
    # to pass the templates different data
    package.json \
    # Output the file into the `dist/` directory
  "$file" > dist/"$(basename "$file")"

done
