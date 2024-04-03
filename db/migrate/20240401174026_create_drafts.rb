class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :drafts do |t|
      t.text :body
      t.timestamps
    end
  end
end
