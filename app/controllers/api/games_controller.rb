class Api::GamesController < ApplicationController
  def create
    @game = Game.new({
      current_turn: params[:current_turn],
      current_has_rolled: params[:current_has_rolled],
      last_roll: params[:last_roll]
    })
    if @game.save

      player = Player.create({
        game_id: @game.id,
        user_id: current_user.id,
        turn_number: 0
      })

      Hand.create({
        user_id: current_user.id,
        game_id: @game.id,
        wood_count: 0,
        rock_count: 0,
        wheat_count: 0,
        sheep_count: 0,
        brick_count: 0
      })

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

  def roll
    @game = Game.find(params[:id])
    die1 = rand(6) + 1
    die2 = rand(6) + 1

    @game.current_has_rolled = true
    @game.last_roll = die1 + die2

    if @game.save
      render 'show.json.jbuilder'
    end
  end

  def next
    @game = Game.find(params[:id])
    if @game.current_turn + 1 == @game.players.length
      @game.current_turn = 0
    else
      @game.current_turn = @game.current_turn + 1
    end
    @game.current_has_rolled = false

    if @game.save
      render 'show.json.jbuilder'
    end
  end
end
