Rails.application.routes.draw do
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'welcome/faq'

  resources :questions
  resources :posts

end
