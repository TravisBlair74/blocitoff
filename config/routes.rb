Rails.application.routes.draw do
  get 'users/show'
  get 'items/new'

  devise_for :users
  get 'welcome/index'

  resources :users do
    resources :items, only: [:create]
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'welcome#index'
end
