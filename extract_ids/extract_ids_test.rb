# frozen_string_literal: true

require_relative 'extract_ids'
require 'test/unit'

class ExtractIdsTest < Test::Unit::TestCase
  def test_cases
    data = {
      id: 1,
      items: [
        { id: 3 }, { id: 4, items: [{ id: 6 }, { id: 7 }, { id: 8, items: [{ id: 9 }] } ] }
      ]
    }
    datafake = {
      id: 1,
      items: [
        { id: 3 }, { id: 4, items: [{ id: 6 }, { id: 7 }, { id: 8, items: [{ id: 9 }, { id: 10 }, [{ id: 11 }]] } ] }
      ]
    }

    assert_equal ExtractData.extract_ids(data), [1, 3, 4, 6, 7, 8, 9]
    # assert_equal ExtractData.extract_ids(datafake), [1, 3, 4, 6, 7, 8, 9, 10, 11]
  end
end
