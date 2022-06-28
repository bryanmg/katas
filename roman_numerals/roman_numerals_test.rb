
require_relative 'roman_numerals'
require 'test/unit'

class WordPatterbTest < Test::Unit::TestCase
  def test_cases
    assert_equal RomanNumerals.to_roman(1000), "M"
    # assert_equal RomanNumerals.to_roman(1990), "MCMXC"
    # assert_equal RomanNumerals.to_roman(1999), "MCMXCIX"
    assert_equal RomanNumerals.to_roman(2008), "MMVIII"
    assert_equal RomanNumerals.to_roman(1666), "MDCLXVI"
    assert_equal RomanNumerals.to_roman(5), "V"
  
    assert_equal RomanNumerals.from_roman('M'), 1000
    assert_equal RomanNumerals.from_roman('V'), 5
    assert_equal RomanNumerals.from_roman('MI'), 1001
    assert_equal RomanNumerals.from_roman('MIX'), 1009
    assert_equal RomanNumerals.from_roman('MIV'), 1004
    assert_equal RomanNumerals.from_roman('MXL'), 1040
    assert_equal RomanNumerals.from_roman('MDCLXVI'), 1666
    assert_equal RomanNumerals.from_roman('MCMXC'), 1990
    assert_equal RomanNumerals.from_roman('MCMXCIX'), 1999
    assert_equal RomanNumerals.from_roman('MCMXXVII'), 1927
    assert_equal RomanNumerals.from_roman('MMVIII'), 2008
  end
end
