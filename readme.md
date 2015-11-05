# Flow

### Links

[Sheetify](https://github.com/sheetify/sheetify)
[Uncss](https://github.com/giakki/uncss)
[Uglifyjs](https://github.com/mishoo/UglifyJS2)


### To-Do

* Find a way to use uncss or purifycss correctly
* Find way to recursively use an html minifier on all files in `src/` directory and put resulting files in `dist/` directory
`````
for i in src/*.html; do node_modules/.bin/html-minifier -o ./dist/$i; done
`````
