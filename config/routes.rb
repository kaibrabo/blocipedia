Rails.application.routes.draw do
  get 'home/show'

  get 'home/new'

    devise_for :users

    root to: "home#index"
end
