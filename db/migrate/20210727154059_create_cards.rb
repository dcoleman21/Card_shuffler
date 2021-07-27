class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :description
      t.string :image
      t.string :source
      t.string :quote
      t.string :author

      t.timestamps
    end
  end
end
