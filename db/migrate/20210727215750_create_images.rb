class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :description
      t.string :image
      t.string :source

      t.timestamps
    end
  end
end
