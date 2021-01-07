require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'

class MuseumTest < Minitest::Test
  def setup
    @moma = Museum.new('Museum of Modern Art')
  end

  def exhibits
    {
      chemex: create_exhibit({name: 'Chemex', cost: 0}),
      rocks: create_exhibit({name: 'Rocks', cost: 0})
    }
  end

  def create_exhibit(data)
    Exhibit.new(data)
  end

  def test_it_exists
    assert_instance_of Museum, @moma
  end

  def test_readable_attributes
    assert_equal 'Museum of Modern Art', @moma.name
    assert_equal [], @moma.exhibits
  end

  def test_can_add_exhibits
    @moma.add_exhibit(exhibits[:chemex])

    assert_equal 1, @moma.exhibits.length
    assert_equal 'Chemex', @moma.exhibits.first.name
  end
end
