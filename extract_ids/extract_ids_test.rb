# frozen_string_literal: true

require_relative 'extract_ids'
require 'test/unit'

class ExtractIdsTest < Test::Unit::TestCase
  def test_cases
    # assert_equal SpinWords.spin_words('Hey fellow warriors'), 'Hey wollef sroirraw'
    # assert_equal SpinWords.spin_words('This is a test'), 'This is a test'
    # assert_equal SpinWords.spin_words('This is another test'), 'This is rehtona test'

    data = {
      id: 1,
      items: [
        { id: 3 },
        { id: 4, items: [
          { id: 6 },
          { id: 7 },
          { id: 8, items: [{ id: 9 }] }
        ] }
      ]
    }

    assert_equal ExtractData.extract_ids(data), [1, 3, 4, 6, 7, 8, 9]
    # Test.assert_equals(extract_ids(data), [1,3,4,6,7,8,9])
  end
end
