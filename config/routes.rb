Rails.application.routes.draw do
  get 'routes/my' => 'routes#my_index'
  get 'routes/joined' => 'routes#joined'
  get "routes/:id/join" => 'users#join', :as => :join_route
  get "routes/:id/cancel" => 'users#cancel', :as => :cancel_route
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :show]
  resources :routes do
    resources :bookings
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/search' => 'pages#search'

end
