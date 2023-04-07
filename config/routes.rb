Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :platforms
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home/index"
  # get "contact#index"
  # get "about#index"
  get "contact" => "contact#index", as: "contact"
  get "about" => "about#index", as: "about"
  root to: "home#index"
end
