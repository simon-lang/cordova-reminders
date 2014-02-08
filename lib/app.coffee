app =

  dom: $ '.app'

  components:
    header: $ '<h1>Reminders</h1>'
    input:  $ '<input class="form-control" autofocus>'
    submit: $ '<button class="btn btn-primary">Submit</button>'
    list:   $ '<ul>'

  render: ->
    @dom.empty()
    for k, component of @components
      @dom.append component
  
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
    # app.receivedEvent "deviceready"
    # @render()
    app.render()
  
$ ->
  app.initialize()
  # THIS NEXT LINE purely for debug/testing
  # app.onDeviceReady()
