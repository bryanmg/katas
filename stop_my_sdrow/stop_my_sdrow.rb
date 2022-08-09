# frozen_string_literal: true

module SpinWords
  def self.spin_words(sentence)
    sentence.split(' ').map do |word|
      if word.size >= 5
        word.reverse
      else
        word
      end
    end.join(' ')
  end
end
