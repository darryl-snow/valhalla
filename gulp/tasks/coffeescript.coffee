"use strict"

browserify = require "browserify"
buffer = require "vinyl-buffer"
notifier = require "node-notifier"
source = require "vinyl-source-stream"

# coffeeReactTransform= require "coffee-react-transform"

module.exports = (gulp, $, config) ->

	gulp.task "coffeescript", ->

		# # disable coffeelint until it can support cjsx!
		# gulp.src config.paths.js.entry + "**/*.coffee"
		# .pipe $.plumber()
		# .pipe coffeeReactTransform().on "error", $.util.log
		# .pipe $.coffeelint()
		# .pipe $.coffeelint.reporter()

		b = browserify
			entries: config.paths.js.entry + config.names.js.source
			debug: true
			transform: ["coffee-reactify"]

		b.bundle()
			.on "error", (err) ->
				notifier.notify
					message: "Error: " + err.message
				@.end()
			.pipe source config.names.js.compiled
			.pipe $.plumber()
			.pipe buffer()
			.pipe $.sourcemaps.init()
			.pipe $.sourcemaps.write()
			.pipe $.header "/* " + config.names.project + " : " + config.version + " : " + new Date() + " */"
			.pipe $.size
				showFiles: true
			.pipe gulp.dest config.paths.js.dest