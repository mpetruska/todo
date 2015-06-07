{ each } = require "prelude-ls"

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

    stylus:
      compile:
        files:
          "target/stylesheets/todo.css": "src/css/todo.styl"

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
  <[
    grunt-livescript
    grunt-react
    grunt-contrib-copy
    grunt-contrib-stylus]>
  |> each (grunt.load-npm-tasks)

  # register tasks
  grunt.registerTask "default", <[livescript react stylus copy]>
