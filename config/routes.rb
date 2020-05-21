Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only: [:show, :edit, :update,]
  get "/" => 'users#top'
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
