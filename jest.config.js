module.exports = {
    projects: [
        {
            displayName: 'jsdom-tests',
            testEnvironment: 'jest-environment-jsdom',
            moduleFileExtensions: ["js", "json", "coffee"],
            transform: {
                "^.+\\.coffee$": "./jest-transformer.js"
            },
            testMatch: [
                "<rootDir>/app/scripts/**/?(*.)+(spec|test).coffee"
            ]
        },
        {
            displayName: 'node-tests',
            testEnvironment: 'jest-environment-node',
            moduleFileExtensions: ["js", "json", "coffee"],
            transform: {
                "^.+\\.coffee$": "./jest-transformer.js"
            },
            testMatch: [
                "<rootDir>/app/mongoose/**/?(*.)+(spec|test).coffee"
            ]
        }
    ]
}