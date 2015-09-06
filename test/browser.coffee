b = require 'b-assert'

example = require '../src'

describe 'browser example', ->
  unless window?
    return

  it 'compares equals', ->
    res = example.compare 'a', 'a'
    b res, true
