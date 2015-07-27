# loga

finally a reasonable logging library

```coffee
log = require 'loga'

log('debug by default')

log.trace 'trace'
log.debug 'debug'
log.info 'info'
log.warn 'warn'
log.error 'error'

# listeners
log.on 'warn', (args...) ->
  # do something with log
```

order

  - trace
  - debug
  - info
  - warn
  - error
