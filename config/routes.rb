Rails.application.routes.draw do

get 'about' => 'welcome#about'

root 'welcome#index'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

end
