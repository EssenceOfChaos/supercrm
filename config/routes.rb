Rails.application.routes.draw do
  
  resources :tasks
  root 'pages#index'
  get 'pages/index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  get 'pages/contact'
  get 'pages/index'
  get 'pages/settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
