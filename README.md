# MarkdownViews

Make Rails 4+ handle .md templates, with optional preprocessing of ERB, HAML, etc. Easily configurable; uses RedCarpet. Also performs syntax highlighting via CodeRay.

## Usage

Just create views as `some_action.html.md` instead of `some_action.html.erb`.


By default also strips all HTML comments from the output. This can cause issues with inline Javascript or otherwise be undesired. To disable, add the following to an initializer:

    MarkdownViews.strip_comments = false

By default, all .md files are preprocessed with ERB (making them effectively .md.erb files). This can be changed or disabled by setting a different template handler or setting to nil, respectively.

    MarkdownViews.preprocessor = :erb
    MarkdownViews.preprocessor = nil

RedCarpet's rendering can be configured. Both rendering options and markdown options can be set. See RedCarpet's documentation for available options.

    MarkdownViews.markdown_opts.merge! fenced_code_blocks: false

    MarkdownViews.rendering_opts.merge! link_attributes: {'data-popup'=> true}

Likewise, CodeRay can be configured too:

    MarkdownViews.coderay_opts.merge! line_numbers: true

By default, no CSS file is included for CodeRay. This is probably undesirable and you'll want to add one to your asset pipeline somewhere.


## Installation

Add this line to your application's Gemfile:

    gem 'markdown_views'

And then execute:

    $ bundle

## Contributing

1. Fork it ( http://github.com/<my-github-username>/markdown_views/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
