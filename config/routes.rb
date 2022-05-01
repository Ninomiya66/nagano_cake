Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root 'public/homes#top'

  get 'about' => 'public/homes#about'

  scope module: :public do

    resources :items, only: [:index, :show]

    resources :customers, only: [:show, :edit] do

      collection do

        get 'check'

        patch 'out'

      end

    end

  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

    resources :genres, only: [:index, :edit, :create, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    get '/' => 'homes#top'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
