class DevelopmentCardHand < ApplicationRecord
  belongs_to :game
  belongs_to :development_card
  belongs_to :hand
end
