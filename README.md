# Fishbone

Fishbone is an HTML5-Bootstrap boilerplate web application with django backend.
It is designed to run on Google App Engine and is based on [django-on-appengine](https://github.com/aurorasoftware/django-on-appengine).


----

### Installation

1. Download the App Engine SDK.
2. Install it.
3. Clone the repo, and run `dev_appserver.py .`.
4. Congratulations, you are now running fishbone on App Engine!

----

### Using Fishbone with Grunt

[Grunt](http://gruntjs.com/) support is built into Fishbone, all you need to do is as follow:

1. Run `npm install --save-dev` to install grunt task dependencies.
2. Configure `Gruntfile.coffee` as you wish (optional).
3. Run `grunt dev` to build client-side sources of fishbone for development environments.

----

### Customization 

In order to customize client-side code, you need to modify resources under `assets` directory and then build it using grunt.

----
