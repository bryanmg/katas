# frozen_string_literal: true

# kata: https://www.codewars.com/kata/562846dd1f77ab7c00000033

def word_pattern(pattern_str, sentence)
  pattern = pattern_str.split('')
  words = sentence.split(' ')

  return false if pattern.uniq.size != words.uniq.size

  text = sentence
  pattern.uniq.each_with_index do |ptt, idx|
    text = text.gsub(/#{words.uniq[idx]}/, ptt)
  end
  text.gsub!(/ /, '')

  text == pattern_str
end
