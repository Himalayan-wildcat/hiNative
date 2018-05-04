Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "tops#index"
  resources :categories, path: '/ja'
  resources :chats
  resources :users, except: [:new, :create], path: '/ja/users/profile'
  resource  :settings, except: [:new, :create], path: 'ja/settings'
end
