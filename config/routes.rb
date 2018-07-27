Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

	resources :projects do
    resources :issues
    member do
      post :user_unassign
    end
  end

	# resources :issues

  # post '/assign_d', to: 'projects#assign_dev'
  # post '/assign_q', to: 'projects#assign_qa'
  
  post '/add_resource', to: 'projects#add_resource'

  get '/assign_bug', to: 'issues#assign_bug'
  get '/unassign_bug', to: 'issues#unassign_bug'

  # post '/user_unassign', to: 'projects#user_unassign' # make it member route in projects


  # root to: 'projects#index'
  root to: 'static_pages#home'


=begin
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
=end


end