class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :current_turn
      t.boolean :current_has_rolled
      t.integer :last_roll

      t.timestamps
    end
  end
end
