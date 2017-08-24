Rails.application.routes.draw do

  get 'downgrade/new'

  get 'downgrade/edit'

  get 'downgrade/index'

  get 'downgrade/show'

    devise_for :users

    resources :users

    resources :wikis

    resources :charges, only: [:new, :create]

    get 'about' => 'welcome#about'

    root to: "welcome#index"
end
