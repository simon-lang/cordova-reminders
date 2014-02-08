module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # uglify:
    #   options:
    #     banner: '/*! <%= pkg.name %> <%= grunt.template.today(\'yyyy-mm-dd HH:mm:ss\') %> */\n'
    #   build:
    #     src: 'www/js/app.js'
    #     dest: 'www/js/app.min.js'

    uglify:
      options:
        mangle: false
      my_target:
        files:
          'www/js/lib.js': ['vendor/js/*.js'] #, 'bower_components/backbone/backbone.js'

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
