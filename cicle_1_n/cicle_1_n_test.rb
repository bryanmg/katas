# frozen_string_literal: true
require_relative 'cicle_1_n'
require 'test/unit'

class CycleTest < Test::Unit::TestCase
  def test_cases
    assert_equal cycle(5), -1
    assert_equal cycle(13), 6
    assert_equal cycle(21), 6
    assert_equal cycle(27), 3
    assert_equal cycle(33), 2
    assert_equal cycle(37), 3
    assert_equal cycle(94), -1
    assert_equal cycle(22), -1
    assert_equal cycle(65), -1
    assert_equal cycle(197), 98
  end
end
