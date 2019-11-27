class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :drink_id
      t.integer :quantity
      t.float :price

      t.timestamp
    end
  end
end
