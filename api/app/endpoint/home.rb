require_relative './base'

class Tiendita::Api::App
  module Endpoint
    class Home < Base
      get '/' do
        [200, {'Content-Type' => 'application/json'}, ["Hey, this is the home page!"]]
      end
    end
  end
end
