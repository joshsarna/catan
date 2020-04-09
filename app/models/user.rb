class User < ApplicationRecord
  has_secure_password

  has_many :players
  has_many :games, through: :players
  has_many :hands
end
