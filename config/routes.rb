Rails.application.routes.draw do
  # Routes routes...
  get 'routes/my' => 'routes#my_index'
  get 'routes/joined' => 'routes#joined'
  get "routes/:id/join" => 'users#join', :as => :join_route
  get "routes/:id/cancel" => 'users#cancel', :as => :cancel_route
  get 'routes/:id/preload' => 'routes#preload', :as => :preload_route
  get 'routes/:id/preview' => 'routes#preview', :as => :preview_route
  resources :routes do
    resources :bookings
  end

  # Pages routes...
  root :to => 'pages#home'
  post '/search' => 'pages#search'

  # Users routes...
  resources :users, :only => [:new, :create, :show, :edit, :update]
  get '/bookings' => 'users#bookings', :as => :bookings

  # Session routes...
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :password_resets

end
