# require 'active_support/core_ext/module/attribute_accessors'
require 'action_view'
require 'cgi'
require 'coderay'
require 'redcarpet'

%w(config engine handler renderer version).each do |f|
  require "markdown_views/#{f}"
end

ActionView::Template.register_template_handler(:md, MarkdownViews::Handler)
