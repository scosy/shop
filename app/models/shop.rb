class Shop < ApplicationRecord
  has_many :shop_hours, dependent: :delete_all

  validates_presence_of :name
end
