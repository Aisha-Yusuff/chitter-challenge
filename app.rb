require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/chitter' do 
    p ENV
    @peeps = Peeps.all
    erb :index
  end 

  run! if app_file == $0
end