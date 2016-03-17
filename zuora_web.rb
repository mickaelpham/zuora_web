# zuora_web.rb
require 'sinatra'
require 'zuora'

class ZuoraWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/query' do
    @save_credentials = true
    erb :query
  end

  post '/query' do
    save_credentials = params['save_credentials'] == 'on'

    if save_credentials
      @username         = params['username']
      @password         = params['password']
      @query            = params['query']
      @save_credentials = save_credentials
    end

    client = Zuora::Client.new do |config|
        config.username      = params['username']
        config.password      = params['password']
        config.wsdl_location = 'wsdl/apisandbox_65.wsdl'
    end

    @query_results = client.query(params['query'])
    erb :query_results
  end

  get '/create' do
    erb :create
  end
end
