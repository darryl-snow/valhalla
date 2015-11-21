"use strict"

module.exports = (gulp, $, config) ->

	gulp.task "stylus", ->

		gulp.src config.paths.css.entry + config.names.css.source
		.pipe $.plumber()
		.pipe $.sourcemaps.init()
		.pipe $.stylus()
		.pipe $.sourcemaps.write()
		.pipe $.autoprefixer "last 2 versions", "> 1%"
		.pipe $.rename config.names.css.compiled
		.pipe $.header "/* " + config.names.project + " : " + config.version + " : " + new Date() + " */"
		.pipe $.size
			showFiles: true
		.pipe gulp.dest config.paths.css.dest

		gulp.src config.paths.css.entry + "**/*.styl"
		.pipe $.plumber()
		.pipe $.dss
			output: "index.html"
			templatePath: config.paths.css.entry + "styleguide"
		.pipe gulp.dest config.paths.css.dest