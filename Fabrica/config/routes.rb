Fabrica::Application.routes.draw do

 	root to: 'users#login'

 	resources :users
  
	get 'login', to: 'users#login', as: :login
	post 'logar', to: 'users#logar', as: :logar

	get 'login_off', to: 'users#login_off', as: :login_off

	get 'show', to: 'users#show', as: :show

	get 'cadastro', to: 'users#new', as: :cadastro

	post 'altera', to: 'users#redefine_senha', as: :altera

	get 'redefinir', to: 'users#redefine', as: :redefinir

	get 'mostrartodos', to: 'users#index', as: :mostrartodos

	resources :racaos

	get 'novaracao', to: 'racaos#new', as: :novaracao

	get 'mostraracoes', to: 'racaos#index', as: :mostraracoes
	
	resources :ingredientes

	get 'novoingrediente', to: 'ingredientes#new', as: :novoingrediente

	resources :receitas

	get 'addingrediente', to: 'receitas#add_ingrediente', as: :addingrediente

	post 'salvaingrediente', to: 'receitas#salva_ingrediente', as: :salvaingrediente

	get 'removeingrediente', to: 'receitas#remove_ingrediente', as: :removeingrediente
end
