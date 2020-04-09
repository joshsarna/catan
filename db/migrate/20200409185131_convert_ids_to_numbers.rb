class ConvertIdsToNumbers < ActiveRecord::Migration[6.0]
  def change
    # development_card_hands
    change_column :development_card_hands, :hand_id, "numeric USING CAST(hand_id AS numeric)"
    change_column :development_card_hands, :hand_id, :integer
    change_column :development_card_hands, :game_id, "numeric USING CAST(game_id AS numeric)"
    change_column :development_card_hands, :game_id, :integer

    # hands
    change_column :hands, :user_id, "numeric USING CAST(user_id AS numeric)"
    change_column :hands, :user_id, :integer
    change_column :hands, :game_id, "numeric USING CAST(game_id AS numeric)"
    change_column :hands, :game_id, :integer

    # players
    change_column :players, :user_id, "numeric USING CAST(user_id AS numeric)"
    change_column :players, :user_id, :integer
    change_column :players, :game_id, "numeric USING CAST(game_id AS numeric)"
    change_column :players, :game_id, :integer
  end
end
