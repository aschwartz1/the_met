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
end
