class CountryRevenuesController < ApplicationController
  def show
    @countries = Revenue.select(:country).distinct.map(&:country).sort

    if params[:country].present? && @countries.map(&:downcase).include?(params[:country])
      @selected_country = params[:country]
      country_revenues = Revenue.where('LOWER(country) = ? AND quantity > 0', @selected_country)
    else
      country_revenues = Revenue.where('quantity > 0')
      @selected_country = all
    end

    # @total_revenue = country_revenues.reduce(0) {|memo, revenue| memo + revenue.revenue }.round
    @total_revenue = country_revenues.sum(:revenue).round
    @avg_revenue_per_order = @total_revenue.fdiv(country_revenues.distinct.count(:order_id)).round(2)
    @nb_customers = country_revenues.distinct.count(:customer_id)
    @revenue_per_month = country_revenues.group_by_month(:date).sum(:revenue)

  end
end
