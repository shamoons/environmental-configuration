fs = require 'fs'

configurator = (configFilePath) ->
  baseConf = JSON.parse fs.readFileSync "#{configFilePath}/base.json", 'ascii'


(->
  deepExtend = undefined
  fs = undefined
  parseEnvConfig = undefined
  __slice_ = Array::slice
  __hasProp_ = Object::hasOwnProperty
  fs = require("fs")
  deepExtend = ->
    extenders = undefined
    key = undefined
    object = undefined
    other = undefined
    val = undefined
    _i = undefined
    _len = undefined
    object = arguments_[0]
    extenders = (if 2 <= arguments_.length then __slice_.call(arguments_, 1) else [])

    return {}  unless object?
    _i = 0
    _len = extenders.length

    while _i < _len
      other = extenders[_i]
      for key of other
        continue  unless __hasProp_.call(other, key)
        val = other[key]
        if (object[key]?) or typeof val isnt "object"
          object[key] = val
        else
          object[key] = deepExtend(object[key], val)
      _i++
    object

  parseEnvConfig = ->
    baseConf = undefined
    confData = undefined
    confFile = undefined
    env = undefined
    envConf = undefined
    baseConf = JSON.parse(fs.readFileSync(__dirname + "/local.json", "ascii"))
    env = process.env.NODE_ENV or "local"
    try
      confFile = __dirname + ("/" + env + ".json")
      confData = fs.readFileSync(confFile, "ascii")
    catch err
      throw new Error("Unable to read config file: " + confFile + ". Please check your NODE_ENV environment variable")
    try
      envConf = JSON.parse(confData)
    catch err
      throw new Error("Unable to parse JSON from file: " + confFile + ", error: " + err.message)
    deepExtend baseConf, envConf

  module.exports = parseEnvConfig()
  return
).call this