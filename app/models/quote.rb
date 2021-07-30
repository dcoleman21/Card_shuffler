class Quote < ApplicationRecord
  has_one :card
  validates :quote, :author, presence: true
end
