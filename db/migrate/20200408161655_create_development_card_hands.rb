class CreateDevelopmentCardHands < ActiveRecord::Migration[6.0]
  def change
    create_table :development_card_hands do |t|
      t.string :development_card_id
      t.string :hand_id
      t.string :game_id
      t.boolean :face_up

      t.timestamps
    end
  end
end
