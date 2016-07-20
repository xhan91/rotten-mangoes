Rails.application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  
  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]
  post '/session/fake/quit', to: 'session#fake_quit'
  post '/session/fake/:id', to: 'session#fake', as: 'session_fake'

  namespace :admin do
    resources :users
  end


  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
