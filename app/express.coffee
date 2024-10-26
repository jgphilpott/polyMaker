Mongoose = require "./mongoose"
express = require "express"

Socket = require "./socket"
http = require "http"

path = require "path"

protocol = "https://"
platform = "express"
host = "127.0.0.1"
port = "4000"

app = express()
app.use express.json()

mongoose = new Mongoose().connect()
server = http.createServer app
socket = new Socket server

app.set "view engine", "pug"
app.set "views", path.join(__dirname, "templates")

app.use express.static path.join(__dirname, "")

app.get "/", (request, responce) =>

    responce.redirect "/anvil"

app.get "/anvil", (request, responce) =>

    responce.render "pages/anvil", platform: platform

app.get "/docs", (request, responce) =>

    responce.render "pages/docs", platform: platform

app.get "/tutorials", (request, responce) =>

    responce.render "pages/tutorials", platform: platform

server.listen port, =>

    console.log "Polysmith listening at " + protocol + host + ":" + port
