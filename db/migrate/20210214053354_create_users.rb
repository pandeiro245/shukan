class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :token
      t.string :twitter_id, null: true
      t.string :screen_name, null:true

      t.timestamps
    end
  end
end
