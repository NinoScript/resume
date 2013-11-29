#!/usr/bin/env coffee

# Load YAML data
yaml = require 'js-yaml'
data = require './curriculum.yaml'

# Globals for template code convenience
root[key] = data[key] for key of data

# Render Jade file
jade = require 'jade'
html = jade.renderFile './template.jade', pretty: true

# Save file
fs = require 'fs'
fs.writeFile './curriculum.html', html
