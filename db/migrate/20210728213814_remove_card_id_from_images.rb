class RemoveCardIdFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :card_id, :integer
  end
end
