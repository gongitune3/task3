Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only: [:show, :index, :edit, :update,]
  get "home/about" => 'homes#about'
  get "books/index" => 'books#index'
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
