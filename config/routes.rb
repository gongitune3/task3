Rails.application.routes.draw do
  devise_for :users
  resources :books
  get "top" => "books#top"
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
