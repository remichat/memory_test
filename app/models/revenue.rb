class Revenue < ApplicationRecord
  def revenue
    unit_price * quantity
  end
end
