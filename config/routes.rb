Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :categories
    resources :chats

    root to: "users#index"
  end
  devise_for :users
  root "tops#index"
  resources :categories, path: '/ja', only: :index
  resources :chats
  resources :users, except: [:new, :create], path: '/ja/users/profiles'
  resource  :settings, except: [:new, :create], path: 'ja/settings'
end
