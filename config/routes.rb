Rails.application.routes.draw do
  # get 'posts/new'
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
    
  devise_scope :user do
    get "users/show" => "users#show"
    get "sing_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    # ゲストログイン機能の設定
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'top#index'
  # likesをposts内にネストさせる。これにより、post_likes_pathなどとして
  # 投稿に対していいねを付けるためのパスの指定が簡単になる
  resources :posts do
    resource :likes, only: [:create, :delete]
  end
  resources :reviews
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
