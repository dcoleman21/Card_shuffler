class RemoveCardIdFromQuotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quotes, :card_id, :integer
  end
end
