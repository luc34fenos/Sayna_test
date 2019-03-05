Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  root to: 'home#index'

  get '/works', to: 'home#works'
  get '/lovers', to: 'home#lovers'
  get '/program', to: 'home#program'
  get '/contact', to: 'home#contact'
  get '/coworker', to: 'home#users_all'

  post '/sendmail', to: 'home#send_mail'

  get '/profil/:id', to: 'home#show', as: 'profil'



  get "/note", to: 'homes#note_user'
  post "/note", to: 'homes#noter'

  get "/part", to: "homes#index"
  get "/project", to: 'homes#project'
  get "/correction", to: 'homes#correction'

  resources :liens, only: [:new, :create, :edit, :update, :destroy]
  resources :students, only: [:new, :create, :show, :edit, :update, :destroy]

end
