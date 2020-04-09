class User < ApplicationRecord
  has_secure_password

  has_many :players
  has_many :games, through: :players
  has_many :hands

  def face_up_development_cards(game_id)
    hand = hands.find_by(game_id: game_id)
    development_cards = hand.development_card_hands
    face_up_development_cards = development_cards.where(face_up: true)
    
    return face_up_development_cards.map do |development_card_in_hand|
      development_card_in_hand.development_card
    end
  end

  def current_game_hand(game_id)
    hand = hands.find_by(game_id: game_id)

    return {
      id: hand.id,
      wood_count: hand.wood_count,
      rock_count: hand.rock_count,
      wheat_count: hand.wheat_count,
      sheep_count: hand.sheep_count,
      brick_count: hand.brick_count,
      development_cards: hand.development_card_hands.map { |development_card_hand|
        {
          id: development_card_hand.id,
          name: development_card_hand.development_card.name,
          image_url: development_card_hand.development_card.image_url,
          face_up: development_card_hand.face_up
        }
      }
    }
  end
end
