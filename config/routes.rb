Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "static_pages#index"

  get 'session/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  # SEGUINDO AS ROTAS RESTFULL, ROTA DE CADASTRO PARA SESSION
  get 'entrar', to:'session#new'
  # ONDE REALIZAMOS O LOGIN, DE FATO
  post 'entrar', to:'session#create'

  # ROTA SHOW MOSTRARÁ O USUÁRIO LOGADO
  resources :users, only: [:new, :create, :show]
end
