class CreateDrinksFeatures < ActiveRecord::Migration
  def change
    create_table :drinks_features do |t|
      t.integer :drink_id
      t.integer :feature_id
    end
  end
end
