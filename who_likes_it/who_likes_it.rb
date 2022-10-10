# frozen_string_literal: true

class Person
  def initialize(who)
    @who = who
  end

  def who_likes_it?
    return 'no one likes this' if who.empty?

    case who.size
    when 1
      "#{who[0]} likes this"
    when 2..3
      aux = who.pop
      likes_it = who.join(', ')

      "#{[likes_it, aux].compact.join(' and ')} like this"
    else
      "#{who[0]}, #{who[1]} and #{who.size - 2} others like this"
    end
  end

  private

  attr_reader :who
end
