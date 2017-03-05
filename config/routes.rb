Rails.application.routes.draw do
  get ':id', to: 'users#show', as: :profile
  get ':id/edit', to: 'users#edit', as: :edit_profile
  get '/users/new', redirect('/kaydol')
  resources :users, except: :index
  get '/kaydol', to: 'users#new', as: :register
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
