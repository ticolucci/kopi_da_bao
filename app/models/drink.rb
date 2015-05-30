class Drink < ActiveRecord::Base
  has_and_belongs_to_many :features
  has_many :order_items

  validates :name, presence: true
end
