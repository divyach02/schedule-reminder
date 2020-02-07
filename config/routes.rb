Rails.application.routes.draw do
  resources :events
  devise_for :users

  root to: 'home#index'
end
