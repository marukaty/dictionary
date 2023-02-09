class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.references :book, null: true, index: true, foreign_key: { on_delete: :nullify }, comment: '紐づくbookがあれば'
      t.string :word, null: false, comment: '検索する言葉'
      t.string :summary, null: false, comment: '概要'
      t.string :description, null: false, comment: '詳細説明'
      t.timestamps
    end

    add_index :contents, :word
  end
end
