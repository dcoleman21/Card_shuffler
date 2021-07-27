class Image < ApplicationRecord
  belongs_to :card
  validates :description, :image, :source, presence: true
end
