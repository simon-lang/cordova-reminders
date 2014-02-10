DEBUG = process.env.NODE_ENV is 'development'

module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    uglify:
      options:
        mangle: false
        banner: '/*! <%= pkg.name %> <%= grunt.template.today(\'yyyy-mm-dd HH:mm:ss\') %> */\n'
      prod:
        src: ['www/js/lib.js', 'www/js/app.js']
        dest: 'www/js/app.min.js'
      lib:
        files:
          'www/js/lib.js': [
            'bower_components/jquery/jquery.js'
            'bower_components/underscore/underscore.js'
            'bower_components/backbone/backbone.js'
            'bower_components/bootstrap-timepicker/js/bootstrap-timepicker.js'
          ]

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
        files: ['lib/*.coffee']
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
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-browserify'  
  
  grunt.registerTask 'default', ['browserify', 'stylus', 'jade', 'autoprefixer', 'uglify']
  grunt.registerTask 'build', ['browserify', 'stylus', 'jade', 'autoprefixer', 'uglify']
