Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'#, as: 'about'
  devise_for :users##これをresourcesより上に持ってくる
  resources :users,only: [:show,:index,:edit,:update]
  resources :books

end