class CreateOrdersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :venue_id
      t.string :delivery_status
      t.float :total_price

      t.datetime :delivery_time

      t.timestamp
    end
  end
end
