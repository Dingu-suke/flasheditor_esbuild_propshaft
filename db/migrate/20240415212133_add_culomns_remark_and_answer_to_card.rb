class AddCulomnsRemarkAndAnswerToCard < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :remarks, :text
    add_column :cards, :answer, :text
  end
end
