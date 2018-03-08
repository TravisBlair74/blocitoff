Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :users do
    resources :items
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'welcome#index'
end
