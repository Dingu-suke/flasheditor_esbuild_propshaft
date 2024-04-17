class ChangeDraftsToCards < ActiveRecord::Migration[7.1]
  def change
    rename_table :drafts, :cards
  end
end
