
require "byebug"

class Game < ApplicationRecord
  has_many :cells

  $counts = {}
  def count(name)
    if $counts[name]
      $counts[name] += 1
    else
      $counts[name] = 1
    end
  end

  def self.reset
    $counts = {}
  end

  def was_alive?(cell)
    count("was_alive?")
    self.cells
    .map {|c| c.x == cell.x && c.y == cell.y }
    .reduce(false) {|s, n| s or n}
  end

  def number_of_neighbors(cell)
    count("number_of_neighbors")
    cell.neighbors.count{|c| was_alive?(c) }
  end

  def is_alive?(cell)
    count("is_alive?")
    result = case number_of_neighbors(cell)
    when 2 then was_alive?(cell)
    when 3 then true
    else false
    end
    return result
  end

  # Rather than saving, instead initialize a new game and cells. Return them.
  def step
    Game.new(
      name: self.name,
      cells: self.cells
      .flat_map {|c| c.neighbors.to_a }
      .uniq
      .flat_map {|c| is_alive?(c) ? [c] : [] }
      .uniq{|c| [c.x, c.y]}
    )
  end
end

class Object
  def teel
    pp self.length
    self
  end
end