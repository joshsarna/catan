class ChangeGameCurrentTurnToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :current_turn, "numeric USING CAST(current_turn AS numeric)"
    change_column :games, :current_turn, :integer
  end
end
