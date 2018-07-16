Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
	#resources :users
	resources :projects


  root to: 'static_pages#home'
  
=begin
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
=end


end