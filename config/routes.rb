Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  
  root to: 'items#index'  #この1行を追加
  resources :items

  resources :users, only: :show
end
