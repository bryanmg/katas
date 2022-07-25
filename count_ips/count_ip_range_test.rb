# frozen_string_literal: true

require_relative 'count_ip_range'
require 'test/unit'

class CountIpRangeTest < Test::Unit::TestCase
  def test_cases
    assert_equal ipsBetween('10.0.0.0', '10.0.0.50'), 50
    assert_equal ipsBetween('20.0.0.10', '20.0.1.0'), 246
    # dojo
    assert_equal ipsBetween('20.0.0.10', '20.0.0.55'), 45
    assert_equal ipsBetween('20.0.1.255', '20.0.0.0'), 65_025
    # TODO: Solve this escenario
    # assert_equal ipsBetween("21.0.0.0", "22.0.0.0"), 16581375
  end
end
