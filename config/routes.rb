Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#index"

  resources :users, only: [:new, :create]
  
  get 'login', to:'login#login'
end
