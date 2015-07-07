module Tiendita
  module Api
    class App
      require_relative './app/base'
      require_relative './app/config'
      require_relative './app/middleware'
      require_relative './app/endpoint'

      attr_reader :app

      class << self
        def new
          setup
          super
        end

        def setup
          setup! unless setup?
        end

        def setup?
          @setup ||= false
        end

        private

        def setup!
          load_serializers
          setup_endpoints
        end

        def setup_endpoints
          Tiendita::Api::App::Base.subclasses.each(&:setup)
        end

        def load_serializers
          Dir.glob("#{__dir__}/app/serializers/*.rb").each { |f| require f }
        end
      end

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
