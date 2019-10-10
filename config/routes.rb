Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'static_pages#index'

  resources :users, :only => [:index, :show]
  resources :posts, :only => [:create, :destroy]
end
