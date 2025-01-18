# MarkdownViews

MarkdownViews enables Rails to process .md templates as part of `app/views/`, with optional preprocessing of ERB, HAML, etc. A `markdown()` helper is also provided for when you need Markdown for only part of a view.

It uses CommonMarker for markdown processing and Rouge for syntax highlighting.


## Usage: Views

Just create views as `some_action.html.md` instead of `some_action.html.erb` and write them with Markdown instead of HTML. You can still use ERB (or HAML, etc -- see below).

    # My page title

    Hello, **<%= current_user.first_name %>**.

    ```ruby
    def syntax_highlighting
      'works too!'
    end
    ```


## Usage: Helper

MarkdownViews also includes a simple Markdown rendering helper.

    <%= markdown('## Some markdown text') %>

    <%= markdown do %>
    ## Some markdown text
    <% end %>


## Configuration

By default, all HTML comments are stripped from the output. Occasionally this can cause issues with inline Javascript or otherwise be undesired. To disable, add the following to an initializer:

    MarkdownViews.strip_comments = false

By default, all .md files are preprocessed with ERB (making them effectively .md.erb files). This can be changed or disabled by setting a different template handler or setting to nil, respectively.

    MarkdownViews.preprocessor = :erb
    MarkdownViews.preprocessor = nil

CommonMarker's rendering can also be configured. See [CommonMarker's documentation](https://github.com/gjtorikian/commonmarker#options-and-plugins) for available options.

    MarkdownViews.parsing_opts.merge! smart: false

    MarkdownViews.rendering_opts.merge! unsafe: false

    MarkdownViews.extensions.merge! tasklist: true

Likewise, Rouge can be configured:

    # Use inline formatting:
    MarkdownViews.rouge_opts.merge! formatter: Rouge::Formatters::HTMLInline.new('monokai')

    # Enable line numbers:
    MarkdownViews.rouge_opts.merge!(
      formatter: Rouge::Formatters::HTMLTable.new(Rouge::Formatters::HTML.new, code_class: 'rouge-highlight'),
      wrap: false
    )

The standard CSS themes from Rouge are available via the asset pipeline. To use one, add it to your `application.css`:

    *= require rouge.monokai

See `app/assets/stylesheets/` for the complete list.


## Installation

Add this line to your application's Gemfile:

    gem 'markdown_views'

And then execute:

    $ bundle


## Gem versions

The 3.x series uses CommonMarker 1.x or 2.x and Rouge. It is compatible with Rails 6.1-8+.
The 2.x series uses CommonMarker 0.x and Rouge. It is compatible with Rails 5.0-8.0.

#### Upgrading from 2.x to 3.x

CommonMarker 1.x swapped out the underlying parser. While the rendered markdown output is very similar, the configuration flags were reworked. This gem's defaults are roughly the same as before. However, if your configuration was previously customized, it will need to be updated.

CommonMarker 1's new syntax highlighting is not used, with preference instead given to Rouge. This preserves rendering compatibility, including existing stylesheets.

The stylesheets were refreshed from Rouge 4.4 which corrects a few missing CSS selectors. The github stylesheet was also renamed from `rouge.github` to `rouge.github.light`.


## Contributing

1. Fork it ( http://github.com/zarqman/markdown_views/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

MIT
