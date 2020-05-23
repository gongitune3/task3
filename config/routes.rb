Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only: [:show, :index, :edit, :update,]
  get "books/about" => 'books#about'
  get "books/index" => 'books#index'
  get "/" => 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
