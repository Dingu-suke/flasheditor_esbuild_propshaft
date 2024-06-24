class AddUserIdToDrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :drafts, :user_id, :integer
    add_index :drafts, :user_id
  end
end
