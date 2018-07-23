Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

	resources :projects

	resources :issues

  post '/assign_d', to: 'projects#assign_dev'
  post '/assign_q', to: 'projects#assign_qa'
  get '/assign_bug', to: 'issues#assign_bug'
  get '/unassign_bug', to: 'issues#unassign_bug'

  post '/user_delete', to: 'projects#user_delete'


  # root to: 'projects#index'
  root to: 'static_pages#home'


=begin
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
=end


end