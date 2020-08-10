Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update] do
   get 'followings' => 'relationships#followings'
   get 'followers' => 'relationships#followers'
  end
  # get 'users/:id/followers', to: 'users#followers'
  # get 'users/:id/followings', to: 'users#followings'
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resources :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  get 'home/about'

end