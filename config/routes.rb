Rails.application.routes.draw do

	root 'welcomes#index'

	get 'about', to: 'welcomes#about'

  resources :topics do
    resources :posts, :sponsored_posts, except: [:index]
  end
end
