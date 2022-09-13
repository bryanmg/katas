# frozen_string_literal: true

class LengthError < StandardError; end
class FormatError < StandardError; end

class PhoneNumber
  NUMBER_WORDS = {
    '2' => /[ABCabc]/,
    '3' => /[DEFdef]/,
    '4' => /[GHIghi]/,
    '5' => /[JKLjkl]/,
    '6' => /[MNOmno]/,
    '7' => /[PQRSpqrs]/,
    '8' => /[TUVtuv]/,
    '9' => /[WXYZwxyz]/
  }.freeze
  def self.format(code)
    raise LengthError if code.length != 10

    number = format_code(code.join)

    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

  def self.format_code(code)
    formated = NUMBER_WORDS.map { |key, _value| code.gsub!(NUMBER_WORDS[key], key.to_s) }.compact.uniq.join
    return code if formated.empty?

    formated
  end
end
