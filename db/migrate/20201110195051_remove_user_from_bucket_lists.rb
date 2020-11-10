class RemoveUserFromBucketLists < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bucket_lists, :user, index: true, foreign_key: true
  end
end
