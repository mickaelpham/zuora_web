# zuora_web.rb
require 'sinatra'

class ZuoraWeb < Sinatra::Base
  get '/' do
    erb :index
  end
end
