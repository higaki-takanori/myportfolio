Rails.application.routes.draw do
  resources :plays
  resources :users
  root "static_page#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
