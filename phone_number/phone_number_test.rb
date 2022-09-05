# frozen_string_literal: true

require_relative 'phone_number'
require 'test/unit'

class PhoneNumberTest < Test::Unit::TestCase
  def test_cases
    assert_equal create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]), "(123) 456-7890"
    assert_equal create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]), "(123) 456-7890"
    assert_equal create_phone_number([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), "(111) 111-1111"
  end
end
