class DevelopmentCard < ApplicationRecord
  has_many :development_card_hands
  has_many :hands, through: :development_card_hands
end
