Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dogs', to: 'dogs#index'
  get '/dogs/:id', to: 'dogs#show'
  get '/dogs/new', to: 'dogs#new'
  post '/dogs', to: 'dogs#create'
  get '/dogs/edit', to: 'dogs#edit'
  post '/dogs/:id', to: 'dogs#update'
  delete '/dogs/:id', to: 'dogs#destroy'
end
