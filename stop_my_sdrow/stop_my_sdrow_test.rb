# frozen_string_literal: true

require_relative 'stop_my_sdrow'
require 'test/unit'

class StopMySdrowTest < Test::Unit::TestCase
  def test_cases
    assert_equal SpinWords.spin_words('Hey fellow warriors'), 'Hey wollef sroirraw'
    assert_equal SpinWords.spin_words('This is a test'), 'This is a test'
    assert_equal SpinWords.spin_words('This is another test'), 'This is rehtona test'
  end
end
