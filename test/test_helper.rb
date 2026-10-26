require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
require "rails/test_help"


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

  def cm_version
    @cm_version ||= Gem::Version.new Commonmarker::VERSION
  end

end
Minitest::Test.include TestHelpers
