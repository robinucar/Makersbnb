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
    erb :'properties/index'
  end

  # get '/properties/new' do 
  #   erb :'properties/new'
  # end

  run if app_file == $0
end

