_.templateSettings = interpolate: /\{\{(.+?)\}\}/g

window.Reminder = require './models/reminder.coffee'
ReminderList = require './collections/reminders.coffee'

Router = require './router.coffee'
Backbone.history.start {pushState: true}
# Usage: http://backbonejs.org/#Router-route

window.app = module.exports =

  dom: $ '.app'

  reminders: new ReminderList

  router: new Router

  components:
    header: $ '<h1>Reminders</h1>'
    input:  $ '<input class="form-control" autofocus>'
    timepicker: $ '<input type="text" class="input-small">'
    time:   $ '<div class="input-append bootstrap-timepicker"> <span class="add-on"><i class="icon-time"></i></span> </div>'
    submit: $ '<button class="btn btn-primary">Submit</button>'
    list:   $ '<ul>'

  render: ->
    @dom.empty()
    for k, component of @components
      @dom.append component

    @components.timepicker.timepicker()
    @components.timepicker.prependTo @components.time
    # @components.timepicker.timepicker().on 'changeTime.timepicker', ({time}) ->
    #   console.log 'changeTime.timepicker', time

    return @dom
  
  init: ->
    @template = _.template $('#reminder-template').html()

    # Bind any events that are required on startup. Common events are:
    # 'load', 'deviceready', 'offline', and 'online'.
    if navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry)/)
      document.addEventListener 'deviceready', @onDeviceReady, false
    else
      @onDeviceReady()

    addToList = _.bind @addToList, app
    createReminder = _.bind @createReminder, app
    @components.submit.on 'click', createReminder
    @components.input.on 'keyup', (e) ->
      if e.keyCode is 13
        createReminder()

    @reminders.fetch()
    @reminders.each addToList

  createReminder: ->
    return unless @components.input.val()
    r = new Reminder
      label: @components.input.val()
      date: @components.timepicker.data().timepicker.getTime() # ugh 
    @reminders.create r
    @addToList r
 
  addToList: (r) ->
    li = $ @template r.toJSON()
    r.on 'destroy', ->
      li.remove()
    li.click =>
      r.destroy()
    @components.list.prepend li
    @components.input.val('').focus()
  
  # The scope of 'this' is the event. In order to call the 'receivedEvent'
  # function, we must explicity call 'app.receivedEvent(...);'
  onDeviceReady: ->
    # @render()
    app.render()

    # @components.input.val 'shhhsh'
    # app.addToList()
  
$ ->
  app.init()
