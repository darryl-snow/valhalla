"use strict"

critical = require "critical"
notifier = require "node-notifier"

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
		.pipe $.rev.manifest()
		.pipe gulp.dest config.paths.css.dest

		setTimeout ->

			manifest = require("../../public/styles/rev-manifest.json")
			cssFile = manifest["styles/main.min.css"]

			critical.generate
				base: config.paths.build + "/"
				css: [config.paths.build + "/" + cssFile]
				dest: config.paths.build + "/" + config.names.html.compiled
				extract: false
				height: 900
				inline: true
				minify: true
				src: config.names.html.compiled
				width: 1300
			, (err, output) ->

				$.util.log $.util.colors.green "Critical CSS inlined!"

				if err

					notifier.notify
						message: "Error: " + err.message

					$.util.log $.util.colors.red err.message

		, 10000