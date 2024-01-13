class ChangeEventTitleToSummary < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :title, :summary
  end
end
