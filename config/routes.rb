Rails.application.routes.draw do
  resources :categories
  resources :games
  root 'welcome#index'
end
