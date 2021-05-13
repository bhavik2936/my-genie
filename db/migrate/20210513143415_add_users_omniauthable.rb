class AddUsersOmniauthable < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :provider, limit: 50,  null: false, default: ""
      t.string :uid,      limit: 500, null: false, default: ""
    end
  end
end
