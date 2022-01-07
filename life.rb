require 'set'
board = Set[{x:2, y: 2},{x:3, y: 3},{x:3, y: 2},{x:2, y: 3}]


def is_alive?(board, x,y)
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
  neighbor_coordinates(x, y).map{ |c| is_alive?(board, c[:x], c[:y]) }.filter{|c| c}.count
end

puts is_alive?(board, 2, 2) # => true
puts is_alive?(board, 1,1) # => false

puts number_of_neighbors(board, 2,2) # => 3
puts number_of_neighbors(board, 2,1) # => 2
puts number_of_neighbors(board, 1,1) # => 1

puts neighbor_coordinates(2,2)