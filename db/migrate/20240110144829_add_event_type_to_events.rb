class AddEventTypeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :event_type, :string, default: 'Private'
     Event.find_each do |event|
      event.update(event_type: event.visibility ? 'Public' : 'Private')
  end
  remove_column :events, :visibility
end
end
