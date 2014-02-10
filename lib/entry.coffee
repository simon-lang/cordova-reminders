_.templateSettings = interpolate: /\{\{(.+?)\}\}/g

window.Reminders =
  Models:
    Reminder: require './models/reminder.coffee'
  Collections:
    ReminderList: require './collections/reminders.coffee'
  Router: require './router.coffee'

# Usage: http://backbonejs.org/#Router-route
Backbone.history.start {pushState: true}

App = require './app.coffee'
app = new App

$ -> app.init()
