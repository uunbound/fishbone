#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    # Metadata.
    pkg: grunt.file.readJSON("package.json")
    banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */\n"

    resource:
      path: "assets"
      js: "<%= resource.path %>/js"
      css: "<%= resource.path %>/css"
      less: "<%= resource.path %>/less"
      img: "<%= resource.path %>/img"
      font: "<%= resource.path %>/font"
      coffee: "<%= resource.path %>/coffee"

    dist:
      path: "static"
      js: "<%= dist.path %>/js"
      css: "<%= dist.path %>/css"
      img: "<%= dist.path %>/img"
      font: "<%= dist.path %>/font"

    # Task configuration.
    clean:
      all: ["<%= dist.path %>/*"],

    concat:
      options:
        stripBanners: true
        separator: ";"

      dist:
        src: ["<%= resource.js %>/lib/almond-0.2.5.js", "<%= resource.js %>/lib/require-2.1.5.min.js"]
        dest: "<%= dist.js %>/require.js"

    uglify:
      dist:
        src: "<%= concat.dist.dest %>"
        dest: "<%= dist.js %>/require.js"

    jshint:
      options:
        curly: true
        eqeqeq: true
        immed: true
        latedef: true
        newcap: true
        noarg: true
        sub: true
        undef: true
        unused: true
        boss: true
        eqnull: true
        globals: {}

      gruntfile:
        src: "Gruntfile.js"

      lib_test:
        src: ["lib/**/*.js", "test/**/*.js"]

    coffee:
      app:
        expand: true
        src: ["*.coffee"]
        dest: "<%= resource.js %>/"
        cwd: "<%= resource.coffee %>/"
        ext: ".js"
        options:
          bare: true

    less:
      dev:
        options:
          paths: ["<%= resource.less %>"]

        files:
          "<%= resource.css %>/theme.css": "<%= resource.less %>/theme.less"
          "<%= resource.css %>/theme-responsive.css": "<%= resource.less %>/theme-responsive.less"

    cssmin:
      minify:
        expand: true
        cwd: "<%= resource.css %>"
        src: ["*.css", "!*.min.css"]
        dest: "<%= dist.css %>"
        ext: ".min.css"

    requirejs:
      dev:
        options:
          # almond: true
          # modules: [{name: 'config'}],
          optimize: "none"
          name: "main"
          baseUrl: "<%= resource.js %>"
          out: "<%= resource.js %>/main.compiled.js"
          mainConfigFile: "<%= resource.js %>/main.js"
      prod:
        options:
          # almond: true
          # modules: [{name: 'config'}],
          name: "main"
          baseUrl: "<%= resource.js %>"
          out: "<%= resource.js %>/main.compiled.js"
          mainConfigFile: "<%= resource.js %>/main.js"

    watch:
      gruntfile:
        files: "<%= jshint.gruntfile.src %>"
        tasks: ["jshint:gruntfile"]

      less:
        files: "<%= resource.less %>/*.less"
        tasks: ["less"]

      coffee:
        files: "<%= resource.coffee %>/*.coffee"
        tasks: ["coffee"]

    copy:
      dev:
        files: [
          flatten: true
          expand: true
          src: ["<%= resource.js %>/lib/*.js"]
          dest: "<%= dist.js %>/lib/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.js %>/lib/require.js"]
          dest: "<%= dist.js %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.js %>/main.compiled.js"]
          dest: "<%= dist.js %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.css %>/normalize.css"]
          dest: "<%= dist.css %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.css %>/theme.css"]
          dest: "<%= dist.css %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.css %>/theme-responsive.css"]
          dest: "<%= dist.css %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.css %>/main.css"]
          dest: "<%= dist.css %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.img %>/*"]
          dest: "<%= dist.img %>/"
        ]
      prod:
        files: [
          flatten: true
          expand: true
          src: ["<%= resource.js %>/lib/*.js"]
          dest: "<%= dist.js %>/lib/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.js %>/lib/require.js"]
          dest: "<%= dist.js %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.js %>/main.compiled.js"]
          dest: "<%= dist.js %>/"
        ,
          flatten: true
          expand: true
          src: ["<%= resource.img %>/*"]
          dest: "<%= dist.img %>/"
        ]

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-requirejs"
  grunt.loadNpmTasks "grunt-contrib-watch"

  # Default task.
  grunt.registerTask "default", ["clean", "jshint", "less", "coffee"]
  grunt.registerTask "dev", ["default", "requirejs:dev", "copy:dev"]
  grunt.registerTask "prod", ["default", "requirejs:prod", "cssmin", "copy:prod"]
