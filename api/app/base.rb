require 'sinatra/base'

class Tiendita::Api::App
  # Sinatra Base class.
  # Endpoint::Base and Middleware::Base  must inherit from this class.
  class Base < Sinatra::Base
    set(:setup) { "Implement me" }
  end
end
