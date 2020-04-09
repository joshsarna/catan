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
end
