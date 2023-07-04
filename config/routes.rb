Rails.application.routes.draw do

  devise_for :users
  
  # get 'posts/new' 

  # post 'posts' => 'posts#create'

  resources :posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'homes#top'

  get "/" => 'homes#top'

  get "index/con" => "posts#indexcon"

  get "index/an"  =>  "posts#indexan"

  get "index/cus" =>  "posts#indexcus"

  get "index/oth" =>  "posts#indexoth"

  resources :posts do
    resources :comments, only:[:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update]
  # post 'posts' => 'posts#create'

  # Defines the root path route ("/")
  # root "articles#index"
end
