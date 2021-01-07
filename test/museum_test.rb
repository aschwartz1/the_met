require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'

class MuseumTest < Minitest::Test
  def setup
    @moma = Museum.new('Museum of Modern Art')

    @bob = Patron.new('Bob', 25)
    @bob.add_interest('Chemex')
    @kim = Patron.new('Kim', 0)
    @kim.add_interest('Rocks')
    @kim.add_interest('Chemex')
    @joe = Patron.new('Joe', 0)
    @joe.add_interest('Rocks')

    @chemex = create_exhibit({name: 'Chemex', cost: 0})
    @rocks = create_exhibit({name: 'Rocks', cost: 25})
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
    assert_equal [], @moma.patrons
  end

  def test_can_add_exhibits
    @moma.add_exhibit(@chemex)

    assert_equal 1, @moma.exhibits.length
    assert_equal @chemex, @moma.exhibits.first
  end

  def test_can_admit_patrons
    @moma.admit(@bob)

    assert_equal 1, @moma.patrons.length
    assert_equal @bob, @moma.patrons.first
  end

  def test_can_recommend_exhibits
    @moma.add_exhibit(@chemex)

    assert_equal [@chemex], @moma.recommend_exhibits(@bob)
  end

  def test_can_find_patrons_interested_in_exhibit
    @moma.add_exhibit(@chemex)
    @moma.add_exhibit(@rocks)
    @moma.admit(@bob)

    assert_equal [@bob], @moma.patrons_interested_in(@chemex)
    assert_equal [], @moma.patrons_interested_in(@rocks)
  end

  def test_can_group_patrons_by_exhibit_interest
    @moma.add_exhibit(@chemex)
    @moma.add_exhibit(@rocks)
    @moma.admit(@bob)

    expected = {
      @chemex => [@bob],
      @rocks => []
    }

    assert_equal expected, @moma.patrons_by_exhibit_interest
  end

  def test_generates_lottery_contestants
    @moma.add_exhibit(@chemex)
    @moma.add_exhibit(@rocks)
    @moma.admit(@bob)
    @moma.admit(@kim)
    @moma.admit(@joe)

    assert_equal [@kim, @joe], @moma.ticket_lottery_contestants
  end

  def test_can_select_a_lottery_winner
    @moma.add_exhibit(@chemex)
    @moma.add_exhibit(@rocks)
    @moma.admit(@bob)
    @moma.admit(@kim)
    @moma.admit(@joe)

    # TODO Ran out of time here, before being able to make sure this is a good test
    assert_equal true, ([@kim, @joe].include? @moma.draw_lottery_winner)
  end

  def test_can_be_no_lottery_winners
    @moma.add_exhibit(@chemex)
    @moma.admit(@bob)
    @moma.admit(@kim)
    @moma.admit(@joe)

    assert_nil @moma.draw_lottery_winner
  end
end
