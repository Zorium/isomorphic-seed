b = require 'b-assert'

example = require '../src'

describe 'server example', ->
  if window?
    return

  it 'compares equals', ->
    res = example.compare 'a', 'a'
    b res, true
