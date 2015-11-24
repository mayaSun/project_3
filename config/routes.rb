Rails.application.routes.draw do
  
  root to: 'pages#home'
  get '/login', to: 'pages#login'
  post '/login', to: 'pages#create_admin_session'
  get '/set_language', to: 'pages#set_language'

  resources :chapters do
    member {get "set_download_variables"}
    member {get "download"}
  end
end
