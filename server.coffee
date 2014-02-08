express = require 'express'

env = process.env.NODE_ENV
DEBUG = env is 'development'

app = express()

# jade views
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/lib'

app.use express.static __dirname + '/www'

app.get '/:route', (req, res) ->
  res.render 'index', {DEBUG}

port = 3000
app.listen port

console.log 'Server listening on port', port
