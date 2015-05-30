class OrderItem < ActiveRecord::Base
  has_and_belongs_to_many :features
  belongs_to :drink
  belongs_to :order

  validates :drink, presence: true
end
