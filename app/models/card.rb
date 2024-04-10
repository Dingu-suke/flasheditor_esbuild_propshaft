class Card < ApplicationRecord
  belongs_to :user
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
