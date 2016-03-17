# zuora_web.rb
require 'sinatra'

class ZuoraWeb < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
