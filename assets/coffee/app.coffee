define [
  "jquery"
  "underscore"
  "backbone"
  "bootstrap"
],($, _, Backbone, bootstrap)->
  initialize: ->
    self = this
    self.init()
    $(document).ready ->
      self.ready()
  init: ->
    #realtime code
    console.log "app.js init"

    (->
      method = undefined
      noop = ->

      methods = ["assert", "clear", "count", "debug", "dir", "dirxml", "error", "exception", "group", "groupCollapsed", "groupEnd", "info", "log", "markTimeline", "profile", "profileEnd", "table", "time", "timeEnd", "timeStamp", "trace", "warn"]
      length = methods.length
      console = (window.console = window.console or {})
      while length--
        method = methods[length]

        # Only stub undefined methods.
        console[method] = noop  unless console[method]
    )()

    # Google Analytics
    _gaq = [["_setAccount", "UA-38516144-1"], ["_trackPageview"]]
    ((d, t) ->
      g = d.createElement(t)
      s = d.getElementsByTagName(t)[0]
      g.src = ((if "https:" is location.protocol then "//ssl" else "//www")) + ".google-analytics.com/ga.js"
      s.parentNode.insertBefore g, s
    ) document, "script"

  ready: ->
    #document ready code
    console.log "app.js ready"
