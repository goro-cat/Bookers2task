Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  root 'homes#top'
  get 'home/about' => 'homes#about'#, as: 'about'
  devise_for :users##これをresourcesより上に持ってくる
  get 'search' => 'searches#search'
  get 'search/index' => 'searches#index'

  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :follower, :followed
    end
    #resources :relationships, only: %I[create destroy]
  end
  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す

  #get 'relationships/follower' => 'relationships#follower'
  #get 'relationships/followed' => 'relationships#followed'


  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    resource :searches, only:[:serch, :index]
  end



end