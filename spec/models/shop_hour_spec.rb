require 'rails_helper'

RSpec.describe ShopHour, type: :model do
  let!(:shop) { FactoryBot.create(:shop) }
  let!(:shop_hour) { FactoryBot.build(:shop_hour) }
  
  context 'before save' do
    context 'day_of_week column' do
      it 'is not valid if null' do
      shop_hour.update(day_of_week: "")
        expect(shop_hour).not_to be_valid
      end
      
      it 'is valid if it is an integer' do
        expect(shop_hour).to be_valid
      end

      it 'is valid if included between 1 and 7' do
        shop_hour.update(day_of_week: rand(1..7))
        expect(shop_hour).to be_valid
      end
    end
      
    it 'is not valid without an opening hour' do
      shop_hour.update(opens_at: "")
      expect(shop_hour).not_to be_valid
    end
    
    it 'is not valid without a closing hour' do
      shop_hour.update(closes_at: "")
      expect(shop_hour).not_to be_valid
    end

    it "is not valid if closing hour happens before opening hour" do
      shop_hour.opens_at = "20:00:00"
      shop_hour.closes_at = "08:00:00"
      expect(shop_hour).not_to be_valid
    end

    context 'when a shop has multiple hours' do
      it 'is not valid if opening_hours overlap' do
        @shop_hour = ShopHour.create(shop_id: shop_hour.shop_id,
                                      day_of_week: shop_hour.day_of_week,
                                      opens_at: shop_hour.opens_at,
                                      closes_at: shop_hour.closes_at,
                                    )
        expect(@shop_hour).not_to be_valid
      end
    end
  end
end
