Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:edit,:update,:index] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  root 'homes#top'
  get 'homes/about'
end
