module MarkdownViewsHelper

  def markdown(source=nil)
    if block_given?
      source = capture do
        yield
      end
    end
    MarkdownViews::Renderer.render(source)
  end

end
