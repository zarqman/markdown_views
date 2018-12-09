module MarkdownViews
  mattr_accessor :strip_comments
  self.strip_comments = true

  mattr_accessor :preprocessor
  self.preprocessor = :erb

  mattr_accessor :extensions
  self.extensions = %i(autolink strikethrough table tagfilter)

  mattr_accessor :rendering_opts
  self.rendering_opts = %i(UNSAFE GITHUB_PRE_LANG HARDBREAKS TABLE_PREFER_STYLE_ATTRIBUTES)
    # DEFAULT UNSAFE GITHUB_PRE_LANG HARDBREAKS NOBREAKS SOURCEPOS
    # TABLE_PREFER_STYLE_ATTRIBUTES FULL_INFO_STRING

  mattr_accessor :parsing_opts
  self.parsing_opts = %i(UNSAFE SMART VALIDATE_UTF8)
    # DEFAULT, UNSAFE, FOOTNOTES, LIBERAL_HTML_TAG, SMART
    # STRIKETHROUGH_DOUBLE_TILDE, VALIDATE_UTF8

  mattr_accessor :rouge_opts
  self.rouge_opts = {
    formatter: Rouge::Formatters::HTML.new,
    wrap: true,
  }

end
