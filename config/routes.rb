Rails.application.routes.draw do
  resources :goals
  resources :events, only: [:index]
  root 'welcome#check'
  get '/welcome', to: 'welcome#index'
  get '/export_events', to: 'events#export'
  get '/login', to: 'users#login_with_token'
  get '/auth/:provider/callback', to: 'users#login_with_twitter'
end
