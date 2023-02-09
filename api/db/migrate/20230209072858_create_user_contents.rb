class CreateUserContents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_contents, comment: '紐づくbookがなければ' do |t|
      t.references :user, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.references :content, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
