# frozen_string_literal: true

class LengthError < StandardError; end
class FormatError < StandardError; end

class PhoneNumber
  self.NUMBER_WORDS = {
    "0": [],
    "1": [],
    "2": ["A", "B", "C"],
    "3": ["D", "E", "F"],
    "4": ["G", "H", "I"],
    "5": ["J", "K", "L"],
    "6": ["M", "N", "O"],
    "7": ["P", "Q", "R", "S"],
    "8": ["T", "U", "V"],
    "9": ["W", "X", "Y", "Z"]
  }
  def self.format(code)
    raise LengthError if code.length != 10

    number = self.format_code(code)

    raise FormatError if numbers.join.match?(/[^0-9]/)

    "(#{numbers[0..2].join}) #{numbers[3..5].join}-#{numbers[6..9].join}"
  end

  def self.format_code(code)
    code.map do |char|
      keys = self.NUMBER_WORDS.select{ |key, vals| vals.include?(char) }
      binding.irb
    end
  end
end

b = [1, 2, 3, "L", "L", "A", "M", "E", "Y", "A"]
binding.irb