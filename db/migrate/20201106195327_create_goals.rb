class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.belongs_to :bucket_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
