class Hand < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :development_card_hands
  has_many :development_cards, through: :development_card_hands
end
