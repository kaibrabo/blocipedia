Rails.application.routes.draw do

    devise_for :users

    resources :users

    resources :wikis

    resources :charges, only: [:new, :create]

    get 'downgrade/index'
    get 'confirm_downgrade' => 'downgrade#confirm'

    get 'about' => 'welcome#about'

    root to: "welcome#index"
end
