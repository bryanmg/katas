# frozen_string_literal: true

require_relative 'who_likes_it'
require 'test/unit'

class PersonTest < Test::Unit::TestCase
  def test_cases
    assert_equal(Person.new([]).who_likes_it?, 'no one likes this')
    assert_equal(Person.new(['Peter']).who_likes_it?, 'Peter likes this')
    assert_equal(Person.new(%w[Jacob Alex]).who_likes_it?, 'Jacob and Alex like this')
    assert_equal(Person.new(%w[Max John Mark]).who_likes_it?, 'Max, John and Mark like this')
    assert_equal(Person.new(%w[Alex Jacob Mark Max]).who_likes_it?, 'Alex, Jacob and 2 others like this')
  end
end
