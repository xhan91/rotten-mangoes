Rails.application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end

  post '/session/fake/quit', to: 'session#fake_quit'
  post '/session/fake/:id', to: 'session#fake'

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
