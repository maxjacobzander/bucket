class AlterTable < ActiveRecord::Migration[6.0]
  def change
    bucket_lists, has_many: goals
  end
end
