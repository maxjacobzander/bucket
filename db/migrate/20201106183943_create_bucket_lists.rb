class CreateBucketLists < ActiveRecord::Migration[6.0]
  def change
    create_table :bucket_lists do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.has_many :goals

      t.timestamps
    end
  end
end
