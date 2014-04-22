DEBUG = process.env.NODE_ENV is 'development'

module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    cssmin:
      combine:
        files:
          'www/css/lib.css': [
            'bower_components/bootstrap/docs/assets/css/bootstrap.css'
            'bower_components/bootstrap-timepicker/css/bootstrap-timepicker.css'
          ]

    uglify:
      options:
        mangle: false
        banner: '/*! <%= pkg.name %> <%= grunt.template.today(\'yyyy-mm-dd HH:mm:ss\') %> */\n'
      lib:
        files:
          'www/js/lib.js': [
            # 'plugins/com.phonegap.plugins.PushPlugin/www/PushNotification.js'
            'bower_components/jquery/jquery.js'
            'bower_components/underscore/underscore.js'
            'bower_components/backbone/backbone.js'
            'bower_components/backbone.localStorage/backbone.localStorage.js'
            'bower_components/bootstrap-timepicker/js/bootstrap-timepicker.js'
          ]
      prod:
        src: ['www/js/lib.js', 'www/js/app.js']
        dest: 'www/js/app.min.js'

    stylus:
      compile:
        options:
          compress: !DEBUG
        files:
          'www/css/main.css': 'lib/styles/main.styl'

    browserify:
      dist:
        files:
          'www/js/app.js': ['lib/**/*.coffee']
        options:
          extensions: '.coffee'
          transform: ['coffeeify']

    jade:
      compile:
        options:
          data:
            DEBUG: DEBUG
        files:
          'www/index.html': ['lib/index.jade']

    autoprefixer:
      options: {}     
      no_dest:
        src: "www/css/main.css"

    watch:
      stylus:
        files: ['lib/styles/*.styl']
        tasks: ['stylus']
      browserify:
        files: ['lib/**/*.coffee']
        tasks: ['browserify']
      jade:
        files: ['lib/*.jade', 'lib/templates/*.jade']
        tasks: ['jade']
      livereload:
        options:
          livereload: true
        files: [
          'www/css/main.css'
          'www/index.html'  # todo: having this forces full reload on style change :(
          'www/js/app.js'
        ]
  
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-browserify'  
  
  grunt.registerTask 'default', ['cssmin', 'browserify', 'stylus', 'jade', 'autoprefixer', 'uglify']
