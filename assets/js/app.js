define(["jquery", "underscore", "backbone", "bootstrap"], function($, _, Backbone, bootstrap) {
  return {
    initialize: function() {
      var self;

      self = this;
      self.init();
      return $(document).ready(function() {
        return self.ready();
      });
    },
    init: function() {
      var _gaq;

      console.log("app.js init");
      (function() {
        var console, length, method, methods, noop, _results;

        method = void 0;
        noop = function() {};
        methods = ["assert", "clear", "count", "debug", "dir", "dirxml", "error", "exception", "group", "groupCollapsed", "groupEnd", "info", "log", "markTimeline", "profile", "profileEnd", "table", "time", "timeEnd", "timeStamp", "trace", "warn"];
        length = methods.length;
        console = (window.console = window.console || {});
        _results = [];
        while (length--) {
          method = methods[length];
          if (!console[method]) {
            _results.push(console[method] = noop);
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      })();
      _gaq = [["_setAccount", "UA-38516144-1"], ["_trackPageview"]];
      return (function(d, t) {
        var g, s;

        g = d.createElement(t);
        s = d.getElementsByTagName(t)[0];
        g.src = ("https:" === location.protocol ? "//ssl" : "//www") + ".google-analytics.com/ga.js";
        return s.parentNode.insertBefore(g, s);
      })(document, "script");
    },
    ready: function() {
      return console.log("app.js ready");
    }
  };
});
