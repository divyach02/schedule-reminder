class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :day
      t.datetime :time
      t.references :user, foreign_key: true
      t.integer :month_day
      t.integer :month_direction

      t.timestamps
    end
  end
end
