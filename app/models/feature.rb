class Feature < ActiveRecord::Base
  has_and_belongs_to_many :drinks
  validates :name, presence: true
end
