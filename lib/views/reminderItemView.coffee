module.exports = Backbone.View.extend
  
  template: _.template $('#reminder-template').html()

  tagName: 'li'
  className: 'reminder-item'

  events:
    'click .icon-edit':   'edit'
    'click .icon-remove': 'destroy'

  initialize: ->
    @listenTo @model, 'change', @render
    @listenTo @model, 'destroy', @remove

  edit: ->
    console.log 'edit', @model.get 'id'

  destroy: ->
    @model.destroy()

  render: ->
    @$el.html @template @model.attributes
