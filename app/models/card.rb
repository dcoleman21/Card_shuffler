class Card < ApplicationRecord
  validates :description, :image, :source, :quote, :author, presence: true
end
