class CreateDecks < ActiveRecord::Migration[7.1]
  def change
    create_table :decks do |t|
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :decks, :users
    add_index :decks, :user_id
  end
end