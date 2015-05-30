class Drink < ActiveRecord::Base
  has_and_belongs_to_many :features
  validates :name, presence: true
end
