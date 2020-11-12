class RemoveGoalsfromBucketLists < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bucket_lists, :goals, index: true, foreign_key: true
  end
end
