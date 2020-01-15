class AddRevenueToRevenues < ActiveRecord::Migration[5.2]
  def change
    add_column :revenues, :revenue, :float
  end
end
