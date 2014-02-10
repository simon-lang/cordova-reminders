_.templateSettings = interpolate: /\{\{(.+?)\}\}/g

window.Reminders =
  Router: require './router.coffee'
  Models:
    Reminder: require './models/reminder.coffee'
  Collections:
    ReminderList: require './collections/reminders.coffee'
  Views:
    ReminderItem: require './views/reminder-item.coffee'

App = require './app.coffee'

$ -> window.app = new App
