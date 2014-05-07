expect = require 'expect.js'

configurator = require '../src'

config = configurator './config'

describe 'configurator', ->
  it 'should load the base.json file', ->
    console.log config
    expect(add).to.be.a('function');
#   });

#   it('should do math', function () {
#     expect(add(1, 3)).to.equal(4);
#   });
# });