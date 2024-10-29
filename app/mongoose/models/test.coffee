User = require "./user"
crypto = require "crypto"
mongoose = require "mongoose"

describe "Polysmith Models", ->

    beforeAll ->

        await mongoose.connect "mongodb://localhost:27017/testing"

        await mongoose.connection.db.collection("users").deleteMany({})
        await mongoose.connection.db.collection("users").dropIndexes()

        await User.init()

    afterAll ->

        await mongoose.connection.db.dropDatabase()

        await mongoose.disconnect()

    describe "User Model", ->

        it "should enforse the required inputs of username and password", ->

            user = new User {}

            try

                await user.validate()

            catch error

                expect(error.errors.username).toBeDefined()
                expect(error.errors.password).toBeDefined()

            user = new User

                username: "Testname"
                password: "Testword"

            try

                await user.validate()

                expect(user.id).toBeDefined()

                expect(user.username).toBeDefined()
                expect(user.password).toBeDefined()

            catch error

                expect(error.errors.username).not.toBeDefined()
                expect(error.errors.password).not.toBeDefined()

                console.log error

            await user.save()

        it "should not allow duplicate usernames", ->

            user = new User

                username: "Testname"
                password: "Testword"

            try

                await user.save()

            catch error

                expect(error.code).toBe(11000) # Duplicate Key Error

        it "should genorate a new salt and hash the given password", ->

            user = await User.findOne({username: "Testname"})

            salt = user.getSalt()
            testword = user.getPassword()

            user.setPassword testword

            expect(user.salt).not.toBe salt

            expect(user.id).toBeDefined()
            expect(user.id.length).toBe 84

            expect(user.salt).toBeDefined()
            expect(user.salt.length).toBe 84

            expect(user.password).toBeDefined()
            expect(user.password.length).toBe 128

            expect(user.salt).not.toBe "§"
            expect(user.password).not.toBe testword

            expect(user.password).toBe crypto.createHash("sha512").update(testword + user.getSalt()).digest("hex")
