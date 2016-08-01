Rails.application.routes.draw do


  resources :topics do
    resources :posts, :sponsored_posts, except: [:index]
  end

  get 'about' => 'welcomes#about'

  root 'welcomes#index'

end
