Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  post '/users/sign_up', to:'users#create'
  resources :users, only: [:show, :create]
  resources :items do
    resources :purchases, only:[:index, :create, :new]
    collection do
      get 'search'
    end
  end

end
