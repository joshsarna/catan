class Api::GamesController < ApplicationController
  def create
    @game = Game.new(
      current_turn: params[:current_turn],
      current_has_rolled: params[:current_has_rolled],
      last_roll: params[:last_roll]
    )

    if @game.save
      render 'show.json.jbuilder'
    end
  end

  def show
    @game = Game.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @game = Game.find(params[:id])
    @game.current_turn = params[:current_turn] || @game.current_turn
    @game.current_has_rolled = params[:current_has_rolled] || @game.current_has_rolled
    @game.last_roll = params[:last_roll] || @game.last_roll
    if @game.save
      render 'show.json.jbuilder'
    end
  end
end
