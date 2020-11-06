class AddGoalsToBucketLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :bucket_lists, :goals, null: false, foreign_key: true
  end
end
