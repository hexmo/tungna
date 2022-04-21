# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  resources :cart_items
  resources :products
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  get '/cart_items_price', to: 'cart_items#cart_items_price'
  get '/user_detail', to: 'util#user_detail'
end
