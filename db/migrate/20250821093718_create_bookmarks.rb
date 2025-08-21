class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.references :movie, null: false, { on_delete: :restrict }
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
