Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  resources :articles
  resources :pages



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end