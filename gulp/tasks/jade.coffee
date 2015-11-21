"use strict"

module.exports = (gulp, $, config) ->

	gulp.task "jade", ->

		gulp.src config.paths.html.entry + "*.jade"
		.pipe $.plumber()
		.pipe $.jade
			pretty: true
			data:
				description: config.description
				keywords: config.keywords
		.pipe gulp.dest config.paths.html.dest