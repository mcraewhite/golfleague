Rails.application.routes.draw do
  
  resources :courses do
    resources :holes
  end
  resources :rounds
  resources :players
  resources :playerleagues
  resources :leagues
  resources :users
  resources :sessions
  resources :holescores
  resources :groups
  resources :teesets
  resources :tees

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  root to: "courses#index"

end
