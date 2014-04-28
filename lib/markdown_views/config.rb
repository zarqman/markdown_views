module MarkdownViews
  mattr_accessor :strip_comments
  self.strip_comments = true

  mattr_accessor :preprocessor
  self.preprocessor = :erb

  mattr_accessor :rendering_opts
  self.rendering_opts = {
    # filter_html: true,
    hard_wrap: true,
    # link_attributes: {'data-popup'=> true},
    # no_styles: true,
    # safe_links_only: true,
  }

  mattr_accessor :markdown_opts
  self.markdown_opts = {
    autolink: true,
    disable_indented_code_blocks: true,
    fenced_code_blocks: true,
    lax_spacing: true,
    no_intra_emphasis: true,
    space_after_headers: true,
    strikethrough: true,
    tables: true,
  }

  mattr_accessor :coderay_opts
  self.coderay_opts = {
    bold_every: false,
    css: :class,
    line_number_anchors: false,
    line_numbers: false,
  }

end

