module.exports = Backbone.View.extend
  
  template: _.template $('#reminder-template').html()

  # tagName: 'li'

  # className: 'document-row'

  events:
    # 'click .icon':          'open'
    # 'click .button.edit':   'openEditDialog'
    'click .icon-remove': 'destroy'

  initialize: ->
    @listenTo @model, 'change', @render
    @listenTo @model, 'destroy', @remove

  destroy: ->
    @model.destroy()

  render: ->
    @$el.html @template @model.attributes
