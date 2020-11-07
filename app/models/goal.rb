class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :bucket_list
end
