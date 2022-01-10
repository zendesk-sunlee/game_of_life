require 'set'

def was_alive?(board, x,y)
  board.include?({x: x, y: y})
end

def neighbors(x, y)
  Set[{x: x-1, y: y-1}, {x: x, y: y-1}, {x: x+1, y: y-1},
      {x: x-1, y: y  },                 {x: x+1, y: y  },
      {x: x-1, y: y+1}, {x: x, y: y+1}, {x: x+1, y: y+1}]
end

def number_of_neighbors(board, x, y)
  neighbors(x, y).count{|c| was_alive?(board, c[:x], c[:y]) }
end

def is_alive?(board, x, y)
  case number_of_neighbors(board, x, y)
  when 2 then was_alive?(board, x, y)
  when 3 then true
  else false
  end
end
