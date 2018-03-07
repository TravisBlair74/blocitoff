Rails.application.routes.draw do
  get 'items/new'

  get 'users_controller/show'
  devise_for :users
  get 'welcome/index'

  resources :users do
    resources :items, only: [:create]
  end

  authenticated :user do
    root 'users_controller#show', as: :authenticated_root
  end

  root 'welcome#index'
end
