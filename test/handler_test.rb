require "test_helper"

class HandlerTest < ActionDispatch::IntegrationTest

  test ".html.md views render" do
    get '/info'
    if cm_version >= '2.10.1'
      o = <<~HTML
        <html>
          <body>
            <h1>header</h1>
        <p>this is <em>amazing</em>!</p>
        <script>alert('raw');</script>
        <p>&lt;script&gt;alert('non-html_safe');&lt;/script&gt;</p>

          </body>
        </html>
      HTML
    else
      o = <<~HTML
        <html>
          <body>
            <h1>header</h1>
        <p>this is <em>amazing</em>!</p>
        &lt;script>alert('raw');&lt;/script>
        <p>&lt;script&gt;alert('non-html_safe');&lt;/script&gt;</p>

          </body>
        </html>
      HTML
    end
    assert_equal o, response.body
  end

end
