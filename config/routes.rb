Rails.application.routes.draw do
  resources :suggestions
  #devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 # devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :movies do
    resources :reviews do
     # resources :suggestions
 end
end
    resources :users, only: [:show, :index]
 
  root 'movies#index'
end
