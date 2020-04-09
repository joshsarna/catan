RedBook::red_book
Rails.application.routes.draw do
  namespace :api do
    post '/games' => 'games#create'
    get '/games/:id' => 'games#show'
    patch '/games/:id' => 'games#update'

    patch '/hands/:id' => 'hands#update'

    post '/development_card_hands' => 'development_card_hands#draw'
    patch '/development_card_hands/:id' => 'development_card_hands#update'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'
  end
end
