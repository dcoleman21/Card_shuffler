class AddCardsToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :card, null: false, foreign_key: true
  end
end
