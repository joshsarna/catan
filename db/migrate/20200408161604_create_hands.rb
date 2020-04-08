class CreateHands < ActiveRecord::Migration[6.0]
  def change
    create_table :hands do |t|
      t.string :user_id
      t.string :game_id
      t.integer :wood_count
      t.integer :rock_count
      t.integer :wheat_count
      t.integer :sheep_count
      t.integer :brick_count

      t.timestamps
    end
  end
end
