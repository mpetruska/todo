module.exports = (grunt) ->

  grunt.init-config {}=

    pkg:
      grunt.file.readJSON "package.json"

    livescript:
      src:
        files:
          "tmp/javascript/todoApp.jsx": "src/javascript/todoApp.lsx"

    react:
      src:
        files:
          "target/javascript/todoApp.js": "tmp/javascript/todoApp.jsx"

  # load tasks
  grunt.loadNpmTasks \grunt-livescript
  grunt.loadNpmTasks \grunt-react

  # register tasks
  grunt.registerTask \default, <[livescript react]>
