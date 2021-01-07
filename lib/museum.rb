class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit unless @exhibits.include? exhibit
  end

  def admit(patron)
    @patrons << patron unless @patrons.include? patron
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include? exhibit.name
    end
  end

  def patrons_interested_in(exhibit)
    @patrons.select do |patron|
      patron_interested_in?(patron, exhibit)
    end
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit|
      patrons_by_exhibit[exhibit] = patrons_interested_in(exhibit)
    end

    patrons_by_exhibit
  end

  def ticket_lottery_contestants
    patrons_by_exhibit_interest.flat_map do |exhibit, patrons|
      who_cannot_afford_to_see(patrons, exhibit)
    end
  end

  def draw_lottery_winner
    lottery_contestants = ticket_lottery_contestants
    return nil if lottery_contestants.nil?

    # TODO implement random select
  end

  private

  def patron_interested_in?(patron, exhibit)
    patron.interests.include? exhibit.name
  end

  def who_cannot_afford_to_see(patrons, exhibit)
    patrons.select do |patron|
      exhibit.cost > patron.spending_money
    end
  end
end
