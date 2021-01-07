require 'minitest/autorun'
require 'minitest/pride'

class PatronTest < Minitest::Test
  def test_it_exists
    bob = Patron.new

    assert_instance_of Patron, bob
  end
end
