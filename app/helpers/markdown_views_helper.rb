module MarkdownViewsHelper

  def markdown(source=nil)
    if block_given?
      source = capture do
        yield
      end
      source = unindent source
    end
    MarkdownViews::Renderer.render(source)
  end

  # unindents a block of text according to the least indented line
  def unindent(source)
    spaces = 100
    lines = source.split("\n")
    lines.each do |line|
      if line =~ /[^\s]/
        line =~ /^(\s*)/
        spaces = [spaces, $1.length].min
      end
      break if spaces.zero?
    end
    if spaces > 0 && spaces < 100
      lines.each do |line|
        line.sub! /^\s{#{spaces}}/, ''
      end
      source = lines.join("\n")
    end
    source
  end

end
