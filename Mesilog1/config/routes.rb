Rails.application.routes.draw do
  devise_for :users
  root 'welcome#top'
  resources :users, only: [:new, :show, :edit, :create, :update]
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end