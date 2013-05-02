require.config({
  paths: {
    "jquery": "lib/jquery-1.9.1.min",
    "underscore": "lib/underscore-1.4.4.min",
    "backbone": "lib/backbone-1.0.0.min",
    "bootstrap": "lib/bootstrap-2.3.1.min",
    "modernizer": "lib/modernizr-2.6.2.min"
  },
  shim: {
    underscore: {
      exports: '_'
    }
  },
  backbone: {
    deps: ["underscore", "jquery"],
    exports: "Backbone"
  },
  bootstrap: {
    deps: ["jquery"]
  }
});

require(["app"], function(app) {
  return app.initialize();
});
