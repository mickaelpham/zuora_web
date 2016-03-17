# zuora_web.rb
require 'sinatra'
require 'zuora'

class ZuoraWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/query' do
    erb :query
  end

  post '/query' do
    client = Zuora::Client.new do |config|
        config.username      = params['username']
        config.password      = params['password']
        config.wsdl_location = 'wsdl/apisandbox_65.wsdl'
    end

    erb :query_results
  end

  get '/create' do
    erb :create
  end
end
