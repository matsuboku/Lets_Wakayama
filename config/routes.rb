Rails.application.routes.draw do
  
  namespace :public do
    get 'posts/new,'
    get 'posts/index,'
    get 'posts/show'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  # 顧客側
  root to: "public/homes#top"
  get 'about'=> 'public/homes#about'
  
  get 'users/my_page'=> 'public/users#show'
  get 'users/info/edit'=> 'public/users#edit'
  patch 'users/info'=> 'public/users#update'
  get 'users/confirm'=> 'public/users#confirm'
  patch 'users/withdraw'=> 'public/users#withdraw'
  get 'users' => 'public/users#dummy'
  
  scope module: :public do

  end
  
  # 管理者側
  get 'admin'=> 'admin/homes#top'
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
    resources :users, only: [:update, :edit, :show, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
