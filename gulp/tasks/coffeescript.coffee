"use strict"

# coffeeReactTransform= require "coffee-react-transform"

module.exports = (gulp, $, config) ->

	gulp.task "coffeescript", ->

		# gulp.src config.paths.js.entry + "**/*.coffee"
		# .pipe $.plumber()
		# .pipe coffeeReactTransform().on "error", $.util.log
		# .pipe $.coffeelint()
		# .pipe $.coffeelint.reporter()

		gulp.src config.paths.js.entry + config.names.js.source, read: false
		.pipe $.plumber()
		.pipe $.sourcemaps.init()
		.pipe $.browserify
			transform: ["coffee-reactify"]
			# transform: ["coffeeify"]
			# shim:
			# 	jQuery:
			# 		path: Config.src + "lib/jquery/dist/jquery.js"
			# 		exports: "$"
		.pipe $.sourcemaps.write()
		.pipe $.rename config.names.js.compiled
		.pipe $.header "/* " + config.names.project + " : " + config.version + " : " + new Date() + " */"
		.pipe $.size
			showFiles: true
		.pipe gulp.dest config.paths.js.dest