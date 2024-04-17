class AddColumnTitileToDraft < ActiveRecord::Migration[7.1]
  def change
    add_column :drafts, :title, :string
  end
end
