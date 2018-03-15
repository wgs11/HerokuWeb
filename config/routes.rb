Rails.application.routes.draw do
  resources :heros
  resources :donations
  get 'users/new'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :categories
  resources :games
  resources :users
  root 'welcome#index'
end
