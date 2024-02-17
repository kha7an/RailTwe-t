Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :posts
  resources :users

  resources :posts do
    resources :comments
  end

  resources :posts do
    member do
      match "like", to: "posts#like",via: [:post, :get]
      match "unlike", to: "posts#unlike",via: [:post, :get]
    end
  end

  root "posts#index"


end
