b = require 'b-assert'

example = require '../src'

describe 'example', ->
  it 'compares equals', ->
    res = example.compare 'a', 'a'
    b res, true

  it 'compares non-equals', ->
    res = example.compare 'b', 'a'
    b res, false
