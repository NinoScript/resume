#!/usr/bin/env coffee

# Load YAML data
yaml = require 'js-yaml'
data = require './curriculum.yaml'

# Globals for template code convenience
root[key] = data[key] for key of data

moment = require './moment-interval'
for key of data
	value = data[key]
	for i of value
		element = value[i]
		w = element.when
		if w != undefined
			console.log w
			interval = moment.interval(w)
			element.interval = [
				interval.start().format("MMMM YYYY")
				interval.end()  .format("MMMM YYYY")
			]

# Render Jade file
jade = require 'jade'
html = jade.renderFile './template.jade', pretty: true

# Save file
fs = require 'fs'
fs.writeFile '../out/curriculum.html', html
