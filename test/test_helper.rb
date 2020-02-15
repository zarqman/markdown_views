require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "markdown_views"

require "minitest/autorun"
