Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resources :book_comments,only: [:create,:destroy]
    resource :favorites,only: [:create,:destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'users/:id/following' => 'relationships#following', as: 'following'
  get 'users/:id/follower' => 'relationships#follower', as: 'follower'
end