# frozen_string_literal: true

# its routes.rb
Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'projects#index'
  resources :projects do
  end
  get 'users', to: 'users#index'
  delete 'users/:id', to: 'users#destroy'
end
