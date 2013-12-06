resume
======

YAML resume, compiled with node.js

This project was inspired by [Ming-Ho Yee's][mhyee] and [David Hu's][divad12] resume projects.

Dependencies
------------

* [Watch][watch], not strictly neccesary, but takes care of the compiling phase
* CoffeeScript, the `coffee` compiler is needed
* Node.js, the following modules are used:
	* Jade
	* JS-YAML
	* Moment-Interval

Usage
-----

Manually, each time something changes:

	$ ./compile.coffee && open curriculum.html

Or using `watch`:

	$ watch

[mhyee]:   https://github.com/mhyee/resume
[divad12]: https://github.com/divad12/resume
[watch]:   https://github.com/NinoScript/watch
