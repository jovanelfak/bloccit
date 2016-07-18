Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'
  get 'welcome/faq'

  resources :advertisements
  
  resources :posts
  

end
