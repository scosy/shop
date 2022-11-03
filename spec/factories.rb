FactoryBot.define do
  factory :shop do
    name { 'Shop' }
  end

  factory :shop_hour do
    day_of_week { 1 }
    opens_at { "08:00:00" }
    closes_at { "20:00:00" }
    shop
  end
end