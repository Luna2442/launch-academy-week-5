require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'

require_relative 'models/contact'
also_reload 'models/contact'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  @contacts = Contact.all

  @relative_contacts = Contact.where(params[:search])

  erb :index
end

get '/:id' do
  @contact = Contact.find(params[:id])
  erb :contact
end

post '/search' do
  first_name = params[:search].split(' ')[0]
  last_name = params[:search].split(' ')[1]
  contacts_array = Contact.where({first_name: first_name, last_name: last_name})
  @contact = contacts_array[0]
  erb :contact
end
