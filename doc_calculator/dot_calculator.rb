# frozen_string_literal: true

def dot_calculator(equation)
  value, operator, factor = equation.split(%r{ /| })
  value.size.send(operator.to_sym, factor.size).times.map { '.' }.join
end
