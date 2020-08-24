Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  post '/users/sign_up', to:'users#create'
  get '/items/new', to:'items#new'
  resources :users, only: [:show, :create]
  resources :items, only: [:edit, :show]
end
