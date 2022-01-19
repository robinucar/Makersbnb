# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/user'

class AirBnB < Sinatra::Base
  configure :development do
    reggit ister Sinatra::Reloader
  end
  
  enable :sessions
 
  # routes
  
  # Homepage (sign up page)
  get '/' do 
    p "welcome to the homepage (sign up)"
    session[:user_id] = nil
    erb :index
  end

  # Homepage (sign up form)
  post '/' do 
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id  
    p "user created id:#{user.id}"
    p "redirecting to properties..."
    redirect '/properties'
  end

  # Login
  get '/sessions/new' do 
    erb :'users/new'
  end  
    
  # Login (form)
  post '/sessions/new' do  
    p "signing you in"
    redirect '/properties'
  end

  # Properties
  get '/properties' do
    p "welcome to the properties page"
    @user = User.find(id: session[:user_id])
    
    erb :'properties/index'
  end

  # Properties (button - 'List a Property')
  post '/properties' do 
    redirect 'properties/new'
  end

  # List a Property
  get '/properties/new' do 
    @user = User.find(id: session[:user_id])
    erb :'properties/new'
  end

  # List a Property (form)
  post '/properties/new' do 
    @user = User.find(id: session[:user_id])
    p params[:property]
    redirect '/properties'
  end

  run if app_file == $0
end

