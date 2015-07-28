class FixColumnNames < ActiveRecord::Migration
  
  def change
    rename_column  :users,  :user_name,  :name 
    rename_column  :items,  :item_name,  :name
    change_column  :users,  :birthday,   :date
  end
end
