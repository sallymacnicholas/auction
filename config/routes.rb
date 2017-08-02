Rails.application.routes.draw do
  root 'home#show'

  get '/browse', to: 'home#index', as: :browse
  get 'search', to: 'admin/users#index'
  resources :home, only: %i[index show]

  namespace :admin do
    resources :dashboard
    resources :active, only: [:index]
    resources :archived, only: [:index]
    resources :items
    resources :users
    resources :search, only: [:index]
  end

  get '/dashboard/:id', to: 'users#show', as: :dashboard
  resources :users
  resources :items
  resources :upvotes


  get '/login', to: 'sessions#new', as: :signup
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
