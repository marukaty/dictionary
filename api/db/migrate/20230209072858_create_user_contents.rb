class CreateUserContents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_contents do |t|

      t.timestamps
    end
  end
end
