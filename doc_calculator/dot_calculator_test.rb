# frozen_string_literal: true

require_relative 'dot_calculator'
require 'test/unit'

class DotCalculatorTest < Test::Unit::TestCase
  def test_cases
    assert_equal '....................',    dot_calculator('..... + ...............')
    assert_equal '..',                      dot_calculator('..... - ...')
    assert_equal '....',                    dot_calculator('..... - .')
    assert_equal '...............',         dot_calculator('..... * ...')
    assert_equal '..........',              dot_calculator('..... * ..')
    assert_equal '..',                      dot_calculator('..... // ..')
    assert_equal '.....',                   dot_calculator('..... // .')
    assert_equal '',                        dot_calculator('. // ..')
    assert_equal '',                        dot_calculator('.. - ..')
  end
end
