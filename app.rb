# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class AirBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  # routes
 
  get '/' do 
    p "welcome to the home page"
    erb :index
  end

  post '/' do 
    p "redirecting to properties..."
    p params[:email]
    p params[:password]
    p params[:password_confirmation]
    redirect '/properties'
  end

  get '/properties' do 
    p "welcome to the properties page"
    erb :'properties/index'
  end

  get '/sessions/new' do 
    erb :'users/new'
  end  
    
  post '/sessions/new' do 
    p "signing you in"
    redirect '/properties'
  end

  get '/properties/new' do 
    erb :'properties/new'
  end

  post '/properties' do 
    redirect 'properties/new'
  end

  post '/properties/new' do 
    p params[:property]
    redirect '/properties'
  end

  run if app_file == $0
end

