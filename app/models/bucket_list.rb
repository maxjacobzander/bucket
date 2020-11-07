class BucketList < ApplicationRecord
  has_many :goals
  has_many :users, through: :goals
end
