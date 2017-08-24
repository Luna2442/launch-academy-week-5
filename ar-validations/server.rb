require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative 'app/models/recipe'
require_relative 'app/models/comment'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  erb :index
end
