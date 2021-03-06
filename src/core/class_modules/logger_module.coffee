Frames = window.Frames || require('framework')
Echo = window.Echo

LEVELS = 'debug info warn error'.split(' ')

LoggerModule =

  included: (klass) ->
    @echo ?= Echo()
    klass.extend @

  log: (text, options = {}) ->
    @logger(text, options)

  logger: (args...) ->
    LoggerModule.echo(args...)

for level in LEVELS
  LoggerModule[level] = (text, options) ->
    @log(text, Object.extended(options).clone().merge {level})

Frames.export('framework/logger_module', LoggerModule)
