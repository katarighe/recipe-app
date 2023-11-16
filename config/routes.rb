Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root "home#index"

  # routes for MVC

  resources :inventories, only: [:index, :show, :new, :create, :destroy]

  resources :recipes, only: [:index, :show, :new, :create, :destroy]

  resources :public_recipes, only: [:index]

  resources :foods, only: [:new, :create, :destroy]

  resources :recipe_foods, only: [:new, :create, :destroy]

  resources :inventory_foods, only: [:new, :create, :destroy]

  # Create Route for Shopping List
  get '/shopping_list?recipe_id=params[:recipe_id]&inventory_id=params[:inventory][:inventory_id]', to: 'shopping_lists#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
