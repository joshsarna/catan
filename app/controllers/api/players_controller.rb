class Api::PlayersController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    
    @player = Player.new(
      game_id: params[:game_id],
      user_id: current_user.id,
      turn_number: game.players.length
    )

    if @player.save
      render 'show.json.jbuilder'
    end
  end
end
