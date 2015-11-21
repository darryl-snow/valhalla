"use strict"

module.exports = (gulp, $, config) ->

	gulp.task "copy-files", ->

		gulp.src config.paths.fonts.entry
		.pipe gulp.dest config.paths.fonts.dest