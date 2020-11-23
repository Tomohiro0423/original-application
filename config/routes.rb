Rails.application.routes.draw do
  root to: 'toppages#index'
  
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
