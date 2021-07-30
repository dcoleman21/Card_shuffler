class Card < ApplicationRecord
  belongs_to :image
  belongs_to :quote
end
