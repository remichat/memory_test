class ChangeColumnTypeToRevenue < ActiveRecord::Migration[5.2]
  def change
    change_column :revenues, :quantity, :integer, using: 'quantity::integer'
    change_column :revenues, :unit_price, :float, using: 'unit_price::integer'
  end
end
