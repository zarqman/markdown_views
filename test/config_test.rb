require "test_helper"

class ConfigTest < Minitest::Test

  def test_extensions
    processed = Commonmarker::Config.process_options(extension: MarkdownViews.extensions)[:extension]
    expected = {
      strikethrough:               true,
      tagfilter:                   true,
      table:                       true,
      autolink:                    true,
      tasklist:                    false,
      superscript:                 false,
      # header_ids:                '',
      footnotes:                   false,
      description_lists:           false,
      front_matter_delimiter:      '',
      multiline_block_quotes:      false,
      math_dollars:                false,
      math_code:                   false,
      shortcodes:                  false,
      wikilinks_title_before_pipe: false,
      wikilinks_title_after_pipe:  false,
      underline:                   false,
      spoiler:                     false,
      greentext:                   false,
      subscript:                   false,
    }
    assert_equal expected, processed
  end

  def test_parsing_opts
    processed = Commonmarker::Config.process_options(parse: MarkdownViews.parsing_opts)[:parse]
    expected = {
      smart:                     true,
      default_info_string:       '',
      relaxed_tasklist_matching: false,
      relaxed_autolinks:         false,
    }
    assert_equal expected, processed
  end

  def test_plugins
    processed = Commonmarker::Config.process_plugins(MarkdownViews.plugins)
    expected = {
      syntax_highlighter: nil
    }
    assert_equal expected, processed
  end

  def test_rendering_opts
    processed = Commonmarker::Config.process_options(render: MarkdownViews.rendering_opts)[:render]
    expected = {
      hardbreaks:         true,
      github_pre_lang:    true,
      full_info_string:   false,
      width:              80,
      unsafe:             true,
      escape:             false,
      sourcepos:          false,
      escaped_char_spans: false,
      ignore_setext:      false,
      ignore_empty_links: false,
      gfm_quirks:         false,
      prefer_fenced:      false,
    }
    assert_equal expected, processed
  end

end
