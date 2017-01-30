Rails.application.routes.draw do
  
  root 'pages#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :tasks
  get 'pages/contact'
  get 'pages/index'
  get 'pages/settings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
