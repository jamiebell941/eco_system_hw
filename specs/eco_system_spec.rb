require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../fish")
require_relative("../bear")
require_relative("../river")

class EcoSystemTest < MiniTest::Test

  def setup
    @bear1 = Bear.new("Bear Grills")

    @fish1 = Fish.new("Alex Salmon")
    @fish2 = Fish.new("Tuna Turner")
    @fish3 = Fish.new("Marlin Munroe")
    @fish4 = Fish.new("Nicola Sturgeon")

    @fishes = [@fish1, @fish2, @fish3, @fish4]

    @river1 = River.new("Schitts Creek", @fishes)
  end

  def test_river_has_name
    assert_equal("Schitts Creek", @river1.name)
  end

  def test_river_has_fish
    assert_equal(4, @river1.fish.count)
  end

  def test_fish_has_name
    assert_equal("Tuna Turner", @fish2.fish_name)
  end

  def test_bear_has_name
    assert_equal("Bear Grills", @bear1.bear_name)
  end

  # def test_bear_stomach_empty
  #
  # end
  def test_remove_fish_from_river
    @river1.remove_fish_from_river(@fish2)
    assert_equal(3, @river1.fish.count)
  end

  def test_bear_eats_fish
      @bear1.bear_eats_fish(@fish2)
      assert_equal(1, @bear1.stomach.count)
  end

  def test_fish_eaten_by_bear
      @bear1.bear_eats_fish(@fish2)
      @river1.remove_fish_from_river(@fish2)
      assert_equal(1, @bear1.stomach.count)
      assert_equal(3, @river1.fish.count)

  end
end
