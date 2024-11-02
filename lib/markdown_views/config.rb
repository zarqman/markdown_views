module MarkdownViews
  mattr_accessor :strip_comments
  self.strip_comments = true

  mattr_accessor :preprocessor
  self.preprocessor = :erb

  mattr_accessor :extensions
  self.extensions = Commonmarker::Config::OPTIONS[:extension].merge(
    strikethrough: true,
    tagfilter: true,
    table: true,
    autolink: true,
    tasklist: false,
    header_ids: nil,
    shortcodes: false,
  )

  mattr_accessor :transformers
  self.transformers = %i(code_blocks)

  mattr_accessor :rendering_opts
  self.rendering_opts = Commonmarker::Config::OPTIONS[:render].merge(
    unsafe: true,
    github_pre_lang: true,
    hardbreaks: true,
    escaped_char_spans: false,
  )

  mattr_accessor :parsing_opts
  self.parsing_opts = Commonmarker::Config::OPTIONS[:parse].merge(
    smart: true,
  )

  mattr_accessor :plugins
  self.plugins = Commonmarker::Config::PLUGINS.merge(
    syntax_highlighter: nil,
  )

  mattr_accessor :rouge_opts
  self.rouge_opts = {
    formatter: Rouge::Formatters::HTML.new,
    wrap: true,
  }

end
