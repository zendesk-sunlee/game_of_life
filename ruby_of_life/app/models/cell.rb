class Cell < ApplicationRecord
  belongs_to :game

  def neighbors
    x = self.x
    y = self.y
    Set[Cell.pnew(x-1, y-1), Cell.pnew(x, y-1), Cell.pnew(x+1, y-1),
        Cell.pnew(x-1, y  ),                    Cell.pnew(x+1, y  ),
        Cell.pnew(x-1, y+1), Cell.pnew(x, y+1), Cell.pnew(x+1, y+1)]
  end

  def coords
    [x, y]
  end

  def self.pnew(x, y)
    Cell.new(x: x, y: y)
  end
end