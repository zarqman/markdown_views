# MarkdownViews

MarkdownViews enables Rails 5-6+ to process .md templates as part of `app/views/`, with optional preprocessing of ERB, HAML, etc. A `markdown()` helper is also provided for when you need Markdown for only part of a view.

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

CommonMarker's rendering can also be configured. See CommonMarker's documentation for available options.

    MarkdownViews.parsing_opts -= %i(UNSAFE)

    MarkdownViews.rendering_opts -= %i(UNSAFE TABLE_PREFER_STYLE_ATTRIBUTES)

    MarkdownViews.extensions -= %i(autolink)

Likewise, Rouge can be configured:

    # Use inline formatting:
    MarkdownViews.rouge_opts.merge! formatter: Rouge::Formatters::HTMLInline.new('pastie')

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

The 0.x series used RedCarpet and CodeRay.
(There was no 1.x series.)
The 2.x series uses CommonMarker and Rouge.

#### Upgrading from 0.x to 2.x

The configuration options have changed. The defaults are roughly the same as before. However, if you had customized them previously, then it will need to be revisited.

Similarly, the provided stylesheets for syntax highlighting have been changed. If you were importing the 'coderay' stylesheet before, then a new stylesheet will need to be selected. Try 'rouge.colorful' or one of the others included in app/assets/stylesheets.


## Contributing

1. Fork it ( http://github.com/<my-github-username>/markdown_views/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
