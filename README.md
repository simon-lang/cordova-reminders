## A Simple Reminder App

Learning [Cordova](http://cordova.apache.org/) and [Grunt](http://gruntjs.com/).

- Coffeescript, Jade and Stylus as languages of choice
- Grunt for building and livereloading
- Browserify to require modules
- Backbone for basic architecture
- NPM and Bower for package management
- Cordova for deploying to native mobile
- No server side or persistence implemented yet. We'll get there.


## Development Instructions

First ensure all dependencies are installed and assets are built. Move to the web directory and start a simple web server:

```
export NODE_ENV=development
bower install
npm install
grunt
cd wwww
server (or coffee server.coffee if you don't have simple python webserver)
```

Run `grunt watch` to take `lib/app.coffee` (and files it requires), `lib/styles/main.styl` (and files it imports), and `lib/index.jade` (and files it includes) and compile them to `www/js/app.js`, `www/css/main.css` and `www/index.html` respectively. It also runs a livereload server so these files will be automatically updated in your browser.

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

- Proper routing
- basic serverside and some websocket comms. socksjs or socketio
- basic persistence, probably mongodb+mongoose for convinience
- Actually use some cordova features
- Bootstrap 3, not 2 (will have to find upgraded timepicker)
- Fontawesome
- Unit Tests
- Try Angular instead of Backbone? or Marionette at least?
- git ignore cordova build products?


## To Read:

- http://lostechies.com/derickbailey/2012/04/19/decoupling-backbone-apps-from-websockets/
