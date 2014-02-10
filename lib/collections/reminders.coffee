Reminder = require '../models/reminder.coffee'

module.exports = window.Reminders = Backbone.Collection.extend
  model: Reminder
  localStorage: new Backbone.LocalStorage 'reminders'
