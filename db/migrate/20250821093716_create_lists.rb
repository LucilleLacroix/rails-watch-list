class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.text :overview
      t.string :image_url

      t.timestamps
    end
  end
end
