module MarkdownViews
  class Handler
    class << self

      def call(template, source)
        source = preprocessor.call(template, source)

        <<-R1
          MarkdownViews::Renderer.render(begin;#{source};end)
        R1
      end

      if ActionView::Template::Handlers.respond_to?(:template_handlers) # as of rails 8.2
        def preprocessor
          @@preprocessor ||= begin
            pp = MarkdownViews.preprocessor || :raw
            ActionView::Template::Handlers.template_handlers[pp.to_sym] || raise('Unknown template handler')
          end
        end
      else
        def preprocessor
          @@preprocessor ||= begin
            pp = MarkdownViews.preprocessor || :raw
            ActionView::Template.registered_template_handler(pp) || raise('Unknown template handler')
          end
        end
      end

    end
  end
end
