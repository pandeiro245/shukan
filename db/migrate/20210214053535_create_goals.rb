class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :category_id, null: false, foreign_key: true
      t.string :name
      t.integer :done_count, defaut: 0

      t.timestamps
      
      t.index ['category_id'], name: 'index_goals_on_category_id'
    end
  end
end
