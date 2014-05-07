# environmental-configuration

Adapter to select an appropriate configuration file based on an Environment

## Install

```
npm install environmental-configuration --save
```

## Usage

```
config = require('environmental-configuration')('./config')
```

`./config` should be the path to your configuration relative to the file that is calling it. Within that folder, you need to have at least one file called `base.json`. For your other environments, they need to be named `**env**`.json.