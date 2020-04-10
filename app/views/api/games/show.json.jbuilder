json.id @game.id
json.current_user_turn @game.current_user_turn(current_user)
json.current_has_rolled @game.current_has_rolled
json.last_roll @game.last_roll

json.other_players (@game.players.select { |player| player.user.id != current_user.id }) { |player|
  json.name player.user.name
  json.development_cards player.user.face_up_development_cards(@game.id)
  json.hand_id player.user.hand_for_game(@game.id).id
  json.turn player.turn_number == @game.current_turn
}

json.hand current_user.current_game_hand(@game.id)