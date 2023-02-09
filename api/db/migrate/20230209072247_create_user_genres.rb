class CreateUserGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :user_genres do |t|
      t.references :user, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.references :genre, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
