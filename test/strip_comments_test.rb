require "test_helper"

class StripCommentsTest < Minitest::Test

  def test_not_greedy
    assert_equal "ace", strip_comments("a<!-- b -->c<!-- d -->e")
    assert_equal "a\nc\nd\nf", strip_comments("a\n<!-- b -->c\nd<!-- e -->\nf")
  end

  # only comment should vanish, without absorbing any outside whitespace
  def test_intra_line_comments
    assert_equal "ac", strip_comments("a<!-- b -->c"), 'no whitespace'
    assert_equal "\nac\n", strip_comments("\na<!-- b -->c\n"), 'no whitespace, with linefeeds'
    assert_equal "a c", strip_comments("a <!-- b -->c"), 'left whitespace'
    assert_equal "a c", strip_comments("a<!-- b --> c"), 'right whitespace'
    assert_equal "a  c", strip_comments("a <!-- b --> c"), 'double whitespace'
    assert_equal "ac", strip_comments("a<!--b-->c"), 'comment w/o whitespace'
    assert_equal "a \nc", strip_comments("a <!-- b -->\nc"), 'trailing comment'
    assert_equal "a\n c", strip_comments("a\n<!-- b --> c"), 'leading comment'
  end

  # only comment should vanish, without absorbing outside whitespace
  def test_shared_line_multi_line_comments
    assert_equal "14", strip_comments("1<!-- 2\n3 -->4"), 'no whitespace'
    assert_equal "1  4", strip_comments("1 <!-- 2\n3 --> 4"), 'with whitespace'
    assert_equal "1\n  4", strip_comments("1\n <!-- 2\n3 --> 4"), 'leading whitespace on comment'
    assert_equal "1  \n4", strip_comments("1 <!-- 2\n3 --> \n4"), 'trailing whitespace on comment'
    assert_equal "1 \n 4", strip_comments("1 \n<!-- 2\n3 --> 4"), 'trailing whitespace on line'
    assert_equal "1 \n 4", strip_comments("1 <!-- 2\n3 -->\n 4"), 'leading whitespace on line'
  end

  # should make line vanish, including outside whitespace
  def test_whole_line_single_line_comments
    assert_equal "1\n3\n", strip_comments("1\n<!-- 2 -->\n3\n"), 'adjacent lines'
    assert_equal "1\r\n3\r\n", strip_comments("1\r\n<!-- 2 -->\r\n3\r\n"), 'adjacent lines w/windows LF'
    assert_equal "1\n\n\n3\n", strip_comments("1\n\n<!-- 2 -->\n\n3\n"), 'spaced lines'
    assert_equal "  1\n  3\n", strip_comments("  1\n  <!-- 2 -->\n  3\n"), 'adjacent lines indented w/spaces'
    assert_equal "\t1\n\t3\n", strip_comments("\t1\n\t<!-- 2 -->\n\t3\n"), 'adjacent lines indented w/tabs'
    assert_equal "  1\n\n\n  3\n", strip_comments("  1\n\n  <!-- 2 -->\n\n  3\n"), 'spaced lines indented w/spaces'
    assert_equal "1  \n  \n4\t\n", strip_comments("1  \n  \n<!-- 2 -->  \n<!--3-->\t\n4\t\n"), 'spaced lines w/trailing whitespace'
  end

  # should make all lines vanish, including outside whitespace on same lines
  def test_whole_line_multi_line_comments
    assert_equal "1\n4\n", strip_comments("1\n<!-- 2\n3 -->\n4\n"), 'adjacent lines'
    assert_equal "1\n\n\n4\n", strip_comments("1\n\n<!-- 2\n3 -->\n\n4\n"), 'spaced lines'
    assert_equal "  1\n  4\n", strip_comments("  1\n  <!-- 2\n  3 -->\n  4\n"), 'adjacent lines indented w/spaces'
    assert_equal "1  \n  \n4\t\n", strip_comments("1  \n  \n<!-- 2  \n3 -->\t\n4\t\n"), 'spaced lines w/trailing whitespace'
  end


  def strip_comments(*args)
    MarkdownViews::Renderer.strip_comments(*args)
  end

end
