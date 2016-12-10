Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations:      'overrides/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/hello', to: 'application#hello'
  get '/secure', to: 'application#secure'


  get '/me/shows', to: 'connected#followed_shows'
  post '/me/shows/:id', to: 'connected#follow_show'
  delete '/me/shows/:id', to: 'connected#unfollow_show'

  get '/shows', to: 'shows#search'
  get '/shows/default', to: 'shows#default_shows'
  get '/shows/:id', to: 'shows#get'
  post '/shows', to: 'shows#create'
  put '/shows/:id', to: 'shows#update'
  delete '/shows/:id', to: 'shows#delete'

  get '/shows/:id/seasons', to: 'seasons#all'
  get '/shows/:id/seasons/:id', to: 'seasons#get'
  post '/shows/:id/seasons', to: 'seasons#create'
  put '/shows/:id/seasons/:number', to: 'seasons#update'
  delete '/shows/:id/seasons/:number', to: 'seasons#delete'


end
