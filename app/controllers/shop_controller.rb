class ShopController < ApplicationController
  def index
    @shops = Shop.all
  end
end