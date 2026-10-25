require_relative 'lib/markdown_views/version'

Gem::Specification.new do |spec|
  spec.name          = "markdown_views"
  spec.version       = MarkdownViews::VERSION
  spec.authors       = ["thomas morgan"]
  spec.email         = ["tm@iprog.com"]
  spec.summary       = %q{Add .md template handler to Rails.}
  spec.description   = %q{Enables Rails handling of .md templates, with optional preprocessing of ERB, HAML, etc. Also provides a markdown() view helper. Uses CommonMarker & Rouge.}
  spec.homepage      = "https://github.com/zarqman/markdown_views"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,exe,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  end

  spec.required_ruby_version = '>= 3.1'

  spec.add_dependency 'commonmarker', '>= 1.1', '< 2.10.1'
  spec.add_dependency 'rails', '>= 6.1'
  spec.add_dependency 'rouge', '>= 4', '< 6'
  spec.add_dependency 'securerandom'

  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "rake"
end
