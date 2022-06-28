# frozen_string_literal: true
# https://www.codewars.com/kata/51b66044bce5799a7f000003

module RomanNumerals
  EQUIVALENCES = {
    1=>"I", 4=>"IV", 5=>"V", 9=>"IX", 10=>"X", 40=>"XL", 50=>"L", 90=>"XC", 100=>"C", 400=>"CD", 500=>"D", 900=>"CM", 1000=>"M"
  }

  def self.from_roman(number)
    matcher = number.scan(/M|CM|D|CD|C|XC|L|XL|X|IX|V|IV|I/)
    matcher.uniq.inject(0) do |pntr, element|
      pntr += matcher.count(element) * EQUIVALENCES.invert[element]
    end
  end

  def self.to_roman(number)
    splited_number = number.to_s.reverse.split("").map(&:to_i) # [M, D, C, U]
    result = []
    
    (splited_number.size-1).downto(0) do |i|
      if i == 3
        result << "M"*splited_number[i]
        next
      end

      if EQUIVALENCES.values.include?(splited_number[i]*(10**i))
        result << EQUIVALENCES[splited_number[i]*(10**i)]
      else
        result << compute_roman_digit(splited_number, i)
      end
    end
    
    result.join
  end

  private
  def self.compute_roman_digit(digits, i)
    digits[i].to_i < 5 ? EQUIVALENCES[10**i]*digits[i] :  EQUIVALENCES[5*(10**i)] + EQUIVALENCES[10**i] * (digits[i]-5)
  end
end
