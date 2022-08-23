# frozen_string_literal: true

require_relative 'split_hash_by_key'
require 'test/unit'

class SplitHashByKeyTest < Test::Unit::TestCase
  def test_cases
    assert_equal ExtractData.split_hash_by_key({ a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 }, :c, :e),
                 [{ a: 1, b: 2 }, { c: 3, d: 4 }, { e: 5, f: 6 }]
    assert_equal ExtractData.split_hash_by_key({ a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 }, :b, :f),
                 [{ a: 1 }, { b: 2, c: 3, d: 4, e: 5 }, { f: 6 }]
    assert_equal ExtractData.split_hash_by_key({ 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6 }, 'd'),
                 [{ 'a' => 1, 'b' => 2, 'c' => 3 }, { 'd' => 4, 'e' => 5, 'f' => 6 }]
    assert_equal ExtractData.split_hash_by_key({ a: 1, b: 2 }, :a), [{ a: 1, b: 2 }]

    assert_raises StandardError do
      ExtractData.split_hash_by_key({ a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 }, 'b')
    end
  end
end
