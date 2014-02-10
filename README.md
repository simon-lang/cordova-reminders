## A Simple Reminder App

Just mucking around with [Cordova](http://cordova.apache.org/) and [Grunt](http://gruntjs.com/).

We're using Coffeescript, Jade and Stylus as languages of choice. Browserify to require modules. Backbone for basic architecture. NPM and Bower (maybe) for package management.

Cordova for deploying to native mobile.

No server side or persistence implemented yet. We'll get there.


## Development Instructions

First `export NODE_ENV=development`.

Run `grunt watch` to take `/lib/app.coffee` (and files it requires), `lib/styles/styles.styl` (and files it imports), and `lib/index.jade` (and files it includes) and compile them to `www/js/app.js`, `www/css/styles.css` and `www/index.html` respectively. It also runs a livereload server so these files will be automatically updated in your browser.

You can also run `grunt autoprefixer` to prefix the css and `grunt uglify` to minify the js.


## Mobile testing instructions

```
export NODE_ENV=production
grunt
cordova emulate ios
cordova run ios
```

This packages a version for mobile and opens in your iOS simulator. If you don't have cordova or the ios sim, make sure you've done the following:

```
sudo npm install -g cordova
npm install -g ios-sim
npm install -g ios-deploy
 
cordova platform add ios
cordova build
cordova emulate ios
cordova run ios
```


## TODO:

- Backbone/Marionette/Something that includes proper pushState routing
- basic serverside and some websocket comms. Probably socksjs over socketio
- basic persistence, probably mongodb+mongoose for convinience
- Actually use some cordova features
- Bootstrap 3, not 2 (will have to find upgraded timepicker)
- Fontawesome
- Unit Tests
- Combine and minify CSS for prod
- Try Angular instead of Backbone?
- git ignore cordova build products?

Do this stuff: (inspired by [this](https://github.com/bertrand-caron/bootstrap-timepicker))
```
$ grunt test // run jshint and jasmine tests
$ grunt watch // run jsHint and Jasmine tests whenever a file is changed
$ grunt compile // minify the js and css files
$ grunt gh-pages // push updates to gh-pages
$ grunt bump:[patch/minor/major] // bump the version
```

## To Read:

- http://docs.phonegap.com/en/3.3.0/guide_cli_index.md.html#The%20Command-Line%20Interface
- http://devgirl.org/2013/07/17/tutorial-implement-push-notifications-in-your-phonegap-application/
- http://docs.phonegap.com/en/3.3.0/cordova_camera_camera.md.html#Camera
- http://lostechies.com/derickbailey/2012/04/19/decoupling-backbone-apps-from-websockets/


