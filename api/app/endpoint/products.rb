require './models/product'
require_relative './base'

class Tiendita::Api::App
  module Endpoint
    class Products < Base
      get '/' do
        json Product.all
      end

      post '/' do
        begin
          @product = Product.new(params[:product])

          if @product.save
            status 201
            json @product
          else
            status 422
            json @product.errors
          end
        rescue Exception => @error
          status 422
          json({error: @error.to_s})
        end
      end

      put '/:id' do
        begin
          @product = Product.find(params[:id])

          if @product.update_attributes(params[:product])
            status 200
          else
            status 422
            json @product.errors
          end
        rescue Exception => @error
          status 422
          json({error: @error.to_s})
        end
      end
    end
  end
end
