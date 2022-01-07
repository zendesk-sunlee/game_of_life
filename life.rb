require 'set'

def was_alive?(board, x,y)
  board.include?({x: x, y: y})
end

def neighbor_coordinates(x, y)
  [{x: x-1, y: y-1},
   {x: x, y: y-1}, 
    {x: x+1, y: y-1}, 
    {x: x-1, y: y}, 
    {x: x+1, y: y}, 
    {x: x-1, y: y+1}, 
    {x: x, y: y+1}, 
    {x: x+1, y: y+1} ]
end

def number_of_neighbors(board, x, y)
  neighbor_coordinates(x, y).map{ |c| was_alive?(board, c[:x], c[:y]) }.filter{|c| c}.count
end

def is_alive?(board, x, y)
  # Any live cell with fewer than two live neighbours dies, as if by underpopulation.
  if was_alive?(board, x,y) && number_of_neighbors(board, x, y) < 2
    return false
  elsif was_alive?(board, x,y) && (number_of_neighbors(board, x, y) == 2 || number_of_neighbors(board, x, y) == 3)
    return true
  elsif was_alive?(board, x,y) && number_of_neighbors(board, x, y) > 3
    return false
  elsif !was_alive?(board, x,y) && number_of_neighbors(board, x, y) == 3
    return true
  else
    raise "Somehow we did not match any rules"
  end 
end

