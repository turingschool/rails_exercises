Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dogs', to: 'dogs#index'
  get '/dogs/new', to: 'dogs#new'
  get '/dogs/:id', to: 'dogs#show'
  post '/dogs', to: 'dogs#create'
  get '/dogs/:id/edit', to: 'dogs#edit'
  patch '/dogs/:id', to: 'dogs#update'
  delete '/dogs/:id', to: 'dogs#destroy'

  get '/dogs/:dog_id/tricks', to: 'tricks#index'
  get '/dogs/:dog_id/tricks/new', to: 'tricks#new'
  post '/dogs/:dog_id/tricks', to: 'tricks#create'
end
