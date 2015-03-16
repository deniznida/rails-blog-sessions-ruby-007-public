RailsBlog::Application.routes.draw do
  resources :users
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'

  get 'logout' => 'sessions#destroy'
  
  resources :tags
  
  resources :posts do 
    resources :comments
  end

  root 'posts#index'
end
