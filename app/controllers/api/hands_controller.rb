class Api::HandsController < ApplicationController
  def update
    @hand = Hand.find(params[:id])
    @hand.wood_count = params[:wood_count] || @hand.wood_count
    @hand.rock_count = params[:rock_count] || @hand.rock_count
    @hand.wheat_count = params[:wheat_count] || @hand.wheat_count
    @hand.sheep_count = params[:sheep_count] || @hand.sheep_count
    @hand.brick_count = params[:brick_count] || @hand.brick_count
    p @hand

    if (@hand.save)
      render 'show.json.jbuilder'
    end
  end

  def steal
    @hand = Hand.find(params[:id])
    opponent_hand = Hand.find(params[:opponent_hand_id])
    opponent_cards = []

    opponent_hand.wood_count.times do
      opponent_cards << 'wood'
    end
    opponent_hand.brick_count.times do
      opponent_cards << 'brick'
    end
    opponent_hand.wheat_count.times do
      opponent_cards << 'wheat'
    end
    opponent_hand.sheep_count.times do
      opponent_cards << 'sheep'
    end
    opponent_hand.rock_count.times do
      opponent_cards << 'rock'
    end

    if opponent_cards.length == 0 
      render 'show.json.jbuilder'
    else
      stolen_card = opponent_cards.sample
      @hand[stolen_card + '_count'] += 1
      opponent_hand[stolen_card + '_count'] -= 1

      opponent_hand.save
      if @hand.save
        render 'show.json.jbuilder'
      end
    end
  end
end
