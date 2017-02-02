Rails.application.routes.draw do
  
  resources :customers
  root 'pages#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :tasks
  get 'admin/dashboard' => 'admin_users#index'
  get 'pages/contact'
  get 'pages/index'
  get 'pages/settings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
