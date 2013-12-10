#!/usr/bin/env coffee

# Load YAML data
yaml = require 'js-yaml'
data = require './curriculum.yaml'

# Globals for template code convenience
root[key] = data[key] for key of data

# TODO: check if this could go inside dust, as a helper or filter maybe
moment = require './moment-interval'
for key of data
	value = data[key]
	for i of value
		element = value[i]
		w = element.when
		if w != undefined
			interval = moment.interval(w)
			element.interval = [
				interval.start().format("MMMM YYYY")
				interval.end()  .format("MMMM YYYY")
			]


dust = require 'dustjs-linkedin'
help = require 'dustjs-helpers'

template = require './template.yaml'
# CoffeeScript = require 'coffee-script'
# for lambda of all.filters
#     dust.filters[lambda] = CoffeeScript.eval(all.filters[lambda])
for partial of template.partials
    dust.loadSource dust.compile template.partials[partial], partial

# Disable white space compression
# dust.optimizers.format = (ctx, node) -> node

compiled = dust.compile template.view, "template"
dust.loadSource compiled
dust.render "template", data, (err, html) ->
    # Save file
    fs = require 'fs'
    fs.writeFile '../out/curriculum.html', html, ->
        console.log "Done compiling! :D"
