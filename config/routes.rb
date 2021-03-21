Rails.application.routes.draw do
  resources :goals, only: [:new, :create, :show, :update]

  root 'welcome#index'
  get '/login', to: 'users#login_with_token'
end
