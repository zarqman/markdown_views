module MarkdownViews
  class Renderer
    class << self

      def render(template)
        out = template.to_s
        out = strip_comments(out) if MarkdownViews.strip_comments
        out = renderer.render(out)
        out = strip_comments(out) if MarkdownViews.strip_comments
        out.html_safe
      end

      def renderer
        @@renderer ||= begin
          r = ExtendedMarkdownHtml.new MarkdownViews.rendering_opts
          Redcarpet::Markdown.new r, MarkdownViews.markdown_opts
        end
      end

      def strip_comments(input)
        input.gsub(/[ \t\r\n\f]*<!--(.*?)-->*/m, '')
      end

    end
  end

  class ExtendedMarkdownHtml < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants

    def block_code(text, language)
      language ||= 'text'
      html = CGI::unescapeHTML(text).sub(/\A[ \t\n\r]+/, '').sub(/[ \t\n\r]+\Z/, '')
      cr = CodeRay.scan(html, language).html(MarkdownViews.coderay_opts)
      %Q{<pre class="lang-#{language.to_s.gsub(/[^a-z0-9]/,'')}"><code class="CodeRay">#{cr.chomp}</code></pre>}
    end

    def table(header, body)
      <<-TBL
        <div class="table-responsive">
          <table class="table">
            <thead>
              #{header}
            </thead>
            <tbody>
              #{body}
            </tbody>
          </table>
        </div>
      TBL
    end
  end
end
