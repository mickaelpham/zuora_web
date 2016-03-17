# zuora_web.rb
require 'sinatra'

class ZuoraWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/create' do
    erb :create
  end
end
