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

  def patrons_by_exhibit_interest

  end
end
