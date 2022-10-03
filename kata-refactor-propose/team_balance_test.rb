# frozen_string_literal: true

require_relative 'team_balance_service'
require 'test/unit'

class PhoneNumberTest < Test::Unit::TestCase
  def test_cases
    #Feel free to add test cases if you want
    assert_equal TeamBalanceService.new("1").process, { balance: 100 }
    assert_equal TeamBalanceService.new("2").process, { balance: 100 }
  end
end
