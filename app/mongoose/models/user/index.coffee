_ = require "lodash"
crypto = require "crypto"
mongoose = require "mongoose"

schema = new mongoose.Schema

    id:

        index: true
        unique: true
        type: String
        default: ->

            crypto.randomBytes(42).toString("hex")

    username:

        index: true
        required: true
        unique: true
        type: String

    password:

        required: true
        type: String

    salt:

        type: String
        default: "§"

    name:

        type: Object
        default: ->

            first: ""
            middle: ""
            last: ""

    dob:

        type: Date
        default: null
        validate:
            validator: (v) -> v and v < new Date()
            message: "Date of birth must be in the past."

    email:

        type: String
        default: null
        validate:

            validator: (v) -> /\S+@\S+\.\S+/.test(v)
            message: "Invalid email format."

    phone:

        type: String
        default: null
        validate:

            validator: (v) -> /^\+?[0-9\s\-]{7,15}$/.test(v)
            message: "Invalid phone format."

    settings:

        type: Map
        default: ->

            camera:

                type: "perspective"
                position:

                    x: 240
                    y: 240
                    z: 120

                target:

                    x: 0
                    y: 0
                    z: 0

                near: 0.1
                far: 1000
                fov: 75

            controls:

                speed:

                    drag: 50
                    fly: 50
                    zoom: 50

                zoom:

                    min: 5
                    max: 500

            filaments:

                abs:

                    type: "abs"
                    name: "Generic ABS"
                    description: ""
                    brand: "Generic"
                    color: "#000000"
                    diameter: 1.75
                    density: 1.10
                    weight: 1000
                    cost: 0
                    fan: 0
                    temperature:

                        bed: 80
                        nozzle: 240
                        standby: 200

                    retraction:

                        speed: 45
                        distance: 5

                nylon:

                    type: "nylon"
                    name: "Generic Nylon"
                    description: ""
                    brand: "Generic"
                    color: "#000000"
                    diameter: 1.75
                    density: 1.14
                    weight: 1000
                    cost: 0
                    fan: 100
                    temperature:

                        bed: 60
                        nozzle: 245
                        standby: 175

                    retraction:

                        speed: 25
                        distance: 8

                petg:

                    type: "petg"
                    name: "Generic PETG"
                    description: ""
                    brand: "Generic"
                    color: "#000000"
                    diameter: 1.75
                    density: 1.27
                    weight: 1000
                    cost: 0
                    fan: 50
                    temperature:

                        bed: 70
                        nozzle: 240
                        standby: 200

                    retraction:

                        speed: 45
                        distance: 5

                pla:

                    type: "pla"
                    name: "Generic PLA"
                    description: ""
                    brand: "Generic"
                    color: "#000000"
                    diameter: 1.75
                    density: 1.24
                    weight: 1000
                    cost: 0
                    fan: 100
                    temperature:

                        bed: 50
                        nozzle: 200
                        standby: 180

                    retraction:

                        speed: 45
                        distance: 5

            general:

                language: "en-US"
                currency: "BTC"

            measurements:

                scale: "metric"
                angle:

                    detail: 2
                    snap: false
                    unit: "degree"

                area:

                    detail: 2
                    snap: false
                    unit:

                        imperial: "inchSq"
                        metric: "millimeterSq"

                data:

                    detail: 2
                    snap: false
                    unit: "byte"

                density:

                    detail: 2
                    snap: false
                    unit:

                        imperial: "ounceInchCu"
                        metric: "gramCentimeterCu"

                length:

                    detail: 2
                    snap: false
                    unit:

                        imperial: "inch"
                        metric: "millimeter"

                mass:

                    detail: 2
                    snap: false
                    unit:

                        imperial: "ounce"
                        metric: "gram"

                speed:

                    detail: 2
                    snap: false
                    unit:

                        imperial: "inchSecond"
                        metric: "millimeterSecond"

                temperature:

                    detail: 2
                    snap: false
                    unit: "celsius"

                time:

                    detail: 2
                    snap: false
                    unit: "millisecond"

                volume:

                    detail: 2
                    snap: false
                    unit:

                        imperial: "inchCu"
                        metric: "millimeterCu"

            panels:

                camera:

                    open: true
                    selected: ["speed"]

                lights:

                    open: false
                    selected: null

                menu:

                    open: false
                    selected: null

                meshes:

                    open: true
                    selected: null

                polygen:

                    open: false
                    selected: null

                settings:

                    open: false
                    selected: null

                shapes:

                    open: false
                    selected: ["basic", "prisms", "pyramids", "hedrons", "special"]

                shortcuts:

                    open: true
                    selected: ["box", "cylinder", "sphere", "text", "image"]

            printer:

                size: x: 250, y: 250, z: 300
                shape: "rectangular"
                centred: false
                heated:

                    volume: false
                    bed: true

                nozzles: [

                    filament: 1.75
                    diameter: 0.4
                    gantry: 25

                ]

            slicing:

                gcode: "marlin"
                adhesion: false
                support: false
                layer: 0.1
                infill:

                    density: 20
                    pattern: "cubic"

            tooltips:

                rotation: true
                bounding: false
                guidelines: true
                measurements: false
                grid:

                    volume: false
                    caps: true
                    axes:

                        x: true
                        y: true
                        z: true

                    ticks:

                        xy: true
                        xz: false
                        yz: false

                        step:

                            xy: 10
                            xz: 10
                            yz: 10

            ui:

                fullscreen: false
                title: "POLYSMITH"
                theme: "light"
                navbar: true
                forkme: false
                metabox: true
                help: true

schema.methods.refreshID = ->

    @id = crypto.randomBytes(42).toString("hex")

schema.methods.getUsername = ->

    return this.username

schema.methods.setUsername = (username) ->

    @username = username

schema.methods.getPassword = ->

    return this.password

schema.methods.setPassword = (password, saltBytes = 42) ->

    this.setSalt saltBytes # Automatically generate a new salt with each new password.

    @password = crypto.createHash("sha512").update(password + this.getSalt()).digest("hex")

schema.methods.verifyPassword = (password) ->

    return crypto.createHash("sha512").update(password + this.getSalt()).digest("hex") is this.getPassword()

schema.methods.getSalt = ->

    return this.salt

schema.methods.setSalt = (bytes = 42) ->

    @salt = crypto.randomBytes(bytes).toString("hex")

schema.methods.getName = ->

    return this.name

schema.methods.setName = (name) ->

    @name = name

schema.methods.getFirstName = ->

    return this.name.first

schema.methods.setFirstName = (name) ->

    @name.first = name

schema.methods.getMiddleName = ->

    return this.name.middle

schema.methods.setMiddleName = (name) ->

    @name.middle = name

schema.methods.getLastName = ->

    return this.name.last

schema.methods.setLastName = (name) ->

    @name.last = name

schema.methods.getDOB = ->

    return this.dob

schema.methods.setDOB = (dob) ->

    @dob = dob

schema.methods.getEmail = ->

    return this.email

schema.methods.setEmail = (email) ->

    @email = email

schema.methods.getPhone = ->

    return this.phone

schema.methods.setPhone = (phone) ->

    @phone = phone

schema.methods.updateSettings = (path, value) ->

    _.set @settings, path, value

schema.set "timestamps", true

User = mongoose.model "User", schema

module.exports = User
