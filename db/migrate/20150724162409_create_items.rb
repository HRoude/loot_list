class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string  :name
      t.string  :descrip
      t.string  :comment
      t.string  :dislike
      t.float   :price
      t.string  :url_link
      t.string  :image
      t.string  :category
      t.string  :want_rating

      t.timestamps null: false
    end
  end
end
