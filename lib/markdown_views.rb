require 'action_view'
require 'commonmarker'
require 'rails'
require 'rouge'
require 'securerandom'

%w(config engine handler renderer version).each do |f|
  require "markdown_views/#{f}"
end

ActionView::Template.register_template_handler(:md, MarkdownViews::Handler)
