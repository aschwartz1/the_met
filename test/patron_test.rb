require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronTest < Minitest::Test
  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @bob
  end

  def test_readable_attributes
    assert_equal "Bob", @bob.name
    assert_equal 20, @bob.spending_money
  end

  def test_starts_with_no_interests
    assert_equal [], @bob.interests
  end

  def test_can_add_interests
    @bob.add_interest("Rocks")

    assert_equal ["Rocks"], @bob.interests
  end
end
