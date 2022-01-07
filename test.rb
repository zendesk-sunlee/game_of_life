require "test/unit"
require_relative 'life'
require 'set'

class LifeTest < Test::Unit::TestCase

    BLOCK = Set[{x:2, y: 2},{x:3, y: 3},{x:3, y: 2},{x:2, y: 3}]
    BLINKER = Set[{x:2, y: 2},{x:2, y: 3},{x:2, y: 1}]
    BLOCK_WITH_NUB = Set[{x:2, y: 2},{x:3, y: 3},{x:3, y: 2},{x:2, y: 3}, {x:1, y:1}]

    def test_was_alive?
        assert_equal true, was_alive?(BLOCK, 2, 2) # => true
        assert_equal false, was_alive?(BLOCK, 1,1) # => false
    end

    def test_neighbors
        coords = Set[{:x=>1, :y=>1},
        {:x=>2, :y=>1},
        {:x=>3, :y=>1},
        {:x=>1, :y=>2},
        {:x=>3, :y=>2},
        {:x=>1, :y=>3},
        {:x=>2, :y=>3},
        {:x=>3, :y=>3}]
        assert_equal coords, neighbors(2,2)
    end

    def test_number_of_neighbors
        assert_equal 3, number_of_neighbors(BLOCK, 2,2) # => 3
        assert_equal 2, number_of_neighbors(BLOCK, 2,1) # => 2
        assert_equal 1, number_of_neighbors(BLOCK, 1,1) # => 1
    end

    def test_is_alive?
        assert_equal false, is_alive?(BLINKER, 2, 1) # => false # Rule 1
        assert_equal true, is_alive?(BLINKER, 2, 2) # => true # Rule 2
        assert_equal false, is_alive?(BLOCK_WITH_NUB, 2, 2) # => false # Rule 3
        assert_equal true, is_alive?(BLINKER, 1, 2) # => true # Rule 4
        assert_equal false, is_alive?(BLINKER, -1, -1) # => true # Rule 4
    end
end
