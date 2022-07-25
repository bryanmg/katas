# frozen_string_literal: true

def rgb(*args)
  args.map { |num| num.clamp(0, 255).to_s(16).upcase }.map { |n| n.size == 1 ? "0#{n}" : n }.join
end
