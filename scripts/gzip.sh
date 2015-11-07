#!/bin/bash

echo "Gzipping HTML …"
"$(npm bin)/zopfli" -i 1000 dist/*.html
echo "HTML Done"

echo "Gzipping CSS …"
"$(npm bin)/zopfli" -i 1000 dist/css/*.css
echo "CSS Done"

echo "Gzipping JS …"
"$(npm bin)/zopfli" -i 1000 dist/js/*.js
echo "JS Done"

echo "Gzipping Images …"
echo "This is going to take a while, go grab a snack"
"$(npm bin)/zopfli" -i 1000 dist/img/*
echo "Images Done"
