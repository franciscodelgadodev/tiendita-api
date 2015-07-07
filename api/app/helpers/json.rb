require 'active_model_serializers'

class Tiendita::Api::App
  module Helpers
    module JSON
      def json(object, options={})
        serializer = ActiveModel::Serializer.serializer_for(object, options)
        if serializer
          serializer.new(object, options).to_json
        else
          object.to_json(options)
        end
      end
    end
  end
end
