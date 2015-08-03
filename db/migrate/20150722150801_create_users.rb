class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :password_digest
      t.string  :email
      t.string  :name
      t.date    :birthday
      t.string  :current_interests
      t.string  :special_event
      t.string  :general_dislikes

      t.timestamps null: false
    end
  end
end
