"use strict"

module.exports = (gulp, $, config) ->

	gulp.task "prod-build", ->

		config.env = "prod"

	gulp.task "prod", ["prod-build", "build"], ->

		# usemin to go through html and replace references to all assets with minified and hashed versions
		gulp.src config.paths.html.dest + "/*.html"
		.pipe $.usemin
			css: [
				$.minifyCss
				$.uncss
					html: config.paths.html.dest + "/*.html"
				$.rev
				$.size
					showFiles: true
			]
			js: [
				$.uglify()
				$.rev()
				$.size
					showFiles: true
			]
			html:[$.htmlmin collapseWhitespace: true]
		.pipe gulp.dest config.paths.build