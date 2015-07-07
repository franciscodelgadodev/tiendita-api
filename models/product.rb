class Product < ActiveRecord::Base
  validates :name,
            :purchase_price,
            :sale_price, presence: true

  validates :purchase_price,
            :sale_price, numericality: { greater_than: 0 }
end
