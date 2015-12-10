Rails.application.routes.draw do
  
  root to: 'pages#home'
  get '/login', to: 'pages#login'
  post '/login', to: 'pages#create_admin_session'
  get '/set_language', to: 'pages#set_language'
  get '/about_us', to: 'pages#about_us'
  get '/select_chapter', to: 'chapters#select_chapter'

  resources :chapters do
    member {get "set_download_variables"}
    member {get "download"}
  end

  get '/chapter_select' => 'chapters#chapter_select'
end
