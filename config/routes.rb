Rails.application.routes.draw do
  
  get 'users/show'
  resources :events
  devise_for :users
  root 'home#index'

  resources :charges#, :only => [:new, :create]

  resources :users, :only => [:show]
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
