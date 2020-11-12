class BucketList < ApplicationRecord
  has_many :goals
  has_many :users, through: :goals

  accepts_nested_attributes_for :goals

  validates :name, presence: true
end
