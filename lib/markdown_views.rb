require 'action_view'
require 'commonmarker'
require 'rouge'

%w(config engine handler renderer version).each do |f|
  require "markdown_views/#{f}"
end

if ActionView.version < Gem::Version.new('6.0.0.a')
  ActionView::Template.register_template_handler(:md, MarkdownViews::Handler52)
else
  ActionView::Template.register_template_handler(:md, MarkdownViews::Handler)
end
