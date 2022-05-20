# frozen_string_literal: true

# its routes.rb

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'projects#index'
  resources :projects do
    member do
      post :add_user
      delete :destroy_user
    end
  end
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  delete 'users/:id', to: 'users#destroy'
end
