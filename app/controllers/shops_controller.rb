class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show]

  def index
    @shops = Shop.all
  end

  def show
    @shop_hours = @shop.shop_hours
    @shop_hour_days = @shop_hours.pluck(:day_of_week)
    @days = [*0..6]
    # Sort days  array to have today's day first
    @days.rotate! until @days.first == Time.now.wday
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to shop_url(@shop) }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name)
  end
end
