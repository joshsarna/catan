class Game < ApplicationRecord
  has_many :players
  has_many :users, through: :players
  has_many :hands
  has_many :development_card_hands

  def draw_development_card
    available_cards = DevlopmentCard.all.select { |development_card|
      !DevelopmentCardHand.find_by({
        game_id: id,
        development_card_id: development_card.id
      })
    }

    return available_cards.sample
  end
end
