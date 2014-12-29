require 'sinatra/base'
require 'json'
require 'active_support'
require 'active_support/core_ext/class/subclasses'

module Tiendita
  module Api
    class App
      autoload :Base, './api/app/base'
      autoload :Middleware, './api/app/middleware'
      autoload :Endpoint, './api/app/endpoint'

      attr_reader :app

      def initialize
        @app = Rack::Builder.app do
          use Middleware::Sessions

          Endpoint::Base.subclasses.each do |endpoint|
            map(endpoint.to_uri) { run(endpoint.new) }
          end
        end
      end

      def call(env)
        app.call(env)
      rescue => error
        [500, {'Content-Type' => 'application/json'}, [error.to_s]]
      end
    end
  end
end
