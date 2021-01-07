require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'

class ExhibitTest < Minitest::Test
  def setup
    @rocks = Exhibit.new(data[:rocks])
  end

  def data
    {
      rocks: {name: 'Rocks', cost: 0}
    }
  end

  def test_it_exists
    assert_instance_of Exhibit, @rocks
  end

  def test_readable_attributes
    assert_equal 'Rocks', @rocks.name
    assert_equal 0, @rocks.cost
  end
end
