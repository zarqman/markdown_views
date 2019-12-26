module MarkdownViews
  class Renderer
    class << self

      def render(template)
        out = template.to_s
        out = strip_comments(out) if MarkdownViews.strip_comments
        out = render_md(out)
        out = strip_comments(out) if MarkdownViews.strip_comments
        out.html_safe
      end

      # remainder all considered private

      def render_md(input)
        doc = CommonMarker.render_doc(input, MarkdownViews.parsing_opts, MarkdownViews.extensions)

        MarkdownViews.transformers.each {|name| send("transform_#{name}", doc) }

        doc.to_html(MarkdownViews.rendering_opts, MarkdownViews.extensions)
      end

      def rouge_formatter
        MarkdownViews.rouge_opts[:formatter] || Rouge::Formatters::HTML.new
      end

      def strip_comments(input)
        input.gsub(/[ \t\r\n\f]*<!--(.*?)-->*/m, '')
      end

      def transform_code_blocks(doc)
        doc.walk do |node|
          next unless node.type == :code_block
          next if node.fence_info == ''

          lang = node.fence_info
          code = node.string_content
          lexer = Rouge::Lexer.find(lang) || Rouge::Lexers::PlainText
          html = rouge_formatter.format(lexer.lex code).rstrip
          if MarkdownViews.rouge_opts[:wrap]
            html = %Q{<pre lang="#{lang.gsub(/[^a-z0-9_-]/,'')}"><code class="rouge-highlight">#{html}</code></pre>}
          end

          new_node = CommonMarker::Node.new(:html)
          new_node.string_content = html
          node.insert_before new_node
          node.delete
        end
      end

    end
  end
end
