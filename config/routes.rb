Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit,:update,:index]
  resources :groups do
    resources :messages
  end

  root 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
