Rails.application.routes.draw do


 resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcomes#about'

  root 'welcomes#index'

end
