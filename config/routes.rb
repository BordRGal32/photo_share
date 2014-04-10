PhotoShare::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, :except => [:edit]
  resources :users, :except => [:index]
  resources :photos
  resources :tags
  root :to => 'sessions#new'
end
