Rails.application.routes.draw do
  get 'dashboard/index'
  resources "projects"
  resources :projects do
    resources :bugs
  end
  match '/projects/user',    to: 'projects#user', via: [:post]
  match '/projects/remove_user/:id',    to: 'projects#remove_user', via: [:delete]
  devise_for :users
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
