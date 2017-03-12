Rails.application.routes.draw do

  root 'frms#index'

  get '/kaydol', to: 'users#new', as: :register
  get '/giris', to: "sessions#new", as: :login
  get '/cikis', to: "sessions#destroy", as: :logout
  resource :session, only: [:new, :create, :destroy]

  get '/forumlar', to: 'frms#index', as: :forums
  get '/forumlar/:id', to: 'frms#show', as: :forum

  get ':id', to: 'users#show', as: :profile
  get ':id/edit', to: 'users#edit', as: :edit_profile
  get '/users/new', redirect('/kaydol')
  resources :users, except: :index


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
