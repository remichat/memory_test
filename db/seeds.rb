csv_options = { headers: :first_row }
filepath    = 'db/memory-tech-challenge-data.csv'

Revenue.destroy_all

revenues = CSV.foreach(filepath, csv_options).map do |row|
  {
    date: DateTime.strptime(row[0], "%Y-%m-%d %H:%M:%S"),
    order_id: row[1],
    customer_id: row[2],
    country: row[3],
    product_code: row[4],
    product_description: row[5],
    quantity: row[6],
    unit_price: row[7],
    revenue: row[6].to_i * row[7].to_f
  }
end

Revenue.create!(revenues)
