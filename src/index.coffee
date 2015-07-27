logger = -> logger.debug.apply logger, arguments
logger.level = 'trace'

levels = ['trace', 'debug', 'info', 'warn', 'error']
listeners = {}

log = (level, args) ->
  if levels.indexOf(logger.level) is -1 or
  levels.indexOf(level) < levels.indexOf(logger.level)
    return null

  fn = console[level] or console.log or -> null
  fn.apply console, args
  if listeners[level]
    for listener in listeners[level]
      listener args...

for level in levels
  logger[level] = do (level) ->
    (args...) ->
      log level, args

logger.on = (key, fn) ->
  listeners[key] ?= []
  listeners[key].push fn

module.exports = logger
