Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  put '/donations/add_custom', to: 'donations#add_custom'
  put '/heros/add_custom', to: 'heros#add_custom'
  resources :users
  resources :donations
  resources :videos
  resources :categories
  resources :games
  resources :heros do
    put :add
    put :add_custom
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end