class Revenue < ApplicationRecord
  def self.toto
    Revenue.all.each_with_index do |revenue, index|
      revenue.update(revenue: revenue.unit_price * revenue.quantity)
    end
    p index
  end
end
