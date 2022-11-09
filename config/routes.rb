Rails.application.routes.draw do


  namespace :public do
    get 'members/show'
    get 'members/edit'
    get 'members/confirm'
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
  scope module: :public do

  end

  get 'admin'=> 'admin/homes#top'
  namespace :admin do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
