class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :group_id
      t.string :password_digest
      t.string :email
      t.string :user_name
      t.string :birthday,           default: "(this left blank)"
      t.string :current_interests,  default: "(this left blank)"
      t.string :special_event,      default: "(this left blank)"
      t.string :general_dislikes,   default: "(this left blank)"

      t.timestamps null: false
    end
  end
end
