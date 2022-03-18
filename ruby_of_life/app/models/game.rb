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

  def get_number_of_neighbors_hash
    self.cells
    .flat_map {|c| c.neighbors.to_a }
    .map(&:coords)
    .reduce({}) {|a, v| if a[v] then a[v] += 1 else a[v] = 1 end; a }
  end

  def is_alive?(cell, number_of_neighbors_hash )
    count("is_alive?")
    result = case number_of_neighbors_hash[cell.coords]
    when 2 then was_alive?(cell)
    when 3 then true
    else false
    end
    return result
  end

  # Rather than saving, instead initialize a new game and cells. Return them.
  def step
    number_of_neighbors_hash = get_number_of_neighbors_hash
    Game.new(
      name: self.name,
      cells: self.cells
      .flat_map {|c| c.neighbors.to_a }
      .uniq{|c| [c.x, c.y]}
      .flat_map {|c| is_alive?(c,number_of_neighbors_hash) ? [c] : [] }
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