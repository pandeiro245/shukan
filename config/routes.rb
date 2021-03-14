Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'users#login'
  get '/login_test', to: 'welcome#login_test'
end
