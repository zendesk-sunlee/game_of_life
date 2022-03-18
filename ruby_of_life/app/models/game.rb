class Game < ApplicationRecord
  has_many :cells

  def was_alive?(coord)
    x,y = coord
    self.cells
    .map {|c| c.x == x && c.y == y }
    .reduce(false) {|s, n| s or n}
  end

  def get_number_of_neighbors_hash
    self.cells
    .flat_map {|c| c.neighbors.to_a }
    .map(&:coords)
    .reduce({}) {|a, v| if a[v] then a[v] += 1 else a[v] = 1 end; a }
  end

  def step
    Game.new(
      name: self.name,
      cells: get_number_of_neighbors_hash
      .flat_map do |k, v|
        if v == 2 && was_alive?(k) || v== 3
          [Cell.pnew(k.first, k.second)]
        else
          []
        end
      end
    )
  end
end
