Rails.application.routes.draw do
  root to: 'pages#home'
  get '/login', to: 'pages#login'
  post '/login', to: 'pages#create_admin_session'
  resources :chapters 
end
