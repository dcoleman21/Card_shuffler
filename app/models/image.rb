class Image < ApplicationRecord
  has_many :cards
  validates :description, :image, :source, presence: true
end
