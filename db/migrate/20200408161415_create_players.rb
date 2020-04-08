class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :game_id
      t.string :user_id
      t.integer :turn_number

      t.timestamps
    end
  end
end
