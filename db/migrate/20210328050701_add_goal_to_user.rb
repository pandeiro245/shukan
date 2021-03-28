class AddGoalToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :goal_id, :integer
    add_column :users, :goal_updated_at, :datetime
  end
end
