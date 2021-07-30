class AddCardsToQuotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :quotes, :card, null: false, foreign_key: true
  end
end
