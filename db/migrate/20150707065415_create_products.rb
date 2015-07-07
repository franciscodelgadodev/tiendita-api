class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :purchase_price, precision: 3, scale: 2, null: false, default: 0
      t.decimal :sale_price, precision: 3, scale: 2, null: false, default: 0

      t.timestamps null: false
    end
  end
end
