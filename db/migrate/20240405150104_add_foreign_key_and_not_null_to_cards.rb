class AddForeignKeyAndNotNullToCards < ActiveRecord::Migration[7.1]
  def change
    change_column_null :cards, :user_id, false
    add_foreign_key :cards, :users    
  end
end
