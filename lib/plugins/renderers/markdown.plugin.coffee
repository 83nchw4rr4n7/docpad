# Requires
DocpadPlugin = require "#{__dirname}/../../plugin.coffee"
markdown = require 'github-flavored-markdown'

# Define Plugin
class MarkdownPlugin extends DocpadPlugin
	# Plugin name
	name: 'markdown'

	# Plugin priority
	priority: 700

	# Render some content
	render: ({inExtension,outExtension,templateData,file}, next) ->
		tru
			if inExtension in ['md','markdown']
				file.content = markdown.parse file.content
				next()
			else
				next()
		catch err
			return next(err)

# Export Plugin
module.exports = MarkdownPlugin