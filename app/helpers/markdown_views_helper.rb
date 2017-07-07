module MarkdownViewsHelper

  def markdown(source=nil)
    if block_given?
      source = capture do
        yield
      end.strip_heredoc
    end
    MarkdownViews::Renderer.render(source)
  end

end
