# frozen_string_literal: true

class FormatError < StandardError; end

# TODO: test with small matrix

class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def reconstruct
    validate_square_matrix!

    upper_diagonal_matrix + botom_diagonal_matrix
  end

  private

  attr_reader :matrix

  def upper_diagonal_matrix
    n_size = matrix.size - 1

    (0..n_size).to_a.reverse.map do |index|
      (0..n_size).to_a.map { |j| matrix[j][index + j] }.compact
    end
  end

  def botom_diagonal_matrix
    n_size = matrix.size - 1

    (1..n_size).to_a.each_with_index.map do |i, index|
      row = []
      (n_size - index).times { |j| row << matrix[i + j][j] }
      row.compact
    end
  end

  def validate_square_matrix!
    raise FormatError if matrix[0].size != matrix.size
  end
end
