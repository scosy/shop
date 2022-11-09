class ShopController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_hours = @shop.shop_hours
    @shop_hour_days = @shop_hours.pluck(:day_of_week)
    @days = [*0..6]
    # Sort days array to have today's day first
    @days.rotate! until @days.first == Time.now.wday
  end
end
