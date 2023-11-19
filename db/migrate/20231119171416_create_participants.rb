class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.integer :event_id
      t.boolean :attending

      t.timestamps
    end
  end
end
