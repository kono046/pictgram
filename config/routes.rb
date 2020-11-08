Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'

  resources :users
end