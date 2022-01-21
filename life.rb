require 'set'

Cell = Struct.new(:x, :y)

def was_alive?(board, cell)
  board.include?(cell)
end

def neighbors(cell)
  x = cell.x
  y = cell.y
  Set[Cell.new(x-1, y-1), Cell.new(x, y-1), Cell.new(x+1, y-1),
      Cell.new(x-1, y  ),                   Cell.new(x+1, y  ),
      Cell.new(x-1, y+1), Cell.new(x, y+1), Cell.new(x+1, y+1)]
end

def number_of_neighbors(board, cell)
  neighbors(cell).count{|c| was_alive?(board, c) }
end

def is_alive?(board, cell)
  case number_of_neighbors(board, cell)
  when 2 then was_alive?(board, cell)
  when 3 then true
  else false
  end
end

def step(board)
  board
  .flat_map {|c| neighbors(c).to_a }
  .flat_map {|c| is_alive?(board, c) ? [c] : [] }
  .to_set
end

