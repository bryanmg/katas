# frozen_string_literal: true

class Permutator
  REPLACEMENT_CHAR = '?'
  DIGITS_TO_PERMUTATE = %w[0 1].freeze

  def initialize(pattern)
    @pattern = pattern
    @permutations = posible_permutations
  end

  def sort
    permutations.count.times.map do |perm_idx|
      pattern.gsub(REPLACEMENT_CHAR).each_with_index do |_el, idx|
        permutations[perm_idx][idx]
      end
    end
  end

  private

  attr_reader :pattern, :permutations

  def posible_permutations
    factors = pattern.scan(REPLACEMENT_CHAR).count
    DIGITS_TO_PERMUTATE.repeated_permutation(factors).to_a.map(&:join)
  end
end
