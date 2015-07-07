require "sinatra/activerecord"
require_relative "./base"

# Class used just to configure enviroment
# It should not be used neither as Endpoint
# or Middleware
class Tiendita::Api::App
  class Config < Base
    set(:setup) do
      register Sinatra::ActiveRecordExtension
    end
  end
end
