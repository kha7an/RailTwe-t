Rails.application.routes.draw do
  resources :follows
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :api do
    namespace :v1 do
      resources :reports, only: [:index]
    end
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



  devise_scope :user do
    get '/accounts/complete', to: 'users/registrations#complete_edit'
    put '/accounts/complete', to: 'users/registrations#complete_update'
  end

  root "posts#index"


end
