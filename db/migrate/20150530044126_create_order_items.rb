class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :drink_id

      t.timestamps null: false
    end
  end
end
