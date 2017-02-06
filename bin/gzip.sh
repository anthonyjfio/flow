#!/bin/bash

echo "Gzipping HTML …"
  # Use zopfli to gzip all `html` files
  "$(npm bin)/zopfli" -i 1000 dist/*.html
echo "HTML Done"

echo "Gzipping CSS …"
  # Use zopfli to gzip all `css` files
  "$(npm bin)/zopfli" -i 1000 dist/css/*.css
echo "CSS Done"

echo "Gzipping JS …"
  # Use zopfli to gzip all `js` files
  "$(npm bin)/zopfli" -i 1000 dist/js/*.js
echo "JS Done"
