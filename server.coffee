express = require 'express'

app = express()

# jade views
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/lib'

app.use express.static __dirname + '/www'

app.get '/', (req, res) ->
  res.render 'index'

port = 3000
app.listen port

console.log 'Server listening on port', port
