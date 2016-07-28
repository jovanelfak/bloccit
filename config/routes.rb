Rails.application.routes.draw do

	root 'welcomes#index'

	get 'about', to: 'welcomes#about'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
end
