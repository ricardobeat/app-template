# Dependencies
# ------------
express = require 'express'
app = express.createServer()

app.configure ->
    app.set 'views', "#{__dirname}/views"
    app.set 'view engine', 'kiwi'
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use app.router
    app.use express.static "#{__dirname}/public"
  
app.configure 'development', ->
    app.use express.errorHandler dumpExceptions: true, showStack: true

app.configure 'production', ->
    app.use express.errorHandler()

app.get '/', (req, res) ->
    res.send 'hi'

unless module.parent
    app_port = 3000
    app.listen app_port
    console.log "Express server listening on port #{app_port}"

module.exports = app