fs = require 'fs'
_ = require 'lodash'
path = require 'path'

configurator = (configFilePath) ->
  env = process.env.NODE_ENV or 'base'
  configEnvironments = ['base', env]

  configs = []
  _.forEach configEnvironments, (configEnvironment) ->
    try
      confFile = path.join configFilePath, "#{env}.json"
      confData = JSON.parse fs.readFileSync confFile, 'ascii'
      configs = _.assign configs, confData
    catch err
      throw new Error(err.message)

  configs

module.exports = configurator