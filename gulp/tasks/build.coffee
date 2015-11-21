"use strict"

module.exports = (gulp, $, config) ->

	gulp.task "build", ["coffeescript", "stylus", "copy-files", "jade", "libs"], ->