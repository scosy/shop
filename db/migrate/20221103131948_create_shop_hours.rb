class CreateShopHours < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_hours do |t|
      t.references :shop, null: false

      t.integer :day_of_week, null: false

      t.time :opens_at, null: false
      t.time :closes_at, null: false

      t.timestamps
    end
  end
end
