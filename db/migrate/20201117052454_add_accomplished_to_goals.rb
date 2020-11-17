class AddAccomplishedToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :accomplished, :boolean, default: false
  end
end
