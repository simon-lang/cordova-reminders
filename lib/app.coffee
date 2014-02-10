Router = require './router.coffee'
Backbone.history.start {pushState: true}
# Usage: http://backbonejs.org/#Router-route

window.app = module.exports =

  dom: $ '.app'

  router: new Router

  components:
    header: $ '<h1>Reminders</h1>'
    input:  $ '<input class="form-control" autofocus>'
    time:   $ '<div class="input-append bootstrap-timepicker"> <input id="timepicker1" type="text" class="input-small"> <span class="add-on"><i class="icon-time"></i></span> </div>'
    submit: $ '<button class="btn btn-primary">Submit</button>'
    list:   $ '<ul>'

  render: ->
    @dom.empty()
    for k, component of @components
      @dom.append component
    $('#timepicker1').timepicker();
    return @dom
  
  # Application Constructor
  initialize: ->
    @bindEvents()

  # Bind any events that are required on startup. Common events are:
  # 'load', 'deviceready', 'offline', and 'online'.
  bindEvents: ->
    document.addEventListener 'deviceready', @onDeviceReady, false
    addToList = _.bind @addToList, app
    @components.submit.on 'click', addToList
    @components.input.on 'keyup', (e) ->
      if e.keyCode is 13
        addToList()

  addToList: ->
    task = @components.input.val()
    return unless task
    li = $ '<li>'
    li.text task
    @components.list.prepend li
    @components.input.val('').focus()
  
  # The scope of 'this' is the event. In order to call the 'receivedEvent'
  # function, we must explicity call 'app.receivedEvent(...);'
  onDeviceReady: ->
    # @render()
    app.render()
  
$ ->
  console.log 'docready'
  app.initialize()
  # TODO: if DEBUG
  app.onDeviceReady()
