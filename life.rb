require 'set'
block = Set[{x:2, y: 2},{x:3, y: 3},{x:3, y: 2},{x:2, y: 3}]


def was_alive?(board, x,y)
  board.include?({x: x, y: y})
end

puts was_alive?(block, 2, 2) # => true
puts was_alive?(block, 1,1) # => false

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

puts neighbor_coordinates(2,2)

def number_of_neighbors(board, x, y)
  neighbor_coordinates(x, y).map{ |c| was_alive?(board, c[:x], c[:y]) }.filter{|c| c}.count
end

puts number_of_neighbors(block, 2,2) # => 3
puts number_of_neighbors(block, 2,1) # => 2
puts number_of_neighbors(block, 1,1) # => 1

def is_alive?(board, x, y)
  # Any live cell with fewer than two live neighbours dies, as if by underpopulation.
  if was_alive?(board, x,y) && number_of_neighbors(board, x, y) < 2
    return false
  end
end

blinker = Set[{x:2, y: 2},{x:2, y: 3},{x:2, y: 1}]
puts is_alive?(blinker, 2, 1) # => false