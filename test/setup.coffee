should = require 'should'
mocha = require 'mocha'
jsdom = require 'jsdom'
global._ = require 'underscore'
global.Backbone = require 'backbone'

# Create a fake DOM/jQuery for testing UI components
global.window = jsdom.jsdom().createWindow()
global.document = window.document
global.document.body.innerHtml = '<div class="app></div>'
global.$ = require('jquery').create(window) # WARNING: jQuery for testing is 1.8.3 - different to app
$.extend $.fn, fastClick: $.fn.click # extend jQuery with a faux fastClick method
$.extend $.fn, transit: $.fn.animate

# global.Reminders =
#   Model: require '../models/model'
#   View: require '../views/view'
#   Collection: require '../collections/collection'
