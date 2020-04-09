json.id @game.id
json.current_user_turn @game.current_user_turn(current_user)
json.current_has_rolled @game.current_has_rolled
json.last_roll @game.last_roll

json.other_players (@game.users.select { |user| user.id != current_user.id }) { |user|
  json.name user.name
  json.development_cards user.face_up_development_cards(@game.id)
}

json.hand current_user.current_game_hand(@game.id)