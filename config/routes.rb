Rails.application.routes.draw do
  root to: "posts#index"
  
  resources :posts
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
