require './setup'

app = require '../lib/app'

describe 'App', ->
  it 'render() should return dom', ->
    dom = app.render()
    console.log dom.html()
    
    dom.hasClass('app').should.eql true
    # not working because we're using existing dom element
