mongoose = require "mongoose"

class Mongoose

    constructor: (database = "polysmith", platform = "express", host = "mongodb", port = "27017") ->

        @protocol = "mongodb://"
        @database = database
        @platform = platform
        @host = host
        @port = port

        @uri = this.protocol + this.host + ":" + this.port + "/" + this.database

    connect: ->

        mongoose.connect this.uri
                .then => console.log "Mongoose listening at " + this.protocol + this.host + ":" + this.port
                .catch (error) => console.error "MongoDB Connection Error", error

    disconnect: ->

        mongoose.connection.close()

module.exports = Mongoose
