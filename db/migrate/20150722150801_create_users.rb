class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :group_id
      t.string :password_digest
      t.string :email
      t.string :user_name
      t.string :birthday
      t.string :current_interests
      t.string :special_event
      t.string :general_dislikes

      t.timestamps null: false
    end
  end
end
