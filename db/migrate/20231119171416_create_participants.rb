class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.integer :participant_id
      t.boolean :attending
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
