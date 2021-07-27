class Card < ApplicationRecord
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  validates :description, :image, :source, :quote, :author, presence: true
end
