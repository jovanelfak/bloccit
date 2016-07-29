Rails.application.routes.draw do

get 'about', to: 'welcomes#about'
get 'about', to: 'welcomes#index'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

end
