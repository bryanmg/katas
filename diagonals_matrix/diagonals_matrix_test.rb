# frozen_string_literal: true

require_relative 'diagonals_matrix'
require 'test/unit'

class DotCalculatorTest < Test::Unit::TestCase
  def test_cases
    matrix1 = [
      [1,   2,   3,   4],
      [5,   6,   7,   8],
      [9,   0,   10,  11],
      [12,  13,  14,  15]
    ]
    matrix3 = [
      [1,   2],
      [5,   6,   7,   8],
      [9,   0,   10,  11]
    ]

    assert_equal Matrix.new(matrix1).reconstruct,
                 [[4], [3, 8], [2, 7, 11], [1, 6, 10, 15], [5, 0, 14], [9, 13], [12]]

    assert_raises FormatError do
      Matrix.new(matrix3).reconstruct
    end
  end
end
