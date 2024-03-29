// Generated by CoffeeScript 1.7.1
(function() {
  var configurator, fs, path, _;

  fs = require('fs');

  _ = require('lodash');

  path = require('path');

  configurator = function(configFilePath) {
    var configEnvironments, configs, env;
    env = process.env.NODE_ENV || 'base';
    configEnvironments = ['base', env];
    configs = [];
    _.forEach(configEnvironments, function(configEnvironment) {
      var confData, confFile, err;
      try {
        confFile = path.join(configFilePath, "" + env + ".json");
        confData = JSON.parse(fs.readFileSync(confFile, 'ascii'));
        return configs = _.assign(configs, confData);
      } catch (_error) {
        err = _error;
        throw new Error(err.message);
      }
    });
    return configs;
  };

  module.exports = configurator;

}).call(this);
