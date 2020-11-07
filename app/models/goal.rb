class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :bucket_list

  validates :name, presence: true
end
