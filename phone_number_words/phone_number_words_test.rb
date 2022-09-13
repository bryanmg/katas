# frozen_string_literal: true

require_relative 'phone_number_words'
require 'test/unit'

class PhoneNumberTest < Test::Unit::TestCase
  def test_cases
    assert_equal PhoneNumber.format([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]), '(123) 456-7890'
    assert_equal PhoneNumber.format([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]), '(123) 456-7890'
    assert_equal PhoneNumber.format([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), '(111) 111-1111'
    assert_equal PhoneNumber.format([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), '(111) 111-1111'
    assert_equal PhoneNumber.format([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), '(111) 111-1111'
    assert_equal PhoneNumber.format([1, 1, 1, 'L', 'L', 'A', 'M', 'E', 'Y', 'A']), '(111) 552-6392'
    assert_equal PhoneNumber.format([1, 8, 0, 0, 'F', 'L', 'O', 'W', 'E', 'R']), '(180) 035-6937'

    # Crazy combination
    assert_equal PhoneNumber.format([1, 'A', 1, 1, 'B', 1, 1, 'C', 1, 1]), '(121) 121-1211'

    # with bad size
    assert_raises LengthError do
      assert_equal PhoneNumber.format([1, 1, 1]), '(111) 111-1111'
    end
    assert_raises LengthError do
      assert_equal PhoneNumber.format([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), '(111) 111-1111'
    end
  end
end
