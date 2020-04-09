class Api::DevelopmentCardHandsController < ApplicationController
  def draw
    game = Game.find(params[:game_id])
    hand = Hand.find(params[:hand_id])
    development_card = game.draw_development_card

    hand.update(
      rock_count: hand.rock_count - 1,
      wheat_count: hand.wheat_count - 1,
      sheep_count: hand.sheep_count - 1
    )

    @development_card_hand = DevelopmentCardHand.new(
      development_card_id: development_card.id,
      hand_id: params[:hand_id],
      game_id: params[:game_id],
      face_up: false
    )

    if @development_card_hand.save
      render 'show.json.jbuilder'
    end    
  end

  def update
    @development_card_hand = DevelopmentCardHand.find(params[:id])
    @development_card_hand.face_up = params[:face_up] || @development_card_hand.face_up
    
    if @development_card_hand.save
      render 'show.json.jbuilder'
    end
  end
end
