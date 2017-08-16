Rails.application.routes.draw do
  resources :users, only: [:edit,:update,:new,:create]
  resources :groups
  devise_for :users
  root 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
