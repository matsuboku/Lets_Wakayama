Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # 顧客側
  root to: "public/homes#top"
  get 'about'=> 'public/homes#about'
  get 'users/confirm'=> 'public/users#confirm'
  patch 'users/withdraw'=> 'public/users#withdraw'
  get 'users' => 'public/users#dummy'

  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    # ユーザーidが含まれてるurlにするため
      member do
        get :favorites
      end
    end
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

  # 管理者側
  get 'admin'=> 'admin/homes#top'
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
    resources :users, only: [:update, :edit, :show, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
