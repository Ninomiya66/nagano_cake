Rails.application.routes.draw do

  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root 'public/homes#top'

  get 'about' => 'public/homes#about'

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

    resources :genres, only: [:index, :edit, :create, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    get '/' => 'homes#top'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
