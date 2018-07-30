Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

	resources :projects do
    resources :issues
    member do
      post :add_resource
      post :user_unassign
    end
  end

  get '/assign_bug', to: 'issues#assign_bug'
  get '/unassign_bug', to: 'issues#unassign_bug'

  root to: 'static_pages#home'

end