class Tiendita::Api::App
  module Endpoint
    # Endpoint Base class.
    # Each Endpoint must inherit from this class
    class Base < Tiendita::Api::App::Base
      set(:to_uri) { "/" << name[/[^:]+$/].underscore }

      def call(env)
        super
      rescue Sinatra::NotFound
        [404, {'Content-Type' => 'text/plain'}, ["Endpoint Not found"]]
      end
    end
  end
end
