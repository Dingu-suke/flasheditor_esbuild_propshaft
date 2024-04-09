class Deck < ApplicationRecord
  belongs_to :user
  has_many :deck_cards
  has_many :cards, through: :deck_cards
  has_many :deck_tags, dependent: :destroy
  has_many :tags, through: :deck_tags

  validates :name, presence: true, length: { maximum: 255 }

  def at_least_five_cards
    if cards.size < 1
      errors.add(:cards, 'は最低1枚選択してください')
    end
  end

end
