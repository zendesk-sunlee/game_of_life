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

class GenerationsController < ApplicationController
  GAMES = {
  "block" => Set[Cell.new(2, 2),Cell.new(3, 3),Cell.new(3, 2),Cell.new(2, 3)],
  "vblinker" => Set[Cell.new(2, 2),Cell.new(2, 3),Cell.new(2, 1)],
  "hblinker" => Set[Cell.new( 1, 2), Cell.new( 2, 2), Cell.new( 3, 2) ],
  "glider" => Set[Cell.new(1,3), Cell.new(2,3), Cell.new(3,3), Cell.new(3,2), Cell.new(2,1)]
  }

  def show
    @game_id = params[:game_id]
    @id = params[:id].to_i
    @game = GAMES[@game_id]
    
    @id.times { @game = step(@game) }
  end
end
