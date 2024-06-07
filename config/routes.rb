Rails.application.routes.draw do
  resources :follows

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :api do
    namespace :v1 do
      resources :reports, only: [:index]
      devise_for :users, controllers: { registrations: 'api/v1/registrations' }
      devise_scope :user do
        post 'sign_in', to: 'sessions#create'
      end
    end
  end

  resources :posts
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resources :comments
    member do
      match "like", to: "posts#like", via: [:post, :get]
      match "unlike", to: "posts#unlike", via: [:post, :get]
    end
  end

  devise_scope :user do
    get '/accounts/complete', to: 'users/registrations#complete_edit'
    put '/accounts/complete', to: 'users/registrations#complete_update'
  end

  root "posts#index"
end
