Rails.application.routes.draw do

    resources :wikis

    get 'about' => 'welcome#about'

    devise_for :users

    root to: "welcome#index"
end
