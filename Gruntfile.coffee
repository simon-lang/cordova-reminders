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
        # options:
          # paths: ['path/to/import']
          # urlfunc: 'embedurl' # use embedurl('test.png') in our code to trigger Data URI embedding
          # use: [require('fluidity')] # use stylus plugin at compile time
          # #  @import 'foo', 'bar/moo', etc. into every .styl file
          #  that is compiled. These might be findable based on values you gave
          # import: ['foo', 'bar/moo'] #  to `paths`, or a plugin you added under `use`
        files:
          'www/css/styles.css': 'www/css/styles.styl' # 1:1 compile
          # 'path/to/another.css': ['path/to/sources/*.styl', 'path/to/more/*.styl'] # compile and concat into single file
    coffee:
      compile:
        options:
          bare: true
        files:
          'www/js/app.js': ['lib/*.coffee']
  
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  
  grunt.registerTask 'default', ['uglify']
