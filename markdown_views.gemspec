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
  spec.description   = %q{Makes Rails handle .md templates, with optional preprocessing of ERB, HAML, etc. Easily configurable; uses RedCarpet & CodeRay.}
  spec.homepage      = "https://github.com/zarqman/markdown_views"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'redcarpet', '~> 3.1'
  spec.add_dependency 'coderay', '~> 1.1'
  spec.add_dependency 'actionpack', '>= 4.0', '< 6'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
