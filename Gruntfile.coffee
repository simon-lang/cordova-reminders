module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today(\'yyyy-mm-dd\') %> */\n'
      build:
        src: 'www/js/app.js'
        dest: 'www/js/app.min.js'

    stylus:
      compile:
        files:
          'www/css/styles.css': 'www/css/styles.styl' # 1:1 compile

    coffee:
      compile:
        options:
          bare: true
        files:
          'www/js/app.js': ['lib/*.coffee']

    jade:
      compile:
        options:
          data:
            debug: false
        files:
          'www/index.html': ['www/index.jade']

    watch:
      stylus:
        files: ['www/css/*.styl']
        tasks: ['stylus']
      coffee:
        files: ['lib/*.coffee']
        tasks: ['coffee']
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
  
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  
  grunt.registerTask 'default', ['coffee', 'stylus', 'jade', 'uglify']
