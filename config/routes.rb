Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :platforms
  resources :products do
    collection do
      get :search
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home/index"
  # get "contact#index"
  # get "about#index"
  get "contact" => "contact#index", as: "contact"
  get "about" => "about#index", as: "about"
  get 'cart' => 'cart#index', as: 'cart'
  post 'cart' => 'cart#create'
  delete 'cart/:id' => 'cart#destroy', as: 'cart_delete'
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
  root to: "home#index"

end
