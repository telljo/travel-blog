# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users
  resources :posts

  resources :trips do
    resources :posts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'trips#index'

  resources :geolocations do
    collection do
      get :search
    end
  end
  post 'geolocations', to: 'geolocations#find_location'

  get ':username', to: 'users#show', as: 'user'
  get ':username/trips', to: 'trips#index'
end
