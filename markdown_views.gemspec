# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markdown_views/version'

Gem::Specification.new do |spec|
  spec.name          = "markdown_views"
  spec.version       = MarkdownViews::VERSION
  spec.authors       = ["thomas morgan"]
  spec.email         = ["tm@iprog.com"]
  spec.summary       = %q{Add .md template handler to Rails.}
  spec.description   = %q{Enables Rails handling of .md templates, with optional preprocessing of ERB, HAML, etc. Also provides a markdown() view helper. Uses CommonMarker & Rouge.}
  spec.homepage      = "https://github.com/zarqman/markdown_views"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 3.1'

  spec.add_dependency 'commonmarker', '>= 1.1', '< 3.0'
  spec.add_dependency 'rails', '>= 6.1', '< 8.1'
  spec.add_dependency 'rouge', '~> 4'
  spec.add_dependency 'securerandom'

  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "rake"
end
