Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/about', to: 'pages#about'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end