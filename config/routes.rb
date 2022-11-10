Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

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

  get 'admin'=> 'admin/homes#top'
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
