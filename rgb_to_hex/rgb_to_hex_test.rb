# frozen_string_literal: true
require_relative 'rgb_to_hex'
require 'test/unit'

class RgbToHexTest < Test::Unit::TestCase
  def test_cases
    assert_equal 'FFFFFF', rgb(255, 255, 255)
    assert_equal 'FFFFFF', rgb(255, 255, 300)
    assert_equal '000000', rgb(0, 0, 0)
    assert_equal '9400D3', rgb(148, 0, 211)
    assert_equal '0F0F0F', rgb(15, 15, 15)

    # Special test for dojo
    assert_equal '000000', rgb(-1, -1, -1)
    assert_equal '10FE05', rgb(16, 254, 5)
    assert_equal '0A090A', rgb(10, 9, 10)
  end
end
