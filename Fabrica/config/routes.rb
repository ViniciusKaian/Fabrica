Fabrica::Application.routes.draw do

  get "sessions/new"

  resources :users
  
end
