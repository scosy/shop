class ShopHour < ApplicationRecord
  belongs_to :shop

  validates_presence_of :day_of_week, :opens_at, :closes_at
  validates :closes_at, comparison: { greater_than: :opens_at }
  enum :day_of_week, { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 0 }

  # Check if new hours overlap with exisiting hours
  validate :overlapping_hours?, unless: -> { opens_at.blank? || closes_at.blank? }

  scope :in_shop, ->(shop_id) { where(shop_id) }
  scope :in_day, ->(day_of_week) { where(day_of_week) }
  scope :in_range, ->(range) { where("opens_at BETWEEN ? AND ?", range.first, range.last) }
  scope :exclude_self, ->(id) { where.not(id) }

  def overlapping_hours?
    range = Range.new(opens_at, closes_at)
    overlaps = ShopHour.in_shop(shop_id:).in_day(day_of_week:).exclude_self(id:).in_range(range)
    overlap_error unless overlaps.empty?
  end

  def overlap_error
    errors.add(:overlap_error, "There are already opening hours in this range")
  end
end
