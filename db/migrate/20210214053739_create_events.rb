class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :goal, null: false, foreign_key: true
      t.date :date_on

      t.timestamps
    end
  end
end
