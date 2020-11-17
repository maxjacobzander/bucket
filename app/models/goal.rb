class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :bucket_list

  validates :name, presence: true

  scope :incomplete, -> { where(accomplished: false) }
  scope :accomplished, -> { where(accomplished: true) }
end
