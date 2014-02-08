express = require 'express'

app = express()

# jade views
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/lib'

app.use express.static __dirname + '/www'

app.get '/', (req, res) ->
  res.render 'index'

app.listen '3000'
