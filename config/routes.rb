Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  root to: 'tasks#index'

  resources :users, only: [:index, :new, :create, :destroy]
  resources :tasks, only: [:index, :new, :create, :destroy]
end
