require "test/unit"
require_relative 'life'
require 'set'

class LifeTest < Test::Unit::TestCase

  BLOCK = Set[Cell.new(2, 2),Cell.new(3, 3),Cell.new(3, 2),Cell.new(2, 3)]
  BLINKER = Set[Cell.new(2, 2),Cell.new(2, 3),Cell.new(2, 1)]
  BLINKER_HORIZONTAL = Set[Cell.new( 1, 2), Cell.new( 2, 2), Cell.new( 3, 2) ]
  BLOCK_WITH_NUB = Set[Cell.new(2, 2),Cell.new(3, 3),Cell.new(3, 2),Cell.new(2, 3), Cell.new(1,1)]

  def test_was_alive?
    assert_equal true, was_alive?(BLOCK, Cell.new(2, 2)) # => true
    assert_equal false, was_alive?(BLOCK, Cell.new(1, 1)) # => false
  end

  def test_neighbors
    coords = Set[
    Cell.new(1, 1),
    Cell.new(2, 1),
    Cell.new(3, 1),
    Cell.new(1, 2),
    Cell.new(3, 2),
    Cell.new(1, 3),
    Cell.new(2, 3),
    Cell.new(3, 3)]
    assert_equal coords, neighbors(Cell.new(2,2))
  end

  def test_number_of_neighbors
    assert_equal 3, number_of_neighbors(BLOCK, Cell.new(2,2)) # => 3
    assert_equal 2, number_of_neighbors(BLOCK, Cell.new(2,1)) # => 2
    assert_equal 1, number_of_neighbors(BLOCK, Cell.new(1,1)) # => 1
  end

  def test_is_alive?
    assert_equal false, is_alive?(BLINKER, Cell.new(2, 1)) # => false # Rule 1
    assert_equal true, is_alive?(BLINKER, Cell.new(2, 2)) # => true # Rule 2
    assert_equal false, is_alive?(BLOCK_WITH_NUB, Cell.new(2, 2)) # => false # Rule 3
    assert_equal true, is_alive?(BLINKER, Cell.new(1, 2)) # => true # Rule 4
    assert_equal false, is_alive?(BLINKER, Cell.new(-1, -1)) # => true # Rule 4
  end

  def test_step
    assert_equal BLOCK, step(BLOCK)
    assert_equal BLINKER, step(BLINKER_HORIZONTAL)
  end
end
