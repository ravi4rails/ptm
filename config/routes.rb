Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'
  namespace :admin do
    get    'dashboard' =>     'sites#dashboard'
    resources :tasks
    resources :projects
    resources :users
    resources :sub_task
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
