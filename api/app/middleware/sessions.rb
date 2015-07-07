require_relative './base'

class Tiendita::Api::App
  module Middleware
    class Sessions < Base
      before do
        #Handle sessions here!
      end
    end
  end
end
