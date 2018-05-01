Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "questions#index"
  resources :questions, path: 'ja/questions'
  resources :users
end
