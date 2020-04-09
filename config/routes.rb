RedBook::red_book
Rails.application.routes.draw do
  namespace :api do
    post '/games' => 'games#create'
    get '/games/:id' => 'games#show'
    patch '/games/:id' => 'games#update'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'
  end
end
