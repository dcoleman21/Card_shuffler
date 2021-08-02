class Card < ApplicationRecord
  belongs_to :image
  belongs_to :quote

  def self.get_random_card
    Card.order('RANDOM()').first
  end
end
