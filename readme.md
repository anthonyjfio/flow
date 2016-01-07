# Flow

This is an experiment in making a boilerplate setup that can be used to make static websites.

Flow requires `node`, `npm` and `bash`

It features:

* `mustache` for html templates
* `html-minifier`
* `critical` to inline critical css
* `postcss`
* `postcss-import` to import other css files into one css file
* `cssnext` for future css syntax
* `cssnano` to minify css
* `autoprefixer`
* `uncss` to remove unused css
* `clean-css`
* `browserify`
* `babel` to use es6 now
* `uglifyjs` for minifying javascript
* `imagemin` for compressing images
* `parallelshell` for executing commands simultaniously
* `sane` to watch files for changes and trigger rebuilds
* `browser-sync` for refreshing the browser when changes happern
* `node-zopfli` to compress the files before deployment. This is siginficantly better than gzip.

