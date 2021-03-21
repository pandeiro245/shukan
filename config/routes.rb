Rails.application.routes.draw do
  resources :goals, only: [:new, :create, :show, :update]
  resources :events, only: [:index]

  root 'welcome#index'
  get '/login', to: 'users#login_with_token'
end
