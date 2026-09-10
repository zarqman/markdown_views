require "test_helper"

class HandlerTest < ActionDispatch::IntegrationTest

  test "helpers render in views" do
    get '/info'
    o = <<~HTML
      <html>
        <body>
          <h1>header</h1>
      <p>this is <em>amazing</em>!</p>

        </body>
      </html>
    HTML
    assert_equal o, response.body
  end

end
