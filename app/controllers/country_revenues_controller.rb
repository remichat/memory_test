class CountryRevenuesController < ApplicationController
  def show
    country = params[:country]

    country_revenues = Revenue.where('LOWER(country) = ? AND quantity > 0', country)

    @total_revenue = country_revenues.reduce(0) {|memo, revenue| memo + revenue.revenue }.round
    @avg_revenue_per_order = @total_revenue.fdiv(country_revenues.distinct.count(:order_id)).round(2)
    @nb_customers = country_revenues.distinct.count(:customer_id)
  end
end
