Rails.application.routes.draw do
  get 'users_controller/show'
  devise_for :users
  get 'welcome/index'

  authenticated :user do
    root 'users_controller#show', as: :authenticated_root
  end
  root 'welcome#index'
end
