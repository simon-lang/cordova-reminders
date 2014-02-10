# todo: This should actually be split into a proper model/view
module.exports = class App

  constructor: ->
    @dom = $ '.app'

    @components =
      input:  @dom.find 'input.label-input'
      timepicker: @dom.find 'input.timepicker'
      submit: @dom.find 'button.submit'
      list:   @dom.find 'ul.reminder-list'
  
    @reminders = new Reminders.Collections.ReminderList
    @reminders.on 'add', @addToList
    @reminders.fetch()

    @router = new Reminders.Router
  
    if navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry)/)
      # Common device events are: 'load', 'deviceready', 'offline', and 'online'.
      document.addEventListener 'deviceready', @deviceReady, false
    else
      @deviceReady()

  deviceReady: =>
    # Usage: http://backbonejs.org/#Router-route
    Backbone.history.start {pushState: true}

    # Timepicker
    @components.timepicker.timepicker()

    # Submit
    @components.submit.on 'click', @createReminder
    @components.input.on 'keyup', @checkForEnter

  checkForEnter: (e) =>
    if e.keyCode is 13
      @createReminder()

  createReminder: =>
    unless @components.input.val()
      @components.input.val('').focus()
      return
    @reminders.create new Reminders.Models.Reminder
      label: @components.input.val()
      date: @components.timepicker.data().timepicker.getTime() # ugh. Am I doing this wrong, or just terrible api?
    @components.input.val('').focus()
 
  addToList: (model) =>
    view = new Reminders.Views.ReminderItem {model}
    @components.list.prepend view.render()
