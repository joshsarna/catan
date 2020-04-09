RedBook::red_book
Rails.application.routes.draw do
  namespace :api do
    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

    post '/games' => 'games#create'
    get '/games/:id' => 'games#show'
    patch '/games/:id' => 'games#update'
    patch '/games/:id/roll' => 'games#roll'

    post '/players' => 'players#create'

    patch '/hands/:id' => 'hands#update'

    post '/development_card_hands' => 'development_card_hands#draw'
    patch '/development_card_hands/:id' => 'development_card_hands#update'

  end
end
