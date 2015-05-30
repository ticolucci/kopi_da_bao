class CreateOrderItemsFeatures < ActiveRecord::Migration
  def change
    create_table :features_order_items do |t|
      t.integer :order_item_id
      t.integer :feature_id
    end
  end
end
