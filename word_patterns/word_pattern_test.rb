# frozen_string_literal: true

require_relative 'word_pattern'
require 'test/unit'

class WordPatterbTest < Test::Unit::TestCase
  def test_cases
    assert_equal word_pattern('abab', 'truck car truck car'), true
    assert_equal word_pattern('aaaa', 'dog dog dog dog'), true
    assert_equal word_pattern('abab', 'apple banana banana apple'), false
    assert_equal word_pattern('aaaa', 'cat cat dog cat'), false
    # dojo
    assert_equal word_pattern('xxxx', 'cat cat cat cat'), true
    assert_equal word_pattern('ccc', 'cat dog cat'), false
    assert_equal word_pattern('abcdf', 'cat men dog tigger woman'), true
    assert_equal word_pattern('ttt', 'cat cat cat'), true
  end
end
