# frozen_string_literal: true

def ipsBetween(init_range, end_range)
  return false unless has_valid_format?(init_range, end_range)

  factors = []
  end_range = end_range.split('.').map(&:to_i)
  init_range = init_range.split('.').map(&:to_i)

  init_range.each_with_index { |num, index| factors << (end_range[index] - num) }

  units = factors.pop
  remanent = factors.reject(&:zero?).size
  exponential = 255 * (factors.reject(&:zero?)&.inject(&:*) || 0)
  exponential + units + remanent
end

def has_valid_format?(initial, final)
  ipv4_regex = /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/
  initial.match?(ipv4_regex) && final.match?(ipv4_regex)
end
