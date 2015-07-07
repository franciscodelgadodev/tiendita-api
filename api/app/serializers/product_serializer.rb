class ProductSerializer < ActiveModel::Serializer
  attributes :name, :purchase_price, :sale_price
end
