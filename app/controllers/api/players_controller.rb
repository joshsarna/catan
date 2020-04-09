class Api::PlayersController < ApplicationController
  def create
    game = Game.find(params[:game_id])

    @player = game.players.find_by({user_id: current_user.id})
    
    if !@player
      @player = Player.new(
        game_id: game.id,
        user_id: current_user.id,
        turn_number: game.players.length
      )

      if @player.save
        Hand.create({
          user_id: current_user.id,
          game_id: game.id,
          wood_count: 0,
          rock_count: 0,
          wheat_count: 0,
          sheep_count: 0,
          brick_count: 0
        })

        render 'show.json.jbuilder'
      end
    else
      render 'show.json.jbuilder'
    end
  end
end
