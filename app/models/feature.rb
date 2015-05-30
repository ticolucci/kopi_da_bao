class Feature < ActiveRecord::Base
  has_and_belongs_to_many :drinks
  has_and_belongs_to_many :order_items

  validates :name, presence: true
end
