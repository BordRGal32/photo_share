PhotoShare::Application.routes.draw do
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions

    resources :users, :except => [:delete] do
      resources :photos do
        resources :tags
      end
    end

end
