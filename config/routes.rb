Rails.application.routes.draw do
  resources :plays
  resources :users
  resources :plays, only: [:show, :index] do
    resource :likes, only: [:create, :destroy]
  end
  get '/search',     to: 'plays#search'
  get '/login',      to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root "static_page#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
