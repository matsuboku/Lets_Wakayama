Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  get 'admin'=> 'admin/homes#top'

  namespace :admin do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
