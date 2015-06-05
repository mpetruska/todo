module.exports = (grunt) ->

  grunt.init-config {}=

    pkg:
      grunt.file.readJSON "package.json"

    livescript:
      javascript:
        files:
          "tmp/javascript/todoApp.jsx": "src/javascript/todoApp.lsx"

    react:
      javascript:
        files:
          "target/javascripts/todoApp.js": "tmp/javascript/todoApp.jsx"

    copy:
      html:
        src: "src/app.html"
        dest: "target/app.html"

      javascript:
        src: "src/javascript/react.min.js"
        dest: "target/javascripts/react.min.js"

  # load tasks
  grunt.loadNpmTasks "grunt-livescript"
  grunt.loadNpmTasks "grunt-react"
  grunt.loadNpmTasks "grunt-contrib-copy"

  # register tasks
  grunt.registerTask "default", <[livescript react copy]>
