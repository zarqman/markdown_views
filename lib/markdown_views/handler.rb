module MarkdownViews
  class Handler
    class << self

      def call(template)
        source = preprocessor.call(template)

        <<-R1
          MarkdownViews::Renderer.render(begin;#{source};end)
        R1
      end

      def preprocessor
        @@preprocessor ||= begin
          pp = MarkdownViews.preprocessor || :raw
          ActionView::Template.registered_template_handler(pp) || raise('Unknown template handler')
        end
      end

    end
  end
end
