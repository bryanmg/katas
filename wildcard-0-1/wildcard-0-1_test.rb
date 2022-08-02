# frozen_string_literal: true

require_relative 'wildcard-0-1'
require 'test/unit'

class Wildcard01Test < Test::Unit::TestCase
  def test_cases
    assert_equal Permutator.new('?').sort,        %w[0 1]
    assert_equal Permutator.new('101?').sort,     %w[1010 1011]
    assert_equal Permutator.new('??').sort,       %w[00 01 10 11]
    assert_equal Permutator.new('10??').sort,     %w[1000 1001 1010 1011]
    assert_equal Permutator.new('1?1?').sort,     %w[1010 1011 1110 1111]
  end
end
