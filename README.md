## A Simple Reminder App

Just mucking around with [Cordova](http://cordova.apache.org/) and [Grunt](http://gruntjs.com/).

We're using Coffeescript, Jade and Stylus as languages of choice. Browserify to require modules. Backbone for basic architecture. NPM and Bower (maybe) for package management.

Cordova for deploying to native mobile.

No server side or persistence implemented yet. We'll get there.


## Development Instructions

Run `grunt watch` to take `/lib/app.coffee` (and files it requires), `lib/styles/styles.styl` (and files it imports), and `lib/index.jade` (and files it includes) and compile them to `www/js/app.js`, `www/css/styles.css` and `www/index.html` respectively. It also runs a livereload server so these files will be automatically updated in your browser.

You can also run `grunt autoprefixer` to prefix the css and `grunt uglify` to minify the js.

## Mobile testing instructions

Run `cordova run ios` to launch the app in your iOS simulator. If you don't have cordova or the ios sim, make sure you've done the following:

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

- have a "build" task which includes uglify/autoprefixer?
- unit tests
- Backbone/Marionette/Something that includes proper pushState routing
- hogan or similar for partial templates. e.g. implement bootstrap input-group
- basic serverside and some websocket comms. Probably socksjs over socketio
- basic persistence, probably mongodb+mongoose for convinience


## To Read:

- http://docs.phonegap.com/en/3.3.0/guide_cli_index.md.html#The%20Command-Line%20Interface
- http://devgirl.org/2013/07/17/tutorial-implement-push-notifications-in-your-phonegap-application/
- http://docs.phonegap.com/en/3.3.0/cordova_camera_camera.md.html#Camera
