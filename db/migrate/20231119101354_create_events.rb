class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :images
      t.boolean :reservation
      t.boolean :visibility
      t.integer :price
      t.integer   :tickets_left
      t.datetime :date
      t.string :location
      t.timestamp :start_time
      t.timestamp :end_time
      t.string   :avatar
      t.string   :banner

      t.timestamps
    end
  end
end
