class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :genre, null: true, index: true, foreign_key: { on_delete: :nullify }, comment: '紐づくジャンルがあれば'
      t.string :title, null: false
      t.timestamps
    end
  end
end
