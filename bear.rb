class Bear
attr_reader :bear_name
attr_accessor :stomach
  def initialize(bear_name, stomach = [])
    @bear_name = bear_name
    @stomach = []
  end

  def bear_eats_fish(fish)
  @stomach.push(fish)
  end

end
