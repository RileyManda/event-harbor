class RemoveImagesFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :images, :string
  end
end
