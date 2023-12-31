Rails.application.routes.draw do
  get 'sessions/new'
  root "tasks#index"
  resources :tasks do
    collection do
    post :confirm
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  namespace :admin do
    resources :users
  end
  resources :labels, only: [:new, :create, :index, :edit, :destroy]
end
