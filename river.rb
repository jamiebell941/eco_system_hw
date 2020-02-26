class River
  attr_reader :name, :fish
  def initialize(name, fish = [])
    @name = name
    @fish = fish
  end

  def remove_fish_from_river(fish)
  @fish.delete(fish)
  end

end
