class CreateRevenues < ActiveRecord::Migration[5.2]
  def change
    create_table :revenues do |t|
      t.datetime :date
      t.string :order_id
      t.string :customer_id
      t.string :country
      t.string :product_code
      t.string :product_description
      t.string :quantity
      t.string :unit_price

      t.timestamps
    end
  end
end
