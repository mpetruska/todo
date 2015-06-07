module.exports = (grunt) ->

  grunt.init-config {}=

    pkg:
      grunt.file.readJSON "package.json"

    livescript:
      javascript:
        files:
          "tmp/javascript/todoApp.jsx": "src/javascript/todoApp.lsx"
          "target/javascripts/todoStorage.js": "src/javascript/todoStorage.ls"

    react:
      javascript:
        files:
          "target/javascripts/todoApp.js": "tmp/javascript/todoApp.jsx"

    copy:
      html:
        src: "src/app.html"
        dest: "target/app.html"

      react:
        src: "src/javascript/react.min.js"
        dest: "target/javascripts/react.min.js"

      prelude:
        src: "src/javascript/prelude-browser-min.js"
        dest: "target/javascripts/prelude-browser-min.js"

      manifest:
        src: "src/app.appcache"
        dest: "target/app.appcache"        

  # load tasks
  grunt.loadNpmTasks "grunt-livescript"
  grunt.loadNpmTasks "grunt-react"
  grunt.loadNpmTasks "grunt-contrib-copy"

  # register tasks
  grunt.registerTask "default", <[livescript react copy]>
