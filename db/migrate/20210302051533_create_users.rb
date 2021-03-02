class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :wish_count, default: 3
      t.boolean :is_verified, default: true

      t.timestamps
    end
  end
end
