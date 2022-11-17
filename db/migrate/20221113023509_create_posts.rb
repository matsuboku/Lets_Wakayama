class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :explanation, null: false
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.integer :genre_id, null: false
      t.timestamps
    end
  end
end
