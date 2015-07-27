assert = require 'assert'

log = require '../src'

describe 'loga', ->
  it 'logs debug default', ->
    log 'debug default'

  it 'logs trace', ->
    log.trace 'trace'

  it 'logs debug', ->
    log.debug 'debug'

  it 'logs info', ->
    log.info 'info'

  it 'logs warn', ->
    log.warn 'warn'

  it 'logs error', ->
    log.error 'error'

  it 'obeys level', ->
    originalLevel = log.level
    log.level = 'warn'
    log.trace 'THIS SHOULD NOT LOG'
    log.debug 'THIS SHOULD NOT LOG'
    log.info 'THIS SHOULD NOT LOG'
    log.warn 'warn level'
    log.error 'error level'
    log.level = originalLevel

  it 'obeys null level', ->
    originalLevel = log.level
    log.level = null
    log.trace 'THIS SHOULD NOT LOG'
    log.debug 'THIS SHOULD NOT LOG'
    log.info 'THIS SHOULD NOT LOG'
    log.warn 'THIS SHOULD NOT LOG'
    log.error 'THIS SHOULD NOT LOG'
    log.level = originalLevel

  it 'binds listeners', (done) ->
    log.on 'info', (msg) ->
      assert.equal msg, 'test'
      done()
    log.debug 'none'
    log.info 'test'
