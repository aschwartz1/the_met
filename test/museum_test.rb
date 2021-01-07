require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'

class MuseumTest < Minitest::Test
  def setup
    @moma = Museum.new('Museum of Modern Art')
  end

  def test_it_exists
    assert_instance_of Museum, @moma
  end

  def test_readable_attributes
    assert_equal 'Museum of Modern Art', @moma.name
    assert_equal [], @moma.exhibits
  end
end
