_.templateSettings = interpolate: /\{\{(.+?)\}\}/g

window.Reminders =
  Router: require './router'
  Models:
    Reminder: require './models/reminder'
  Collections:
    ReminderList: require './collections/reminders'
  Views:
    ReminderItem: require './views/reminderItemView'

App = require './app'

$ -> window.app = new App
