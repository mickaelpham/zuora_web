# zuora_web.rb
require 'sinatra'
require 'zuora'

class ZuoraWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/query' do
    @save_credentials = true
    erb :'query/index'
  end

  post '/query' do
    # Maintain username/password between queries if checked
    save_credentials = params['save_credentials'] == 'on'

    if save_credentials
      @username         = params['username']
      @password         = params['password']
      @query            = params['query']
      @save_credentials = save_credentials
    end

    wsdl_location = params['environment'] == 'production' ?
      'wsdl/production.wsdl' :
      'wsdl/apisandbox.wsdl'

    client = Zuora::Client.new do |config|
        config.username      = params['username']
        config.password      = params['password']
        config.wsdl_location = wsdl_location
    end

    query_result = client.query(params['query'])
    @success     = query_result.success?

    if query_result.success?
      @size    = query_result.size
      @records = query_result.records

      if query_result.size > 0
        # Remove fields that start with '@' (usually, SOAP types)
        @fields  = query_result.records.first.keys.reject { |k| k.match /^@/ }

        # Fancy way to restore the columns to their CamelCase values
        @columns = @fields.map { |c| c.to_s.split('_').collect(&:capitalize).join }
      end
    else
      @body = query_result.body
    end

    erb :'query/results'
  end

  get '/create' do
    erb :create
  end
end
