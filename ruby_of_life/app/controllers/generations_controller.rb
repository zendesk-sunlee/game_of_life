Cell = Struct.new(:x, :y)

class GenerationsController < ApplicationController
  GAMES = {
    "vblinker" => Set[Cell.new(2,1), Cell.new(2, 2), Cell.new(2,3)]
  }

  def show
    @game = GAMES[params[:game_id]]
  end
end
