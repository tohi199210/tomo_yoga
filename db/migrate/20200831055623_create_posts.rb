class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :image_id
      t.string :title
      t.text :table_content
      t.text :subtitle
      t.text :content

      t.timestamps
    end
  end
end
