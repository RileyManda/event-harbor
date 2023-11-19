class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :image
      t.boolean :reserved
      t.boolean :visibility

      t.timestamps
    end
  end
end
