Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/clients', to: 'clients#index'
      get '/clients/:id', to: 'clients#show'
      get '/client/name', to: 'clients#find_name'
      post '/clients', to: 'clients#create'
      put '/client/:id', to: 'clients#update'
      delete '/client/:id', to: 'clients#destroy'

      get '/cities', to: 'cities#index'
      get '/cities/:id', to: 'cities#show'
      get 'city/name', to: 'cities#find_name'
      get 'city/state', to: 'cities#find_state'
      post '/cities', to: 'cities#create'
    end
  end
end
