class Shops::ShopHoursController < ApplicationController
  before_action :set_shop

  def new
    @shop_hour = @shop.shop_hours.build
  end

  def create
    @shop_hour = @shop.shop_hours.build(shop_hour_params.tap { |sh| sh[:day_of_week] = sh[:day_of_week].to_i })

    respond_to do |format|
      if @shop_hour.save
        format.html { redirect_to shop_url(@shop_hour.shop) }
        format.json { render :show, status: :created, location: @shop_hour.shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def shop_hour_params
    params.require(:shop_hour).permit(%i[shop_id day_of_week opens_at closes_at])
  end
end
