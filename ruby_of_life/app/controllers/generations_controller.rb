require "byebug"

class GenerationsController < ApplicationController
  def show
    @game_id = params[:game_id]
    @id = params[:id].to_i
    @game = Game.find_by_name(@game_id)
    @id.times { @game = @game.step }
    @cells = @game.cells
  end
end
