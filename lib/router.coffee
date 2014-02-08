module.exports = Backbone.Router.extend
  
  routes:
    'help':                 'help',    #help
    'search/:query':        'search',  #search/kiwis
    'search/:query/p:page': 'search'   #search/kiwis/p7

  help: ->
    console.log 'help'

  search: (query, page) ->
    console.log 'search', query, page
