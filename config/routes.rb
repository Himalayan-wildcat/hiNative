Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   mount ActionCable.server => "/cable"
  root "tops#index"
  resources :categories, path: '/ja', only: :index
  resources :chats
  resources :users, except: [:new, :create], path: '/ja/users/profiles'
  resource  :settings, except: [:new, :create], path: 'ja/settings'
end
