class ShopHour < ApplicationRecord
  belongs_to :shop

  validates_presence_of :day_of_week, :opens_at, :closes_at

  enum :day_of_week, { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7 }
end
