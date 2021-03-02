class CreateWishes < ActiveRecord::Migration[6.1]
  def change
    create_table :wishes do |t|
      t.references :user, null: false, foreign_key: true
      t.text :wish_statement

      t.timestamps
    end
  end
end
