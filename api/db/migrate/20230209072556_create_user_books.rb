class CreateUserBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_books, comment: '紐づくジャンルがない時' do |t|
      t.references :user, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.references :book, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
