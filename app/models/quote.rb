class Quote < ApplicationRecord
  belongs_to :card
  validates :quote, :author, presence: true
end
