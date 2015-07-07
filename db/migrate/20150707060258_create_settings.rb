class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.string :datatype, default: "string", limit: 7
    end

    add_index :settings, :name, unique: true
  end
end
