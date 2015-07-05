# Uncomment if IE9 support required
# window.console = {} unless window.console
# if !window.console.log then window.console.log = ->
# if !window.console.info then window.console.info = ->
# if !window.console.error then window.console.error = ->

# Lovely welcome message
console.log "%c Welcome to <Project> ", """
background: #3498db;
color: #ffffff;
font-size: 18px;
font-family: 'Helvetica Neue';
font-weight: 300;
line-height: 30px;
height: 30px;
padding: 5px;
"""

# 3rd party libraries
# require "library"

# Custom modules
require "./modules/module.coffee"