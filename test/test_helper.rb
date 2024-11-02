require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "markdown_views"

require "minitest/autorun"


module TestHelpers

  # hack to make diffs more understandable
  # otherwise minitest sometimes truncates multi-lines diffs, making them unusable
  def mu_pp(obj)
    if obj.is_a? String
      super obj.gsub("\n", '\n').gsub("\t", '\t')
    else
      super
    end
  end

end
Minitest::Test.include TestHelpers
