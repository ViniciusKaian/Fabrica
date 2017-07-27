Fabrica::Application.routes.draw do
	root to: "users#new"

  resources :users
  
	get 'login', to: 'users#login', as: :login
	post 'logar', to: 'users#logar', as: :logar

	get 'login_off', to: 'users#login_off', as: :login_off

	get 'show', to: 'users#show', as: :show

	get 'cadastro', to: 'users#new', as: :cadastro
end
