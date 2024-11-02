require "test_helper"

class RenderTest < Minitest::Test

  def test_markdown
    s = <<~MD
      # header
      this is *amazing*!
    MD
    o = <<~HTML
      <h1>header</h1>
      <p>this is <em>amazing</em>!</p>
    HTML
    assert_equal o, render(s)
  end

  def test_inline_html
    s = <<~MD
      ---
      <em>inline</em> html
    MD
    o = <<~HTML
      <hr />
      <p><em>inline</em> html</p>
    HTML
    assert_equal o, render(s)
  end

  def test_code_block
    s = <<~MD
      ```ruby
      def syntax_highlighting
        'works too!'
      end
      ```
    MD
    o = <<~HTML
      <pre lang=\"ruby\"><code class=\"rouge-highlight\"><span class=\"k\">def</span> <span class=\"nf\">syntax_highlighting</span>
        <span class=\"s1\">'works too!'</span>
      <span class=\"k\">end</span></code></pre>
    HTML
    assert_equal o, render(s)
  end


  def render(*args)
    MarkdownViews::Renderer.render(*args)
  end

end
