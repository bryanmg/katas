# frozen_string_literal: true

# https://www.codewars.com/kata/5a057ec846d843c81a0000ad

def cycle(div)
  char = (1.0 / div).to_s.split('.')[1]
  len = 2

  loop do
    break if char[0...len] == char[len...len * 2]

    if len >= char.length
      len = -1
      break
    end

    len += 1
  end

  len
end
