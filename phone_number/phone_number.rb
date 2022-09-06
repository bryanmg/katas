# frozen_string_literal: true

class LengthError < StandardError; end
class FormatError < StandardError; end

class PhoneNumber
  def self.format(numbers)
    raise LengthError if numbers.length != 10

    raise FormatError if numbers.join.match?(/[^0-9]/)

    "(#{numbers[0..2].join}) #{numbers[3..5].join}-#{numbers[6..9].join}"
  end
end
