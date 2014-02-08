DEBUG = process.env.NODE_ENV is 'development'

module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    uglify:
      options:
        mangle: false
        banner: '/*! <%= pkg.name %> <%= grunt.template.today(\'yyyy-mm-dd HH:mm:ss\') %> */\n'
      app:
        src: 'www/js/app.js'
        dest: 'www/js/app.min.js'
      lib:
        files:
          'www/js/lib.js': [
            'bower_components/jquery/jquery.js'
            'bower_components/underscore/underscore.js'
            'bower_components/backbone/backbone.js'
          ]

    stylus:
      compile:
        files:
          'www/css/styles.css': 'lib/styles/styles.styl'

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
            debug: false
        files:
          'www/index.html': ['lib/index.jade']

    autoprefixer:
      options: {}     
      no_dest:
        src: "www/css/styles.css"

    watch:
      stylus:
        files: ['lib/styles/*.styl']
        tasks: ['stylus']
      browserify:
        files: ['lib/*.coffee']
        tasks: ['browserify']
      jade:
        files: ['www/*.jade']
        tasks: ['jade']
      livereload:
        options:
          livereload: true
        files: [
          'www/css/styles.css'
          'www/index.html'
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
