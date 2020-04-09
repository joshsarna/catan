class Game < ApplicationRecord
  has_many :players
  has_many :users, through: :players
  has_many :hands
  has_many :development_card_hands
end
