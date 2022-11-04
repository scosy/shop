class ShopController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_hours = @shop.shop_hours
    @shop_hour_days = @shop_hours.pluck(:day_of_week)
    @days = Date::DAYNAMES.dup.map { |day| Date.strptime(day, '%A').wday }
    until @days.first == Time.now.strftime('%w').to_i
      @days.rotate!
    end
  end
end